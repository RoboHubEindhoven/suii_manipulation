import socket
import sys
import time


class UrControlPanel (object):
    def __init__(self, host):
        """
        Initialize a socket connection to the UR server.

        :param host: The UR IP address
        """
        # port for the ur dashboard server cb-series
        port = 29999
        print('# Creating socket')
        try:
            self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        except socket.error:
            print('Failed to create socket')
            sys.exit()
        self.s.connect((host, port))
        #self.s.listen(5)
        #self.con, address = self.s.accept()

    def __str__(self):
        """
        This is the class'
        :return:
        """
        version, mode, safety = self.get_robot_info()
        return "{}\n{}\n{}\n".format(version, mode, safety)

    def send_data(self, data):
        """
        Most of the time the ur will react with an status or answer but you could also just send your info and don't
        care what is comming back therefore this function.
        :param data:  The string of data you want to send.
        :return: returns whats is send or an error.
        """
        try:
            # Send data to UR
            data = data + "\n" if not data.endswith("\n") else data
            self.s.sendall(data)
        except Exception as e:
            print("send failed: {}".format(e))
            return "Failed to send"
        return "Send {}".format(data)

    def request(self, data):
        """
        Send a string of data to the robot
        https://www.universal-robots.com/how-tos-and-faqs/how-to/ur-how-tos/dashboard-server-cb-series-port-29999-15690/
        :param data: [string] A command for the robot
        :return: returns reply or status error.
        """
        try:
            # Send data to UR
            data = data + "\n" if not data.endswith("\n") else data
            self.s.sendall(data)
            # Receive data
            print('# Receive data from server')
            reply = self.s.recv(4096)
        except Exception as e:
            print("send failed: {}".format(e))
            return "Failed to send"
        return reply

    def disconnect(self):
        """
        Tries to shutdown the socket, if fails it still closes the correct way.
        :return: status msg
        """
        try:
            answer = self.request("quit")
            self.s.shutdown(socket.SHUT_RDWR)
        except Exception as e:
            answer = "Ur not correctly shutdown, error: {}".format(e)
        finally:
            self.s.close()
        return answer

    def get_robot_info(self):
        version = self.request("PolyscopeVersion")
        mode = self.get_robot_mode()
        safety_mode = self.request("safetymode")  # until version 3.10, version 3.11 uses "safetystatus"
        return version, mode, safety_mode

    def power_on_robot(self):
        self.request("power on")
        return self.wait_for_robot_status("POWER_ON")

    def power_off_robot(self):
        # shutdown power of the robot arm, not the controlbox.
        return self.wait_for_robot_status("POWER_OFF")

    def shutdown_robot(self):
        answer = self.request("shutdown")
        if answer in "Shutting down":
            return answer
        return "Not shutdown correctly"

    def unlock_protective_stop(self):
        return self.request("unlock protective stop")

    def release_brake(self):
        return self.request("brake release")

    def close_safety_popup(self):
        return self.request("close safety popup")

    def wait_for_robot_status(self, desired_status, max_timeout=5):
        """
        A waiting function that can act on status to get to desired status. As described on this website:
        https://www.universal-robots.com/how-tos-and-faqs/how-to/ur-how-tos/dashboard-server-cb-series-port-29999-15690/
        :param desired_status: The robot status as return of robotmode from the UR controller
        :param max_timeout: [seconds] maximum time until return with error state.
        :return:
        """
        timeout = time.time() + max_timeout
        while True:
            mode = self.get_robot_mode()
            # using 'in' instead of 'is' in if statement because that is a better string comparison in python
            # and the return of robotmode request = "Robotmode: <mode>" so you check if the mode is in the string.
            if desired_status in mode:
                return
            elif time.time() >= timeout:
                return "timeout"
            elif "POWER_OFF" in mode:
                if desired_status is "POWER_ON":
                    self.request("power on")
                else:
                    continue
            elif "POWER_ON" in mode:
                if desired_status is "POWER_OFF":
                    self.request("power off")
                else:
                    continue
            elif "IDLE" in mode:
                if desired_status is "POWER_ON":
                    self.request("power on")
                elif desired_status is "POWER_OFF":
                    self.request("power off")
                else:
                    continue
            elif "CONFIRM_SAFETY" in mode:
                # Close safety popup to confirm safety
                self.close_safety_popup()
            elif "BOOTING" in mode:
                continue  # Probably booting up so continue the wait.
            elif "BACKDRIVE" in mode:
                return mode  # Probably freedrive is on
            elif "RUNNING" in mode:
                return mode  # Program is running.
            elif "NO_CONTROLLER" in mode:
                return mode  # Well fuck this can be a problem with the Control Box, Check power and other connections
            time.sleep(0.1)

    def check_safety_mode(self):
        """
        Returns the safety status of the robot.
        Can be "Safetymode: <mode>", where <mode> is
         -  NORMAL
         -  REDUCED
         -  PROTECTIVE_STOP
         -  RECOVERY
         -  SAFEGUARD_STOP
         -  SYSTEM_EMERGENCY_STOP
         -  ROBOT_EMERGENCY_STOP
         -  VIOLATION
         -  FAULT

        :return:
        """
        mode = self.request("safetymode")
        return mode

    def get_robot_mode(self, act_on_mode=False):
        """
        returns:
        "Robotmode: <mode>", where <mode> is
         -  NO_CONTROLLER
         -  DISCONNECTED
         -  CONFIRM_SAFETY
         -  BOOTING
         -  POWER_OFF
         -  POWER_ON
         -  IDLE
         -  BACKDRIVE
         -  RUNNING
        :return: robotmode string
        """
        if act_on_mode:
            mode = self.request("robotmode")
            if "CONFIRM_SAFETY" in mode:
                return self.close_safety_popup()
            elif "BOOTING" in mode:
                return
            elif "POWER_OFF" in mode:
                return self.request("power on")
            elif "BACKDRIVE" in mode:
                return  # if needed (probably turn off freedrive
            elif "RUNNING" in mode:
                return  # Stop program, probably never going to happen.
            elif "NO_CONTROLLER" in mode:
                return  # fatal error
        else:
            mode = self.request("robotmode")
            print mode
            return mode

    def ur_command_switch(self, string):
        """
        This script will parse the command to the needed commands towards the ur.
        You can give the following commands: init_robot, unlock_protective_stop, shutdown_robotarm, power_on_robotarm,
        :param string: the command
        :return: the robotmode, or generated status.
        """
        if "init_robot" in string :
            self.power_on_robot()
            self.wait_for_robot_status("POWER_ON")
            self.release_brake()
            self.wait_for_robot_status("RUNNING")
            resp = self.get_robot_mode()
        elif "unlock_protective_stop" in string:
            self.close_safety_popup()
            self.unlock_protective_stop()
            resp = self.get_robot_mode()
        elif "get_safety" in string:
            return self.check_safety_mode()
        elif "shutdown_robotarm" in string:
            self.shutdown_robot()
            resp = "send shutdown signal"
        elif "power_on" in string:
            self.power_on_robot()
            resp = self.get_robot_mode()
        elif "power_off" in string:
            self.power_off_robot()
            resp = self.get_robot_mode()
        else:
            resp = "[ur_manager]: service command wasn't recognized"
        return resp


