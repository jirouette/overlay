import overlay.cards.MonsterCard;
import overlay.cards.SpellCard;
import overlay.cards.TrapCard;
import overlay.cards.Deck;

class Main
{
	static public function main()
	{
		var c = new MonsterCard(
			"Flamvell Guard",
			DRAGON_TYPE,
			FIRE_ATTRIBUTE,
			TUNER_ABILITY,
			1,
			100,
			2000,
			"A Flamvell guardian who commands fire with his will. His magma-hot barrier protects his troops from intruders.",
			"SDBE-EN005",
			"21615956", 
			true);
		var d = new Deck(MAIN_DECK);
		d.add(c);
		d.shuffle();
		trace(d);
	}
}
