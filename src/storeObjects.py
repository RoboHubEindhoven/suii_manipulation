#!/usr/bin/env python

import sys
import rospy
import yaml
import string

class Object(object):
    def __init__(self):
        self.name = raw_input("Give object name: ")
        self.height = raw_input("Give object height: ")
        self.width = raw_input("Give object width: ")

        raw_input("Press enter to save object")


if __name__ == '__main__':
    try:
        objects = []
        adr = '/home/remco/catkin_ws/src/ur_script_control/yaml/objects.yaml'        
        
        for i in range(0, 2):
            i = Object()
            objects.append(i)

        file = open(adr, 'w+')
        yaml.dump(i, file)
        file.close()
        

    except rospy.ROSInterruptException:
        pass