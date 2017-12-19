package overlay.fields;

import thx.text.Table;
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
		var zones:Array<Array<Dynamic>> = [[for (i in 0...this.width) "Column #"+(i+1)]];
		for(i in 0...this.zones.length)
		{
			if (i%this.width == 0)
				zones.push([]);
			zones[zones.length-1].push(this.zones[i]);
		}

		var table = Table.fromData(zones);
		table.ensureRow(0).style.setAlign(Center);

		for (i in 0...Std.int(this.zones.length/this.width))
		{
			table.ensureRow(i+1).style.type = Body;
			table.ensureRow(i+1).style.setAlign(Center);
		}

		return table.toString();
	}
}
