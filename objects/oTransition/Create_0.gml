/// @description Size variables and mode setup
// get gui data
w = display_get_gui_width();
h = display_get_gui_height();

h_half = h * 0.5;


// set transition mode state variables
enum TRANS_MODE 
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO,
	LOAD,
	GOTONEXT,
}

mode = TRANS_MODE.INTRO;
percent = 1;
target = room;
