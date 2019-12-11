#! /usr/bin/env python2.7
import rospy
from ur_control_panel import UrControlPanel
from suii_msgs.srv import UrManager, UrManagerResponse


class UrManagerRosWrapper(object):

    def __init__(self):
        self.urm = UrControlPanel("192.168.2.204")  # The host of the robot.
        self.ur_service = rospy.Service("/ur_manager", UrManager, self.ur_service_cb)
        print(self.urm)

    def ur_service_cb(self, string):
        resp = UrManagerResponse()
        resp.response = self.urm.ur_command_switch(string.command)

        return resp


if __name__ == '__main__':
    rospy.init_node("Ur_Manager")
    u = UrManagerRosWrapper()
    rospy.spin()
