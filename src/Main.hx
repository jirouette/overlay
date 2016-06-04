import overlay.cards.MonsterCard;

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
		trace(c);
	}
}
