#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Pose
from visualization_msgs.msg import Marker
from math import pi, sin, cos
import tf
from SendMove import SendMove

if __name__ == '__main__':
        try:
            rospy.init_node("add_marker", anonymous=True)
            pub_marker = rospy.Publisher('visualization_marker', Marker, queue_size=10)
            br = tf.TransformBroadcaster()
            listener = tf.TransformListener()
            s = SendMove()
            marker = Marker()
            marker.header.frame_id = "camera"
            marker.header.stamp = rospy.Time()
            marker.ns = "Marker"
            marker.id = 0
            marker.type = Marker.CUBE
            marker.action = Marker.ADD
	        #vision =  rospy.wait_for_message("/vision_data", Pose)
	        #print(vision)
            marker.pose.position.x = -0.1 #vision.position.x
            marker.pose.position.y = -0.005 #vision.position.y
            marker.pose.position.z = -0.41
            (x, y, z, w) = tf.transformations.quaternion_from_euler(0, 0, -pi/4) #vision.orientation.z - pi/2
            marker.pose.orientation.x = x
            marker.pose.orientation.y = y
            marker.pose.orientation.z = z
            marker.pose.orientation.w = w
            marker.scale.x = 0.04
            marker.scale.y = 0.04
            marker.scale.z = 0.04
            marker.color.a = 1.0
            marker.color.r = 0.0
            marker.color.g = 1.0
            marker.color.b = 0.0

	        # if vision.orientation.z < 0:
	        # angle = -vision.orientation.z - pi/2
	        # elif vision.orientation.z > 0:
		    # angle = -vision.orientation.z + pi/2

            angle = -pi/4

            pub_marker.publish(marker)

            while not rospy.is_shutdown():
                br.sendTransform((marker.pose.position.x, marker.pose.position.y, marker.pose.position.z), tf.transformations.quaternion_from_euler(0, 0, angle),  rospy.Time.now(), "object", "camera")
                if listener.canTransform("object", "ur3/base", rospy.Time(0)):
                    t = listener.lookupTransform("ur3/base", "object", rospy.Time(0))
                    while not rospy.is_shutdown():
                        x = t[0][0] # + 0.06 * sin(rospy.get_time())
                        y = t[0][1] # + 0.06 * cos(rospy.get_time())
                        br.sendTransform((x, y, t[0][2]), (t[1][0], t[1][1], t[1][2], t[1][3]), rospy.Time.now(), "object", "ur3/base")
                        rospy.loginfo_throttle(5, "Sending TF")
        except rospy.ROSInterruptException:
            pass
