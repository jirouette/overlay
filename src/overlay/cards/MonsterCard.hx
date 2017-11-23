package overlay.cards;

import overlay.cards.Card;
import overlay.cards.specifications.Attribute;
import overlay.cards.specifications.Type;
import overlay.cards.specifications.Ability;
import overlay.cards.specifications.Level;
import overlay.cards.specifications.Point;


class MonsterCard extends Card
{
	public var attribute(default, null):Attribute;
	public var type(default, null):Type;
	public var ability(default, null):Ability;

	public var ATK(default, null):Point;
	public var DEF(default, null):Point;

	public var level(default, null):Level;

	public function new(name:String,
	                    type:MonsterType,
	                    attribute:MonsterAttribute,
	                    ability:Null<MonsterAbility>,
	                    level:Int,
	                    ATK:UInt,
	                    DEF:UInt,
	                    ?text:Null<String>)
	{
		super(name, text);
		this.type = new Type(type);
		this.attribute = new Attribute(attribute);
		this.ability = new Ability(ability);
		this.level = new Level(level);
		this.ATK = new Point(VALUE(ATK));
		this.DEF = new Point(VALUE(DEF));
	}

	public function line()
	{
		var t = Std.string(type);
		if (ability.value != null)
			t += "/" + Std.string(ability);
		return t;
	}

	public override function toString():String
	{
		var t = Std.string(name) + " (";
		t += Std.string(attribute) + ", ";
		t += "*" + Std.string(level) + ", ";
		t += line() + ")";
		t += " " + Std.string(ATK) + "/" + Std.string(DEF);
		return t;
	}
}
