#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon May 15 07:41:51 2023

@author: ubuntu
"""

#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist

rospy.init_node('turtlebot_controller')
cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)

def move_turtlebot(linear_speed, angular_speed):
    twist_msg = Twist()
    twist_msg.linear.x = linear_speed
    twist_msg.angular.z = angular_speed
    cmd_vel_pub.publish(twist_msg)

if __name__ == '__main__':
    try:
        # Avancer
        move_turtlebot(0.1, 0.0)  # Vitesse linéaire : 0.1 m/s, Vitesse angulaire : 0.0 rad/s
        rospy.sleep(2)  # Attendre 2 secondes

        # Tourner à gauche
        move_turtlebot(0.0, 0.5)  # Vitesse linéaire : 0.0 m/s, Vitesse angulaire : 0.5 rad/s
        rospy.sleep(1)  # Attendre 1 seconde

        # Arrêter
        move_turtlebot(0.0, 0.0)  # Vitesse linéaire : 0.0 m/s, Vitesse angulaire : 0.0 rad/s

    except rospy.ROSInterruptException:
        pass
