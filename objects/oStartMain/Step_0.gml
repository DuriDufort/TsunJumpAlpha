/// @description Transition 
// Transition through Start and Menu screen using any key
// To be replaced in the future

if(room == rStartScreen || room == rMainMenu)
{
	if(keyboard_check_pressed(vk_anykey))
	{
		slideTransition(TRANS_MODE.NEXT);	
	}
}