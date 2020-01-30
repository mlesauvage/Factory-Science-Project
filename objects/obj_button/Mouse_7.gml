/// @description Insert description here
// You can write your code in this editor

if(pressedState == false)
	return;


if(instance_exists(informObject))
{
	with(informObject) event_user(other.eventCallbackNumber);
	pressedState=false;
}
else
{
	show_debug_message("No object to inform about button click!");
}