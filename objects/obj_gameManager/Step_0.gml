/// @description Insert description here
// You can write your code in this editor

var waitForBlinkTime = 2000;

switch(currentState)
{
	case STATE_SHOWING_MONTH:
		showMonthTimer = showMonthTimer + delta_time/1000;
		if(showMonthTimer >= waitForBlinkTime)
		{
			with(obj_email_alert) blinkEnabled = true;
			currentState = STATE_SHOWING_ALERT;
			showMonthTimer = 0;
			waitForBlinkTime = irandom_range(500,4500);
		}
		break;
	case STATE_SHOWING_ALERT:
		if(inboxClicked)
		{
			show_debug_message("Handling the click.");
			inboxClicked = false;
			
			//Decide if the game shows the next memo, or the alert is for a win/loss email.
			//You got too far into debt. Handle game loss.
			if(cash <= -50)
			{
				currentState = STATE_GAME_END;
				restartBtn.visible = true;
				
				var memo = instance_create_layer(0, 0, "layer_memos", obj_memo);
				memo.visible = true;

				//Fill in memo data.
				memo.question = "You have completely, utterly failed at properly managing your business.\nThe board of directors has decided that your services are no longer required.";
				memo.closing = "We wish you luck in the pursuit of future opportunities."
				memo.signature = "Mr. Urkefacci";
				memo.email = "alan.urkefacci@bigcompany.com";

				break;
			}
			//Sharehlders unhappy - Handle game loss.
			if(shareholderSatisfaction <= 0)
			{
				currentState = STATE_GAME_END;
				restartBtn.visible = true;
				
				//Create memo.
				var memo = instance_create_layer(0, 0, "layer_memos", obj_memo);
				memo.visible = true;

				//Fill in memo data.
				memo.question = "You have completely, utterly failed at maintaining shareholder value.\nThe board of directors has decided that your services are no longer required.";
				memo.closing = "We wish you luck in the pursuit of future opportunities."
				memo.signature = "Mr. Urkefacci";
				memo.email = "alan.urkefacci@bigcompany.com";

				break;
			}
			//Handle game end (win) - because they're out of emails to read.
			else if(instance_number(obj_memo) == 0)
			{
				currentState = STATE_GAME_END;
				restartBtn.visible = true;

				//Create memo.
				var memo = instance_create_layer(0, 0, "layer_memos", obj_memo);
				memo.visible = true;

				//Fill in first part of memo data.
				//The rest changes depending on performance.
				memo.signature = "Mr. Urkefacci";
				memo.email = "alan.urkefacci@bigcompany.com";

				//Decide how good a "win" this is.
				//Change the letter text accordingly.
				//Is this based on environmental score? Does it include profit?
				// AND is && as in cash>10 && income>30
				memo.closing = "We wish you luck in the pursuit of future opportunities.";
				
				if(environmentalScore <= 25)
				{
					if(income <= 50)
					{
						memo.question = "You did a great job in reducing your waste output of your company, but you could have done better in the money department.";
					}
					else
					{
						memo.question = "Not only did you greatly reduce your environmental impact, you ended up creating a sustainable company along the way.";
					}
					
				}
				else if(environmentalScore >= 75)
				{
					if(income <= 50)
					{
						memo.question = "You barely worked on decreasing your waste output, and you could have done better in the money department.";
					}
					else
					{
						memo.question = "You did not reduce your waste output of you company, but at least you built a successful one, and I guess there has to be something said for that.";
					}
				}
				else
				{
					if(income <= 50)
					{
						memo.question = "You did alright, you brought down your waste output from the original score, but perhaps you could have tried a little harder. Or perhaps you tried too hard, and that's why your company suffered.";
					}
					else
					{
						memo.question = "You did alright in your attempt to lower your company waste output, and along the way you built a successful company. All in all, you did pretty good.";
					}
	
				}
				

				break;
			}
			
			//Game still going - show the next email.
			currentState = STATE_SHOWING_EMAIL;
			
			with(obj_email_alert) blinkEnabled = false;
			monthNum = monthNum+1;
			cash = cash + income;
			if(monthNum > 11)
			{
				monthNum = 0;
			}

			//Choose random memo
			var choice = irandom(instance_number(obj_memo)-1);
			displayMemo = instance_find(obj_memo, choice);

			//Move it to the right place
			displayMemo.x = 0;
			displayMemo.y = 0;

			//Make it visible
			displayMemo.visible=true;
			yesBtn.visible = true;
			noBtn.visible = true;

		}
		break;
	case STATE_SHOWING_EMAIL:
		//Do other stuff
		break;
	case STATE_GAME_END:
		break;
	default:
		break;
}