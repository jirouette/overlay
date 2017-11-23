package overlay.cards;

import overlay.cards.Card;
import overlay.cards.specifications.Trap;

class TrapCard extends Card
{
	var type:Trap;

	public function new(name:String, type:TrapType, ?text:Null<String>)
	{
		super(name, text);
		this.type = new Trap(type);
	}

	public override function toString():String
	{
		var t = Std.string(name) + " (" + Std.string(type) + ")";
		if (text.value != null)
			t += " : \n" + Std.string(text);
		return t;
	}
}
