package overlay.fields;

import overlay.fields.Zone;
import overlay.fields.specifications.ZoneType;
import Type;

enum RuleName
{
	NORMAL_RULE; // DM, GX, 5DS, ZEXAL (Master Rules 2)
	SPEED_RULE; // like Duel Links (Master Rules 2)
	ARCV_RULE; // ARCV (Master Rules 3)
	ARCV_SPEED_RULE; // ARCV in Duel Links format (Master Rules 3)
	VRAINS_RULE; // VRAINS (New Master Rules)
	VRAINS_SPEED_RULE; // VRAINS in Duel Links format (New Master Rules)

	// custom rules :

	GAUNTLET_RULE; // Master Rules 2 without any spell trap
	ARCV_GAUNTLET_RULE; // Master Rules 3 without any spell trap
	VRAINS_GAUNTLET_RULE; // New Master Rules without any spell trap
	VRAINS_GAUNTLET_PENDULUM_RULE; // New Master Rules without any spell trap beside Pendulum-only zones (positioned!)
	WORLD_WAR_RULE; // Master Rules 2 with 6 SpellTraps + 10 Monster Zones
	ARCV_WORLD_WAR_RULE; // New Master Rules with 4 SpellTraps + 2 Pendulum + 10 Monster Zones
	VRAINS_WORLD_WAR_RULE; // New Master Rules with 4 SpellTraps + 2 PendulumSpellTrap + 10 Main Monster Zones + 4 Extra Monster Zones
	VRAINS_PENDULUM_FIELD_RULE; // New Master Rules with 2 Pendulum-only zones (positionned) + 3 Field Zones (positioned)
	VRAINS_TRIANGLE_EXTRA_LINK_RULE; // New Master Rules with 1 Spell/Trap instead of middle Main Monster + 1 Extra Monster instead of middle Spell/Trap + Extremity positioned Extra Monsters
}

class FieldSet
{
	public var zones:Array<Null<Zone>>;
	public var outer_zones:Array<Null<Zone>>;
	public var width:UInt;
	public var name:RuleName;

	public function new(zones, outer_zones, width, ?name)
	{
		this.zones = zones;
		this.outer_zones = outer_zones;
		this.width = width;
		this.name = name;
	}

	public function getZone(type:ZoneName, index:Int = -1):Null<Zone>
	{
		var x = 0;
		for (z in zones)
		{
			if (z != null && z.type != null && Type.enumEq(z.type.value, type))
			 	if (index == -1 || x++ == index)
					return z;
		}
		return null;
	}

	public function toString():String
	{
		return switch(name)
		{
			case NORMAL_RULE: "Master Rules 2";
			case SPEED_RULE: "Speed Duel Master Rules 2";
			case ARCV_RULE: "Master Rules 3";
			case ARCV_SPEED_RULE: "Speed Duel Master Rules 3";
			//case VRAINS_RULES: "New Master Rules"; // not working at the moment, dont why, will look later
			case VRAINS_SPEED_RULE: "Speed Duel New Master Rules";

			// custom rules :

			case GAUNTLET_RULE: "Gauntlet Master Rules 2";
			case ARCV_GAUNTLET_RULE: "Gauntlet Master Rules 3";
			case VRAINS_GAUNTLET_RULE: "Gauntlet New Master Rules";
			case VRAINS_GAUNTLET_PENDULUM_RULE: "Gauntlet Pendulum New Master Rules";
			case WORLD_WAR_RULE: "World War Master Rules 2";
			case ARCV_WORLD_WAR_RULE: "World War Master Rules 3";
			case VRAINS_WORLD_WAR_RULE: "World War New Master Rules";
			case VRAINS_PENDULUM_FIELD_RULE: "Pendulum Field New Master Rules";
			case VRAINS_TRIANGLE_EXTRA_LINK_RULE: "Triangle Extra Link New Master Rules";

			default: "New Master Rules";
		}
	}

	public static function fromRuleName(name:RuleName):FieldSet
	{
		return switch(name)
		{
			case NORMAL_RULE:
				// MMMMM
				// SSSSS
				// (1F)
				new FieldSet([
					new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),
					new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE)
				], [
					new Zone(UNIQUE_FIELD_ZONE)
				], 5, name);

			case SPEED_RULE:
				// MMMMM
				// SSS
				// (1F)
				new FieldSet([
					new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),
					new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE)
				], [
					new Zone(UNIQUE_FIELD_ZONE)
				], 3, name);
			case ARCV_RULE:
				// MMMMM
				// SSSSS
				// (F, P, P)
				new FieldSet([
					new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),
					new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE)
				], [
					new Zone(FIELD_ZONE),
					new Zone(PENDULUM_ZONE),new Zone(PENDULUM_ZONE)
				], 5, name);
			case ARCV_SPEED_RULE:
				// MMM
				// SSS
				// (F, P, P)
				new FieldSet([
					new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),
					new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE)
				], [
					new Zone(FIELD_ZONE),
					new Zone(PENDULUM_ZONE),new Zone(PENDULUM_ZONE)
				], 3, name);
			case VRAINS_RULE:
				// _X_X_
				// MMMMM
				// PSSSP
				// (F)
				new FieldSet([
					null,new Zone(EXTRA_MONSTER_ZONE),null,new Zone(EXTRA_MONSTER_ZONE),null,
					new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),
					new Zone(PENDULUM_SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(PENDULUM_SPELLTRAP_ZONE)
				], [
					new Zone(FIELD_ZONE)
				], 5, name);
			case VRAINS_SPEED_RULE:
				// X_X
				// MMM
				// PSP
				// (F)
				new FieldSet([
					new Zone(EXTRA_MONSTER_ZONE),null,new Zone(EXTRA_MONSTER_ZONE),
					new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),
					new Zone(PENDULUM_SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(PENDULUM_SPELLTRAP_ZONE)
				], [
					new Zone(FIELD_ZONE)
				], 3, name);

			// custom rules :

			case GAUNTLET_RULE:
				// MMMMM
				// (1F)
				new FieldSet([
					new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE)
				], [
					new Zone(UNIQUE_FIELD_ZONE),
				], 5, name);

			case ARCV_GAUNTLET_RULE:
				// MMMMM
				// (F, P, P)
				new FieldSet([
					new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE)
				], [
					new Zone(FIELD_ZONE),
					new Zone(PENDULUM_ZONE),new Zone(PENDULUM_ZONE)
				], 5, name);

			case VRAINS_GAUNTLET_RULE:
				// _X_X_
				// MMMMM
				// (F)
				new FieldSet([
					null,new Zone(EXTRA_MONSTER_ZONE),null,new Zone(EXTRA_MONSTER_ZONE),null,
					new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE)
				], [
					new Zone(FIELD_ZONE)
				], 5, name);

			case VRAINS_GAUNTLET_PENDULUM_RULE:
				// _X_X_
				// MMMMM
				// P___P
				// (F)
				new FieldSet([
					null,new Zone(EXTRA_MONSTER_ZONE),null,new Zone(EXTRA_MONSTER_ZONE),null,
					new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),
					new Zone(PENDULUM_ZONE),null,null,null,new Zone(PENDULUM_ZONE)
				], [
					new Zone(FIELD_ZONE)
				], 5, name);

			case WORLD_WAR_RULE:
				// MMMMMMMMMM
				// __SSSSSS__
				// (1F)
				new FieldSet([
					// first row
					new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),
					new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),

					// second row
					null,null,new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),
					new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),null,null
				], [
					new Zone(UNIQUE_FIELD_ZONE)
				], 10, name);

			case ARCV_WORLD_WAR_RULE:
				// MMMMMMMMMM
				// ___SSSS___
				// (F, P, P)
				new FieldSet([
					// first row
					new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),
					new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),new Zone(MONSTER_ZONE),

					// second row
					null,null,null,new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),
					new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),null,null,null
				], [
					new Zone(FIELD_ZONE),
					new Zone(PENDULUM_ZONE), new Zone(PENDULUM_ZONE)
				], 10, name);

			case VRAINS_WORLD_WAR_RULE:
				// _X_X__X_X_
				// MMMMMMMMMM
				// _PSS__PSS_
				// (F)
				new FieldSet([
					null,new Zone(EXTRA_MONSTER_ZONE),null,new Zone(EXTRA_MONSTER_ZONE),null,null,new Zone(EXTRA_MONSTER_ZONE),null,new Zone(EXTRA_MONSTER_ZONE),null,
					new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),
					new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),
					new Zone(PENDULUM_SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(PENDULUM_SPELLTRAP_ZONE)
				], [
					new Zone(FIELD_ZONE)
				], 10, name);

			case VRAINS_PENDULUM_FIELD_RULE:
				// _X_X_
				// MMMMM
				// PFFFP
				new FieldSet([
					null,new Zone(EXTRA_MONSTER_ZONE),null,new Zone(EXTRA_MONSTER_ZONE),null,
					new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),
					new Zone(PENDULUM_SPELLTRAP_ZONE),new Zone(FIELD_ZONE),new Zone(FIELD_ZONE),new Zone(FIELD_ZONE),new Zone(PENDULUM_SPELLTRAP_ZONE)
				], [
					new Zone(FIELD_ZONE)
				], 5, name);

			case VRAINS_TRIANGLE_EXTRA_LINK_RULE:
				// X___X
				// MMSMM
				// PSXSP
				new FieldSet([
					new Zone(EXTRA_MONSTER_ZONE),null,null,null,new Zone(EXTRA_MONSTER_ZONE),
					new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(MAIN_MONSTER_ZONE),new Zone(MAIN_MONSTER_ZONE),
					new Zone(PENDULUM_SPELLTRAP_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(EXTRA_MONSTER_ZONE),new Zone(SPELLTRAP_ZONE),new Zone(PENDULUM_SPELLTRAP_ZONE)
				], [
					new Zone(FIELD_ZONE)
				], 5, name);

			default:
				// X
				new FieldSet([new Zone(EXTRA_MONSTER_ZONE)], [], 1, name); // good luck
		}
	}
}
