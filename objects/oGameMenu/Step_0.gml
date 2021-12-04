/// @description Cycle through menu options and make selections

// if game not paused exit
if(!global.pause) exit;

#region Menu input controls - Will not change with Controls Menu changes


input_up_p		= keyboard_check_pressed(vk_up);
input_down_p	= keyboard_check_pressed(vk_down);
input_enter_p	= keyboard_check_pressed(vk_enter);
menu_left		= keyboard_check_pressed(vk_left);
menu_right		= keyboard_check_pressed(vk_right);
menu_s_left		= keyboard_check(vk_left);
menu_s_right	= keyboard_check(vk_right);

#endregion

var _ds = menu_pages[page], _ds_height = ds_grid_height(_ds); //get _dsgrid

if(inputting)
{
	switch(_ds[# 1, menu_option[page]])
	{
		#region Change Values stored in slider menu elements
		case MENU_ELEMENT_TYPE.SLIDER:		
			var _hinput = menu_s_right - menu_s_left;
			if(_hinput != 0)
			{
				_ds[# 3, menu_option[page]] += _hinput * 0.01;
				_ds[# 3, menu_option[page]] = clamp(_ds[# 3, menu_option[page]], 0, 1);
			}
		break;
		
		#endregion
		
		#region Change value for toggle menu elements
		case MENU_ELEMENT_TYPE.TOGGLE:
			var _hinput = menu_right - menu_left;
			if(_hinput != 0)
			{
				_ds[# 3, menu_option[page]] += _hinput;
				_ds[# 3, menu_option[page]] = clamp(_ds[# 3, menu_option[page]], 0, 1);
			}
		break;
		
		#endregion

		#region Change value for input menu elements
		case MENU_ELEMENT_TYPE.INPUT:
			var _kk = keyboard_lastkey;
			if(_kk != vk_enter && _kk != ord("P") && _kk != vk_escape) // checks for illegal keys
			{
				if(_kk != _ds[# 3, menu_option[page]]) // audio
				if(_kk != _ds[# 3, 0] && _kk != _ds[# 3, 1] && _kk != _ds[# 3, 2] && _kk != _ds[# 3, 3]) // checks if key is in use
				{
					_ds[# 3, menu_option[page]] = _kk;
					variable_global_set(_ds[# 2, menu_option[page]], _kk);
				}
			}
		break;

		#endregion
	}
}
else
{
	var _ochange = input_down_p - input_up_p;
	if(_ochange != 0)
	{
		menu_option[page] += _ochange;
	
		if(menu_option[page] > _ds_height-1)
		{
			menu_option[page] = 0;
		}
		if(menu_option[page] < 0)
		{
			menu_option[page] = _ds_height-1;
		}
		// menu audio
	}
}

#region When enter is pressed over a menu item will execute relevent script

if(input_enter_p)
{
	switch(_ds[# 1, menu_option[page]])
	{
		case MENU_ELEMENT_TYPE.SCRIPT_RUNNER:
			script_execute(_ds[# 2, menu_option[page]]);
		break;
		
		case MENU_ELEMENT_TYPE.PAGE_TRANSFER:
			page = _ds[# 2, menu_option[page]];
		break;
		
		case MENU_ELEMENT_TYPE.SLIDER:
			if(inputting){ script_execute(_ds[# 2, menu_option[page]], _ds[# 3, menu_option[page]]); }
			
		case MENU_ELEMENT_TYPE.TOGGLE:
			if(inputting){ script_execute(_ds[# 2, menu_option[page]], _ds[# 3, menu_option[page]]); }
			
		case MENU_ELEMENT_TYPE.INPUT:
			
			inputting = !inputting;
		break;
	}
	
	// Audio place holder for sub menu select
}

#endregion

