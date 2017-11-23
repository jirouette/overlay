package overlay.cards.specifications;

import overlay.util.Specification;

enum MonsterSuperAbility
{
	TOKEN_MONSTER;
	RITUAL_MONSTER;
	FUSION_MONSTER;
	SYNCHRO_MONSTER;
	DARK_SYNCHRO_MONSTER; // not existing in TCG/OCG
	XYZ_MONSTER;
	LINK_MONSTER;
}

class SuperAbility extends Specification<MonsterSuperAbility>
{
	public function toString():String
	{
		return switch(value)
		{
			case TOKEN_MONSTER: "Token Monster";
			case RITUAL_MONSTER: "Ritual Monster";
			case FUSION_MONSTER: "Fusion Monster";
			case SYNCHRO_MONSTER: "Synchro Monster";
			case DARK_SYNCHRO_MONSTER: "Dark Synchro Monster";
			case XYZ_MONSTER: "Xyz Monster";
			case LINK_MONSTER: "Link Monster";
		}
	}

	public function isExtraMonster():Bool
	{
		return switch(value)
		{
			case TOKEN_MONSTER|RITUAL_MONSTER|null: false;
			default: true;
		}
	}

	public function isSpecialSummonMonster():Bool
	{
		return value != null;
	}
}
