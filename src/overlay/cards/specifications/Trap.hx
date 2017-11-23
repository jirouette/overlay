package overlay.cards.specifications;

import overlay.util.Specification;

enum TrapType
{
	NORMAL_TRAP;
	CONTINUOUS_TRAP;
	COUNTER_TRAP;
}

class Trap extends Specification<TrapType>
{
	public function toString():String
	{
		return switch(value)
		{
			case NORMAL_TRAP: "Normal Trap";
			case CONTINUOUS_TRAP: "Continuous Trap";
			case COUNTER_TRAP: "Counter Trap";
			default: "None Trap";
		}
	}
}
