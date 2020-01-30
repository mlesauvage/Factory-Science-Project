/// @description Insert description here
// You can write your code in this editor
var rectangleX = 55
var rectangleY = 410

draw_set_color(c_black)
draw_set_alpha(.25);
draw_rectangle (50, 405, 550, 700, false);
draw_set_alpha(1);

draw_text(1100, 325, monthNames[monthNum]);

draw_set_color(c_white);
draw_set_font(font_funky);
draw_set_halign(fa_left);
draw_text(rectangleX, rectangleY, "Company Cash: $" + string(cash) + "K");
draw_text(rectangleX, rectangleY + 40, "Monthly Income: $" + string(income) + "K");
draw_text(rectangleX, rectangleY + 80, "Shareholder Satisfaction: " + string(shareholderSatisfaction));
draw_text(rectangleX, rectangleY + 120, "Waste Output: " + string(environmentalScore) + "%");
