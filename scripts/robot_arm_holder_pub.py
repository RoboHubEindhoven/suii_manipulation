#!/usr/bin/env python
#Publisher test

import rospy
from std_msgs.msg import String

def talker():
    pub = rospy.Publisher('/object_holder', String, queue_size=10)
    rospy.init_node('robot_arm_holder_sub', anonymous=True)
    #rate = rospy.Rate(10) # 10hz
    #while not rospy.is_shutdown():
    hello_str = "HOLDER_2"
    pub.publish(hello_str)
    #rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
