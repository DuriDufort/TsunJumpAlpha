/// @description Create in game menus
// Link for menu creation tutorial playlist
// https://www.youtube.com/playlist?list=PLSFMekK0JFgx2vmcCnttxxhrNVTjUB8R1

#region Enums
enum MENU_PAGE {
	MAIN, 
	SETTINGS, 
	AUDIO,
	GRAPHICS, 
	CONTROLS, 
	HEIGHT	
}

enum MENU_ELEMENT_TYPE {
	SCRIPT_RUNNER,
	PAGE_TRANSFER,
	SLIDER,
	TOGGLE,
	INPUT,
}

#endregion

#region Create Menu Pages
ds_menu_main = createMenuPage (
	["Resume",			MENU_ELEMENT_TYPE.SCRIPT_RUNNER,	gameResume],
	["Save",			MENU_ELEMENT_TYPE.SCRIPT_RUNNER,	gameSave],
	["Settings",		MENU_ELEMENT_TYPE.PAGE_TRANSFER,	MENU_PAGE.SETTINGS],
	["Return to Title",	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,	gameTitle],
	["Quit Game",		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,	gameQuit]
	
);

#endregion

#region Create Settings Page
ds_settings = createMenuPage(
	["Audio",			MENU_ELEMENT_TYPE.PAGE_TRANSFER,	MENU_PAGE.AUDIO],
	["Graphics",		MENU_ELEMENT_TYPE.PAGE_TRANSFER,	MENU_PAGE.GRAPHICS],
	["Game Controls",	MENU_ELEMENT_TYPE.PAGE_TRANSFER,	MENU_PAGE.CONTROLS], // Note - page transfer to menu controls vs game controls?
	["Back",			MENU_ELEMENT_TYPE.PAGE_TRANSFER,	MENU_PAGE.MAIN],
);

#endregion

#region Create Audio Page
ds_menu_audio = createMenuPage(
	["Master",	MENU_ELEMENT_TYPE.SLIDER,			changeVolume,		1,		[0,1]],
	["Sound",	MENU_ELEMENT_TYPE.SLIDER,			changeVolume,		1,		[0,1]],
	["Music",	MENU_ELEMENT_TYPE.SLIDER,			changeVolume,		1,		[0,1]],
	["Back",	MENU_ELEMENT_TYPE.PAGE_TRANSFER,	MENU_PAGE.SETTINGS],
);

#endregion

#region Create Graphics Page - Add resolution options
ds_menu_graphics = createMenuPage(
	["Fullscreen Mode", MENU_ELEMENT_TYPE.TOGGLE,			changeWindowMode,		1,	["Fullscreen", "Windowed"]],
	["Back",			MENU_ELEMENT_TYPE.PAGE_TRANSFER,	MENU_PAGE.SETTINGS],
);

#endregion

#region Create Controls Menu
ds_menu_controls = createMenuPage(
	["Move Left",		MENU_ELEMENT_TYPE.INPUT,			"key_left",			vk_left],
	["Move Right",		MENU_ELEMENT_TYPE.INPUT,			"key_right",		vk_right],
	["Jump",			MENU_ELEMENT_TYPE.INPUT,			"key_jump",			vk_space],
	["Sprint",			MENU_ELEMENT_TYPE.INPUT,			"key_sprint",		vk_shift],
	["Back",			MENU_ELEMENT_TYPE.PAGE_TRANSFER,	MENU_PAGE.SETTINGS],
);

#endregion

#region Create Menu Pages Array
page = 0;
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls];

var i=0, array_len = array_length(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++;
}

inputting = false;

#endregion

