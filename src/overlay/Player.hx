package overlay;

import overlay.cards.Deck;
import overlay.fields.Field;

class Player
{
	public var name(default, null):String;
	public var field:Field;
	public var lifepoints(default, set):Int;

	public var hasLost:Bool = false;

	public var deck:Deck;
	public var extradeck:Deck;
	public var sidedeck:Deck;

	public var graveyard:Deck;
	public var banished:Deck;
	public var hand:Deck;

	public function new(name:String, deck_filename:String, lifepoints:Int = 8000)
	{
		this.name = name;
		this.lifepoints = lifepoints;

		this.deck = new Deck(MAIN_DECK);
		this.extradeck = new Deck(EXTRA_DECK);
		this.sidedeck = new Deck(SIDE_DECK);

		this.graveyard = new Deck(GRAVEYARD_DECK, true);
		this.banished = new Deck(BANISHED_DECK, true);
		this.hand = new Deck(HAND_DECK);

		this.field = new Field();

		this.deck.load(deck_filename);
	}

	public function set_lifepoints(lifepoints:Int):Int
	{
		this.lifepoints = if (lifepoints < 0) 0 else lifepoints;
		if (this.lifepoints == 0)
			hasLost = true;
		return this.lifepoints;
	}

	public function draw(nb:Int = 1)
	{
		while(nb-- > 0)
		{
			if (deck.length == 0)
			{
				hasLost = true;
				return;
			}
			var c = deck.first();
			hand.add(c);
			deck.remove(c);
		}
	}

	public function toString():String
	{
		return Std.string(this.name);
	}
}
