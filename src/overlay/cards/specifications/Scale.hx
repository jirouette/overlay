package overlay.cards.specifications;

import overlay.util.Specification;

class Scale extends Specification<Int>
{
	public function new(value:Int, ?printed_value:Null<Int>)
	{
		if (printed_value == null)
			printed_value = value;

		if (value < 0)
			value = 0;
		else if (value > 13)
			value = 13;

		super(value, printed_value);
	}

	public function toString():String
	{
		return Std.string(value);
	}
}
