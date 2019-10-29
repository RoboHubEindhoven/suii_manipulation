import socket
import sys

# UR Robot IP address
HOST = 192.168.x.x
PORT = 29999

class UrManager (object):
    def __init__(self, host):
        """
        Initialize a socket connection to the UR server.

        :param host: The UR IP address
        """
        print('# Creating socket')
        try:
            self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        except socket.error:
            print('Failed to create socket')
            sys.exit()

        self.s.connect((host, port))


    def receive(self, data):
        """
        Send a string of data to the robot
        https://www.universal-robots.com/how-tos-and-faqs/how-to/ur-how-tos/dashboard-server-cb-series-port-29999-15690/
        :param data: [string] A command for the robot
        :return: returns reply or status error.
        """
        try:
            # Send data to UR
            self.s.sendall(data)
            # Receive data
            print('# Receive data from server')
            reply = self.s.recv(4096)

        except Exception as e:
            print("send failed: {}".format(e))
            return "Failed"

        return reply



