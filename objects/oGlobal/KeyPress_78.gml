/// @description Trasition through rooms forward

// room ++; would work if rooms were created in perfect order

if(room = rStartScreen)
{
	slideTransition(TRANS_MODE.GOTO, rMainMenu);

}

if(room = rMainMenu)
{
	slideTransition(TRANS_MODE.GOTO, rOne);
}

if(room = rOne)
{
	slideTransition(TRANS_MODE.GOTO, rTwo);
}

