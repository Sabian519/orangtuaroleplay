// Smuggler
#define COLOR_LOGS 0xC6E2FFFF
new taked = 0;
new pCPPacket = INVALID_PLAYER_ID;
new CheckpointPacket[MAX_PLAYERS] = 0;
new packet = 1;
new CheckpointLast[MAX_PLAYERS] = 0;
new objectpacket;

CreateJoinSmugglerPoint()
{
	new strings[128];
	CreateDynamicPickup(1239, 23, 1294.75, 391.92, 19.55, -1);
	format(strings, sizeof(strings), "[DRUG SMUGGLER]\n"WHITE_E"/joinjob untuk bekerja sebagai smuggler");
	CreateDynamic3DTextLabel(strings, ARWIN, 1294.75, 391.92, 19.55, 1.5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //

}

new Float: RandomPacketPos[12][3] =
{
    {-788.65, 1565.19, 26.32},
    {-166.42, 1177.99, 22.15},
    {2428.71, 86.60, 27.05},
    {1270.54, 307.02, 18.73},
    {774.23, -484.35, 16.54},
    {206.32, -102.91, 4.10},
    {-1663.82, 1080.81, 7.13},
    {-2147.69, 1229.76, 33.13},
    {-673.34, 2706.38, 69.97},
    {2354.80, -680.41, 132.14},
    {-1635.92, -2246.49, 30.68},
    {858.25, -18.09, 62.40}
};

CMD:findpacket(playerid, params[])
{
	if(pData[playerid][pSmugglerTime] > 0) return Error(playerid, "You must be waiting "YELLOW_E"%d "GREY_E"second again to begin smuggler jobs.", pData[playerid][pSmugglerTime]);

	if(pData[playerid][pJob] == 15 || pData[playerid][pJob2] == 15)
	{
		if(pData[playerid][pPacket] == 1) return Error(playerid, "You already take the packet");
		if(pCPPacket == playerid) return Error(playerid, "You are the taker!");

        new rand = random(sizeof(RandomPacketPos));
		if(packet == 0)
		{
			SendClientMessage(playerid, ARWIN, "GPS: {FFFFFF}There is no packet");
		}
		if(packet == 1 && taked == 0)
		{
			CheckpointPacket[playerid] = 1;
        	//new Float:X, Float:Y, Float:Z;
        	GetDynamicObjectPos(objectpacket, RandomPacketPos[rand][0], RandomPacketPos[rand][1], RandomPacketPos[rand][2]);
        	SetPlayerRaceCheckpoint(playerid, 1, RandomPacketPos[rand][0], RandomPacketPos[rand][1], RandomPacketPos[rand][2], RandomPacketPos[rand][0], RandomPacketPos[rand][1], RandomPacketPos[rand][2], 5.0);
        	SendClientMessage(playerid, ARWIN, "GPS: {FFFFFF}Target is "GREEN_E"Standing Still.");
		}
		if(packet == 2 && taked == 0)
		{
	    	CheckpointPacket[playerid] = 1;
        	//new Float:X, Float:Y, Float:Z;
        	GetDynamicObjectPos(objectpacket, RandomPacketPos[rand][0], RandomPacketPos[rand][1], RandomPacketPos[rand][2]);
        	SetPlayerRaceCheckpoint(playerid, 1, RandomPacketPos[rand][0], RandomPacketPos[rand][1], RandomPacketPos[rand][2], RandomPacketPos[rand][0], RandomPacketPos[rand][1], RandomPacketPos[rand][2], 5.0);
        	SendClientMessage(playerid, ARWIN, "GPS: {FFFFFF}Target is "GREEN_E"Standing Still.");
		}
		if(taked == 1)
		{
	    	new Float:X, Float:Y, Float:Z;
	    	CheckpointPacket[playerid] = 1;
	    	GetPlayerPos(pCPPacket, X, Y, Z);
	    	SetPlayerRaceCheckpoint(playerid, 1, X, Y, Z, X, Y, Z, 5.0);
			SendClientMessage(playerid, ARWIN, "GPS: {FFFFFF}Target is "RED_E"Moving.");
		}
	}
	else return Error(playerid, "You are not Smuggler Jobs.");
	return 1;
}

CMD:takepacket(playerid, params[])
{
    if(pData[playerid][pJob] == 15 || pData[playerid][pJob2] == 15)
	{
    	new Float:X, Float:Y, Float:Z;
    	GetDynamicObjectPos(objectpacket, X, Y, Z);
    	if(!IsPlayerInRangeOfPoint(playerid, 15.0, X, Y, Z)) return Error(playerid, "There are no packets near you");

    	if(pData[playerid][pPacket] == 1) return Error(playerid, "You already take a packet");

    	pData[playerid][pPacket]++;
    	TogglePlayerControllable(playerid, 0);
		pData[playerid][pActivity] = SetTimerEx("TakePacket", 600, true, "i", playerid);
		PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Tacking Packet...");
		PlayerTextDrawShow(playerid, ActiveTD[playerid]);
		ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 1);
	}
	else return Error(playerid, "You are not Smuggler Jobs.");
	return 1;
}

CMD:enablecp(playerid, params[])
{
    if(pData[playerid][pJob] == 15 || pData[playerid][pJob2] == 15)
	{
    	if(pData[playerid][pPacket] == 0) return Error(playerid, "You must have a packet");

    	DisablePlayerRaceCheckpoint(playerid);
		CheckpointLast[playerid] = 1;
		SetPlayerRaceCheckpoint(playerid, 1, 1568.997192, 30.751678, 24.164062, 1568.997192, 30.751678, 24.164062, 5.0);
 		SendClientMessage(playerid, ARWIN, "GPS: {FFFFFF}Checkpoint enabled");
 	}
	else return Error(playerid, "You are not Smuggler Jobs.");
	return 1;
}

CMD:droppacket(playerid, params[])
{
	if(pData[playerid][pPacket] == 1)
	{
	    taked = 0;
        DisablePlayerRaceCheckpoint(playerid);
        CheckpointLast[playerid] = 0;
        pData[playerid][pPacket]--;
        pCPPacket = INVALID_PLAYER_ID;
        new Float:X, Float:Y, Float:Z;
        GetPlayerPos(playerid, X, Y, Z);
		RemovePlayerAttachedObject(playerid, 3);
        objectpacket = CreateDynamicObject(11745, X, Y, Z-1, 0.0, 0.0, 0.0, 0);
	}
	else Error(playerid, "You didnt have a packet");
	return 1;
}

function TakePacket(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			ClearAnimations(playerid);
			StopLoopingAnim(playerid);
			DisablePlayerCheckpoint(playerid);
			InfoTD_MSG(playerid, 8000, "Done!");
        	SetPlayerAttachedObject(playerid, 3, 11745, 6, 0.129999, 0.051000, 0.000000, 103.700004, -64.600059, 0.000000, 0.501999, 1.0, 1.0);
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			pData[playerid][pEnergy] -= 5;
			TogglePlayerControllable(playerid, 1);
			InfoTD_MSG(playerid, 8000, "Packet Taked!");
			CheckpointLast[playerid] = 1;
			SendClientMessage(playerid, ARWIN, "SMUGGLER: {FFFFFF}You have taked the packet go to the checkpoint");
			SetPlayerRaceCheckpoint(playerid, 1, 860.8442,-17.8314,63.2484, 860.8442,-17.8314,63.2484, 5.0);
			taked = 1;
			pCPPacket = playerid;
			DestroyDynamicObject(objectpacket);
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
