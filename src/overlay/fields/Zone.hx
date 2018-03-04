package overlay.fields;

import overlay.cards.Card;
import overlay.fields.specifications.Position;
import overlay.fields.specifications.ZoneType;

class Zone
{
	public var card:Null<Card>;
	public var position:Position;
	public var type(default, null):ZoneType;

	public function new(type:ZoneName, ?position:ZonePosition)
	{
		this.type = new ZoneType(type);
		this.position = new Position(if (position == null) ATK_POSITION else position);
	}

	public function toString():String
	{
		if (this.card != null)
		{
			return this.card.name + (switch(this.type.value)
			{
				case MONSTER_ZONE, MAIN_MONSTER_ZONE, EXTRA_MONSTER_ZONE:
					" (" + Std.string(this.position) + ")";
				default:
					"";
			});
		}
		return Std.string(this.type);
	}
}
