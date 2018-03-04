import overlay.Duel;
import overlay.Player;
import overlay.duels.Action;
import overlay.cards.MonsterCard;

import Random;

class Main
{
	static public function main()
	{
		var P1 = new Player("jr", "data/decks/random.deck");
		var P2 = new Player("P2", "data/decks/random.deck");
		var duel = new Duel();
		duel.addPlayer(P1);
		duel.addPlayer(P2);
		duel.start();

		var player = if (duel.current_turn.turn_player == P1) P2 else P1;
		var opponent = duel.current_turn.turn_player;

		var monster = cast(player.hand.last(), MonsterCard);

		var actions = [

			// opponent

			CHANGE_PHASE(DRAW_PHASE),
			DRAW_CARD(1),
			CHANGE_PHASE(STANDBY_PHASE),
			CHANGE_PHASE(MAIN_PHASE),
			CHANGE_PHASE(END_PHASE),

			// player

			CHANGE_PHASE(DRAW_PHASE),
			DRAW_CARD(1),
			CHANGE_PHASE(STANDBY_PHASE),
			CHANGE_PHASE(MAIN_PHASE),
			NORMAL_SUMMON(monster, MONSTER_ZONE, Random.int(0,4)),
			CHANGE_PHASE(BATTLE_PHASE),
			DIRECT_ATTACK(monster, opponent),
			CHANGE_PHASE(MAIN_PHASE),
			CHANGE_PHASE(END_PHASE),
		];

		var loop_actions = [
			// opponent

			CHANGE_PHASE(DRAW_PHASE),
			DRAW_CARD(1),
			CHANGE_PHASE(STANDBY_PHASE),
			CHANGE_PHASE(MAIN_PHASE),
			CHANGE_PHASE(END_PHASE),

			// player

			CHANGE_PHASE(DRAW_PHASE),
			DRAW_CARD(1),
			CHANGE_PHASE(STANDBY_PHASE),
			CHANGE_PHASE(MAIN_PHASE),
			CHANGE_PHASE(BATTLE_PHASE),
			DIRECT_ATTACK(monster, opponent),
			CHANGE_PHASE(END_PHASE),
		];

		for(i in 0...20)
			for(action in loop_actions)
				actions.push(action);

		var action = actions.shift();
		while(duel.run(duel.current_turn.turn_player, action))
		{
			switch(action)
			{
				case NORMAL_SUMMON(m,z,i):
					trace(duel.current_turn.turn_player.field);
				case DRAW_CARD(n):
					trace(duel.current_turn.turn_player.hand);
				case CHANGE_PHASE(phase):
					if (phase == END_PHASE)
						trace("\n\n\n");
				default:
					// nothing to do
			}

			action = actions.shift();
		}
	}
}
