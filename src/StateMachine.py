#!/usr/bin/env python
import sys
import rospy
import yaml
from std_msgs.msg import String
from SendMove import SendMove

class StateMachine (object):
    def __init__(self):
        self.pub = rospy.Publisher('/ur_driver/URScript', String, queue_size=10, latch=True)
        rospy.init_node('StateMachineNode', anonymous=True)
        
        self.addr = '/home/remco/catkin_ws/src/ur_script_control/yaml/poses.yaml'

    def getPos(self, pos_name):
        file = open(self.addr, 'r')
        y = yaml.load(file)
        file.close()
        poses = y
        wanted_pose = poses.get(pos_name)
        #print wanted_pose
        return wanted_pose

    def buildMove(self, moveType, pose):
        #Moving on jointpositions = "movej([-1.95, -1.58, 1.16, -1.15, -1.55, 1.18], a=1.0, v=0.1)"+"\n"
        #Moving on posepositions = "movej(p[0.00, 0.3, 0.4, 2.22, -2.22, 0.00], a=1.0, v=0.1)" + "\n"
        acceleration = 1.0  #Joint acceleration in rad/s^2
        speed = 10.0 #Joint speed in rad/s
        time = 0 #Time the move must take
        radius = 0 # Blend radius in m, so the robot moves trough the point instead of stopping
        #array = list(pose)
        sendable = "move%s(%s, a=%s, v=%s, t=%s, r=%s)" % (moveType, pose, acceleration, speed, time, radius)
        #sendable = "movej(p[0.00, 0.3, 0.4, 2.22, -2.22, 0.00], a=1.0, v=0.1"
        #print sendable
        return sendable

    def sendMove(self, string):
        st = String()        
        st.data = string
        self.pub.publish(st)
        print "Published"

    def testSequence(self):
        self.sendMove(self.buildMove('j',self.getPos('scanPose')))
        rospy.sleep(2)
        self.sendMove(self.buildMove('j',self.getPos('drivePose')))
        rospy.sleep(2)


if __name__ == '__main__':
    try:
        x = StateMachine()
        x.testSequence()
        
        
        #rospy.spin()             
        
    except rospy.ROSInterruptException:
        pass
