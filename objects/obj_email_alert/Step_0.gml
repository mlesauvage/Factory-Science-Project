/// @description Insert description here
// You can write your code in this editor

blinkTime += delta_time/1000;

if(!blinkEnabled)
{
	visible = false;
	blinkTime=0;
}
else if(blinkTime > 250)
{
	blinkTime = 0;
	visible = !visible;
}