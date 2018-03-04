package overlay;

import Random;
import overlay.Player;
import overlay.duels.Action;
import overlay.duels.Turn;

class Duel
{
	var players:Array<Player> = [];
	var turns:List<Turn> = new List();
	var nextTurnPlayer:Null<Player> = null;
	public var current_turn:Null<Turn> = null;

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
		this.nextTurn();
		return true;
	}

	public function run(player:Player, action:Action):Bool
	{
		this.current_turn.action(player, action);

		for(p in players)
			if (p.hasLost)
			{
				trace(p+": lost");
				return false;
			}

		if (this.current_turn.current_phase == END_PHASE)
			this.nextTurn();
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

		return this.current_turn = turn;
	}
}
