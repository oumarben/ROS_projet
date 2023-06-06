#!/usr/bin/env python

import cv2
import numpy as np
import time
import threading
from sensor_msgs.msg import Image
from geometry_msgs.msg import Twist
from cv_bridge import CvBridge, CvBridgeError
import rospy
from sensor_msgs.msg import LaserScan
import math

class YellowDetection:

    pauseCamera = False

    def __init__(self):
        # Initialiser ROS
        rospy.init_node('noeud_detection_jaune')
        self.bridge = CvBridge()
        self.image_pub = rospy.Publisher(
            'image_detection_jaune', Image, queue_size=1)
        self.cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
        self.rate = rospy.Rate(10)  # Taux de publication de l'image
        self.cmd_vel = Twist()
        
        rospy.Subscriber('/scan', LaserScan, self.lidar_callback)
        self.forward_speed = 0.1
        self.min_dist_to_obstacle = 0.16  # Seuil de distance pour la détection des obstacles
        self.obstacle_detected = False
        # Initialisation des commandes de mouvement du robot
        self.angle_to_obstacle = 0.0
        self.target_orientation = 0.0
        
        

    def delimite(self, img, x_start, x_end, y_start, y_end):
        m = np.copy(img)  # Copie de l'image d'origine
        # Découpe de l'image en utilisant les limites définies
        m = m[y_start:y_end, x_start:x_end]

        return m

    def detect_yellow_side(self, image):
        # Paramètres de détection de la couleur
        lower_yellow = np.array([20, 100, 100])
        upper_yellow = np.array([30, 255, 255])

        # Convertir l'image de BGR en HSV
        hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

        # Filtrer les pixels jaunes dans l'image HSV
        mask = cv2.inRange(hsv, lower_yellow, upper_yellow)

        # Calculer le pourcentage de pixels jaunes dans l'image
        total_pixels = mask.shape[0] * mask.shape[1]
        yellow_pixels = np.sum(mask > 0)
        yellow_percentage = (yellow_pixels / total_pixels) * 100

        # Compter le nombre de pixels jaunes à gauche et à droite de l'image
        height, width = mask.shape[:2]
        left_count = np.sum(mask[:, :width // 2] > 0)
        right_count = np.sum(mask[:, width // 2:] > 0)
        rospy.loginfo(yellow_percentage)
        # Déterminer le côté majoritairement jaune
        if yellow_percentage < 5:
            return 0
        elif yellow_percentage >= 10:
            return 2
        elif right_count > left_count:
            return 1
        elif right_count < left_count:
            return -1
        else:
            return 0

    """def controlMove(self,angle,linear):
        self.cmd_vel.angular.z = angle
        self.cmd_vel.linear.x = linear"""
    def lidar_callback(self, data):
        # Obtenir les données du Lidar
        scan = data.ranges
        global lidarValue

        # Vérifier s'il y a des obstacles
        obstacle_detected = False
        min_distance = min(x for x in scan if x > 0)
        if min_distance < self.min_dist_to_obstacle:
            obstacle_detected = True
        rospy.loginfo("distance_min :" + str(min_distance))

        # Faire quelque chose en fonction de la détection des obstacles
        if obstacle_detected:
            # Calculer l'angle vers l'obstacle le plus proche
            angle_min = data.angle_min
            angle_increment = data.angle_increment
            index_min = scan.index(min_distance)
            self.angle_to_obstacle = angle_min + index_min * angle_increment


            # Vérifier la position de l'obstacle par rapport au TurtleBot
            if (self.angle_to_obstacle > 2.19) & (self.angle_to_obstacle < 2.89) :  # Obstacle à droite
                lidarValue = 1
            elif (self.angle_to_obstacle > 3.0) & (self.angle_to_obstacle < 3.83) : # Obstacle à gauche
                lidarValue = -1
        else:
            lidarValue = 0


    def moveCameraLidar(self):
        # Créer l'objet de capture vidéo
        cap = cv2.VideoCapture(0)

        while not rospy.is_shutdown():
            # Lire une image de la caméra
            ret, frame = cap.read()

            # Vérifier si la lecture de l'image est réussie
            if not ret:
                rospy.logerr("Échec de la lecture de l'image depuis la caméra")
                break

            # Convertir l'image en un message de capteur
            try:
                image_msg = self.bridge.cv2_to_imgmsg(frame, "bgr8")
            except CvBridgeError as e:
                rospy.logerr(e)
                break
            # initialisation des valeurs
            lidar_callback()
            
            if pauseCamera == False:

                # Position de départ horizontale
                x_start = int(len(frame[1]) * 0.25)
                # Position de fin horizontale
                x_end = int(len(frame[1]) * 0.75)
                # Position de départ verticale
                y_start = int(len(frame) * 0.75)
                y_end = int(len(frame))  # Position de fin verticale
                delim = self.delimite(frame, x_start, x_end, y_start, y_end)
                yellow_side = self.detect_yellow_side(delim)

               # Publier l'image et le résultat de la détection
                self.image_pub.publish(image_msg)
                rospy.loginfo(yellow_side)
                
                if yellow_side != 0:
                    vitesse = 0.0
                if (yellow_side == 1):
                    # on actualise la valeur de lidar
                    if (lidarValue != 1) :
                        # Tourner à droite
                        self.cmd_vel.angular.z = 0.3
                        self.cmd_vel.linear.x = vitesse
                    
                    else:
                        # Tourner à gauche 
                        self.cmd_vel.angular.z = -0.15
                        self.cmd_vel.linear.x = vitesse

                if (yellow_side == -1):
                    # on actualise la valeur de lidar
                    
                    if (lidarValue != -1):
                        # Tourner à gauche
                        self.cmd_vel.angular.z = -0.3
                        self.cmd_vel.linear.x = vitesse
                    # Tourner à droite
                    else:
                        self.cmd_vel.angular.z =0.15
                        self.cmd_vel.linear.x = vitesse

                if (yellow_side == 2):
                    # on actualise la valeur de lidar
                    # Tourner à 180°
                    if (lidarValue != 1):
                        self.cmd_vel.angular.z = -0.43
                        self.cmd_vel.linear.x = vitesse
                    else:
                        self.cmd_vel.angular.z = 0.43
                        self.cmd_vel.linear.x = vitesse

                if (yellow_side == 0):
                    # Circuler en ligne droite
                    if ((lidarValue == 0)):
                        vitesse = 0.5
                        self.cmd_vel.angular.z = 0.0
                        self.cmd_vel.linear.x = vitesse
                    # Tourner à droite
                    elif (lidarValue == 1):
                        vitesse = 0.0
                        self.cmd_vel.angular.z = -0.15
                        self.cmd_vel.linear.x = vitesse
                    elif (lidarValue == -1):
                        vitesse = 0.0
                        self.cmd_vel.angular.z = 0.15
                        self.cmd_vel.linear.x = vitesse

                # Publier la commande de déplacement
                self.cmd_vel_pub.publish(self.cmd_vel)
            # les conditions de la camera son eteint
            """else :
                lidarValue = 0
                # Attendre avant la prochaine itération
                self.rate.sleep()"""

        # Libérer les ressources
        cap.release()
        cv2.destroyAllWindows()

    def run(self):
        global vitesse 
        global pauseCamera
        pauseCamera = False
        vitesse = 0.5
        # Création du thread
        camLid = threading.Thread(target=moveCameraLidar)
        # Démarrage du thread
        camLid.start()
        """if (feu == "orange") | (panneau == "limite-vitesse-5"):
            vitesse /= 2
        if feu == "rouge":
            # Arrêter le TurtleBot
            self.cmd_vel.angular.z = 0.0
            self.cmd_vel.linear.x = 0.0
            self.cmd_vel_pub.publish(self.cmd_vel)"""


if __name__ == '__main__':
    detection = YellowDetection()
    detection.run()
