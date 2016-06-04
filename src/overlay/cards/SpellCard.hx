package overlay.cards;

import overlay.cards.Card;

enum SpellType
{
	NORMAL_SPELL;
	CONTINUOUS_SPELL;
	EQUIP_SPELL;
	QUICKPLAY_SPELL;
	FIELD_SPELL;
	RITUAL_SPELL;
}

class SpellCard extends Card
{

	var type:SpellType;

	public function new(name:String, type:SpellType, ?text:Null<String>, ?setnumber:Null<String>, ?cardnumber:Null<String>, ?firstedition:Null<Bool>)
	{
		super(name, text, setnumber, cardnumber, firstedition);
		this.type = type;
	}

	static public function typestring(t:SpellType)
	{
		return switch(t)
		{
			case NORMAL_SPELL: "Normal Spell";
			case CONTINUOUS_SPELL: "Continuous Spell";
			case EQUIP_SPELL: "Equip Spell";
			case QUICKPLAY_SPELL: "Quick-Play Spell";
			case FIELD_SPELL: "Field Spell";
			case RITUAL_SPELL: "Ritual Spell";
		}
	}

	public override function toString():String
	{
		var t = name + " (" + SpellCard.typestring(type) + ")" + numbers();
		if (text != null)
			t += " : \n" + text;
		return t;
	}
}