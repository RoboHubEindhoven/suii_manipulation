#! /usr/bin/env python

import rospy
from actionlib import SimpleActionServer
from ur_script_control.msg import RobotArmAction, RobotArmFeedback, RobotArmResult
from ur_script_control.msg import object_pose

class RobotArmActionServer:
    action_feedback = RobotArmFeedback()
    action_result   = RobotArmResult()

    def __init__(self, action_name):
        self.action_name = action_name
        self.server = SimpleActionServer(self.action_name, RobotArmAction, execute_cb=self.execute_cb, auto_start = False)
        self.server.start()

    def get_object_description(self, object_type):
        if (object_type  == 1):  # Small Aluminium Profile (Black)
            return "Small black profile"
        elif (object_type  == 2):  # Small Aluminium Profile (Grey)
            return "Small metal profile"
        elif (object_type  == 3):  # Big Aluminium Profile (Black)
            return "Big black profile"
        elif (object_type  == 4):  # Big Aluminium Profile (Grey)
            return "Big metal profile"
        elif (object_type  == 5):  # Screw (Bolt)
            return "Bolt"
        elif (object_type  == 6):  # Small Nut
            return "Small nut"
        elif (object_type  == 7):  # Large Nut
            return "Big nut"
        elif (object_type  == 8):  # Plastic Tube
            return "R20"
        elif (object_type  == 9):  #
            return "Bearing box"
        elif (object_type  == 10): #
            return "Bearing"
        elif (object_type  == 11): #
            return "Axis"
        elif (object_type  == 12): #
            return "Distance tube"
        elif (object_type  == 13): #
            return "Motor"
        elif (object_type  == 14): # A Container (Blue)
            return "Blue container"
        elif (object_type  == 15): # A Container (Red)
            return "Red container"

        def get_object_type(self, object_type):
            if (object_type  == "Small black profile"):  # Small Aluminium Profile (Black)
                return 1
            elif (object_type  == "Small metal profile"):  # Small Aluminium Profile (Grey)
                return 2
            elif (object_type  == 4):  # Big Aluminium Profile (Black)
                return "Big black profile"
            elif (object_type  == 4):  # Big Aluminium Profile (Grey)
                return "Big metal profile"
            elif (object_type  == 5):  # Screw (Bolt)
                return "Bolt"
            elif (object_type  == 6):  # Small Nut
                return "Small nut"
            elif (object_type  == 7):  # Large Nut
                return "Big nut"
            elif (object_type  == 8):  # Plastic Tube
                return "R20"
            elif (object_type  == 9):  #
                return "Bearing box"
            elif (object_type  == 10): #
                return "Bearing"
            elif (object_type  == 11): #
                return "Axis"
            elif (object_type  == 12): #
                return "Distance tube"
            elif (object_type  == 13): #
                return "Motor"
            elif (object_type  == 14): # A Container (Blue)
                return "Blue container"
            elif (object_type  == 15): # A Container (Red)
                return "Red container"

    def execute_cb(self, goal):
        r = rospy.Rate(1)
        success = True
        self.command = goal.command
        self.waypoint = goal.object.table_description
        self.object_name = goal.object.object_name
        self.y = goal.object.y
        self.x = goal.object.x
        self.theta = goal.object.theta
        
        print("name: {}".format(self.object_name))
        print("y: {}".format(self.y))
        print("x: {}".format(self.x))
        print("theta: {}".format(self.theta))
        print("Waipoint: {}".format(self.waypoint))
        
        self.server.publish_feedback(self.action_feedback)

        if self.command == "GRIPPER_GRASP":
            print("GRIPPER_GRASP")
            self.data = "GRIPPER-OK"
            success = True
        elif self.command == "GRIPPER_PLACE":
            print("GRIPPER_PLACE")
            self.data = "GRIPPER-OK"
            success = True
        
        

        if success:
            self.action_feedback.feedback = self.data
            self.action_result.result    = self.data
            rospy.loginfo('%s: Succeeded' % self.action_name)
            self.server.set_succeeded(self.action_result)

if __name__ == "__main__":
    rospy.init_node("robot_arm_action")
    node = RobotArmActionServer(rospy.get_name())
    rospy.spin()