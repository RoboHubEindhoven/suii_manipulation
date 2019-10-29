#! /usr/bin/env python2
import rospy as ros
import UrManager

def init_robot():
    return

def power_on_robot():
    return

def power_off_robot():
    return

def shutdown_robot():
    return

def unlock_protective_stop():
    return

def close_safety_popup():
    return

def get_robot_mode():
    urm.receive()
    return

def ur_service_cb(string):
    if string is "init_robot":
        init_robot()
        ros.sleep(1)
        power_on_robot()
        resp = get_robot_mode()
    elif string is "unlock_protective_stop":
        close_safety_popup()
        unlock_protective_stop()
        ros.sleep(1)
        resp = get_robot_mode()
    elif string is "shutdown_robotarm":
        shutdown_robot()
        resp = "send shutdown signal"
    elif string is "power_on_robotarm":
        power_on_robot()
        ros.sleep(1)
        resp = get_robot_mode()
    else:
        ros.logwarn("[ur_manager]: service command wasn't recognized")
        resp = "error"
    return UrManager(resp)


if __name__ == '__main__':
    ros.init_node("Ur_Manager")
    # Services
    ur_service = ros.Service("/ur_manager", UrManager, ur_service_cb)

    urm = UrManager()
