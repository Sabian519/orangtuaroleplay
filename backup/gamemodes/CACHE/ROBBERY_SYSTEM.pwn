// SouthLuxury Roleplay Robbery System //

new RobTim[MAX_PLAYERS];
new RobMember[5][MAX_PLAYERS];

CreateWreanchRobPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, 882.16, -21.96, 63.23, -1);
	format(strings, sizeof(strings), "[Robbery Point]\n{FFFFFF}use '"YELLOW_E"/createtimrob"WHITE_E"'\n"WHITE_E"use '"YELLOW_E"/buy"WHITE_E"' to take it wreanch");
	CreateDynamic3DTextLabel(strings, COLOR_GREY, 882.16, -21.96, 63.23, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //
}

CMD:createtimrob(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 2.0, 882.16, -21.96, 63.23))
	{
		if(pData[playerid][pLevel] < 5)
			return Error(playerid, "You must level 5 to robbery!");

		if(RobTim[playerid] == 1) return Error(playerid, "Kamu sudah memiliki Tim untuk perampokan");

		new string[1280];
		RobTim[playerid]++;
		RobMember[0][playerid] = 0;
		GivePlayerMoneyEx(playerid, -25000);
		format(string, sizeof(string), ""X1_BLUE"ROBBERY: "WHITE_E"You have created robbery tim white money"LG_E"$250,00"WHITE_E", use "YELLOW_E"/robberyhelp"WHITE_E"' to find command");
		SCM(playerid, COLOR_WHITE, string);
	}
	else
	{
		 return Error(playerid, "You must be in nearest point created tim");
	}
	
	return 1;
}

CMD:robinvite(playerid, params[])
{
	if(RobTim[playerid] == 0)
		return Error(playerid, "Anda tidak memiliki/belum bergabung anggota perampokan");

	new otherid;
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/robinvite [playerid/PartOfName]");

	if(!IsPlayerConnected(otherid))
		return Error(playerid, "Invalid ID.");

	if(otherid == playerid)
		return Error(playerid, "Invalid ID.");

	if(!NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "You must be near this player.");

	if(RobTim[otherid] == 1)
		return Error(playerid, "Player tersebut sudah bergabung robbery di tim lain!");

	if(pData[otherid][pFaction] != 0)
		return Error(playerid, "Player tersebut sudah bergabung faction!");

	pData[otherid][pRobInvite] = RobTim[playerid];
	pData[otherid][pRobOffer] = playerid;
	Servers(playerid, "Anda telah menginvite %s untuk menjadi anggota robbery.", pData[otherid][pName]);
	Servers(otherid, "%s telah menginvite anda untuk menjadi anggota robbery. Type: /accept robbery or /deny robbery!", pData[playerid][pName]);
	return 1;
}

IsSAPDEnformance(playerid)
{
	return pData[playerid][pFaction] == 1;
	//return if(pData[playerid][pFaction] == 1);
}
CMD:robatm(playerid, params[])
{
	new count;
	if(pData[playerid][IsLoggedIn] == false) return Error(playerid, "You must logged in!");
	if(pData[playerid][pInjured] >= 1) return Error(playerid, "You can't use this at this moment!");

	if(RobTim[playerid] == 0)
		return Error(playerid, "You dont haved robbery tim");

	if(pData[playerid][pAlatRob] == 0)
	    return Error(playerid, "You dont have robbery tools/wreanch");

	if(pData[playerid][pLevel] < 5)
		return Error(playerid, "You cant level 5 to robbery!");

	foreach(new i : Player)
	{
	    if(IsSAPDEnformance(i) && pData[i][pOnDuty] == 1)
	    {
	        count++;
		}
	}

	if(count < 5)
	{
	    return Info(playerid, "Anggota SAPD harus minimal 5++ untuk melakukan perampokan.");
	}

    new id = -1;
	id = GetClosestATM(playerid);

	if(id > -1)
	{
		pData[playerid][pActivity] = SetTimerEx("RobAtm", 1800, true, "i", playerid);

		PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Rob ATM...");
		PlayerTextDrawShow(playerid, ActiveTD[playerid]);
		ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.1, 1, 1, 1, 1, 1, 1);

	    if(pData[playerid][pFaction] == 1)
		{
			SendFactionMessage(1, COLOR_BLUE, "ALARM: "WHITE_E"saat ini sedang terjadi perampokan ATM di "YELLOW_E"Lokasi: %s",GetLocation(AtmData[id][atmX], AtmData[id][atmY], AtmData[id][atmZ]));
		}
	}
	return 1;
}

function RobAtm(playerid)
{
    new id = -1;
	id = GetClosestATM(playerid);
	new rand = RandomEx(1,12);
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 1)
		    {
		    	InfoTD_MSG(playerid, 8000, "Robbery ~r~Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda gagal meretas ATM, Lakukan lagi sebelum Polisi datang");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 2)
		    {
		    	InfoTD_MSG(playerid, 8000, "Robbery ~r~Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda gagal meretas ATM, Lakukan lagi sebelum Polisi datang");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 3)
		    {
		    	InfoTD_MSG(playerid, 8000, "Robbery ~r~Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda gagal meretas ATM, alat perampokan anda hancur");
		    	pData[playerid][pAlatRob] -=1;
		        TogglePlayerControllable(playerid, 1);
				SavePlayerAccount(playerid);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 4)
		    {
		    	InfoTD_MSG(playerid, 8000, "Robbery ~r~Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda gagal meretas ATM, alat perampokan anda hancur");
		    	pData[playerid][pAlatRob] -=1;
		        TogglePlayerControllable(playerid, 1);
				SavePlayerAccount(playerid);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 5)
		    {
		    	InfoTD_MSG(playerid, 8000, "Robbery ~r~Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda gagal meretas ATM, Lakukan lagi sebelum Polisi datang");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 6)
		    {
		    	InfoTD_MSG(playerid, 8000, "Robbery ~r~Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda gagal meretas ATM, alat perampokan anda hancur");
		    	pData[playerid][pAlatRob] -=1;
		        TogglePlayerControllable(playerid, 1);
				SavePlayerAccount(playerid);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 7)
		    {
		    	InfoTD_MSG(playerid, 8000, "Robbery ~r~Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda gagal meretas ATM, alat perampokan anda hancur");
		    	pData[playerid][pAlatRob] -=1;
		        TogglePlayerControllable(playerid, 1);
				SavePlayerAccount(playerid);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 8)
		    {
		    	InfoTD_MSG(playerid, 8000, "Robbery ~r~Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda gagal meretas ATM, Lakukan lagi sebelum Polisi datang");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 9)
		    {
		    	InfoTD_MSG(playerid, 8000, "Robbery ~r~Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda gagal meretas ATM, alat perampokan anda hancur");
		    	pData[playerid][pAlatRob] -=1;
		        TogglePlayerControllable(playerid, 1);
				SavePlayerAccount(playerid);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 10)
		    {
		    	InfoTD_MSG(playerid, 8000, "Robbery ~r~Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda gagal meretas ATM, alat perampokan anda hancur");
		    	pData[playerid][pAlatRob] -=1;
		        TogglePlayerControllable(playerid, 1);
				SavePlayerAccount(playerid);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 11)
		    {
		    	InfoTD_MSG(playerid, 8000, "Robbery ~g~Succesfully!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pHunger] -= 5;
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
				ClearAnimations(playerid);
		    	new RandRobAtm = Random(18215, 28512);
		    	GivePlayerMoneyEx(playerid, RandRobAtm);
				RobTim[playerid] -=1;
	        	AtmData[id][atmStatus] = 1;
	     		Atm_Refresh(id);
	     		Atm_Save(id);
		    	Info(playerid, "Anda berhasil merampok ATM, cepat pergi dari lokasi sebelum polisi datang");
		    	new string[1280];
				format(string, sizeof(string), "You takes Robbery ATM Money "LG_E"$%d", RandRobAtm);
                SendClientMessage(playerid, ARWIN, string);
			}
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

