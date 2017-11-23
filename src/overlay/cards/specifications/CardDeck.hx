package overlay.cards.specifications;

import overlay.util.Specification;

enum DeckType
{
	MAIN_DECK;
	EXTRA_DECK;
	SIDE_DECK;
	GRAVEYARD_DECK;
	BANISHED_DECK;
	HAND_DECK;
	XYZ_STACK;
}

class CardDeck extends Specification<DeckType>
{
	public function toString():String
	{
		return switch(value)
		{
			case MAIN_DECK: "Main Deck";
			case EXTRA_DECK: "Extra Deck";
			case SIDE_DECK: "Side Deck";
			case GRAVEYARD_DECK: "Graveyard";
			case BANISHED_DECK: "Banish Zone";
			case HAND_DECK: "Hand";
			case XYZ_STACK: "Xyz Stack";
			default: "None Deck";
		}
	}
}
