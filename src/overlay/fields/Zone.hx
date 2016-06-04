package overlay.fields;

import overlay.cards.Card;

enum ZoneType
{
	MONSTER_ZONE;
	SPELLTRAP_ZONE;
	FIELD_ZONE;
	PENDULUM_ZONE;
}

enum ZonePosition
{
	ATK_POSITION;
	DEF_POSITION;
}

class Zone
{
	public var card:Null<Card>;
	public var available:Bool = true;
	public var type(default, null):ZoneType;
	public var position:ZonePosition = ATK_POSITION;

	public function new(type:ZoneType)
	{
		this.type = type;
	}

	static public function typestring(t:ZoneType):String
	{
		return switch(t)
		{
			case MONSTER_ZONE: "Monster Zone";
			case SPELLTRAP_ZONE: "Spell/Trap Zone";
			case FIELD_ZONE: "Field Zone";
			case PENDULUM_ZONE: "Pendulum Zone";
		}
	}

	static public function positionstring(p:ZonePosition)
	{
		return switch(p)
		{
			case ATK_POSITION: "Attack position";
			case DEF_POSITION: "Defense position";
		}
	}

	public function toString():String
	{
		if (card != null)
			return card.name + if (Type.enumEq(type, MONSTER_ZONE)) " (" + Zone.positionstring(position) + ")" else "";
		return Zone.typestring(type) + if (available) "" else " (X)";
	}
}
