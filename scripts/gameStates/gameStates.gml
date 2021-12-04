// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function gameSave()
{
	// Save all necessary game data
	// 1. Save PLayer x & y position, current room 
	// 2. Save scroll state information (collected vs not collected)
	// 3. Save global variable data, scroll count, settings,  etc.
	//	 ex. Volume options
	
}

function gameLoad()
{	
	// Load necessary game data
	// 1. load room player was in and target x & y position
	// 2. Load scroll stat (colleceted vs not collected)
	// 3. Load global variable data, scroll count, settings, etc.
	//	 ex. Volume options

}

function gamePause()
{
	// Pause the game and open in game menu
	
	
}

function slideTransition()
{
	with (oTransition)
	{
		mode = argument[0];
		if (argument_count > 1) 
		{
			target	= argument[1];
			if(argument_count > 2)
			{
				x_coord = argument[2];
				y_coord = argument[3];
			}
		}
	}	
}
