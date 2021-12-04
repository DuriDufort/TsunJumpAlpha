/// @description Player Collision
// Display Text stored in ScrollGrid

var _collected = collected;
var _sender = sender;
var _text = text;
var _row = row;
var _ds = oScrollGrid.scroll_grid;

_collected = _ds[# 1, _row];
_sender = _ds[# 2, _row];
_text = _ds[# 3, _row];

var _bool = 1;

_collected = _bool;

with(instance_create_layer(x, y - TEXT_OFFSET, layer, oText))
{
	text = "From " + string(_sender) + "\n" + string(_text);
	length = string_length(text);
	global.scroll_count ++;
	global.follow = id;
}

instance_destroy();


