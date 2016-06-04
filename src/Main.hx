import overlay.cards.MonsterCard;
import overlay.cards.Deck;
import overlay.Player;
import overlay.fields.Field;

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

		var p = new Player("jr");
		while(!p.hasLost)
		{
			p.lifepoints -= 500;
			trace(p.lifepoints);
		}
		trace("LOSS");

		var f = new Field();
		f.getZone(MONSTER_ZONE, 2).available = false;
		f.getZone(MONSTER_ZONE).card = c;
		trace(f);
	}
}
