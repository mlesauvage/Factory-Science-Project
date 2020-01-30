/// @description Reject button press
// You can write your code in this editor


show_debug_message("Reject Button Event Received");

if(currentState != STATE_SHOWING_EMAIL)
	return;

//Destroy the memo
instance_destroy(displayMemo);

//Hide the buttons.
yesBtn.visible = false;
noBtn.visible = false;

//Change state
currentState = STATE_SHOWING_MONTH;