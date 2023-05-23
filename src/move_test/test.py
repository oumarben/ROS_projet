#!/usr/bin/env python

import cv2
import numpy as np
import rospy
from sensor_msgs.msg import Image
from geometry_msgs.msg import Twist
from cv_bridge import CvBridge, CvBridgeError


class YellowDetection:
    def __init__(self):
        # Initialiser ROS
        rospy.init_node('noeud_detection_jaune')
        self.bridge = CvBridge()
        self.image_pub = rospy.Publisher(
            'image_detection_jaune', Image, queue_size=1)
        self.cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
        self.rate = rospy.Rate(10)  # Taux de publication de l'image
        self.cmd_vel = Twist()

    def delimite(self, img):
        m = np.copy(img)  # Copie de l'image d'origine

        # Suppression de la partie supérieure de l'image
        x = int(len(m) * 0.70)  # Calcul de la limite de suppression
        for i in range(len(m)):
            for j in range(len(m[0])):
                if i < x:  # Si la position verticale est inférieure à la limite
                    m[i][j] = [0, 0, 0]  # Remplacement du pixel par du noir

        # Définition des limites pour la découpe de l'image
        x_start = int(len(m[1]) * 0.25)  # Position de départ horizontale
        x_end = int(len(m[1]) * 0.75)  # Position de fin horizontale
        y_start = int(len(m) * 0.15)  # Position de départ verticale
        y_end = int(len(m))  # Position de fin verticale

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

        # Compter le nombre de pixels jaunes à gauche et à droite de l'image
        height, width = mask.shape[:2]
        left_count = np.sum(mask[:, :width // 2] > 0)
        right_count = np.sum(mask[:, width // 2:] > 0)

        # Déterminer le côté majoritairement jaune
        if left_count > right_count:
            return -1
        elif right_count > left_count:
            return 1
        else:
            return 0

    def run(self):
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

            # Détecter le côté majoritairement jaune
            delim = self.delimite(frame)
            yellow_side = self.detect_yellow_side(delim)

            # Publier l'image et le résultat de la détection
            self.image_pub.publish(image_msg)
            rospy.loginfo(
                "Côté majoritairement jaune : {}".format(yellow_side))

            # Déplacer le TurtleBot en fonction du résultat de la détection
            if yellow_side == 1:
                # Tourner à droite
                self.cmd_vel.angular.z = -0.5
                self.cmd_vel.linear.x = 0.0
            elif yellow_side == -1:
                # Tourner à gauche
                self.cmd_vel.angular.z = 0.5
                self.cmd_vel.linear.x = 0.0
            else:
                # Circuler en ligne droite
                self.cmd_vel.angular.z = 0.0
                self.cmd_vel.linear.x = -0.5

            # Publier la commande de déplacement
            self.cmd_vel_pub.publish(self.cmd_vel)

            # Attendre avant la prochaine itération
            self.rate.sleep()

        # Arrêter le TurtleBot
        self.cmd_vel.angular.z = 0.0
        self.cmd_vel.linear.x = 0.0
        self.cmd_vel_pub.publish(self.cmd_vel)

        # Libérer les ressources
        cap.release()
        cv2.destroyAllWindows()


if __name__ == '__main__':
    detection = YellowDetection()
    detection.run()
