#!/usr/bin/env python
import rospy
import copy
import std_msgs
import math


from interactive_markers.interactive_marker_server import *
from interactive_markers.menu_handler import *
from visualization_msgs.msg import *
import geometry_msgs.msg 
from tf.broadcaster import TransformBroadcaster
import tf

class ControlMarker (object):
    def __init__(self):
        # ROS init:
        rospy.init_node('Control_Marker_Node', anonymous=True)
        self.pub = rospy.Publisher('/ur_driver/URScript',std_msgs.msg.String, queue_size=10 )
        self.listener = tf.TransformListener()
        self.broadcaster = tf.TransformBroadcaster()
        #Marker init:
        self.server = InteractiveMarkerServer("basic_controls")
        self.menu_handler = MenuHandler()
        self.menu_handler.insert( "Reset pose", callback=self.processFeedback )
        self.menu_handler.insert( "Get robot to pose", callback=self.processFeedback )
        
        self.resetToPose()


    def processFeedback(self, feedback):
        s = "Feedback from marker '" + feedback.marker_name
        s += "' / control '" + feedback.control_name + "'"

        mp = ""
        if feedback.mouse_point_valid:
            mp = " at " + str(feedback.mouse_point.x)
            mp += ", " + str(feedback.mouse_point.y)
            mp += ", " + str(feedback.mouse_point.z)
            mp += " in frame " + feedback.header.frame_id

        if feedback.event_type == InteractiveMarkerFeedback.BUTTON_CLICK:
            rospy.loginfo( s + ": button click" + mp + "." )
        elif feedback.event_type == InteractiveMarkerFeedback.MENU_SELECT:
            rospy.loginfo( s + ": menu item " + str(feedback.menu_entry_id) + " clicked" + mp + "." )
            if feedback.menu_entry_id == 1:
                self.resetToPose()
            elif feedback.menu_entry_id == 2:
                self.sendPose(feedback.pose)
        elif feedback.event_type == InteractiveMarkerFeedback.POSE_UPDATE:
            rospy.loginfo( s + ": pose changed")
            self.broadcaster.sendTransform(
                    [feedback.pose.position.x,feedback.pose.position.y,feedback.pose.position.z],
                    [feedback.pose.orientation.x,feedback.pose.orientation.y,feedback.pose.orientation.z,feedback.pose.orientation.w],
                    rospy.Time(),
                    feedback.marker_name,
                    feedback.header.frame_id)
                            
        elif feedback.event_type == InteractiveMarkerFeedback.MOUSE_DOWN:
            rospy.loginfo( s + ": mouse down" + mp + "." )
        elif feedback.event_type == InteractiveMarkerFeedback.MOUSE_UP:
            rospy.loginfo( s + ": mouse up" + mp + "." ) 
        self.server.applyChanges()


    def makeBox(self, msg):
        marker = Marker()

        marker.type = Marker.SPHERE
        marker.scale.x = msg.scale * 0.2
        marker.scale.y = msg.scale * 0.2
        marker.scale.z = msg.scale * 0.2
        
        marker.color.r = 0.5
        marker.color.g = 0.5
        marker.color.b = 0.5
        marker.color.a = 1.0

        return marker

    def make6DofMenuMarker(self, pose):
        int_marker = InteractiveMarker()
        int_marker.header.frame_id = "base"
        int_marker.pose = pose
        #print(int_marker.pose)
        int_marker.scale = 0.2

        int_marker.name = "6DOF_Menu_Marker"
        int_marker.description = ""

        control = InteractiveMarkerControl()
        control.interaction_mode = InteractiveMarkerControl.MENU
        control.description="Robot Tool"
        control.name = "menu_only_control"
        int_marker.controls.append(copy.deepcopy(control))

        marker = self.makeBox( int_marker )
        control.markers.append( marker )
        control.always_visible = True
        int_marker.controls.append(control)

        control = InteractiveMarkerControl()
        control.orientation.w = 1
        control.orientation.x = 1
        control.orientation.y = 0
        control.orientation.z = 0
        control.name = "rotate_x"
        control.interaction_mode = InteractiveMarkerControl.ROTATE_AXIS
        int_marker.controls.append(control)

        control = InteractiveMarkerControl()
        control.orientation.w = 1
        control.orientation.x = 1
        control.orientation.y = 0
        control.orientation.z = 0
        control.name = "move_x"
        control.interaction_mode = InteractiveMarkerControl.MOVE_AXIS
        int_marker.controls.append(control)

        control = InteractiveMarkerControl()
        control.orientation.w = 1
        control.orientation.x = 0
        control.orientation.y = 1
        control.orientation.z = 0
        control.name = "rotate_z"
        control.interaction_mode = InteractiveMarkerControl.ROTATE_AXIS
        int_marker.controls.append(control)

        control = InteractiveMarkerControl()
        control.orientation.w = 1
        control.orientation.x = 0
        control.orientation.y = 1
        control.orientation.z = 0
        control.name = "move_z"
        control.interaction_mode = InteractiveMarkerControl.MOVE_AXIS
        int_marker.controls.append(control)

        control = InteractiveMarkerControl()
        control.orientation.w = 1
        control.orientation.x = 0
        control.orientation.y = 0
        control.orientation.z = 1
        control.name = "rotate_y"
        control.interaction_mode = InteractiveMarkerControl.ROTATE_AXIS
        int_marker.controls.append(control)

        control = InteractiveMarkerControl()
        control.orientation.w = 1
        control.orientation.x = 0
        control.orientation.y = 0
        control.orientation.z = 1
        control.name = "move_y"
        control.interaction_mode = InteractiveMarkerControl.MOVE_AXIS
        int_marker.controls.append(control) 
    
        self.server.insert(int_marker, self.processFeedback)
        self.menu_handler.apply( self.server, int_marker.name )

    def resetToPose(self):
        
        rospy.sleep(1)
        pose = geometry_msgs.msg.Pose()
        try:
            (trans, rot) = self.listener.lookupTransform('base', 'tool0_controller', rospy.Time(0))
            pose.position.x = trans[0]
            pose.position.y = trans[1]
            pose.position.z = trans[2]
            pose.orientation.x = rot[0]
            pose.orientation.y = rot[1]
            pose.orientation.z = rot[2]
            pose.orientation.w = rot[3]
        except:
            print "no look up"

        self.make6DofMenuMarker(pose)
        self.server.applyChanges()

    def qua_to_rvec(self, quaternion):
        R = tf.transformations.quaternion_matrix(quaternion)
        
        theta = math.acos(((R[0, 0] + R[1, 1] + R[2, 2]) - 1) / 2)
        multi = 1 / (2 * math.sin(theta))

        rx = multi * (R[2, 1] - R[1, 2]) * theta
        ry = multi * (R[0, 2] - R[2, 0]) * theta
        rz = multi * (R[1, 0] - R[0, 1]) * theta

        return rx, ry, rz

    def sendPose(self, pose):
        # Basic move parameters:
        moveType = 'j'
        acceleration = 1.0
        speed = 1.0
        
        # Orientation conversion for UR_controller
        orientation_q = pose.orientation
        orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        rx, ry, rz = self.qua_to_rvec(orientation_list)
        
        # Put pose in an string
        array = str([pose.position.x, pose.position.y, pose.position.z, rx, ry, rz])
        
        # Publish to topic TODO move to init
        sendable = "move%s(p%s, a=%s, v=%s)" % (moveType, array, acceleration, speed)
        st = std_msgs.msg.String()
        st.data = sendable
        self.pub.publish(st)    
        
        # Update marker
        self.server.applyChanges()



if __name__ == '__main__':
    x = ControlMarker()
    rospy.spin()

        