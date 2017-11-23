package overlay.cards.specifications;

import overlay.util.Specification;

enum MonsterAbility
{
	TOON_ABILITY;
	SPIRIT_ABILITY;
	UNION_ABILITY;
	GEMINI_ABILITY;
	FLIP_ABILITY;
	TUNER_ABILITY; // normally not an ability, but ignoring this
}

class Ability extends Specification<MonsterAbility>
{
	public function toString():String
	{
		return switch(value)
		{
			case TOON_ABILITY: "Toon";
			case SPIRIT_ABILITY: "Spirit";
			case UNION_ABILITY: "Union";
			case GEMINI_ABILITY: "Gemini";
			case FLIP_ABILITY: "Flip";
			case TUNER_ABILITY: "Tuner";
		}
	}
}
