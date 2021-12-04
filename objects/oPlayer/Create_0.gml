/// @description Create Player Variables

#region // Physics
h_speed = 0;
v_speed = 0;

grav = GRAVITY;

walk_speed = 4;
run_speed = 8;

jumps_max = 2;
jumps_current = 0

#endregion

#region // Sprite Variables
sprite_idle = sPlayer_Idle;
sprite_run = sPlayer_Run;
sprite_jump = sPlayer_Jump;

#endregion

#region // if target postion exists, set player create position
if (global.target_x != -1)
{
	x = global.target_x;
	y = global.target_y;
	image_xscale = global.target_direction;
}

#endregion

