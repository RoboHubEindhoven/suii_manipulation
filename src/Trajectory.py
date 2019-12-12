class Move(object):
    def __init__(self, move_type, space, pose, acc, speed, time = 0, radius = 0):
        self.move_type = move_type
        self.space = space
        self.pose = list(pose)
        self.acceleration = acc
        self.speed = speed
        self.time = time
        self.radius = radius
    
    def __str__(self):
        sendable = "move{}({}{}, a={}, v={}, t={}, r={})".format(
            self.move_type, self.space, self.pose, self.acceleration, self.speed, self.time, self.radius)
        return sendable

    def get_string(self):
        return self.__str__()


class Trajectory(object):
    def __init__(self):
        self.start = "def test():\n"
        self.moves = []
        self.end = "end\n"
    
    def __str__(self):
        string = self.start
        for move in self.moves:
            string += (move + "\n")
        string += self.end
        return string

    def get_string(self):
        return self.__str__()

    def add_move(self, move):
        if isinstance(move, Move):
            self.moves.append(str(move))
        else:
            self.moves.append(move)