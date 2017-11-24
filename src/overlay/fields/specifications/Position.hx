package overlay.fields.specifications;

import overlay.util.Specification;

enum ZonePosition
{
	ATK_POSITION;
	DEF_POSITION;
	FACEDOWN_ATK_POSITION;
	FACEDOWN_DEF_POSITION;
	UNAVAILABLE;
}

class Position extends Specification<ZonePosition>
{
	public function toString():String
	{
		return switch(value)
		{
			case ATK_POSITION: "Attack position";
			case DEF_POSITION: "Defense position";
			case FACEDOWN_ATK_POSITION: "Face-down position";
			case FACEDOWN_DEF_POSITION: "Face-down defense position";
			case UNAVAILABLE: "Unavailable";
		}
	}
}
