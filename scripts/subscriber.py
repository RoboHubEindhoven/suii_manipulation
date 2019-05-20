#!/usr/bin/env python
# license removed for brevity
import rospy
from geometry_msgs.msg import Pose

def listener_callback(data):
    x = data.position.x
    y = data.position.y
    theta = data.orientation.z
    print("x {} y {} theta {}".format(x , y , theta))

def listener():
    rospy.init_node('listener', anonymous=True)
    pose = rospy.Subscriber("/vision_data", Pose, listener_callback) 
    rospy.spin()
if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass