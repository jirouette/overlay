package overlay.cards;

import Random;
import overlay.cards.Card;
import overlay.cards.MonsterCard;
import overlay.cards.TrapCard;
import overlay.cards.SpellCard;

import overlay.cards.specifications.CardDeck;

class Deck extends List<Card>
{
	var isPublic:Bool = false;
	var type:CardDeck;

	public function new(type:DeckType, isPublic:Bool = false)
	{
		super();
		this.type = new CardDeck(type);
		this.isPublic = isPublic;
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
			var node = Xml.parse(f.readAll().toString()).firstElement();
			return switch(node.elementsNamed("cardtype").next().firstChild().nodeValue)
			{
				case "SPELL": SpellCard.fromXML(node);
				case "TRAP": TrapCard.fromXML(node);
				case "MONSTER": MonsterCard.fromXML(node);
				default: Card.fromXML(node);
			}
		}
		catch(e:Dynamic)
		{
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
