package overlay.cards.specifications;

import overlay.util.Specification;

enum MonsterType
{
	AQUA_TYPE;
	BEAST_TYPE;
	BEASTWARRIOR_TYPE;
	DINOSAUR_TYPE;
	FAIRY_TYPE;
	FIEND_TYPE;
	FISH_TYPE;
	INSECT_TYPE;
	MACHINE_TYPE;
	PLANT_TYPE;
	PSYCHIC_TYPE;
	PYRO_TYPE;
	REPTILE_TYPE;
	SEASERPENT_TYPE;
	SPELLCASTER_TYPE;
	THUNDER_TYPE;
	WARRIOR_TYPE;
	WINGEDBEAST_TYPE;
	ZOMBIE_TYPE;
	WYRM_TYPE;
	DRAGON_TYPE;
	DIVINEBEAST_TYPE;
	CREATORGOD_TYPE;
	CYBERSE_TYPE;
}

class Type extends Specification<MonsterType>
{
	public function toString():String
	{
		return switch(value)
		{
			case AQUA_TYPE: "Aqua";
			case BEAST_TYPE: "Beast";
			case BEASTWARRIOR_TYPE: "Beast-Warrior";
			case DINOSAUR_TYPE: "Dinosaur";
			case FAIRY_TYPE: "Fairy";
			case FIEND_TYPE: "Fiend";
			case FISH_TYPE: "Fish";
			case INSECT_TYPE: "Insect";
			case MACHINE_TYPE: "Machine";
			case PLANT_TYPE: "Plant";
			case PSYCHIC_TYPE: "Psychic";
			case PYRO_TYPE: "Pyro";
			case REPTILE_TYPE: "Reptile";
			case SEASERPENT_TYPE: "Sea-Serpent";
			case SPELLCASTER_TYPE: "Spellcaster";
			case THUNDER_TYPE: "Thunder";
			case WARRIOR_TYPE: "Warrior";
			case WINGEDBEAST_TYPE: "Winged-Beast";
			case ZOMBIE_TYPE: "Zombie";
			case WYRM_TYPE: "Wyrm";
			case DRAGON_TYPE: "Dragon";
			case DIVINEBEAST_TYPE: "Divine-Beast";
			case CREATORGOD_TYPE: "Creator God";
			case CYBERSE_TYPE: "Cyberse";
			default: "None";
		}
	}
}
