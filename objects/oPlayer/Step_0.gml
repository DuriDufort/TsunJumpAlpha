/// @description Player character logic


if (global.has_control)
{
#region // Player Controls
	key_left = keyboard_check(global.key_left);
	key_right = keyboard_check(global.key_right);
	key_jump =  keyboard_check_pressed(global.key_jump);
	key_run = keyboard_check(global.key_run);
	//key_activated = keyboard_check(global.key_enter); // pressed when interacting with doors/objects
}
else 
{
	key_left	= 0;
	key_right	= 0;
	key_jump	= 0;
	key_run		= 0;
}
#endregion

// Adds Gravity
v_speed = v_speed + grav;

#region // Left and Right Movement
// Calculate Horizontal Movement
var _move = key_right - key_left;

h_speed = _move * walk_speed;


if (_move != 0 && key_run) // If shift is held use sprint speed
{
	h_speed = _move * run_speed;
}
#endregion

#region // Jump Mechanics

if (key_jump && jumps_current > 0)
{
	v_speed = -10;
	jumps_current --;
}

if(place_meeting(x, y+v_speed, oSolid))
{
	while(!place_meeting(x, y+sign(v_speed), oSolid))
	{
		y += sign(v_speed);
	}
	
	if (v_speed > 0)
	{
		jumps_current = jumps_max;
	}
	
	v_speed = 0;
}
#endregion


#region //Collision
// Check Horizontal Collision
// If there is a wall get as close as possible
if(place_meeting(x+h_speed, y, oSolid))
{
	while(!place_meeting(x+sign(h_speed), y, oSolid))
	{
		x = x + sign(h_speed);
	}
	h_speed = 0;
}

x = x + h_speed;

// Check Vertical Collision
// If there is a floor underneath get as close as possible
if(place_meeting(x, y+v_speed, oSolid))
{
	while(!place_meeting(x, y+sign(v_speed), oSolid))
	{
		y = y + sign(v_speed);
	}
	v_speed = 0;
}

y = y + v_speed;
#endregion

#region // Animation
// if player not on ground
if(!place_meeting(x, y+1, oSolid))
{
	//	Use first jump sprite if jumping, second sprite if falling
	sprite_index = sprite_jump;
	image_speed = 0;
	if(sign(v_speed) > 0) image_index = 0; else image_index = 1;
}
else
{
	// If player stationary use idle animation
	if(h_speed == 0)
	{
		sprite_index = sprite_idle;
		image_speed = 1;
	}
	else
	{
		sprite_index = sprite_run;
	}
}
// choose player facing direction 
if(h_speed != 0)
{
	image_xscale = sign(h_speed);
	global.target_direction = sign(h_speed);
}
#endregion


