/// @description DS Grid containing all scroll messages 
// If value in column 2 == 0, scroll has not been collected
// If value == 1, scroll has been collected, destroy specific instance

scroll_grid = dsScrollCreate
(
	[ 1,	0,	"Dufort",		"Hello"],	
	[ 2,	0,	"Blackout",		"Sigma"],
	[ 3,	0,	"Kinetic",		"Good day"],
	[ 4,	0,	"Arti",			"Whats up"],
	[ 5,	0,	"Ruby",			"Mio Love"],
	[ 6,	0,	"Airo",			"Mio Stinky"],
	[ 7,	0,	"Korean Test",	"안녕하십니까"],
);
