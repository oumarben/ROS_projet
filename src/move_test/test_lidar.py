#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
import math

class TurtleBotController:
    def __init__(self):
        rospy.init_node('turtlebot_controller', anonymous=True)
        rospy.Subscriber('/scan', LaserScan, self.lidar_callback)
        self.cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        self.rate = rospy.Rate(10)  # Fréquence de mise à jour (10 Hz)
        self.forward_speed = 0.1
        self.min_dist_to_obstacle = 0.16  # Seuil de distance pour la détection des obstacles
        self.obstacle_detected = False
        # Initialisation des commandes de mouvement du robot
        self.move_cmd = Twist()
        self.angle_to_obstacle = 0.0
        self.target_orientation = 0.0

    def lidar_callback(self, data):
        # Obtenir les données du Lidar
        scan = data.ranges

        # Vérifier s'il y a des obstacles
        obstacle_detected = False
        min_distance = min(x for x in scan if x > 0)
        if min_distance < self.min_dist_to_obstacle:
            obstacle_detected = True
        rospy.loginfo("distance_min :" + str(min_distance))

        # Faire quelque chose en fonction de la détection des obstacles
        if obstacle_detected:
            rospy.loginfo("Obstacle détecté !")

            # Calculer l'angle vers l'obstacle le plus proche
            angle_min = data.angle_min
            angle_increment = data.angle_increment
            index_min = scan.index(min_distance)
            self.angle_to_obstacle = angle_min + index_min * angle_increment

            # Calculer l'angle de déviation
            deviation_angle = math.pi/4  # Angle de déviation de 30 degrés

            # Vérifier la position de l'obstacle par rapport au TurtleBot
            if (self.angle_to_obstacle > 2.19) & (self.angle_to_obstacle < 2.89) :  # Obstacle à droite
                self.target_orientation = deviation_angle
                rospy.loginfo("obstacle à droite : "+ str(self.target_orientation))
            elif (self.angle_to_obstacle > 3.0) & (self.angle_to_obstacle < 3.83) : # Obstacle à gauche
                self.target_orientation = -deviation_angle
                rospy.loginfo("obstacle à gauche : "+ str(self.angle_to_obstacle))
            else:
                rospy.loginfo("Non spécifié : "+ str(self.angle_to_obstacle))

            # Faire pivoter le TurtleBot vers la nouvelle orientation cible
            self.move_cmd.linear.x = 0.0
            self.move_cmd.angular.z = self.target_orientation
            self.cmd_vel_pub.publish(self.move_cmd)
        else:
            rospy.loginfo("Aucun obstacle détecté. Continuer la route.")

            # Continuer tout droit
            self.move_cmd.linear.x = self.forward_speed
            self.move_cmd.angular.z = 0.0
            self.cmd_vel_pub.publish(self.move_cmd)

        # Mettre à jour la variable obstacle_detected
        self.obstacle_detected = obstacle_detected

    def run(self):
        # Boucle infinie jusqu'à ce que le noeud soit arrêté
        while not rospy.is_shutdown():
            self.rate.sleep()


if __name__ == '__main__':
    try:
        controller = TurtleBotController()
        controller.run()
    except rospy.ROSInterruptException:
        pass
