/// @description Create global variables
/*
Section for notes on debug commands
R key - restart game | C Key - Toggle game complete	|
S key - Save game	 | N Key - Change Room Forward	|
L key - load game	 | M Key - Change Room Backward	|
*/

global.game_complete = false;
global.fullscreen = false;

global.scroll_count = 0; // keep track of scrolls collected to unlock doors

// Game Pause
global.key_pause = ord("P");
global.pause = false

// Camera
global.cam = view_camera[0];
global.view_w = camera_get_view_width(global.cam);
global.view_h = camera_get_view_height(global.cam);

display_set_gui_size(global.view_w, global.view_h);

// Variable Input
global.key_left = vk_left;
global.key_right = vk_right;
global.key_jump = vk_space;
global.key_run = vk_shift;

// Fixed Input
global.key_up = vk_up;
global.key_down = vk_down;
global.key_enter = vk_enter;

// Player Variables
global.has_control = true;
global.target_x = -1;
global.target_y = -1;
global.target_room = -1;
global.target_direction = 0;

