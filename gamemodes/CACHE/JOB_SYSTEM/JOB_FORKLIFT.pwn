/*
	// POINT MENGAMBIL BOX
	2539.31, -2471.31, 13.40
	2468.28, -2560.48, 13.41
	2401.40, -2566.41, 13.41
	2425.93, -2486.24, 13.40

	// POINT MENARUH BOX
	2787.55, -2411.66, 13.40
	2788.26, -2425.79, 13.40
	2794.77, -2410.35, 13.40

	// POINT FINISH
	2758.67, -2388.04, 13.40
*/

//new bool:DialogForklift[1];
new KerjaForklift[MAX_PLAYERS];
new ForkliftSteps[MAX_PLAYERS][1];
new FORKLIFT[3], FORKLIFTPlate[3];

IsFORKLIFTCar(carid)
{
	for(new v = 0; v < sizeof(FORKLIFT); v++)
	{
	    if(carid == FORKLIFT[v]) return 1;
	}
	return 0;
}

function ForkliftLoad(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			InfoTD_MSG(playerid, 8000, "Loaded Crates Done!");
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			pData[playerid][pEnergy] -= 3;
			TogglePlayerControllable(playerid, 1);

			SetPVarInt(playerid, "box", CreateDynamicObject(2912,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0));
			AttachDynamicObjectToVehicle(GetPVarInt(playerid, "box"), GetPlayerVehicleID(playerid), -0.010, 0.580, 0.270, 0.000, 0.000, 0.000);
			return 1;
		}
		else if(pData[playerid][pActivityTime] < 100)
		{
			pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		}
	}
	return 1;
}
