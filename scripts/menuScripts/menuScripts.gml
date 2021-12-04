// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function createMenuPage()
{
	// Create menu pages using ds maps containing menu items
	var _arg, i = 0;
	repeat(argument_count)
	{
		_arg[i] = argument[i];
		i++;
	}

	var _ds_grid_id = ds_grid_create(5, argument_count);
	i = 0; 
	repeat(argument_count)
	{
		var _array = _arg[i];
		var _array_len = array_length(_array);
		
		var xx = 0; 
		repeat(_array_len)
		{
			_ds_grid_id[# xx, i] = _array[xx];
			xx++;
		}
		i++;
	}
	return _ds_grid_id;
}

function changeResolution()
{
	// Change game resolution
	// Decide resolution before proceeding with room/view sizes
	switch(argument0)
	{
		case 0: window_set_size(384,216);		break;
		case 1: window_set_size(768, 432);		break;
		case 2: window_set_size(1152, 648);		break;
		case 3: window_set_size(1536, 874);		break;
		case 4: window_set_size(1920, 1080);	break;
	}
}

function changeVolume()
{
	// Change volume control variables
	var _type = menu_option[page];
	
	switch(_type)
	{
		case 0: audio_master_gain(argument0); break;					// master
		case 1: audio_group_set_gain(audiogroup2, argument0, 0); break; // soundeffects
		case 2: audio_group_set_gain(audiogroup1, argument0, 0); break; // music
	 
	}
}

function changeWindowMode()
{
	// Toggle from window to fullscreen mode
	switch(argument0)
	{
		case 0: window_set_fullscreen(true); break;
		case 1: window_set_fullscreen(false); break;
	}
}

function gameResume()
{	
	// Close in game menu and resume game
	// Save game before resuming?
	global.pause = false;
	instance_activate_all();
}

function gameTitle()
{
	// Save game
	// Return to title screen - Main menu
	
}

function gameQuit()
{	
	// Script to be called when quitting the game 
	// 1. save all game data
	// 2. close out game completely
	
	
	game_end();
}


