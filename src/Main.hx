import overlay.Duel;
import overlay.Player;
import overlay.duels.Turn;
import overlay.duels.Action;
import overlay.duels.Phase;

import overlay.cards.specifications.Type;
import overlay.cards.MonsterCard;

class Main
{
	static public function main()
	{
		var p = new Player("jr");
		p.deck.load("data/decks/random.deck");

		var duel = new Duel();
		duel.addPlayer(p);
		duel.start();

		var turn = new Turn(p);

		trace("\n\n"+p.hand+"\n\n");
		turn.action(p, CHANGE_PHASE(DRAW_PHASE));
		turn.action(p, DRAW_CARD(1));
		trace("\n\n"+p.hand+"\n\n");
		turn.action(p, CHANGE_PHASE(STANDBY_PHASE));
		turn.action(p, CHANGE_PHASE(MAIN_PHASE));
		turn.action(p, CHANGE_PHASE(END_PHASE));
	}
}
