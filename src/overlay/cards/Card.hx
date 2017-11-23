package overlay.cards;

import overlay.cards.specifications.Text;

class Card
{
	public var name(default, null):Text;
	public var text(default, null):Text;

	public function new(name:String, ?text:Null<String>)
	{
		this.name = new Text(name);
		this.text = new Text(text);
	}

	public function toString():String
	{
		return Std.string(this.name);
	}
}
