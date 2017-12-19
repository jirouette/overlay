package overlay.duels;

enum Phase
{
	DRAW_PHASE;
	STANDBY_PHASE;
	MAIN_PHASE;
	BATTLE_PHASE;
	END_PHASE;
	FACULTATIVE_PHASE(phase:Phase);
}

enum Step
{
	START_STEP;
	BATTLE_STEP;
	DAMAGE_STEP;
	END_STEP;
}
