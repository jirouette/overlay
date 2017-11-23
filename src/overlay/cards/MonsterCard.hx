package overlay.cards;

import overlay.cards.Card;
import overlay.cards.specifications.Attribute;
import overlay.cards.specifications.Type;
import overlay.cards.specifications.Ability;
import overlay.cards.specifications.Level;
import overlay.cards.specifications.Point;
import overlay.cards.specifications.SuperAbility;
import overlay.cards.specifications.Pendulum;


class MonsterCard extends Card
{
	public var attribute(default, null):Attribute;
	public var type(default, null):Type;
	public var ability(default, null):Null<Ability>; // optional
	public var superability(default, null):SuperAbility;
	public var pendulum(default, null):Null<Pendulum>; // optional

	public var ATK(default, null):Point;
	public var DEF(default, null):Null<Point>; // Link Monsters do not have DEF

	public var level(default, null):Null<Level>; // Link and Xyz Monsters do not have Level
	public var rank(default, null):Null<Level>; // only Xyz Monsters have Rank
	public var rating(default, null):Null<Level>; // only Link Monsters have Rating

	public function new(name:String,
	                    type:MonsterType,
	                    attribute:MonsterAttribute,
	                    ability:Null<MonsterAbility>,
	                    level:Int,
	                    ATK:UInt,
	                    DEF:UInt,
	                    ?text:Null<String>,
						?superability:Null<MonsterSuperAbility>,
						?pendulum_scale:Null<UInt>,
						?pendulum_text:Null<String>)
	{
		super(name, text);
		this.type = new Type(type);
		this.attribute = new Attribute(attribute);
		this.ability = new Ability(ability);
		this.level = new Level(level);
		this.ATK = new Point(VALUE(ATK));
		this.DEF = new Point(VALUE(DEF));
		if (superability != null)
			this.superability = new SuperAbility(superability);
	}

	public override function toString():String
	{
		var t = Std.string(name) + " (";
		t += Std.string(attribute) + ", ";
		t += "*" + Std.string(level) + ", ";
		t += Std.string(type);
		if (superability != null && superability.value != null)
			t += "/" + Std.string(superability);
		if (ability != null && ability.value != null)
			t += "/" + Std.string(ability);
		t += ") " + Std.string(ATK);
		if (DEF != null)
			t += "/" + Std.string(DEF);
		return t;
	}

	public static override function fromXML(node:Xml):Null<Card>
	{
		var name = node.elementsNamed("name").next().firstChild().nodeValue;
		var text = node.elementsNamed("text").next().firstChild().nodeValue;

		var type = Reflect.field(MonsterType, node.elementsNamed("type").next().firstChild().nodeValue + '_TYPE');
		var attribute = Reflect.field(MonsterAttribute, node.elementsNamed("attribute").next().firstChild().nodeValue + '_ATTRIBUTE');
		var ability = Reflect.field(MonsterAbility, node.elementsNamed("ability").next().firstChild().nodeValue + '_ABILITY');
		var level = Std.parseInt(node.elementsNamed("level").next().firstChild().nodeValue);
		var ATK = Std.parseInt(node.elementsNamed("atk").next().firstChild().nodeValue);
		var DEF = Std.parseInt(node.elementsNamed("def").next().firstChild().nodeValue);
		if (type == null)
			type = WARRIOR_TYPE;
		if (attribute == null)
			attribute = EARTH_ATTRIBUTE;
		return new MonsterCard(name, type, attribute, ability, level, ATK, DEF, text);
	}
}
