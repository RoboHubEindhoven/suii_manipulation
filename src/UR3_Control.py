#!/usr/bin/env python
import rospy
import time
from SendMove import SendMove
from ur_driver.io_interface import set_analog_out, set_states
from math import pi, sqrt, sin
from tf2_msgs.msg import TFMessage
from geometry_msgs.msg import Pose, TwistStamped
from actionlib import SimpleActionServer
from std_msgs.msg import String
import tf
import numpy

from suii_msgs.srv import ManipulationAction, ManipulationPose

class RobotArmActionServer():

    def __init__(self, action_name):
        #Services
        self.scanServer = rospy.Service("/move_camera", ManipulationPose, self.scan_cb)
        self.pickServer = rospy.Service("/pick", ManipulationAction, self.pick_cb)
        self.placeServer = rospy.Service("/place", ManipulationAction, self.place_cb)

        #Instances
        self.m = SendMove()
        self.t = tf.TransformListener()
        self.toolTF = Pose()
        self.objectTF = Pose()
        self.goalHolderPlace = String()
        self.armPose = ""

        #Subscribers
        rospy.Subscriber("/tf", TFMessage, self.getToolTF)
        rospy.Subscriber("tool_velocity", TwistStamped, self.getToolVelocity)
        
        #Start gripper service-server
        set_states()

        self.m.sendMove("set_analog_outputdomain(0, 1)")
        self.moveGripper("Open")

        self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('TestPose2')))
        self.waitForArm()

        self.run_once = False
        self.run_twice = False

    def moveGripper(self, pos):
        if pos == "Open":
            set_analog_out(0, 0.4) #Open gripper
        elif pos == "Close":
            set_analog_out(0, 0.0) #Close gripper
        else:
            rospy.loginfo("Invalid input: %s", str(pos))

    def drivePose(self):
        if self.armPose is not "Drive position":
            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('preHome')))
            self.waitForArm()
            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('Home')))
            self.waitForArm()
            self.armPose = "Drive position"
            rospy.loginfo("Robot arm reached %s", self.armPose)
        else:
            rospy.loginfo("Robot arm is already in %s", self.armPose)

    def goHolder(self, holderPlace, picking):
        rospy.loginfo("Going to holderplace %s", holderPlace)
        if holderPlace == "HOLDER_1":
            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('finalPreHolder1')))
            self.waitForArm()
            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('finalHolder1')))
            self.waitForArm()
            
            if picking == "Pick":
                self.moveGripper("Open")
                time.sleep(1)
            elif picking == "Place":
                self.moveGripper("Close")
                time.sleep(1)

            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('finalPreHolder1')))
            self.waitForArm()

        elif holderPlace == "HOLDER_2":
            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('finalPreHolder2')))
            self.waitForArm()
            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('finalHolder2')))
            self.waitForArm()
            
            if picking == "Pick":
                self.moveGripper("Open")
                time.sleep(1)
            elif picking == "Place":
                self.moveGripper("Close")
                time.sleep(1)

            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('finalPreHolder2')))
            self.waitForArm()
           
        elif holderPlace == "HOLDER_3":
            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('finalPreHolder3')))
            self.waitForArm()
            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('finalHolder4')))
            self.waitForArm()

            if picking == "Pick":
                self.moveGripper("Open")
                time.sleep(1)
            elif picking == "Place":
                self.moveGripper("Close")
                time.sleep(1)

            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('finalPreHolder2')))
            self.waitForArm()

    def MHome(self):
        if self.armPose is not "Home position":
            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('preBase'), 0.5))
            self.waitForArm()
            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos('finalHome')))
            self.waitForArm()
            rospy.loginfo("Robot reached %s", self.armPose)
        else:
            rospy.loginfo("Robot arm already in %s", self.armPose)

    def moveTool(self, pose):
        if self.isPoseReachable(pose):
            self.m.sendMove(self.m.buildMove('l', 'p', pose))
            self.waitForArm()

    def waitForArm(self):
        time.sleep(0.3) #0.3 value for real ur3 otherwise arm has no time to get speed
        while (abs(self.xVel) > 0.00005 or abs(self.yVel) > 0.00005 or abs(self.zVel) > 0.0005) and not rospy.is_shutdown():
            rospy.loginfo_throttle(1, "Robot is moving to position")
        rospy.loginfo("Robot reached position")

    def isPoseReachable(self, pose):
        maxReach = 0.5
        minReach = 0.064
        x = pose[0] 
        y = pose[1]
        z = pose[2]
        distance = sqrt(x**2 + y**2 + z**2)
        if distance < maxReach and distance > minReach:
            rospy.loginfo("Positon in reach. Distance = %s", distance)
            return True
        else:
            rospy.logwarn("Out of reach, command not sended. Distance = %s", distance)


    def onTF(self, link, state):

        transform = self.t.lookupTransform("ur3/base", link, rospy.Time(0))
        rospy.loginfo_throttle(5, "Tranformation found for %s"%link)
        x = transform[0][0]
        y = transform[0][1]
        z = transform[0][2]
        qrx = transform[1][0]
        qry = transform[1][1]
        qrz = transform[1][2]
        qrw = transform[1][3]
        [roll, pitch, yaw] = tf.transformations.euler_from_quaternion([qrx, qry, qrz, qrw])
        [rx,ry,rz] = self.m.euler2Rot(roll, pitch, yaw)

        self.m.sendMove(self.m.buildMove('j', 'p', [x, y, z + 0.05, rx, ry, rz]))
        self.waitForArm()

        self.moveTool([x, y, z, rx, ry, rz])

        if state == "Pick":
            self.moveGripper("Close")
            time.sleep(1)
        elif state == "Place":
            self.moveGripper("Open")
            time.sleep(1)

        self.moveTool([x, y, z + 0.05, rx, ry, rz])

        #----------Code for object following----------
        # pose = [x, y, z + 0.05 * sin(2.3*rospy.get_time()) + 0.05, rx, ry, rz]
        # array = list(pose)
        # a = 1.0
        # v = 1.0
        # t = 0.05
        # st = "servoj(get_inverse_kin(p%s), a=%s, v=%s, t=%s)"%(array, a, v, t)
        # self.m.sendMove(st)
        # time.sleep(t)


    def getToolTF(self, msg):
	if len(msg.transforms) == 0:
            return
        if msg.transforms[-1].child_frame_id == "ur3/tool0_controller":
            x = msg.transforms[-1].transform.translation.x
            y = msg.transforms[-1].transform.translation.y
            z = msg.transforms[-1].transform.translation.z
            qx = msg.transforms[-1].transform.rotation.x
            qy = msg.transforms[-1].transform.rotation.y
            qz = msg.transforms[-1].transform.rotation.z
            qw = msg.transforms[-1].transform.rotation.w
            [roll, pitch, yaw] = tf.transformations.euler_from_quaternion([qx, qy, qz, qw])
            [rx, ry, rz] = self.m.euler2Rot(roll, pitch, yaw)
            self.tool = [x,y,z,rx,ry,rz]

    def getToolVelocity(self, msg):
        self.xVel = msg.twist.linear.x
        self.yVel = msg.twist.linear.y
        self.zVel = msg.twist.linear.z
        self.rxVel = msg.twist.angular.x
        self.ryVel = msg.twist.angular.y
        self.rzVel = msg.twist.angular.z


# ----------Service Callbacks----------
    def scan_cb(self, msg):

        self.scanTarget = msg.target
        scanPose = "scanPosition%s" % self.scanTarget

        if self.armPose is not scanPose:
            self.m.sendMove(self.m.buildMove('j', '', self.m.getPos(scanPose)))
            rospy.loginfo("Arm is moving to %s", scanPose)
            self.waitForArm()
            self.armPose = scanPose
            status = False
        else:
            rospy.logwarn("Arm is already in %s", scanPose)
            status = True

        return status

    def pick_cb(self, msg):
        self.armPose = ""
        self.pickLink = msg.link

        if self.t.canTransform("ur3/base", self.pickLink, rospy.Time(0)):
            self.onTF(self.pickLink, "Pick")
            status = 0
        elif "HOLDER" in self.pickLink:
            self.goHolder(self.pickLink, "Pick")
            status = 0
        else:
            status = 1
            rospy.logwarn("Invalid link: %s", self.pickLink)

        return status

    def place_cb(self, msg):
        self.armPose = ""
        self.placeLink = msg.link

        if self.t.canTransform("ur3/base", self.placeLink, rospy.Time(0)):
            self.onTF(self.placeLink, "Place")
            status = 0
        elif "HOLDER" in self.placeLink:
            self.goHolder(self.placeLink, "Place")
            status = 0
        else:
            status = 1
            rospy.logwarn("Invalid link: %s", self.placeLink)

        return status

if __name__ == '__main__':
    rospy.init_node("robot_arm_action")
    robotArm = RobotArmActionServer(rospy.get_name())
    while not rospy.is_shutdown():
        try:
            rospy.spin()
        except rospy.ROSInterruptException:
            pass
