import overlay.cards.MonsterCard;
import overlay.cards.Deck;
import overlay.Player;
import overlay.fields.Field;

class Main
{
	static public function main()
	{
		var d = new Deck(MAIN_DECK);
		d.load("data/decks/random.deck");
		trace(d);
	}
}
