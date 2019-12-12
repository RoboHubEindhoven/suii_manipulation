import rospy
from Trajectory import Trajectory, Move
from SendMove import SendMove

rospy.init_node("test_trajectory")

s = SendMove()
pose1 = s.getPos("scanPosition0")
pose2 = s.getPos("safetyStop")
pose3 = s.getPos("HOLDER_2")
print(pose1)

move1 = Move("j","",pose1, 1,1,0,0)
move2 = Move("j","",pose2, 1,1,0,0.1)
move3 = Move("j","",pose3, 1,1,0,0)

traj = Trajectory()
traj.add_move(move1)
traj.add_move(move2)
traj.add_move(move3)

s.sendTrajectory(traj)

