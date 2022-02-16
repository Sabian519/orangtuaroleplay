// Pizza Boy/
#define CHECKPOINTS            24 // Total Houses
#define PAY_PER_CHECKPOINT     50 // 10$ per delivered pizza
#define MAX_TIP                100 // Maximum Random Tip + 10$
#define CHECKPOINT_NONE        0 // No Checkpoint
#define PIZZA_CHECKPOINT       1 // Pizza Checkpoint
#define PIZZA_INDEX            9 // Pizza Index for SetPlayerAttachedObject

// Checkpoints for each house
new Float:Houses[CHECKPOINTS][4] =
{
	{-2620.6038,114.8833,5.0000,90.3082},
	{-2618.7776,-99.5564,4.3435,90.1442},
	{-2619.7454,-198.0901,4.3359,91.1334},
	{-2720.1912,-318.4200,7.8438,223.6925},
	{-2794.5767,-181.1810,7.1875,271.5131},
	{-2793.6487,-17.8673,7.1875,271.0956},
	{-2793.6230,218.5728,7.1875,271.3977},
	{-2863.4197,682.4032,23.4555,115.8893},
	{-2878.2813,797.4783,35.7071,85.7011},
	{-2838.4158,866.9288,44.0547,90.4168},
	{-2860.3406,964.5320,44.0547,114.8648},
	{-2716.9497,977.3123,54.4609,182.3930},
	{-2583.1211,992.4703,78.2734,182.2633},
	{-2512.9944,993.6325,78.3195,268.8573},
	{-2101.2915,900.8529,76.7109,271.2312},
	{-2127.6814,1052.7560,80.0078,268.8440},
	{-2102.5974,1160.4196,53.2656,181.4501},
	{-2381.5322,1299.7562,19.5594,91.8606},
	{-1873.5360,1147.2172,45.4453,269.6415},
	{-1733.7036,1113.5786,45.4453,1.0524},
	{-2549.3635,818.0742,49.9767,1.7616},
	{-2616.5583,838.2337,50.3562,91.9766},
	{-2595.6262,874.3970,59.6337,271.1916},
	{-2592.7437,959.9304,78.3559,271.0717}
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
	CreateDynamicPickup(1239, 23, -2668.5820,261.8920,4.6328, -1);
	format(strings, sizeof(strings), ""LG_E"[PIZZA POINT]\n"YELLOW_E"/delivery "WHITE_E"to starting jobs");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -2668.5820,261.8920,4.6328, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //PIZZA OTRP

	CreateDynamicPickup(1239, 23, -2659.1448,275.8192,4.3359, -1);
	format(strings, sizeof(strings), ""LG_E"[PIZZA POINT]\n"YELLOW_E"/enddelivery "WHITE_E"to finishing jobs");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -2659.1448,275.8192,4.3359, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //PIZZA OTRP

	CreateDynamicPickup(1582, 23, -2664.1497,238.6727,4.3359, -1);
	format(strings, sizeof(strings), ""LG_E"[STOCK PIZZA POINT]\n"WHITE_E"Available Stock: "LG_E"Unlimited\n"WHITE_E"use '"YELLOW_E"/restock"WHITE_E"' to restock a pizza");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -2664.1497,238.6727,4.3359, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // 
}

CMD:restock(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid,3.0,-2664.1497,238.6727,4.3359))
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
	if(IsPlayerInRangeOfPoint(playerid,3.0,-2659.1448,275.8192,4.3359))
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
	if(IsPlayerInRangeOfPoint(playerid,3.0,-2668.5820,261.8920,4.6328))
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
	format(string,sizeof(string),"Pizza: ~r~%d~w~ /~g~ 5",PizzaBikesPizzas[GetPlayerVehicleID(playerid)]);
    PizzasText[playerid] = CreatePlayerTextDraw(playerid,510.000000, 200.000000, string);
  	PlayerTextDrawBackgroundColor(playerid,PizzasText[playerid], 255);
  	PlayerTextDrawFont(playerid,PizzasText[playerid], 1);
  	PlayerTextDrawLetterSize(playerid,PizzasText[playerid], 0.300000, 1.000000);
  	PlayerTextDrawColor(playerid,PizzasText[playerid], -1);
  	PlayerTextDrawSetOutline(playerid,PizzasText[playerid], 1);
  	PlayerTextDrawSetProportional(playerid,PizzasText[playerid], 1);
  	PlayerTextDrawSetSelectable(playerid,PizzasText[playerid], 0);

  	PizzaSymbol[playerid] = CreatePlayerTextDraw(playerid,477.000000, 186.000000, "Pizzaboy");
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

  	PlayerTextDrawShow(playerid,PizzasText[playerid]);
  	PlayerTextDrawShow(playerid,PizzaSymbol[playerid]);
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

