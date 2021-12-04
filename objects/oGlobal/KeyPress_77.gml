/// @description Transition through rooms backwards
if(room = rMainMenu)
{
	slideTransition(TRANS_MODE.GOTO, rStartScreen);
}

if(room = rOne)
{
	slideTransition(TRANS_MODE.GOTO, rMainMenu);
}

if(room = rTwo)
{
	slideTransition(TRANS_MODE.GOTO, rOne);
}
