package overlay.cards;

import Random;
import overlay.cards.Card;
import overlay.cards.MonsterCard;
import overlay.cards.TrapCard;
import overlay.cards.SpellCard;


enum DeckType
{
	MAIN_DECK;
	EXTRA_DECK;
	SIDE_DECK;
	GRAVEYARD_DECK;
	BANISHED_DECK;
	HAND_DECK;
}

class Deck extends List<Card>
{
	var isPublic:Bool = false;
	var type:DeckType;

	public function new(type:DeckType, isPublic:Bool = false)
	{
		super();
		this.type = type;
		this.isPublic = isPublic;
	}

	static public function typestring(t:DeckType)
	{
		return switch(t)
		{
			case MAIN_DECK: "Main Deck";
			case EXTRA_DECK: "Extra Deck";
			case SIDE_DECK: "Side Deck";
			case GRAVEYARD_DECK: "Graveyard";
			case BANISHED_DECK: "Banish Zone";
			case HAND_DECK: "Hand";
		}
	}

	public function shuffle()
	{
		var t = [];
		var x:Null<Card> = null;
		while((x = pop()) != null)
			t.push(x);
		for (x in Random.shuffle(t))
			add(x);
	}

	public function load(file:String)
	{
		var f = sys.io.File.read(file);
		while (!f.eof())
		{
			try
			{
				var c = loadCard("data/cards/"+f.readLine()+".xml");
				if (c != null)
					add(c);
			}
			catch(e:Dynamic)
			{}
		}
		shuffle();
	}

	public function loadCard(file:String):Null<Card>
	{
		try
		{
			var f = sys.io.File.read(file);
			var data = f.readAll();
			return loadXML(data.toString());
		}
		catch(e:Dynamic)
		{
			return null;
		}
	}

	public function loadXML(data:String):Null<Card>
	{
		var x = Xml.parse(data).firstElement();
		var c:Null<Card>;
		try
		{
			var name = x.elementsNamed("name").next().firstChild().nodeValue;
			var setnumber = x.elementsNamed("setnumber").next().firstChild().nodeValue;
			var cardnumber = x.elementsNamed("cardnumber").next().firstChild().nodeValue;
			var firstedition = x.elementsNamed("firstedition").next().firstChild().nodeValue == "1";
			var text = x.elementsNamed("text").next().firstChild().nodeValue;

			switch(x.elementsNamed("cardtype").next().firstChild().nodeValue)
			{
				case "SPELL":
					var type = Reflect.field(SpellType, x.elementsNamed("type").next().firstChild().nodeValue + '_SPELL');
					if (type == null)
						type = NORMAL_SPELL;
					return new SpellCard(name, type, text, setnumber, cardnumber, firstedition);

				case "TRAP":
					var type = Reflect.field(TrapType, x.elementsNamed("type").next().firstChild().nodeValue + '_TRAP');
					if (type == null)
						type = NORMAL_TRAP;
					return new TrapCard(name, type, text, setnumber, cardnumber, firstedition);

				case "MONSTER":
					var type = Reflect.field(MonsterType, x.elementsNamed("type").next().firstChild().nodeValue + '_TYPE');
					var attribute = Reflect.field(MonsterAttribute, x.elementsNamed("attribute").next().firstChild().nodeValue + '_ATTRIBUTE');
					var ability = Reflect.field(MonsterAbility, x.elementsNamed("ability").next().firstChild().nodeValue + '_ABILITY');
					var level = Std.parseInt(x.elementsNamed("level").next().firstChild().nodeValue);
					var ATK = Std.parseInt(x.elementsNamed("atk").next().firstChild().nodeValue);
					var DEF = Std.parseInt(x.elementsNamed("def").next().firstChild().nodeValue);
					if (type == null)
						type = WARRIOR_TYPE;
					if (attribute == null)
						attribute = EARTH_ATTRIBUTE;
					if (level < 0)
						level = 1;
					if (level > 12)
						level = 12;
					if (ATK < 0)
						ATK = 0;
					if (DEF < 0)
						DEF = 0;
					return new MonsterCard(name, type, attribute, ability, level, ATK, DEF, text, setnumber, cardnumber, firstedition);

				default:
					return null;
			}
		}
		catch(e:Dynamic)
		{
			trace(e);
			return null;
		}
	}

	public override function toString():String
	{
		var t = "";
		for (card in this)
			t += card + "\n";
		return t;
	}
}