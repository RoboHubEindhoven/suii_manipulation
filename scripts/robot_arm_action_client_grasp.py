#! /usr/bin/env python

from __future__ import print_function
import rospy
from actionlib import SimpleActionClient
from ur_script_control.msg import object_pose
from ur_script_control.msg import RobotArmAction, RobotArmActionGoal, RobotArmGoal

class RobotArmActionClient():
    def __init__(self):
        self.client = SimpleActionClient("robot_arm_action", RobotArmAction)
        self.client.wait_for_server()
        rospy.Subscriber("/vision_data", Pose, self.callback)

        self.action_goal = RobotArmActionGoal()
        self.goal = RobotArmGoal()

    def callback(self, msg):
        self.tX = msg.position.x
        self.tY = msg.position.y
        self.tT = msg.orientation.z

    def request_pick(self):
        object_goal = object_pose()
        object_goal.object_name = "Motor"
        object_goal.x = self.tX
        object_goal.y = self.tY
        object_goal.theta = self.tT
        object_goal.table_description = "Waypoint 1"
        self.goal.command = "GRIPPER_GRASP"
        self.goal.object = object_goal
        self.client.send_goal(self.goal)
        self.client.wait_for_result()
        return self.client.get_result()  

if __name__ == "__main__":
    try:
        rospy.init_node('robot_arm_action_client')
        client = RobotArmActionClient()
        print("Requesting Pick")
        result = client.request_pick()
        print(result)
        rospy.spin()
    except rospy.ROSInterruptException:
        print("program interrupted before completion", file=sys.stderr)
