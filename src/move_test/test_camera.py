#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
class TurtleBotController:
    def __init__(self):
        rospy.init_node('turtlebot_controller', anonymous=True)
        rospy.Subscriber('/scan', LaserScan, self.lidar_callback)
        self.cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        self.rate = rospy.Rate(10)  # Fréquence de mise à jour (10 Hz)
        self.forward_speed = 0.2
        self.min_dist_to_obstacle = 0.11  # Seuil de distance pour la détection des obstacles
        self.obstacle_detected = False
        # Initialisation des commandes de mouvement du robot
        self.move_cmd = Twist()

    def lidar_callback(self, data):
        # Obtenir les données du Lidar
        scan = data.ranges

        # Vérifier s'il y a des obstacles
        obstacle_detected = False
        min_distance = min(scan)
        if min_distance < self.min_dist_to_obstacle:
            obstacle_detected = True

        # Faire quelque chose en fonction de la détection des obstacles
        if self.obstacle_detected:
            rospy.loginfo("Obstacle détecté !")
           # Effectuer les actions nécessaires pour dévier l'obstacle
            self.move_cmd.linear.x = 0.0
            self.move_cmd.angular.z = 0.0
            self.cmd_vel_pub.publish(self.move_cmd)

        # Autres actions à effectuer en l'absence d'obstacles
        else:
            rospy.loginfo("Aucun obstacle détecté. Continuer la route.")
            # Continuer à rouler dans la direction souhaitée
            self.move_cmd.linear.x = 0.0
            self.move_cmd.angular.z = 0.0
            self.cmd_vel_pub.publish(self.move_cmd)
        self.obstacle_detected = obstacle_detected

    def run(self):
		#Boucle infine jusqu'à ce que le noeud sera arrêté
        while not rospy.is_shutdown():
            self.rate.sleep()


if __name__ == '__main__':
    try:
        controller = TurtleBotController()
        controller.run()
    except rospy.ROSInterruptException:
        pass
