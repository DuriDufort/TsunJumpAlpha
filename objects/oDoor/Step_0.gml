/// @description Door Logic
// When Scroll count is below required count draw Red door, door not interactable
// When Scroll count is greater than or equal to required count, draw brown door
// When Player is within range of door draw yellow trim around door, key press up transitions to next room

var _key_pressed_enter = keyboard_check(global.key_up);

if(instance_exists(oPlayer))
{
	if(global.scroll_count >= scrolls_required)
	{
		image_index = 1;
	}
	else
	{
		image_index = 0;
	}

	if(global.scroll_count >= scrolls_required)
	{
		if(point_distance(x, y, oPlayer.x, oPlayer.y) < 32)
		{
			image_index = 2;
			if(_key_pressed_enter)
			{
				global.target_room = target_room;
				global.target_x = target_x;
				global.target_y = target_y;
				slideTransition(TRANS_MODE.GOTO, target_room)
			}
		}
	}
}