/// @description Default Scroll Variabls
// Replaced in collision event with variables stored in oScrollGrid
collected = -1;
sender = "default";
text = "default";

var _ds = oScrollGrid.scroll_grid;

// If scroll is collected, destroy instance prevents scrolls from reappearing when changing rooms/loading
// Need to save/load oScrollGrid to keep instance from being created when loading 
if(_ds[# 1, row] == 1) instance_destroy(); 
