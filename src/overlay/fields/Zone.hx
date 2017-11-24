package overlay.fields;

import overlay.cards.Card;
import overlay.fields.specifications.Position;
import overlay.fields.specifications.ZoneType;

class Zone
{
	public var card:Null<Card>;
	public var type(default, null):ZoneType;
	public var position(default, null):Position;

	public function new(type:ZoneName, ?position:ZonePosition)
	{
		this.type = new ZoneType(type);
		this.position = new Position(if (position == null) ATK_POSITION else position);
	}

	public function toString():String
	{
		if (card != null)
			return card.name + " (" + Std.string(position) + ")";
		return Std.string(type) + " (" + Std.string(position) + ")";
	}
}
