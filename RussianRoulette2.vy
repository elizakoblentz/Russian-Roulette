players: DynArray[address, 100]
losers: DynArray[address,100]
odds: uint256
playersTurn: uint256
creator: address

@external
def __init__ (_players : DynArray[address,100], _odds: uint256):
    self.players = _players
    self.creator = msg.sender

@external
def setOdds (oneInThisMany : uint256):
    assert msg.sender == self.creator
        self.odds == oneInThisMany

@external
def addPlayer (player: address) -> bool:
    for addr in self.players:
        if addr == player:
            return False
    
    for addr in self.losers:
        if addr == player:
            return False

    self.players.append(player)
    return True

@internal
def lose(player : address):
    self.players = []
    self.losers.append(player)

@external
def random() -> uint256:
    return self.playersTurn % self.odds

@external
def play():
    random()
    if self.playersTurn == 1:
        self.lose(playersTurn)
    else:
        self.playersTurn == self.playersTurn+1

@external
def isALoser (player: address) -> bool:
    for addr in self.losers:
        if addr == player:
            return True
    return False
