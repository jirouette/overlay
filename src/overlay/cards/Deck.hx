package overlay.cards;

import Random;
import overlay.cards.Card;

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

	public override function toString():String
	{
		var t = "";
		for (card in this)
			t += card + "\n";
		return t;
	}
}