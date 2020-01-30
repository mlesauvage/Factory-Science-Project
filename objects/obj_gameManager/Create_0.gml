/// @description Insert description here
// You can write your code in this editor

#macro EVENT_OK_BUTTON 0
#macro EVENT_REJECT_BUTTON 1
#macro EVENT_INBOX_CLICKED 2
#macro EVENT_RESTART_BUTTON 3

#macro STATE_SHOWING_MONTH 0
#macro STATE_SHOWING_ALERT 1
#macro STATE_SHOWING_EMAIL 2
#macro STATE_GAME_END 3

monthNames = array_maker("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");

displayMemo = noone;
currentState = STATE_SHOWING_MONTH;
monthNum = 0;
inboxClicked = false;

//Game Statistics

cash = 40;
income = 10;
shareholderSatisfaction = 60;
environmentalScore = 100;

//Locations
var buttonX = 800;
var buttonY = 800;
var buttonSpacing = 20;
var restartButtonX = 885;
var restartButtonY = 800;

//Timers
showMonthTimer = 0;


randomize();
draw_set_color(c_black);

var f = file_text_open_read("choices.txt");
var jsonStr = "";

while(!file_text_eof(f))
{
	jsonStr += file_text_read_string(f);  //Grab one string from the file.
	file_text_readln(f);                  //Clears out the end of line character(s).
}
file_text_close(f);

var resultMap = json_decode(jsonStr);
var list = ds_map_find_value(resultMap, "default");

//Iterate through the array (the lists) and grab the data
//from each map into a new memo.
for(var i = 0; i < ds_list_size(list); i++;)
{
	var memo = instance_create_layer(80+i*250, 80+i*150, "layer_memos", obj_memo);
	memo.visible = false;
	var map = ds_list_find_value(list, i);

	memo.question = ds_map_find_value(map, "question");
	memo.closing = ds_map_find_value(map, "closing");
	memo.signature = ds_map_find_value(map, "signature");
	memo.email = ds_map_find_value(map, "email");
	memo.yesIncome = ds_map_find_value(map, "yesIncome");
	memo.yesSatisfaction = ds_map_find_value(map, "yesSatisfaction");
	memo.yesWasteOutput = ds_map_find_value(map, "yesWasteOutput");
	memo.yesCashChange = ds_map_find_value(map, "yesCashChange");
}
  
ds_map_destroy(resultMap);

//Create and position buttons
yesBtn = instance_create_layer(buttonX,buttonY,"layer_buttons", obj_button);
yesBtn.text = "OK";
yesBtn.sprite_index = spr_green_button;
yesBtn.informObject = self;
yesBtn.eventCallbackNumber = EVENT_OK_BUTTON;
yesBtn.visible = false;

var nextX = yesBtn.x + yesBtn.sprite_width + buttonSpacing;

noBtn = instance_create_layer(nextX,yesBtn.y,"layer_buttons", obj_button);
noBtn.text = "No thanks."
noBtn.sprite_index = spr_red_button;
noBtn.informObject = self;
noBtn.eventCallbackNumber = EVENT_REJECT_BUTTON;
noBtn.visible = false;

restartBtn = instance_create_layer(restartButtonX,restartButtonY,"layer_buttons", obj_button);
restartBtn.text = "Play Again?";
restartBtn.sprite_index = spr_green_button;
restartBtn.informObject = self;
restartBtn.eventCallbackNumber = EVENT_RESTART_BUTTON;
restartBtn.visible = false;
