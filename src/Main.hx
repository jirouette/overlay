import overlay.Duel;
import overlay.Player;

import Random;

class Main
{
	static public function main()
	{
		var duel = new Duel();
		duel.addPlayer(new Player("jr", "data/decks/random.deck"));
		duel.addPlayer(new Player("P2", "data/decks/random.deck"));
		duel.start();

		var turn = duel.nextTurn();
		var p = turn.turn_player;
		trace("\n\n======  HAND OF "+p.name+"\n"+p.hand+"======\n\n");
		trace("====== FIELD OF "+p.name+"\n"+p.field);

		turn.action(p, CHANGE_PHASE(DRAW_PHASE));
		turn.action(p, DRAW_CARD(1));
		trace("\n\n====== HAND OF "+p.name+"\n"+p.hand+"======\n\n");
		turn.action(p, CHANGE_PHASE(STANDBY_PHASE));
		turn.action(p, CHANGE_PHASE(MAIN_PHASE));
		var monster = p.hand.pop();
		turn.action(p, NORMAL_SUMMON(monster, MONSTER_ZONE, Random.int(0,4)));
		trace("====== FIELD OF "+p.name+"\n"+p.field);
		turn.action(p, CHANGE_PHASE(END_PHASE));
	}
}
