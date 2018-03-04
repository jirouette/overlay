package overlay.duels;

import overlay.duels.Action;
import overlay.duels.Phase;
import overlay.Duel;

typedef PlayerAction = {player:Player, action:Action};

class Turn
{
	public var phases(default, null):Array<Phase> = [
		DRAW_PHASE,
		STANDBY_PHASE,
		MAIN_PHASE,
		FACULTATIVE_PHASE(BATTLE_PHASE),
		FACULTATIVE_PHASE(MAIN_PHASE),
		END_PHASE
	];
	public var actions(default, null):Array<PlayerAction> = [];

	public var current_phase(get, null):Phase;
	private var phase_index:Int;
	private var duel:Duel;
	public var turn_player(default, null):Player;

	public function new(duel:Duel, turn_player:Player)
	{
		this.duel = duel;
		this.turn_player = turn_player;
		this.current_phase = this.phases[0];
		this.phase_index = 0;

		this.action(turn_player, NEW_TURN);
	}

	public function action(player:Player, action:Action)
	{
		this.actions.push({player: player, action: action});
		trace(player+": "+action);

		switch(action)
		{
			case DRAW_CARD(number):
				player.draw(number);

			case CHANGE_PHASE(phase):
				this.change_phase(phase);

			default:
				return;
		}
	}

	public function change_phase(phase:Phase)
	{
		for (i in (this.phase_index+1)...this.phases.length)
		{
			var p = switch(this.phases[i])
			{
				case FACULTATIVE_PHASE(p):
					p;
				default:
					this.phases[i];
			};

			if (p == phase)
			{
				this.phase_index = i;
				break;
			}
		}
	}

	public function get_current_phase():Phase
	{
		var phase = this.phases[this.phase_index];
		return switch(phase)
		{
			case FACULTATIVE_PHASE(p):
				p;
			default:
				phase;
		}
	}
}
