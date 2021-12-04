/// @description Draw menu gui when game is paused

#region Press P to pause/unpause game

pause_pressed = keyboard_check_pressed(global.key_pause)

if(pause_pressed)
{
	if(!global.pause) 
	{
		global.pause = true;
		instance_deactivate_all(true);
	}
	else // remove before compiling
	{
		global.pause = false;
		instance_activate_all();
	} 
}

if(!global.pause) exit;

#endregion

#region Local variables

var _gui_width = camera_get_view_width(global.cam), _gui_height = camera_get_view_height(global.cam);
var _c = c_black;
var _ds_grid = menu_pages[page], _ds_height = ds_grid_height(_ds_grid);
var _y_buffer = 80, _x_buffer = 48;
var _start_y = (_gui_height * 0.5) - ((((_ds_height - 1) * 0.5) * _y_buffer)), _start_x = _gui_width * 0.5;

#endregion

// Draw pause menu background
draw_rectangle_color(0,0,_gui_width,_gui_height, _c,_c,_c,_c,false);

#region Draw elements on left 

draw_set_font(fPixelHangul);
draw_set_valign(fa_middle);
draw_set_halign(fa_right);
var _ltx = _start_x - _x_buffer, _lty, _xo; // _ltx + _lty = left position start, _xo = x offset for selected item
var _yy = 0;

repeat(_ds_height)
{
	_lty = _start_y + (_yy*_y_buffer);
	_c = c_white;
	_xo = 0;	
	if(_yy == menu_option[page])
	{
		_c = c_orange;
		_xo = -(_x_buffer * 0.5);
	}
	draw_text_transformed_color(_ltx+_xo, _lty, _ds_grid[# 0, _yy], 3, 3, 0, _c,_c,_c,_c,1);
	_yy++;
}

#endregion


// Draw dividing line
draw_line_width_color(_start_x,_start_y-_y_buffer, _start_x, _lty+_y_buffer,5,c_white,c_white);

#region Draw elements on right side

draw_set_halign(fa_left); // Switch text alighnment for right side
var _rtx = _start_x + _x_buffer, _rty; // right position start
_yy = 0;

repeat(_ds_height)
{
	_rty = _start_y + (_yy*_y_buffer);
	switch(_ds_grid[# 1, _yy])
	{
		case MENU_ELEMENT_TYPE.SLIDER:
			var _len = 128;
			var _current_val = _ds_grid[# 3, _yy];
			var _current_array = _ds_grid[# 4, _yy];
			var _circle_pos = ((_current_val - _current_array[0]) / (_current_array[1] - _current_array[0]));
			_c  = c_white;
			draw_line_width_color(_rtx, _rty, _rtx+_len, _rty, 4, _c,_c);
			if(inputting && _yy == menu_option[page])
			{
				_c = c_yellow;	
			}
			draw_circle_color(_rtx + (_circle_pos * _len), _rty, 8, _c, _c, false);
			draw_text_color(_rtx + (_len * 1.2), _rty, string(floor(_circle_pos*100))+ " %", _c,_c,_c,_c, 1);
		break;
		
		case MENU_ELEMENT_TYPE.TOGGLE:
			var _current_val = _ds_grid[# 3, _yy];
			var _c1, _c2;
			_c = c_white;
			if(inputting && _yy == menu_option[page])
			{
				_c = c_yellow;	
			}			
			if(_current_val == 0)
			{
				_c1 = _c;
				_c2 = c_dkgray;
			}
			else
			{
				_c1 = c_dkgray;
				_c2 = _c;
			}	
			draw_text_color(_rtx, _rty, "ON", _c1,_c1,_c1,_c1,1)
			draw_text_color(_rtx + 128, _rty, "OFF", _c2,_c2,_c2,_c2,1)
		break;
		
		case MENU_ELEMENT_TYPE.INPUT:
			var _current_val = _ds_grid[# 3, _yy];			
			switch(_current_val) // Keys definted with current val will print string rather than chr value
			{
				case vk_left:		_current_val = "LEFT KEY";		break;
				case vk_right:		_current_val = "RIGHT KEY";		break;
				case vk_space:		_current_val = "SPACE KEY";		break;
				case vk_shift:		_current_val = "SHIFT KEY";		break;
				case vk_up:			_current_val = "UP KEY";		break;
				case vk_down:		_current_val = "DOWN KEY";		break;
				case vk_lcontrol:	_current_val = "LEFT CTRL KEY";	break;
				case vk_lalt:		_current_val = "LEFT ALT KEY";	break;
				case vk_rcontrol:	_current_val = "RIGHT CTRL KEY";break;
				case vk_ralt:		_current_val = "RIGHT ALT KEY";	break;
				default:			_current_val = chr(_current_val);
			}
			_c = c_white;
			if(inputting && _yy == menu_option[page])
			{
				_c = c_yellow;	
			}
			draw_text_color(_rtx, _rty, _current_val, _c,_c,_c,_c, 1);		
		break;
		
	}
	_yy++;
}

#endregion

// reset vertical alighnment 
draw_set_valign(fa_top);
