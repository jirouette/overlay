package overlay.fields;

import overlay.fields.Zone;
import Type;

class Field
{
	public var zones:Array<Null<Zone>> = [
		new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),
		new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),
	];

	public var outer_zones:Array<Null<Zone>> = [
		new Zone(FIELD_ZONE),
		new Zone(PENDULUM_ZONE),new Zone(PENDULUM_ZONE),
	];

	public var width = 5; // max 5 zones in a row

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
		var t = "";
		var i = 0;
		for (zone in zones)
		{
			if (width % i++ == 0)
				t += "\n";
			else if (t.length > 0)
				t += " | ";
			t += Std.string(zone);
		}
		return if (t.length == 0) "field with empty zone" else t;
	}
}
