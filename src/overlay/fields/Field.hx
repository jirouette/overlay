package overlay.fields;

import overlay.fields.Zone;
import Type;

class Field
{
	public var zones:Array<Zone> = [
		new Zone(FIELD_ZONE),
		new Zone(PENDULUM_ZONE),new Zone(PENDULUM_ZONE),
		new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),
		new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),
	];

	public function new()
	{}

	public function getZone(type:ZoneType, index:Int = -1, available:Bool = true):Null<Zone>
	{
		var x = 0;
		for (z in zones)
		{
			if (Type.enumEq(z.type, type) && (index == -1 || x++ == index))
				return z;
		}
		return null;
	}

	public function toString():String
	{
		var type:ZoneType = if (zones.length == 0) FIELD_ZONE else zones[0].type;
		var t = "";

		for (z in zones)
		{
			if (!Type.enumEq(type, z.type))
				t += "\n";
			else if (t.length > 0)
				t += " | ";
			t += z;

			type = z.type;
		}
		return if (t.length == 0) "field with empty zone" else t;
	}
}
