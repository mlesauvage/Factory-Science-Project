/// @description OK button press
// You can write your code in this editor

//Run code related to clicking Yes/OK/Accept here

show_debug_message("Yes Button Event Received");

if(currentState != STATE_SHOWING_EMAIL)
	return;

//Adjust company parameters based on the memo data
cash = cash + displayMemo.yesCashChange;
income = income + displayMemo.yesIncome;
shareholderSatisfaction = shareholderSatisfaction + displayMemo.yesSatisfaction;
environmentalScore = environmentalScore + displayMemo.yesWasteOutput
if (environmentalScore <= 0)
{
	environmentalScore = 0
}

//Destroy the memo
instance_destroy(displayMemo);

//Hide the buttons.
yesBtn.visible = false;
noBtn.visible = false;

//Change state
currentState = STATE_SHOWING_MONTH;
