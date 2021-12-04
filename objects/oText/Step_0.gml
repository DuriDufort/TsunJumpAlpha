/// @description Progress text

letters += spd;

text_current = string_copy(text, 1, floor(letters));

if(h == 0) h = string_height(text);
w = string_width(text_current);

global.has_control = false;
// Destroy when done
if(letters <= length && keyboard_check_pressed(vk_space))
{
	spd = 10;	
}

if(letters >= length && keyboard_check_pressed(vk_enter))
{
	global.has_control = true;
	instance_destroy();
	global.follow = oPlayer;
}

