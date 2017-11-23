package overlay.cards.specifications;

import overlay.cards.specifications.Specification;

enum MonsterPoint
{
	UNKNOWN; // "?"
	INFINITE;
	VALUE(v:UInt);
}

class Point extends Specification<MonsterPoint>
{
	public function toString():String
	{
		return switch(value)
		{
			case UNKNOWN: "?";
			case INFINITE: "∞";
			case VALUE(v): Std.string(v);
		}
	}
}
