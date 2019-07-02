#!/usr/bin/env python
import rospy
import time
from SendMove import SendMove
from ur_driver.io_interface import set_analog_out, set_states

class Gripper():
    def __init__(self):
        self.s = SendMove()

        #Start gripper service-server
        set_states()

        #Set analog output to voltage mode
        self.s.sendMove("set_analog_outputdomain(0, 1)")

    def moveGripper(self, pos, objectName=''):#objectName is a default '' for the open en close state
        """This function can open or close the gripper.
        
        Arguments:
            pos {String} -- ["Open" or "Close" or "prepick"]
            objectName {String} -- [official object robocup object names]
        """
        if pos == "Open":
            set_analog_out(0, 0.0) #Open gripper
            time.sleep(1)

        elif pos == "Close":
            set_analog_out(0, 0.45) #Close gripper
            time.sleep(1)

        elif pos == "prepick":

            if ("20" in objectName) or objectName=="AXIS" or objectName=="DISTANCE_TUBE" or objectName=="BEARING" :#prepick for the middle sized objects
                set_analog_out(0,0.25)
                time.sleep(1)
            elif ("40" in objectName) or objectName=="M30" or objectName=="BEARING_BOX" or objectName=="MOTOR" :#prepick for the largesized objects
                set_analog_out(0,0.15)
                time.sleep(1)
            elif ("HOLDER" in objectName):
                set_analog_out(0,0.45)
                time.sleep(1)
                pass
        else:
            rospy.loginfo("Invalid input: %s", str(pos))
