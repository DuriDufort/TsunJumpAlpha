/// @description Update Camera


#region Follow object when game not paused
if(!global.pause)
{
	// If follow exists (oPlayer), update destination
	if(instance_exists(global.follow))
	{
		xTo = global.follow.x;
		yTo = global.follow.y;
	}
}

#endregion

#region Update object position
x += (xTo - x) / pan_speed;
y += (yTo - y) / pan_speed;

x = clamp(x, view_w_half + margin, room_width-view_w_half - margin);
y = clamp(y, view_h_half + margin, room_height-view_h_half - margin);

#endregion

// Update camera view
camera_set_view_pos(global.cam, x-view_w_half, y-view_h_half);
