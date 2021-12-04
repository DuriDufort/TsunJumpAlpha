/// @desc Draw debug messages

if debug_mode
	{
	drawSetText(c_black, fMenu, fa_middle, fa_middle);
	draw_text(100, 32, "FPS = " + string(fps));
	draw_text(100, 64, "Scrolls = " + string(global.scroll_count));
	}