package overlay.duels;

import overlay.cards.Card;
import overlay.fields.specifications.ZoneType;

enum Action
{
	DRAW_CARD(number:UInt);
	NORMAL_SUMMON(monster:Card, zone:ZoneName, index:Int);
	NORMAL_SET(monster:Card);
	BATTLE(attacker:Card, target:Card);
	CHANGE_PHASE(phase:Phase);
	NEW_TURN;
}
