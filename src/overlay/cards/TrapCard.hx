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

	public static override function fromXML(node:Xml):Null<Card>
	{
		var name = node.elementsNamed("name").next().firstChild().nodeValue;
		var text = node.elementsNamed("text").next().firstChild().nodeValue;

		var type = Reflect.field(TrapType, node.elementsNamed("type").next().firstChild().nodeValue + '_TRAP');
		if (type == null)
			type = NORMAL_TRAP;
		return new TrapCard(name, type, text);
	}
}
