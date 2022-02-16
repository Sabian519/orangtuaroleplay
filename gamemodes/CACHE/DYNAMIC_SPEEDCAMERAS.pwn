#define MAX_SPEED_CAMERAS 100

enum speedData
{
	speedID,
	speedExists,
	Float:speedPos[4],
	Float:speedRange,
	Float:speedLimit,
	speedObject,
	Text3D:speedText3D
};
new SpeedData[MAX_SPEED_CAMERAS][speedData],
	Iterator:SpeedCams<MAX_SPEED_CAMERAS>;
	
Speed_Refresh(id)
{
	if(id > -1/* && SpeedData[speedid][speedExists]*/)
	{
	    new
	        string[10000];

		if (IsValidDynamicObject(SpeedData[id][speedObject]))
		    DestroyDynamicObject(SpeedData[id][speedObject]);

		if (IsValidDynamic3DTextLabel(SpeedData[id][speedText3D]))
		    DestroyDynamic3DTextLabel(SpeedData[id][speedText3D]);

		format(string, sizeof(string), "[ID: %d]\n"YELLOW_E"SpeedCameras\n"LG_E"Speed Limit:"RED_E" %.0f MPH", id, SpeedData[id][speedLimit]);

		SpeedData[id][speedText3D] = CreateDynamic3DTextLabel(string, ARWIN, SpeedData[id][speedPos][0], SpeedData[id][speedPos][1], SpeedData[id][speedPos][2] + 2.5, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
        SpeedData[id][speedObject] = CreateDynamicObject(18880, SpeedData[id][speedPos][0], SpeedData[id][speedPos][1], SpeedData[id][speedPos][2], 0.0, 0.0, SpeedData[id][speedPos][3]);
	}
	return 1;
}

Speed_Save(id)
{
	new cQuery[1280];

	format(cQuery, sizeof(cQuery), "UPDATE `speedcameras` SET `speedRange` = '%.4f', `speedLimit` = '%.4f', `speedX` = '%.4f', `speedY` = '%.4f', `speedZ` = '%.4f', `speedAngle` = '%.4f' WHERE `id` = '%d'",
	    SpeedData[id][speedRange],
	    SpeedData[id][speedLimit],
	    SpeedData[id][speedPos][0],
	    SpeedData[id][speedPos][1],
	    SpeedData[id][speedPos][2],
	    SpeedData[id][speedPos][3],
	    /*SpeedData[id][speedID]*/id
	);
	return mysql_tquery(g_SQL, cQuery);
}

Speed_Nearest(playerid)
{
	for (new i = 0; i < MAX_SPEED_CAMERAS; i ++)
	if (SpeedData[i][speedExists] && IsPlayerInRangeOfPoint(playerid, SpeedData[i][speedRange], SpeedData[i][speedPos][0], SpeedData[i][speedPos][1], SpeedData[i][speedPos][2]))
    return i;

	return -1;
}

Speed_Delete(id)
{
    if (id > -1/* && SpeedData[speedid][speedExists]*/)
	{
	    new string[64];

		if (IsValidDynamicObject(SpeedData[id][speedObject]))
		    DestroyDynamicObject(SpeedData[id][speedObject]);

		if (IsValidDynamic3DTextLabel(SpeedData[id][speedText3D]))
		    DestroyDynamic3DTextLabel(SpeedData[id][speedText3D]);

        Iter_Remove(SpeedCams, id);
		format(string, sizeof(string), "DELETE FROM `speedcameras` WHERE `speedID` = '%d'", SpeedData[id][speedID]);
		mysql_tquery(g_SQL, string);

		SpeedData[id][speedExists] = false;
		SpeedData[id][speedLimit] = 0.0;
		SpeedData[id][speedRange] = 0.0;
		//SpeedData[id][speedID] = 0;
	}
	return 1;
}

function Speed_Load()
{
	new id;

	new rows = cache_num_rows();
	if(rows)
	{
	    for(new i; i < rows; i++)
	    {
		    SpeedData[id][speedExists] = true;
		    cache_get_value_name_int(i, "id", id); // default SpeedData[id][speedID]
		    cache_get_value_name_float(i, "speedRange", SpeedData[id][speedRange]);
		    cache_get_value_name_float(i, "speedLimit", SpeedData[id][speedLimit]);
		    cache_get_value_name_float(i, "speedX", SpeedData[id][speedPos][0]);
		    cache_get_value_name_float(i, "speedY", SpeedData[id][speedPos][1]);
		    cache_get_value_name_float(i, "speedZ", SpeedData[id][speedPos][2]);
		    cache_get_value_name_float(i, "speedAngle", SpeedData[id][speedPos][3]);

			Iter_Add(SpeedCams, id);
			Speed_Refresh(id);
		}
		printf("[SPEEDCAMERAS]: Loaded speedcameras number of: %d", rows);
	}
}

// Additionals Command //
CMD:destroyspeed(playerid, params[])
{
	static id = -1;

    if (pData[playerid][pAdmin] < 5)
	    return Error(playerid, "You don't have permission to use this command.");

	if (sscanf(params, "d", id))
	    return Usage(playerid, "/destroyspeed [speed id]");

	if ((id < 0 || id >= MAX_SPEED_CAMERAS) || !SpeedData[id][speedExists])
	    return Error(playerid, "You have specified an invalid speed camera ID.");

	Speed_Delete(id);
	Servers(playerid, "You have successfully destroyed speed camera ID: %d.", id);
	return 1;
}

CMD:createspeed(playerid, params[])
{
    if(pData[playerid][pAdmin] < 4)
        return PermissionError(playerid);

	static
	    Float:limit,
	    Float:range;

	if (sscanf(params, "ff", limit, range))
		return Usage(playerid, "/createspeed [speed limit] [range] (default range: 30)");

	if (limit < 5.0 || limit > 150.0)
	    return Error(playerid, "The speed limit can't be below 5 or above 150.");

	if (range < 5.0 || range > 50.0)
	    return Error(playerid, "The range can't be below 5 or above 50.");

	if (Speed_Nearest(playerid) != -1)
	    return Error(playerid, "You can't do this in range another speed camera.");

	new id = Iter_Free(SpeedCams), query[512];
	if(id == -1) return Error(playerid, "The servers is maximum speedcameras");
	new Float:x, Float:y, Float:z, Float:a;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);

	SpeedData[id][speedExists] = true;
 	SpeedData[id][speedRange] = range;
	    
	SpeedData[id][speedPos][0] = x + (1.5 * floatsin(-a, degrees));
	SpeedData[id][speedPos][1] = y + (1.5 * floatcos(-a, degrees));
	SpeedData[id][speedPos][2] = z - 1.2;
	SpeedData[id][speedPos][3] = a;
	SpeedData[id][speedLimit] = limit;
	//SpeedData[id][speedID] = id;

	Speed_Refresh(id);
	Iter_Add(SpeedCams, id);
	Speed_Save(id);
	mysql_format(g_SQL, query, sizeof query, "INSERT INTO speedcameras SET id='%d', speedRange='%.4f', speedLimit='%f', speedX='%f', speedY='%f', speedZ='%f', speedAngle='%f'", id, SpeedData[id][speedRange], SpeedData[id][speedLimit], SpeedData[id][speedPos][0], SpeedData[id][speedPos][1], SpeedData[id][speedPos][2], SpeedData[id][speedPos][3]);
	mysql_tquery(g_SQL, query, "OnSpeedCreated", "d", id);
	return 1;
}

function OnSpeedCreated(playerid, speedid)
{
	/*if (speedid == -1 || !SpeedData[speedid][speedExists])
	    return 0;

	SpeedData[speedid][speedID] = cache_insert_id(g_iHandle);*/
	Speed_Save(speedid);
	Speed_Refresh(speedid);
	Servers(playerid, "SpeedCameras has ben Created ID: %d", speedid);
}

function SpeedingCheck(playerid)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(IsPlayerInAnyVehicle(i))
	        {
				foreach(new id : SpeedCams)
				{
					if(IsPlayerInRangeOfPoint(playerid, SpeedData[id][speedRange], SpeedData[id][speedPos][0], SpeedData[id][speedPos][1], SpeedData[id][speedPos][2]))
					{
					    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					    {
						    new vehicleid = GetPlayerVehicleID(playerid);
							if(GetVehicleSpeed(vehicleid) > SpeedData[id][speedLimit])
							{
								new string[10000];
								format(string, sizeof(string), "SPEEDTRAP: "WHITE_E"Your passed the speed limit "YELLOW_E"%.0f/%.0f mph"WHITE_E", please slow down", GetVehicleSpeed(vehicleid), SpeedData[id][speedLimit]);
								SCM(playerid, COLOR_BLUE, string);

								new LString[10000], carid;
								SendFactionMessage(1, COLOR_BLUE, "SPEEDTRAP: "YELLOW_E"Recording vehicles crossing the speed limit Locations: "LG_E"%s", GetLocation(SpeedData[id][speedPos][0], SpeedData[id][speedPos][1], SpeedData[id][speedPos][2]));
								format(LString, sizeof(LString), "SUSPECT: "YELLOW_E"Vehicle Model: "WHITE_E"["RED_E"%s"WHITE_E"] "YELLOW_E"Plate Number: "WHITE_E"["LB_E"%s"WHITE_E"] "YELLOW_E"Speeding: "WHITE_E"["RED_E"%.0f mph/%.0f mph"WHITE_E"]", GetVehicleName(vehicleid), pvData[carid][cPlate], GetVehicleSpeed(vehicleid), SpeedData[id][speedLimit]);
								SendFactionMessage(1, COLOR_BLUE, LString);
								return 1;
							}
						}
					}
				}
			}
		}
	}
	return 1;
}
