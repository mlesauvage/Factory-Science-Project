/// @description Insert description here
// You can write your code in this editor

var lineSep = 20;
var lineWidth = 1200;

var xBody = 327;
var yBody = 260;

var xName = 327;
var yName = 195;

draw_self();

//Draw body text
draw_set_font(font_default);
draw_set_color(c_black);
var letter = "Dear Mr. Company Owner,\n\n" + question + "\n\n" + closing + "\n\n" + signature;
draw_set_halign(fa_left);
draw_text_ext(xBody,yBody, letter, lineSep, lineWidth);

//Draw sender name
draw_set_font(font_bold);
draw_text(xName, yName, signature);
var sigWidth = string_width(signature);


//Draw email address
draw_set_color(c_dkgray);
draw_set_font(font_small);
draw_text(xName + sigWidth + 5, yName, "<" + email + ">");
