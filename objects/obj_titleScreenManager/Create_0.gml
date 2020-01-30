/// @description Insert description here
// You can write your code in this edi

#macro EVENT_START_GAME 0

var startButtonX = 885;
var startButtonY = 800;

var startBtn = instance_create_layer(startButtonX,startButtonY,"layer_buttons", obj_button);
startBtn.text = "Start Game";
startBtn.sprite_index = spr_green_button;
startBtn.informObject = self;
startBtn.eventCallbackNumber = EVENT_START_GAME;
