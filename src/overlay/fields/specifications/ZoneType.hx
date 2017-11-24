package overlay.fields.specifications;

import overlay.util.Specification;

enum ZoneName
{
	MONSTER_ZONE; // for both main monsters and extra monsters (< VRAINS)
	MAIN_MONSTER_ZONE; // for main monsters (>= VRAINS)
	EXTRA_MONSTER_ZONE; // for extra monsters (>= VRAINS)
	LINKED_ZONE; // same as MONSTER_ZONE (>= VRAINS)
	SPELLTRAP_ZONE; // (>= DM, the only one who didnt change through seasons)
	FIELD_ZONE; // 1 Field Spell per player (>= ARCV)
	UNIQUE_FIELD_ZONE; // 1 Field Spell per Duel (< ARCV)
	PENDULUM_ZONE; // left or right (ARCV)
	PENDULUM_LEFT_ZONE; // == PENDULUM_ZONE in TCG/OCG (ARCV)
	PENDULUM_RIGHT_ZONE; // == PENDULUM_ZONE in TCG/OCG (ARCV)
	PENDULUM_SPELLTRAP_ZONE; // pendulum left or right / spelltraps (>= VRAINS)
	PENDULUM_SPELLTRAP_LEFT_ZONE; // == PENDULUM_SPELLTRAP_ZONE in TCG/OCG (>= VRAINS)
	PENDULUM_SPELLTRAP_RIGHT_ZONE; // == PENDULUM_SPELLTRAP_ZONE in TCG/OCG (>= VRAINS)
}

class ZoneType extends Specification<ZoneName>
{
	public function toString():String
	{
		return switch(value)
		{
			case MONSTER_ZONE: "Monster Zone";
			case MAIN_MONSTER_ZONE: "Main Monster Zone";
			case EXTRA_MONSTER_ZONE: "Extra Monster Zone";
			case LINKED_ZONE: "Linked Zone";
			case SPELLTRAP_ZONE: "Spell/Trap Zone";
			case FIELD_ZONE: "Field Zone";
			case UNIQUE_FIELD_ZONE: "1-Field Zone";
			case PENDULUM_ZONE: "Pendulum Zone";
			case PENDULUM_LEFT_ZONE: "Pendulum Left Zone";
			case PENDULUM_RIGHT_ZONE: "Pendulum Right Zone";
			case PENDULUM_SPELLTRAP_ZONE: "Spell/Trap/Pendulum Zone";
			case PENDULUM_SPELLTRAP_LEFT_ZONE: "Spell/Trap/Pendulum Left Zone";
			case PENDULUM_SPELLTRAP_RIGHT_ZONE: "Spell/Trap/Pendulum Right Zone";
		}
	}
}
