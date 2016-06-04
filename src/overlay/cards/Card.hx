package overlay.cards;

class Card
{
	var name:String;
	var setnumber:String;
	var cardnumber:String;
	var text:String;
	var firstedition:Bool;

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