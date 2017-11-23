package overlay.cards;

import overlay.cards.Card;
import overlay.cards.specifications.Spell;

class SpellCard extends Card
{
	var type:Spell;

	public function new(name:String, type:SpellType, ?text:Null<String>)
	{
		super(name, text);
		this.type = new Spell(type);
	}

	public override function toString():String
	{
		var t = Std.string(name) + " (" + Std.string(type) + ")";
		if (text.value != null)
			t += " : \n" + Std.string(text);
		return t;
	}
}
