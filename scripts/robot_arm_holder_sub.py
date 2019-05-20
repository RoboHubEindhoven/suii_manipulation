#!/usr/bin/env python
#Subscriber test

import rospy
from std_msgs.msg import String

def callback(data):
    x = data.data
    print(x)
    
def listener():
    rospy.init_node('robot_arm_holder_sub', anonymous=True)
    rospy.Subscriber("object_holder", String, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()