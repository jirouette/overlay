package overlay.cards.specifications;

import overlay.util.Specification;

enum MonsterAttribute
{
	DARK_ATTRIBUTE;
	LIGHT_ATTRIBUTE;
	EARTH_ATTRIBUTE;
	WIND_ATTRIBUTE;
	FIRE_ATTRIBUTE;
	WATER_ATTRIBUTE;
	DIVINE_ATTRIBUTE;
}

class Attribute extends Specification<MonsterAttribute>
{
	public function toString():String
	{
		return switch(value)
		{
			case DARK_ATTRIBUTE: "DARK";
			case LIGHT_ATTRIBUTE: "LIGHT";
			case EARTH_ATTRIBUTE: "EARTH";
			case WIND_ATTRIBUTE: "WIND";
			case FIRE_ATTRIBUTE: "FIRE";
			case WATER_ATTRIBUTE: "WATER";
			case DIVINE_ATTRIBUTE: "DIVINE";
			default: "NONE";
		}
	}
}
