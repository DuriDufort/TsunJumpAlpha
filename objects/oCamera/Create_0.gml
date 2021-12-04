/// @description Set up camera
 
global.follow = oPlayer;
view_w_half = global.view_w * 0.5;
view_h_half = global.view_h * 0.5;
xTo = xstart;
yTo = ystart;
margin = CAMERA_MARGIN; // change value to adjust clamp
pan_speed = 25; // change value to adjust camera follow speed, smaller = snappier