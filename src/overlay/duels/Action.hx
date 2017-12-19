package overlay.duels;

import overlay.cards.Card;

enum Action
{
	DRAW_CARD(number:UInt);
	NORMAL_SUMMON(monster:Card);
	NORMAL_SET(monster:Card);
	BATTLE(attacker:Card, target:Card);
	CHANGE_PHASE(phase:Phase);
	NEW_TURN;
}
