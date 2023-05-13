from datetime import datetime

class ContainerState:
    dead: bool
    error: str
    exitCode: int
    finishedAt: datetime
    OOMKilled: bool
    paused: bool
    pId: int
    restarting: bool
    running: bool
    startedAt: datetime
    Status: str

    def __init__(self, dead: bool, error: str, exitCode: int, finishedAt: datetime, OOMKilled: bool, paused: bool, pId: int, restarting: bool, running: bool, startedAt: datetime, status: str) -> None:
        self.dead = dead
        self.error = error
        self.exitCode = exitCode
        self.finishedAt = finishedAt
        self.OOMKilled = OOMKilled
        self.paused = paused
        self.pId = pId
        self.restarting = restarting
        self.running = running
        self.startedAt = startedAt
        self.Status = status