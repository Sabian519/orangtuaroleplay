// Pizza Boy/
#define CHECKPOINTS            24 // Total Houses
#define PAY_PER_CHECKPOINT     100 // 10$ per delivered pizza
#define MAX_TIP                800 // Maximum Random Tip + 10$
#define CHECKPOINT_NONE        0 // No Checkpoint
#define PIZZA_CHECKPOINT       1 // Pizza Checkpoint
#define PIZZA_INDEX            9 // Pizza Index for SetPlayerAttachedObject

// Checkpoints for each house
new Float:Houses[CHECKPOINTS][4] =
{
	{2065.9780,-1703.4775,14.1484,90.8956},
	{2068.2600,-1656.4601,13.5469,86.9378},
	{2068.8579,-1643.8237,13.5469,90.3844},
	{2068.7437,-1628.9187,13.8762,90.3844},
	{2065.0508,-1583.8545,13.4814,92.2467},
	{2003.0380,-1595.1025,13.5759,39.7419},
	{2016.8215,-1629.8384,13.5469,270.7754},
	{2015.4512,-1641.6316,13.7824,272.6556},
	{2012.0426,-1656.4589,13.5547,268.4961},
	{2017.1294,-1703.3452,14.2043,272.0217},
	{2014.4487,-1732.6185,14.2353,271.6387},
	{2139.1643,-1698.1489,15.0784,4.0066},
	{2166.9363,-1672.0193,15.0749,46.6203},
	{2244.2312,-1638.2906,15.9074,340.8198},
	{2257.1416,-1644.8845,15.5164,353.3532},
	{2282.2446,-1641.7231,15.8898,357.1133},
	{2307.0203,-1678.1877,14.0012,180.0783},
	{2328.2483,-1681.9125,14.8624,90.7775},
	{2362.8362,-1644.1184,13.5332,0.849},
	{2368.3418,-1674.5013,13.9063,179.1149},
	{2393.2185,-1646.7593,13.6432,1.7900},
	{2409.0159,-1673.8960,13.6045,180.0550},
	{2413.9771,-1647.1270,14.0119,2.4167},
	{2452.0852,-1642.3127,13.7357,1.4767}
};

new pizzabikes[5];
new PizzaBikesPizzas[MAX_VEHICLES];
new PlayerSkin[MAX_PLAYERS];

// Player Variables
new IsInJob[MAX_PLAYERS];
new TipTime[MAX_PLAYERS];
new PlayerTutorialTime[MAX_PLAYERS];
new InfoTimer[MAX_PLAYERS];
new PlayerCustomer[MAX_PLAYERS];
new PlayerCheckpoint[MAX_PLAYERS];
new PlayerTips[MAX_PLAYERS];
new PlayerEarnings[MAX_PLAYERS];

forward ShowPlayerIntroTexts(playerid);
forward HidePlayerIntroTexts(playerid);
forward ShowPlayerInfoTexts(playerid);
forward HidePlayerInfoTexts(playerid);
forward TutorialTime();
forward ShowPlayerPizzaBikeTexts(playerid);
forward HidePlayerPizzaBikeTexts(playerid);
forward ShowTipTimeText(playerid);
forward HideTipTimeText(playerid);

CreateJoinPizzaPoint()
{
	new strings[128];
	CreateDynamicPickup(1239, 23, 2101.92, -1780.35, 13.39, -1);
	format(strings, sizeof(strings), ""X1_BLUE"[PIZZA POINT]\n/delivery "WHITE_E"to starting jobs\n/enddelivery "WHITE_E"to finishing jobs");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 2101.92, -1780.35, 13.39, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // production job

	CreateDynamicPickup(1582, 23, 2103.08, -1784.22, 13.38, -1);
	format(strings, sizeof(strings), ""LB_E"[STOCK PIZZA POINT]\n"WHITE_E"Available Stock: "LG_E"Unlimited\n"WHITE_E"use '"YELLOW_E"/restock"WHITE_E"' to restock a pizza");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 2103.08, -1784.22, 13.38, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // 
}

CMD:restock(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid,3.0,2103.08, -1784.22, 13.38))
	{
		if(pData[playerid][pPizzaTime] > 0)
		{
		    new vehicleid = GetPlayerVehicleID(playerid);
			Error(playerid, "You must bee waiting "YELLOW_E"%d "GREY_E"second again.", pData[playerid][pPizzaTime]);
			RemovePlayerFromVehicle(playerid);
			SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			return 1;
		}
	    if(IsInJob[playerid] == 1)
	    {
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		    {
		       if(PizzaBikesPizzas[GetPlayerVehicleID(playerid)] == 0)
		       {
		           new string[56];
		           PizzaBikesPizzas[GetPlayerVehicleID(playerid)]=5;
		           SendClientMessage(playerid, ARWIN,"SIDEJOB: "YELLOW_E"You have restocked your pizzabike with "LG_E"5/5 "YELLOW_E"pizzas!");

	    		   PlayerTextDrawHide(playerid,PizzasText[playerid]);
	    		   format(string,sizeof(string),"Pizzas: ~r~%d~w~ /~g~ 5",PizzaBikesPizzas[GetPlayerVehicleID(playerid)]);
	    	   	   PlayerTextDrawSetString(playerid,PizzasText[playerid],string);
	    		   PlayerTextDrawShow(playerid,PizzasText[playerid]);
		       }
	           else return Info(playerid," Your pizzabike still has some pizzas!");
		    }
		    else return Error(playerid," You must be on the pizzabike to use this command!");
		}
	    else return Error(playerid," You must be doing the part-time job before using this command!");
	}
	else return Error(playerid," You must be at the Well Stacked Pizza Co. in order to use this command!");
	return 1;
}

CMD:loadpizza(playerid, params[])
{
	if(IsInJob[playerid] == 1)
	{
	    if(IsPlayerAttachedObjectSlotUsed(playerid,PIZZA_INDEX))
	    {
	        if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	        {
			    new Float:X,Float:Y,Float:Z;
			    for(new j=0;j<5;j++)
			    {
					GetVehiclePos(pizzabikes[j],X,Y,Z);
					if(IsPlayerInRangeOfPoint(playerid,3.0,X,Y,Z))
					{
					    if(PizzaBikesPizzas[pizzabikes[j]] < 5)
					    {
					    	PizzaBikesPizzas[pizzabikes[j]]++;
					    	ClearAnimations(playerid);
							RemovePlayerAttachedObject(playerid, PIZZA_INDEX);
							Info(playerid,"Put back pizza in the vehicle");
							ApplyAnimation(playerid, "INT_HOUSE", "wash_up",4.1,0,0,0,0,0,1);
					    	return 1;
						}
						else
						{
						    Error(playerid,"this bikes already with 5 pizzas!");
						    return 1;
						}
					}
				}
			}
			else return Error(playerid,"Anda harus berjalan kaki saat menggunakan perintah ini!");
		}
		else return Error(playerid," Anda tidak sedang memegang kotak pizza!");
	}
	return 1;
}

CMD:getpizza(playerid, params[])
{
	if(IsInJob[playerid] == 1)
	{
	    if(!IsPlayerAttachedObjectSlotUsed(playerid,PIZZA_INDEX))
	    {
	        if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	        {
			    new Float:X,Float:Y,Float:Z;
			    for(new j=0;j<5;j++)
			    {
					GetVehiclePos(pizzabikes[j],X,Y,Z);
					if(IsPlayerInRangeOfPoint(playerid,3.0,X,Y,Z))
					{
					    if(PizzaBikesPizzas[pizzabikes[j]] >= 1)
					    {
					    	PizzaBikesPizzas[pizzabikes[j]]--;
				            Servers(playerid,"Kamu sedang mengambil pizza, tunggu sebentar..");
							ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
							pData[playerid][pActivity] = SetTimerEx("PizzaTake", 1000, true, "i", playerid);
							PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Takes Pizzy...");
							PlayerTextDrawShow(playerid, ActiveTD[playerid]);
							ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					    	return 1;
						}
						else
						{
						    Error(playerid," Kendaraan ini sudah tidak ada pizzanya lagi! silahkan restock di restaurant");
						    return 1;
						}
					}
				}
			}
			else return Error(playerid," Anda harus berjalan kaki saat menggunakan perintah ini!");
		}
		else return Error(playerid," Anda sudah membawa kotak pizza!");
	}
	return 1;
}

function PizzaTake(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			InfoTD_MSG(playerid, 8000, "Takes pizza Done!");
			TogglePlayerControllable(playerid,1);
            Servers(playerid,"Bawa pizza itu ke pembeli");
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			pData[playerid][pEnergy] -= 5;
			ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,1,1,1,1,1);
			SetPlayerAttachedObject(playerid, PIZZA_INDEX, 1582, 1, 0.002953, 0.469660, -0.009797, 269.851104, 88.443557, 0.000000, 0.804894, 1.000000, 0.822361);
			return 1;
		}
		else if(pData[playerid][pActivityTime] < 100)
		{
			pData[playerid][pActivityTime] += 5;
			TogglePlayerControllable(playerid,0);
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
            ApplyAnimation(playerid,"BD_FIRE","wash_up",4.1, 0, 1, 1, 1, 1, 1);
		}
	}
	return 1;
}
CMD:enddelivery(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid,3.0,2101.92, -1780.35, 13.39))
	{
	    if(IsInJob[playerid] == 1)
	    {
     		new string[128];
	        new rand = random(20);
			PlayerEarnings[playerid]+=rand;
   			GivePlayerMoneyEx(playerid, rand);
			pData[playerid][pPizzaTime] = 900;
			format(string,sizeof(string),"SIDEJOB: "WHITE_E"You have finishing jobs and to payment in paid directly to you!");
			SendClientMessage(playerid,ARWIN,string);
			PlayerEarnings[playerid]=0;
			PlayerTips[playerid]=0;
			if(IsPlayerAttachedObjectSlotUsed(playerid,PIZZA_INDEX)) { RemovePlayerAttachedObject(playerid,PIZZA_INDEX); }
			PlayerCheckpoint[playerid]=CHECKPOINT_NONE;
			DisablePlayerCheckpoint(playerid);
			IsInJob[playerid]=0;
			PlayerTutorialTime[playerid]=0;
			if(IsValidActor(PlayerCustomer[playerid])) { DestroyActor(PlayerCustomer[playerid]); }
			TipTime[playerid]=0;
			HidePlayerPizzaBikeTexts(playerid);
			HideTipTimeText(playerid);
			PizzaBikesPizzas[GetPlayerVehicleID(playerid)]=5;
   			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
      		RemovePlayerFromVehicle(playerid);
        	SetPlayerSkin(playerid,PlayerSkin[playerid]);
	        PlayerSkin[playerid]=0;
	    }
	    else return Error(playerid," Anda harus memulai pekerjaan sebelum mengakhirinya!");
	}
	else return Error(playerid," Anda harus berada di depan Well Stacked Pizza Co. untuk mengakhiri pekerjaan Anda!");
	return 1;
}

CMD:delivery(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid,3.0,2101.92, -1780.35, 13.39))
	{
		if(IsInJob[playerid] == 0)
		{
			IsInJob[playerid]=1;
			PlayerSkin[playerid]=GetPlayerSkin(playerid);
			SetPlayerSkin(playerid,155);
			Info(playerid, "Anda memulai delivery pizza. Silahkan naik kendaraan pizza anda, lalu antarkan ke point");
			SendClientMessage(playerid, COLOR_YELLOW, "SIDEJOB: "X1_BLUE"gunakan "AQUA"/help "X1_BLUE"untuk melihat commando sidejob pizza.");
   		}
	    else return Info(playerid," Anda sudah melakukan pekerjaan sebagai Pizzaboy!");
	}
	else return Error(playerid," Anda harus berada di depan Well Stacked Pizza Co. untuk memulai sidejob!");
	return 1;
}

public ShowPlayerPizzaBikeTexts(playerid)
{
	new string[56];
	format(string,sizeof(string),"Pizzas: ~r~%d~w~ /~g~ 5",PizzaBikesPizzas[GetPlayerVehicleID(playerid)]);
    PizzasText[playerid] = CreatePlayerTextDraw(playerid,510.000000, 170.000000, string);
  	PlayerTextDrawBackgroundColor(playerid,PizzasText[playerid], 255);
  	PlayerTextDrawFont(playerid,PizzasText[playerid], 1);
  	PlayerTextDrawLetterSize(playerid,PizzasText[playerid], 0.300000, 1.000000);
  	PlayerTextDrawColor(playerid,PizzasText[playerid], -1);
  	PlayerTextDrawSetOutline(playerid,PizzasText[playerid], 1);
  	PlayerTextDrawSetProportional(playerid,PizzasText[playerid], 1);
  	PlayerTextDrawSetSelectable(playerid,PizzasText[playerid], 0);

  	PizzaSymbol[playerid] = CreatePlayerTextDraw(playerid,477.000000, 156.000000, "Pizzaboy");
  	PlayerTextDrawBackgroundColor(playerid,PizzaSymbol[playerid], 0);
  	PlayerTextDrawFont(playerid,PizzaSymbol[playerid], 5);
  	PlayerTextDrawLetterSize(playerid,PizzaSymbol[playerid], 0.500000, 1.000000);
  	PlayerTextDrawColor(playerid,PizzaSymbol[playerid], -1);
  	PlayerTextDrawSetOutline(playerid,PizzaSymbol[playerid], 0);
  	PlayerTextDrawSetProportional(playerid,PizzaSymbol[playerid], 1);
 	PlayerTextDrawSetShadow(playerid,PizzaSymbol[playerid], 1);
 	PlayerTextDrawUseBox(playerid,PizzaSymbol[playerid], 1);
  	PlayerTextDrawBoxColor(playerid,PizzaSymbol[playerid], 0);
  	PlayerTextDrawTextSize(playerid,PizzaSymbol[playerid], 30.000000, 30.000000);
  	PlayerTextDrawSetSelectable(playerid,PizzaSymbol[playerid], 0);
  	PlayerTextDrawSetPreviewModel(playerid,PizzaSymbol[playerid],1582);
  	PlayerTextDrawSetPreviewRot(playerid,PizzaSymbol[playerid],120.0,0.0,0.0,1.0);

    format(string,sizeof(string),"Tips: ~g~+%d$",PlayerTips[playerid]);
  	TipsText[playerid] = CreatePlayerTextDraw(playerid,510.000000, 218.000000, string);
  	PlayerTextDrawBackgroundColor(playerid,TipsText[playerid], 255);
  	PlayerTextDrawFont(playerid,TipsText[playerid], 1);
  	PlayerTextDrawLetterSize(playerid,TipsText[playerid], 0.300000, 1.000000);
  	PlayerTextDrawColor(playerid,TipsText[playerid], -1);
  	PlayerTextDrawSetOutline(playerid,TipsText[playerid], 1);
  	PlayerTextDrawSetProportional(playerid,TipsText[playerid], 1);
  	PlayerTextDrawSetSelectable(playerid,TipsText[playerid], 0);

    format(string,sizeof(string),"Earnings: ~g~%d$",PlayerEarnings[playerid]);
  	EarningsText[playerid] = CreatePlayerTextDraw(playerid,510.000000, 208.000000, string);
  	PlayerTextDrawBackgroundColor(playerid,EarningsText[playerid], 255);
  	PlayerTextDrawFont(playerid,EarningsText[playerid], 1);
  	PlayerTextDrawLetterSize(playerid,EarningsText[playerid], 0.300000, 1.000000);
  	PlayerTextDrawColor(playerid,EarningsText[playerid], -1);
  	PlayerTextDrawSetOutline(playerid,EarningsText[playerid], 1);
  	PlayerTextDrawSetProportional(playerid,EarningsText[playerid], 1);
  	PlayerTextDrawSetSelectable(playerid,EarningsText[playerid], 0);

    format(string,sizeof(string),"Total Earnings: ~g~%d$",PlayerEarnings[playerid]+PlayerTips[playerid]);
  	TotalEarningsText[playerid] = CreatePlayerTextDraw(playerid,510.000000, 228.000000, string);
  	PlayerTextDrawBackgroundColor(playerid,TotalEarningsText[playerid], 255);
  	PlayerTextDrawFont(playerid,TotalEarningsText[playerid], 1);
  	PlayerTextDrawLetterSize(playerid,TotalEarningsText[playerid], 0.300000, 1.000000);
  	PlayerTextDrawColor(playerid,TotalEarningsText[playerid], -1);
  	PlayerTextDrawSetOutline(playerid,TotalEarningsText[playerid], 1);
  	PlayerTextDrawSetProportional(playerid,TotalEarningsText[playerid], 1);
  	PlayerTextDrawSetSelectable(playerid,TotalEarningsText[playerid], 0);

  	PlayerTextDrawShow(playerid,PizzasText[playerid]);
  	PlayerTextDrawShow(playerid,PizzaSymbol[playerid]);
  	PlayerTextDrawShow(playerid,EarningsText[playerid]);
  	PlayerTextDrawShow(playerid,TotalEarningsText[playerid]);
  	PlayerTextDrawShow(playerid,TipsText[playerid]);
	return 1;
}

public HidePlayerPizzaBikeTexts(playerid)
{
    PlayerTextDrawHide(playerid,PizzasText[playerid]);
  	PlayerTextDrawHide(playerid,PizzaSymbol[playerid]);
  	PlayerTextDrawHide(playerid,EarningsText[playerid]);
  	PlayerTextDrawHide(playerid,TotalEarningsText[playerid]);
  	PlayerTextDrawHide(playerid,TipsText[playerid]);

  	PlayerTextDrawDestroy(playerid,PizzasText[playerid]);
  	PlayerTextDrawDestroy(playerid,PizzaSymbol[playerid]);
  	PlayerTextDrawDestroy(playerid,EarningsText[playerid]);
  	PlayerTextDrawDestroy(playerid,TotalEarningsText[playerid]);
  	PlayerTextDrawDestroy(playerid,TipsText[playerid]);
	return 1;
}

public ShowTipTimeText(playerid)
{
    TipTimeText[playerid] = CreatePlayerTextDraw(playerid,508.000000, 191.000000, "Tip Time: 00:30");
  	PlayerTextDrawBackgroundColor(playerid,TipTimeText[playerid], 255);
  	PlayerTextDrawFont(playerid,TipTimeText[playerid], 2);
  	PlayerTextDrawLetterSize(playerid,TipTimeText[playerid], 0.280000, 1.000000);
  	PlayerTextDrawColor(playerid,TipTimeText[playerid], -1);
  	PlayerTextDrawSetOutline(playerid,TipTimeText[playerid], 1);
  	PlayerTextDrawSetProportional(playerid,TipTimeText[playerid], 1);
  	PlayerTextDrawSetSelectable(playerid,TipTimeText[playerid], 0);

  	PlayerTextDrawShow(playerid,TipTimeText[playerid]);
  	return 1;
}

public HideTipTimeText(playerid)
{
    PlayerTextDrawHide(playerid,TipTimeText[playerid]);

    PlayerTextDrawDestroy(playerid,TipTimeText[playerid]);
	return 1;
}

stock TimeConvert(seconds)
{
	new tmp[256];
	new minutes = floatround(seconds/60);
	seconds -= minutes*60;
	format(tmp, sizeof(tmp), "%d:%02d", minutes, seconds);
	return tmp;
}

