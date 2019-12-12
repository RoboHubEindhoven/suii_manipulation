#!/usr/bin/env python

import rospy
from Trajectory import Trajectory, Move
from SendMove import SendMove

if __name__ == "__main__":
    rospy.init_node("test_trajectory")
    s = SendMove()
    pose1 = s.getPos("scanPosition0")
    pose2 = s.getPos("safetyStop")
    pose3 = s.getPos("HOLDER_2")
    move1 = Move("j","",pose1, 2,4,0,0)
    move2 = Move("j","",pose2, 2,4,0,0.1)
    move3 = Move("j","",pose3, 2,4,0,0)
    traj = Trajectory()
    traj.add_move(move1)
    traj.add_move(move2)
    traj.add_move(move3)
    while not rospy.is_shutdown():
        s.sendTrajectory(traj)
        rospy.spin()