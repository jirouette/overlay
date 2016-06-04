package overlay.cards;

class Card
{
	public var name(default, null):String;
	public var setnumber(default, null):String;
	public var cardnumber(default, null):String;
	public var text(default, null):String;
	public var firstedition(default, null):Bool;

	public function new(name:String, ?text:Null<String>, ?setnumber:Null<String>, ?cardnumber:Null<String>, ?firstedition:Null<Bool>)
	{
		this.name = name;

		if (text != null)
			this.text = text;
		if (setnumber != null)
			this.setnumber = setnumber;
		if (cardnumber != null)
			this.cardnumber = cardnumber;
		this.firstedition = if (firstedition != null) firstedition else false;
	}

	public function numbers():String
	{
		if (setnumber == null && cardnumber == null && !firstedition)
			return "";

		var t = " (";
		if (firstedition)
			t += "1st edition, ";
		if (setnumber != null)
		{
			t += setnumber;
			if (cardnumber != null)
				t += " - ";
		}
		if (cardnumber != null)
			t += cardnumber;
		t += ")";
		return t;
	}

	public function toString():String
	{
		var t = name + numbers();
		if (text != null)
			t += " : \n" + text;
		return t;
	}
}