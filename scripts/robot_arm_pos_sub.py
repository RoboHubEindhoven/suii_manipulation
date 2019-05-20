#!/usr/bin/env python
#Subscriber test

import rospy
from std_msgs.msg import String

def callback(data):
    x = data.data
    print(x)
    
def listener():
    rospy.init_node('robot_arm_subscriber', anonymous=True)
    rospy.Subscriber("robot_arm_position", String, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()