#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan, Image
from cv_bridge import CvBridge
import cv2
import math


class TurtleBot3:
    # Initialisations
    def __init__(self):
        # Initialiser le noeud ROS
        rospy.init_node('turtlebot3_competition', anonymous=True)

        # Initialiser un éditeur de messages Twist

        self.cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)

        # Initialiser un abonné pour les données du Lidar
        self.laser_sub = rospy.Subscriber("/scan", LaserScan, self.laser_callback)

        # Initialiser un abonné pour les données de la caméra
        self.image_sub = rospy.Subscriber("/camera/image_raw", Image, self.image_callback)

        # Initialiser un message Twist vide
        self.move_cmd = Twist()

        # Initialiser un objet CvBridge pour convertir les images ROS en images OpenCV
        self.bridge = CvBridge()

        # Initialiser les paramètres de la compétition
        self.road_width = 0.4  # Largeur de la route en mètres
        self.min_dist_to_obstacle = 0.2  # Distance minimale à un obstacle en mètres
        self.max_speed = 0.2  # Vitesse maximale du robot en m/s
        self.turn_gain = 1.0  # Gain de la commande de virage
        self.straight_gain = 1.0  # Gain de la commande de maintien de la trajectoire
        self.obstacle_detected = False  # Indicateur de détection d'obstacle

    # Traitement des données du lidar
    def laser_callback(self, data):
        # Obtenir les données du Lidar
        scan = data.ranges

        # Détecter les obstacles
        if min(scan[0:10] + scan[-10:]) < self.min_dist_to_obstacle:
            self.obstacle_detected = True
        else:
            self.obstacle_detected = False

        # si un obstacle est détecté, dévier l'obstacle et continuer
        if self.obstacle_detected:
            #trouver l'angle correspondant à l'obtacle le plus proche

            min_dist_index = scan.index(min(scan))
            angle_to_obstacle = min_dist_index * self.angle_increment

            #Calculer l'angle de déviation en fonction de l'angle de l'obstacle
            deviation_angle = math.pi / 2 - angle_to_obstacle

            #Dévier l'obstacle en tournant dans la direction de déviation
            self.move_cmd.linear.x = 0.0
            self.move_cmd.angular.z = self.turn_gain * deviation_angle
            self.cmd_vel_pub.publish(self.move_cmd)
            rospy.sleep(1.0)

            #Continuer tout droit après avoir dévié l'obstacle
            self.move_cmd.linear.x = self.speed
            self.move_cmd.angular.z = 0.0
            self.cmd_vel_pub.publish(self.move_cmd)
            rospy.sleep(1.0)

        else:
            #Pas d'obstacle detecté, continuer tout droit
            self.move_cmd.linear.x = self.speed
            self.move_cmd.angular.z = 0.0
            self.cmd_vel_pub.publish(self.move_cmd)
            rospy.sleep(1.0)



       # traitement des données de la camera
    def image_callback(self, data):
        # Convertir les données de la caméra en une image OpenCV
        cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")

        # Détecter les lignes jaunes
        hsv_image = cv2.cvtColor(cv_image, cv2.COLOR_BGR2HSV)
        lower_yellow = (20, 100, 100)
        upper_yellow = (40, 255, 255)
        yellow_mask = cv2.inRange(hsv_image, lower_yellow, upper_yellow)
        yellow_edges = cv2.Canny(yellow_mask, 50, 150)

        # Calculer le point de fuite (vanishing point) des lignes jaunes
        lines = cv2.HoughLinesP(yellow_edges, 1, cv2.pi/180, 10, minLineLength=10, maxLineGap=10)
        if lines is not None:
            for line in lines:
                x1, y1, x2, y2 = line[0]
                cv2.line(cv_image, (x1, y1), (x2, y2), (0, 0, 255), 2)

        # Publier l'image modifiée sur un topic ROS pour le débogage
        debug_image_pub = rospy.Publisher('/turtlebot3/debug/image', Image, queue_size=1)
        debug_image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))

    # Commande de mouvement du robot
    def move(self):
        # Si un obstacle est détecté, arrêter le robot
        if self.obstacle_detected:
            self.move_cmd.linear.x = 0.0
            self.move_cmd.angular.z = 0.0
        else:
            # Récupérer les données de la caméra
            cv_image = self.cv_image

            # Convertir l'image en niveau de gris
            gray = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)

            # Créer un masque d'image pour les pixels jaunes
            lower_yellow = (20, 100, 100)
            upper_yellow = (30, 255, 255)
            mask = cv2.inRange(cv_image, lower_yellow, upper_yellow)

            # Appliquer le masque sur l'image en niveau de gris
            masked_gray = cv2.bitwise_and(gray, gray, mask=mask)

            # Appliquer un filtre de seuillage pour binaire l'image
            _, thresh = cv2.threshold(masked_gray, 0, 255, cv2.THRESH_BINARY)

            # Trouver les contours dans l'image binaire
            contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

            # Si aucun contour n'est trouvé, arrêter le robot
            if not contours:
                self.move_cmd.linear.x = 0.0
                self.move_cmd.angular.z = 0.0
                return

            # Trouver le contour le plus long
            longest_contour = max(contours, key=cv2.contourArea)

            # Calculer le centre du contour le plus long
            M = cv2.moments(longest_contour)
            cx = int(M['m10'] / M['m00'])

            # Calculer l'erreur de position par rapport au centre de la route
            error = cx - cv_image.shape[1] / 2

            # Calculer la commande de virage
            turn = self.turn_gain * float(error) / cv_image.shape[1]

            # Calculer la commande de maintien de la trajectoire
            straight = self.straight_gain * (self.road_width / 2 - self.min_dist_to_obstacle)

            # Commander le mouvement du robot
            self.move_cmd.linear.x = self.max_speed
            self.move_cmd.angular.z = turn + straight

        # Publier la commande de mouvement du robot
        self.cmd_vel_pub.publish(self.move_cmd)


    # Boucle principale
    def run(self):
        # Boucle jusqu'à ce que le noeud soit arrêté
        while not rospy.is_shutdown():
            # Traiter les callbacks
            rospy.spin()


if __name__ == '__main__':
    try:
        turtlebot3 = TurtleBot3()
        turtlebot3.run()
    except rospy.ROSInterruptException:
        pass

