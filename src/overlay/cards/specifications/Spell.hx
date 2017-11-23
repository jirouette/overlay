package overlay.cards.specifications;

import overlay.util.Specification;

enum SpellType
{
	NORMAL_SPELL;
	CONTINUOUS_SPELL;
	EQUIP_SPELL;
	QUICKPLAY_SPELL;
	FIELD_SPELL;
	RITUAL_SPELL;
	PENDULUM_SPELL;
}

class Spell extends Specification<SpellType>
{
	public function toString():String
	{
		return switch(value)
		{
			case NORMAL_SPELL: "Normal Spell";
			case CONTINUOUS_SPELL: "Continuous Spell";
			case EQUIP_SPELL: "Equip Spell";
			case QUICKPLAY_SPELL: "Quick-Play Spell";
			case FIELD_SPELL: "Field Spell";
			case RITUAL_SPELL: "Ritual Spell";
			case PENDULUM_SPELL: "Pendulum Spell";
			default: "None Spell";
		}
	}
}
