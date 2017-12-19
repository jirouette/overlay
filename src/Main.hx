import overlay.Duel;
import overlay.Player;
import overlay.duels.Turn;
import overlay.duels.Action;
import overlay.duels.Phase;
import overlay.fields.Field;
import overlay.fields.specifications.Position;

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

		var field = new Field();
		var turn = new Turn(p);
		trace("\n\n======  HAND OF "+p.name+"\n"+p.hand+"======\n\n");
		trace("====== FIELD OF "+p.name+"\n"+field);

		turn.action(p, CHANGE_PHASE(DRAW_PHASE));
		turn.action(p, DRAW_CARD(1));
		trace("\n\n====== HAND OF "+p.name+"\n"+p.hand+"======\n\n");
		turn.action(p, CHANGE_PHASE(STANDBY_PHASE));
		turn.action(p, CHANGE_PHASE(MAIN_PHASE));
		var monster = p.hand.pop();
		turn.action(p, NORMAL_SUMMON(monster));

		field.getZone(MONSTER_ZONE, 3).card = monster;
		field.getZone(MONSTER_ZONE, 3).position = new Position(DEF_POSITION);

		trace("====== FIELD OF "+p.name+"\n"+field);
		turn.action(p, CHANGE_PHASE(END_PHASE));
	}
}
