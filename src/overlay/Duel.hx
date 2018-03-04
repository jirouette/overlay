package overlay;

import Random;
import overlay.Player;
import overlay.duels.Turn;

class Duel
{
	var players:Array<Player> = [];
	var turns:List<Turn> = new List();
	var nextTurnPlayer:Null<Player> = null;

	static var MIN_DECK:Int = 40;
	static var START_HAND:Int = 5;

	public function new()
	{}

	public function addPlayer(p:Player)
	{
		players.push(p);
	}

	public function start():Bool
	{
		for(p in players)
			if (p.deck.length < MIN_DECK)
				return false;
			else
				p.draw(START_HAND);
		return true;
	}

	public function nextTurn():Turn
	{
		if (nextTurnPlayer == null)
			nextTurnPlayer = Random.fromArray(players);

		var turn = new Turn(this, nextTurnPlayer);
		turns.add(turn);

		var index = players.indexOf(nextTurnPlayer);
		index = if (index+1 >= players.length) 0 else (index+1);
		nextTurnPlayer = players[index];

		return turn;
	}
}
