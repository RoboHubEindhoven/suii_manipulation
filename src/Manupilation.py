#!/usr/bin/env python
import rospy
import time
from UR import UR
from Gripper import Gripper
from SendMove import SendMove
from tf2_msgs.msg import TFMessage
from geometry_msgs.msg import Pose, TwistStamped
from std_msgs.msg import String
import tf

from suii_msgs.srv import ManipulationAction, ManipulationPose

class Manipulation():

    def __init__(self):
        #Initialize manipulation node
        rospy.init_node("Manipulation")

        #Services
        self.scanService = rospy.Service("/move_camera", ManipulationPose, self.scan_cb)
        self.pickService = rospy.Service("/pick", ManipulationAction, self.pick_cb)
        self.placeService = rospy.Service("/place", ManipulationAction, self.place_cb)

        #Instances
        self.m = SendMove()
        self.t = tf.TransformListener()
        self.UR3 = UR()

# ----------Service Callbacks----------
    def scan_cb(self, msg):
        self.UR3.gripper.moveGripper("Open")
        self.scanTarget = msg.target
        scanPose = "scanPosition%s" % self.scanTarget

        if self.UR3.armPose is not scanPose:
            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos(scanPose)))
            rospy.loginfo("Arm is moving to %s", scanPose)
            self.UR3.waitForArm()
            self.UR3.armPose = scanPose
            status = False
        else:
            rospy.logwarn("Arm is already in %s", scanPose)
            status = True

        return status

    def pick_cb(self, msg):
        self.UR3.armPose = ""
        self.pickLink = msg.link

        if self.t.canTransform("ur3/base", self.pickLink, rospy.Time(0)):

            x = self.t.lookupTransform("ur3/base", self.pickLink, rospy.Time(0))[0][1]

            if (self.UR3.tool[1] < 0 and x > 0) or (self.UR3.tool[1] > 0 and x < 0):
                self.m.sendMove(self.m.buildMove('j', '', self.m.getPos("safetyStop")))
                self.UR3.waitForArm()

            self.UR3.onTF(self.pickLink, "Pick")
            status = 0

        elif ("HOLDER" in self.pickLink):
            self.UR3.goHolder(self.pickLink, "Pick")
            status = 0
        else:
            status = 1
            rospy.logwarn("Invalid link: %s", self.pickLink)

        return status

    def place_cb(self, msg):
        self.UR3.armPose = ""
        self.placeLink = msg.link

        if self.t.canTransform("ur3/base", self.placeLink, rospy.Time(0)):

            x = self.t.lookupTransform("ur3/base", self.placeLink, rospy.Time(0))[0][1]

            if (self.UR3.tool[1] < 0 and x > 0) or (self.UR3.tool[1] > 0 and x < 0):
	            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos("safetyStop")))
	            self.UR3.waitForArm()

            self.UR3.onTF(self.placeLink, "Place")
            status = 0

        elif "HOLDER" in self.placeLink:
            self.UR3.goHolder(self.placeLink, "Place")
            status = 0

        else:
            status = 1
            rospy.logwarn("Invalid link: %s", self.placeLink)

        return status

if __name__ == '__main__':
    manipulation = Manipulation()
    while not rospy.is_shutdown():
        try:
            rospy.spin()
        except rospy.ROSInterruptException:
            pass
