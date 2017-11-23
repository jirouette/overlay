package overlay.cards.specifications;

import overlay.util.Specification;

class Level extends Specification<Int>
{
	public function new(value:Int, ?printed_value:Null<Int>)
	{
		if (printed_value == null)
			printed_value = value;

		if (value < 1)
			value = 1;
		else if (value > 12)
			value = 12;

		super(value, printed_value);
	}

	public function toString():String
	{
		return Std.string(value);
	}
}
