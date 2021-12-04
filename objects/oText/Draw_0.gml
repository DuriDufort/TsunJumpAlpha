/// @description Draw Text
// Draw text stored in text

var half_w = w * 0.5;

nineSliceBox(sScroll, x-half_w-border, y-h-(border*2.5), x+half_w+border, y );

// Draw Text
drawSetText(c_black, fPixelHangul, fa_center, fa_top);
draw_text_transformed(x, y-h-(border*0.3), text_current, 2, 2, 0);



