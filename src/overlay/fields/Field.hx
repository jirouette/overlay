package overlay.fields;

import overlay.fields.Zone;
import Type;

import overlay.fields.FieldSet;

class Field extends FieldSet
{
	public function new(?rule:RuleName)
	{
		var ruleset = FieldSet.fromRuleName(if (rule == null) NORMAL_RULE else rule);
		super(ruleset.zones, ruleset.outer_zones, ruleset.width, ruleset.name);
	}

	public override function toString():String
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
