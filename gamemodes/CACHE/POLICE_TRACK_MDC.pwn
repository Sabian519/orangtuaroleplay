#include <YSI_Coding\y_hooks>

CMD:placetrack(playerid, params[])
{
    if(pData[playerid][pFaction] <= 0)
		return Error(playerid, "You are not faction!");

    new mstr[128];
	if(IsPlayerConnected(playerid))
	{
        if(isnull(params))
		{
            Usage(playerid, "USAGE: /placetrack [type]");
            Info(playerid, "Type: phone, bisnis, house");
            return 1;
        }
		if(strcmp(params,"phone",true) == 0)
		{
			format(mstr, sizeof(mstr), "Input Phone Number to Track");
			ShowPlayerDialog(playerid, DIALOG_TRACK_PH, DIALOG_STYLE_INPUT, "Tracking Number Phone", mstr, "Appply", "Cancel");
        }
        if(strcmp(params,"bisnis",true) == 0)
		{
   			format(mstr, sizeof(mstr), "Input Business Number to show information");
			ShowPlayerDialog(playerid, DIALOG_INFO_BIS, DIALOG_STYLE_INPUT, "Tracking Business Locations", mstr, "Apply", "Cancel");
        }
        if(strcmp(params,"house",true) == 0)
		{
   			format(mstr, sizeof(mstr), "Input House Number to show information");
			ShowPlayerDialog(playerid, DIALOG_INFO_HOUSE, DIALOG_STYLE_INPUT, "Tracking Houses Location", mstr, "Apply", "Cancel");
        }
	}
	return 1;
}

CMD:mdc(playerid, params[])
{
    if(pData[playerid][pFaction] <= 0)
		return Error(playerid, "You are not faction!");

 	new
  	string[10000];
   	format(string, sizeof(string),"Tracking Phone Location\nTracking Busines Locations\nTracking Houses Locations");
	ShowPlayerDialog(playerid, DIALOG_TRACK, DIALOG_STYLE_LIST, "Police Data Informations Civilianz", string, "Select", "Cancel");
	return 1;
}

forward CheckingBis(playerid);
public CheckingBis(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
	   	if(pData[playerid][pActivityTime] >= 100)
	   	{
	    	InfoTD_MSG(playerid, 8000, "Business Track Placed!");
	    	TogglePlayerControllable(playerid, 1);
	    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pEnergy] -= 3;
			pData[playerid][pActivityTime] = 0;
			ShowBis(playerid);
		}
 		else if(pData[playerid][pActivityTime] < 100)
		{
  			pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
 			PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
	   	}
	}
	return 1;
}

forward CheckingHouse(playerid);
public CheckingHouse(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
	   	if(pData[playerid][pActivityTime] >= 100)
	   	{
	    	InfoTD_MSG(playerid, 8000, "Houses Track Placed!");
	    	TogglePlayerControllable(playerid, 1);
	    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pEnergy] -= 3;
			pData[playerid][pActivityTime] = 0;
			ShowHouse(playerid);
		}
 		else if(pData[playerid][pActivityTime] < 100)
		{
  			pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
 			PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
	   	}
	}
	return 1;
}

forward ShowHouse(playerid);
public ShowHouse(playerid)
{
	new Float: dist;
	new hid = GetPVarInt(playerid, "IDHouse");
	dist = GetPlayerDistanceFromPoint(playerid, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]);
	new line9[10000];
	new type[10000];
	if(hData[hid][hType] == 1)
	{
		type = "Small";
	}
	else if(hData[hid][hType] == 2)
	{
		type = "Medium";
	}
	else if(hData[hid][hType] == 3)
	{
		type = "High";
	}
	else
	{
		type = "Unknow";
	}
	format(line9, sizeof(line9), ""YELLOW_E"House Number: "LG_E"%d\n"YELLOW_E"House Owner: "AQUA"%s\n"YELLOW_E"House Type: "LB_E"%s\n"YELLOW_E"Placed Location: "LG_E"%s\n"YELLOW_E"Placed Distance: "LB_E"%.1f m",
	hid, hData[hid][hOwner], type, GetLocation(hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]), dist);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Houses Data Informations", line9, "Close","");

	return 1;
}

forward ShowBis(playerid);
public ShowBis(playerid)
{
	new line9[10000];
	new type[10000];
	new Float: dist;
	new bid = GetPVarInt(playerid, "IDBisnis");
	dist = GetPlayerDistanceFromPoint(playerid, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]);

	if(bData[bid][bType] == 1)
	{
		type = "Fast Food";
	}
	else if(bData[bid][bType] == 2)
	{
		type = "Market";
	}
	else if(bData[bid][bType] == 3)
	{
		type = "Clothes";
	}
	else if(bData[bid][bType] == 4)
	{
		type = "Equipment";
	}
	else
	{
		type = "Unknow";
	}
	format(line9, sizeof(line9), ""YELLOW_E"Business ID: "LG_E"%d\n"YELLOW_E"Business Owner: "AQUA"%s\n"YELLOW_E"Business Name: "LG_E"%s\n"YELLOW_E"Business Type: "AQUA"%s\n"YELLOW_E"Placed Location: "AQUA"%s\n"YELLOW_E"Placed Distance: "LG_E"%.1f m",
	bid, bData[bid][bOwner], bData[bid][bName], type, GetLocation(bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]), dist);

	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Bisnis Info", line9, "Close","");
	return 1;
}

forward trackph(playerid, to_player, number);
public trackph(playerid, to_player, number)
{
	new
	    Float:x,
	    Float:y,
	    Float:z;

	GetPlayerPos(to_player, x, y, z);
	SetPlayerCheckpoint(playerid, x, y, z, 1.0);
	new string[10000];
	format(string, sizeof(string),"MDC: "WHITE_E"You Has Succesfully Placed Tracked "YELLOW_E"Phone Number "WHITE_E"["LG_E"%d"WHITE_E"]", number);
	SCM(playerid, ARWIN, string);
	return 1;
}

/* ============ [ Hook, Function goes here ] ============ */
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_TRACK)
	{
 		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					return callcmd::placetrack(playerid, "phone");
				}
				case 1:
				{
					return callcmd::placetrack(playerid, "bisnis");
				}
				case 2:
				{
					return callcmd::placetrack(playerid, "house");
				}
			}
			return 1;
		}
	}
 	if(dialogid == DIALOG_INFO_BIS)
	{
 		if(response)
		{
			new bid = floatround(strval(inputtext));
			SetPVarInt(playerid, "IDBisnis", bid);
            if(!Iter_Contains(Bisnis, bid)) return Error(playerid, "The Bisnis specified Number doesn't exist.");
		 	pData[playerid][pActivity] = SetTimerEx("CheckingBis", 1300, true, "i", playerid);

			PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Checking Track..");
			PlayerTextDrawShow(playerid, ActiveTD[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
		}
		return 1;
	}
	if(dialogid == DIALOG_INFO_HOUSE)
	{
 		if(response)
		{
			new hid = floatround(strval(inputtext));
			SetPVarInt(playerid, "IDHouse", hid);
            if(!Iter_Contains(Bisnis, hid)) return Error(playerid, "The House specified Number doesn't exist.");
		 	pData[playerid][pActivity] = SetTimerEx("CheckingHouse", 1300, true, "i", playerid);

			PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Checking Track...");
			PlayerTextDrawShow(playerid, ActiveTD[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
		}
		return 1;
	}
	if(dialogid == DIALOG_TRACK_PH)
    {
    	if(response)
		{
			new number = floatround(strval(inputtext));

			foreach(new ii : Player)
			{
				if(pData[ii][pPhone] == number)
				{
					if(pData[ii][IsLoggedIn] == false || !IsPlayerConnected(ii)) return Error(playerid, "This number is not actived!");
					Info(playerid, "Proses Tracking Check Phone Number ["YELLOW_E"%d"WHITE_E"], Please Waiting", number);
					SetTimerEx("trackph", random(10000)+1, false, "iid", playerid, ii, number);
					return 1;
				}
			}
		}
	}
	return 1;
}
