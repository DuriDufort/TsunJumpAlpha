// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function drawSetText()
{
	// Set variables for drawing text
	draw_set_color(argument[0]);
	draw_set_font(argument[1]);
	draw_set_halign(argument[2]);
	draw_set_valign(argument[3]);	
}

function nineSliceBox()
{	
	// Code used to create 9 slice box from a sprite divisible by 3
	// Example 24 x 24 sprite = (8+8+8) x (8+8+8)
	
	//Stretch Box
	// local variables
	var _size = sprite_get_width(argument[0]) / 3;
	var _x1 = argument[1];
	var _y1 = argument[2];
	var _x2 = argument[3];
	var _y2 = argument[4];
	
	var _w	= _x2 - _x1;
	var _h	= _y2 - _y1;
	
	// Middle
	draw_sprite_part_ext(argument[0], 0, _size, _size, 1, 1, _x1+_size, _y1+_size, _w-(_size*2), _h-(_size*2), c_white, 1);
	
	//Corners
	//Top Left
	draw_sprite_part(argument[0], 0, 0, 0, _size, _size, _x1, _y1);
	//Top Right
	draw_sprite_part(argument[0], 0, _size*2, 0, _size, _size, _x1+_w-_size, _y1);
	//Bottom Left
	draw_sprite_part(argument[0], 0, 0, _size*2, _size, _size, _x1, _y1+_h-_size);
	//Bottom Right
	draw_sprite_part(argument[0], 0,_size*2, _size*2, _size, _size, _x1+_w-_size, _y1+_h-_size);
	
	//Edges
	//left edge
	draw_sprite_part_ext(argument[0], 0, 0, _size, _size, 1, _x1, _y1+_size, 1, _h-(_size*2), c_white, 1);
	//right edge
	draw_sprite_part_ext(argument[0], 0, _size*2, _size, _size, 1, _x1+_w-(_size), _y1+_size, 1, _h-(_size*2), c_white, 1);
	//top edge
	draw_sprite_part_ext(argument[0], 0, _size, 0, 1, _size, _x1+_size, _y1, _w-(_size*2), 1, c_white, 1);
	//bottom edge
	draw_sprite_part_ext(argument[0], 0, _size, _size*2, 1, _size, _x1+_size, _y1+_h-(_size), _w-(_size*2), 1, c_white, 1);

}

function createTextBox()
{	
	// Create text boxes using nine slice Sprite
}

