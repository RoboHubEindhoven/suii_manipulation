#! /usr/bin/env python2
import rospy as ros
from ur_control_panel import UrControlPanel
from suii_msgs.srv import UrManager


def ur_service_cb(string):
    urm.ur_command_switch(string)


if __name__ == '__main__':
    ros.init_node("Ur_Manager")
    # Services
    ur_service = ros.Service("/ur_manager", UrManager, ur_service_cb)
    urm = UrControlPanel("192.168.104.123")  # The host of the robot.



