package overlay.cards;

import overlay.cards.Card;

enum TrapType
{
	NORMAL_TRAP;
	CONTINUOUS_TRAP;
	COUNTER_TRAP;
}

class TrapCard extends Card
{
	var type:TrapType;

	public function new(name:String, type:TrapType, ?text:Null<String>, ?setnumber:Null<String>, ?cardnumber:Null<String>, ?firstedition:Null<Bool>)
	{
		super(name, text, setnumber, cardnumber, firstedition);
		this.type = type;
	}

	static public function typestring(t:TrapType)
	{
		return switch(t)
		{
			case NORMAL_TRAP: "Normal Trap";
			case CONTINUOUS_TRAP: "Continuous Trap";
			case COUNTER_TRAP: "Counter Trap";
		}
	}

	public override function toString():String
	{
		var t = name + " (" + TrapCard.typestring(type) + ")" + numbers();
		if (text != null)
			t += " : \n" + text;
		return t;
	}
}