package overlay.cards;

import overlay.cards.specifications.Text;
import overlay.util.Specification;

class Card extends Specification<Card>
{
	public var name(default, null):Text;
	public var text(default, null):Text;

	public function new(name:String, ?text:Null<String>)
	{
		super(this);
		this.name = new Text(name);
		this.text = new Text(text);
	}

	public function toString():String
	{
		return Std.string(this.name);
	}

	public static function fromXML(node:Xml):Null<Card>
	{
		var name = node.elementsNamed("name").next().firstChild().nodeValue;
		var text = node.elementsNamed("text").next().firstChild().nodeValue;

		return new Card(name, text);
	}
}
