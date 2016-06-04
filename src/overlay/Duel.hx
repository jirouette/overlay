package overlay;

import overlay.Player;

class Duel
{
	var turns:Int = 0;
	var players:Array<Player> = [];

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
}
