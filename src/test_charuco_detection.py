#!/usr/bin/env python

import rospy
import cv2 as cv
from SendMove import SendMove
from UR import UR
from post_processing_test_measuring_precision import PostProcessingTest
import time
import tf
import tf2_ros
import csv
import os
from std_msgs.msg import String

rospy.init_node('test_statemachine')
error_list = []
stepl = 0.015
stepr = 0.1
m = SendMove()
arm = UR()
vision = PostProcessingTest()
ls = tf.TransformListener()
tr = tf.Transformer()
adress = ''
tfBuffer = tf2_ros.Buffer()
listener = tf2_ros.TransformListener(tfBuffer)

robot_poses = []
optical_poses = []
pocket_optical_poses = []
base_optical_poses = []
last_optical = []


def save_data(base_filename):
    robot_pose_filename = base_filename + "_robot_poses"
    target_pose_filename = base_filename + "_optical_poses"
    pocket_optical_pose_filename = base_filename + "_pocket_optical_poses"
    base_optical_pose_filename = base_filename + "_base_optical_poses"
    base_filename = base_filename + "/"
    first_row = ['xyzrpyw']
    try_false = True
    while(try_false):
        if not os.path.exists(adress + base_filename):
            os.mkdir(adress + base_filename)
            print "Directory " + adress + base_filename +" is created "
            try_false = False
        else:
            print("Directory ", base_filename, " already exists.")
            base_filename = raw_input(" Give new filename :  ")

    with open( adress + base_filename + robot_pose_filename, 'w') as writeFile:
        writer = csv.writer(writeFile)
        writer.writerows(first_row)
        writer.writerows(robot_poses)
    writeFile.close()
    with open( adress + base_filename + target_pose_filename, 'w') as writeFile:
        writer = csv.writer(writeFile)
        writer.writerows(first_row)
        writer.writerows(optical_poses)
    writeFile.close()
    with open( adress + base_filename + pocket_optical_pose_filename, 'w') as writeFile:
        writer = csv.writer(writeFile)
        writer.writerows(first_row)
        writer.writerows(pocket_optical_poses)
    writeFile.close()
    with open( adress + base_filename + base_optical_pose_filename, 'w') as writeFile:
        writer = csv.writer(writeFile)
        writer.writerows(first_row)
        writer.writerows(base_optical_poses)
    writeFile.close()

def filter(pose):
    trans = pose.transform
    position = [trans.translation.x, trans.translation.y, trans.translation.z, trans.rotation.x,
                trans.rotation.y, trans.rotation.z, trans.rotation.w]
    return position
    
def record_tf():
    msg = 'now'
    rospy.sleep(0.2)
    vision.postprocessing_test("object") #service to call vision
    rospy.sleep(1.6)
    global last_optical
    now = rospy.Time(0)

    #check TF's
    robot = tfBuffer.lookup_transform("ur3/base", "ur3/ee_link", now)
    pocket_optical = tfBuffer.lookup_transform("base_link", "object", now)
    optical = tfBuffer.lookup_transform("camera", "object", now)
    base_optical = tfBuffer.lookup_transform("ur3/base", "object", now)

    #filter to save only x,y etc
    if optical is not last_optical:
        robot_poses.append(filter(robot))
        optical_poses.append(filter(optical))
        pocket_optical_poses.append(filter(pocket_optical))
        base_optical_poses.append(filter(base_optical))
    last_optical = optical


def charuco_check_vs_robot():
    m.sendMove(m.buildMove('j', '', m.getPos("test3")))
    arm.waitForArm()
    vision.postprocessing_test("ref")
    tool = arm.tool

    for i in range(0, 10, 1):
        arm.moveTool([tool[0], tool[1]+stepl*(i-5), tool[2], tool[3], tool[4], tool[5]])
        record_tf()
        time.sleep(1)

    for i in range(0, 10, 1):
        arm.moveTool([tool[0]+stepl*(i-5), tool[1], tool[2], tool[3], tool[4], tool[5]])
        record_tf()
        time.sleep(1)
    print 'run2'

    for i in range(0, 10, 1):
        arm.moveTool([tool[0]+stepl*(i-5), tool[1]+stepl*(i-5), tool[2], tool[3], tool[4], tool[5]])
        record_tf()
        time.sleep(1)
    print 'run3'

    for i in range(0, 10, 1):
        arm.moveTool([tool[0]+stepl*(i-5), tool[1]-stepl*(i-5), tool[2], tool[3], tool[4], tool[5]])
        record_tf()
        time.sleep(1)
    print 'run4'

while not rospy.is_shutdown():
    foldername = raw_input('Give the foldername for saving: ')
    charuco_check_vs_robot()
    save_data(base_filename=foldername)
    print("Done calibrating")
