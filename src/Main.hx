import overlay.Duel;
import overlay.Player;

class Main
{
	static public function main()
	{
		var p = new Player("jr");
		p.deck.load("data/decks/random.deck");

		var duel = new Duel();
		duel.addPlayer(p);
		duel.start();

		trace(p.hand);
	}
}
