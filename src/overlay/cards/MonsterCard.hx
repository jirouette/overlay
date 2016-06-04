package overlay.cards;

import overlay.cards.Card;

enum MonsterAttribute
{
	DARK_ATTRIBUTE;
	LIGHT_ATTRIBUTE;
	EARTH_ATTRIBUTE;
	WIND_ATTRIBUTE;
	FIRE_ATTRIBUTE;
	WATER_ATTRIBUTE;
	DIVINE_ATTRIBUTE;
}

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
}

enum MonsterAbility
{
	TOON_ABILITY;
	SPIRIT_ABILITY;
	UNION_ABILITY;
	GEMINI_ABILITY;
	TUNER_ABILITY;
}

class MonsterCard extends Card
{
	var attribute:MonsterAttribute;
	var type:MonsterType;
	var ability:Null<MonsterAbility>;
	var faceup:Bool = true;

	var ATK:Int;
	var DEF:Int;

	var level:Int;
	var effect:Null<String>;

	public function new(name:String, 
	                    type:MonsterType, 
	                    attribute:MonsterAttribute, 
	                    ability:Null<MonsterAbility>,
	                    level:Int,
	                    ATK:Int,
	                    DEF:Int,
	                    ?text:Null<String>, 
	                    ?setnumber:Null<String>, 
	                    ?cardnumber:Null<String>,
	                    ?firstedition:Null<Bool>)
	{
		super(name, text, setnumber, cardnumber, firstedition);
		this.type = type;
		this.attribute = attribute;
		this.ability = ability;
		this.level = level;
		this.ATK = ATK;
		this.DEF = DEF;
	}

	static public function attributestring(a:MonsterAttribute)
	{
		return switch(a)
		{
			case DARK_ATTRIBUTE: "DARK";
			case LIGHT_ATTRIBUTE: "LIGHT";
			case EARTH_ATTRIBUTE: "EARTH";
			case WIND_ATTRIBUTE: "WIND";
			case FIRE_ATTRIBUTE: "FIRE";
			case WATER_ATTRIBUTE: "WATER";
			case DIVINE_ATTRIBUTE: "DIVINE";
		}

	}

	static public function typestring(t:MonsterType)
	{
		return switch(t)
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
		}
	}

	static public function abilitystring(a:MonsterAbility)
	{
		return switch(a)
		{
			case TOON_ABILITY: "Toon";
			case SPIRIT_ABILITY: "Spirit";
			case UNION_ABILITY: "Union";
			case GEMINI_ABILITY: "Gemini";
			case TUNER_ABILITY: "Tuner";
		}
	}

	public function line()
	{
		var t = MonsterCard.typestring(type);
		if (ability != null)
			t += "/" + MonsterCard.abilitystring(ability);
		if (effect != null)
			t += "/Effect";
		return t;
	}

	public override function toString():String
	{
		var t = name + " (";
		t += MonsterCard.attributestring(attribute) + ", ";
		t += "*" + level + ", ";
		t += line() + ")" + numbers();
		t += " " + ATK + "/" + DEF;
		if (text != null)
			t += " : \n" + text;
		return t;
	}
}