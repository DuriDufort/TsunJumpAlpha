/// @description Place Holder
// Draw Start Screen in center of screen when in rStartScreen
// Draw Main Menu in center of screen when in rMainMenu

if(room == rStartScreen)
{
	// draw start screen stuff
	
	drawSetText(c_black, fStart, fa_middle, fa_middle);
	draw_text(width_half, height_half, "Start Screen");
	
}

if(room == rMainMenu)
{
	// draw Main Menu stuff
	drawSetText(c_black, fStart, fa_middle, fa_middle);
	draw_text(width_half, height_half, "Main Menu");

	// need to save variable before returning to main menu
	// in order to display hidden menu item
	if (global.scroll_count >= 1)
	{
		drawSetText(c_black, fMenu, fa_middle, fa_center-50);
		// place holder for hidden menu items
	}
	
}
