// ParkVeh
#define MAX_PARKPOINT 300

enum    E_PARK
{
	// loaded from db
	Float: parkX,
	Float: parkY,
	Float: parkZ,
	parkInt,
	parkWorld,
	// temp
	parkPickup,
	Text3D: parkLabel
}

new ppData[MAX_PARKPOINT][E_PARK],
	Iterator:Parks<MAX_PARKPOINT>;

GetClosestParks(playerid, Float: range = 4.3)
{
	new id = -1, Float: dist = range, Float: tempdist;
	foreach(new i : Parks)
	{
	    tempdist = GetPlayerDistanceFromPoint(playerid, ppData[i][parkX], ppData[i][parkY], ppData[i][parkZ]);

	    if(tempdist > range) continue;
		if(tempdist <= dist && GetPlayerInterior(playerid) == ppData[i][parkInt] && GetPlayerVirtualWorld(playerid) == ppData[i][parkWorld])
		{
			dist = tempdist;
			id = i;
		}
	}
	return id;
}

ReturnAnyPark(slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_PARKPOINT) return -1;
	foreach(new id : Parks)
	{
		tmpcount++;
		if(tmpcount == slot)
		{
			return id;
		}
	}
	return -1;
}

GetAnyPark()
{
	new tmpcount;
	foreach(new id : Parks)
	{
		tmpcount++;
	}
	return tmpcount;
}

function LoadPark()
{
	new rows;
	cache_get_row_count(rows);
	if(rows)
  	{
 		new id, i = 0, str[528];
		while(i < rows)
		{
			format(str, sizeof(str), "[P: %d]\n"AQUA"%s"YELLOW_E"\n/spawn /despawn", id, GetLocation(ppData[id][parkX], ppData[id][parkY], ppData[id][parkZ]));
		    cache_get_value_name_int(i, "id", id);
			cache_get_value_name_float(i, "posx", ppData[id][parkX]);
			cache_get_value_name_float(i, "posy", ppData[id][parkY]);
			cache_get_value_name_float(i, "posz", ppData[id][parkZ]);
			cache_get_value_name_int(i, "interior", ppData[id][parkInt]);
			cache_get_value_name_int(i, "world", ppData[id][parkWorld]);
			ppData[id][parkPickup] = CreateDynamicPickup(19131, 23, ppData[id][parkX], ppData[id][parkY], ppData[id][parkZ], ppData[id][parkWorld],  ppData[id][parkInt]);
			ppData[id][parkLabel] = CreateDynamic3DTextLabel(str, ARWIN, ppData[id][parkX], ppData[id][parkY], ppData[id][parkZ]+0.3, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ppData[id][parkWorld], ppData[id][parkInt], -1, 10.0);
			Iter_Add(Parks, id);
	    	i++;
		}
		printf("[Dynamic Park Point] Number of Loaded: %d.", i);
	}
}

Park_Save(id)
{
	new cQuery[512];
	format(cQuery, sizeof(cQuery), "UPDATE parks SET posx='%f', posy='%f', posz='%f', interior=%d, world=%d WHERE id=%d",
	ppData[id][parkX],
	ppData[id][parkY],
	ppData[id][parkZ],
	ppData[id][parkInt],
	ppData[id][parkWorld],
	id
	);
	return mysql_tquery(g_SQL, cQuery);
}

CMD:garagehelp(playerid, params[])
{
	Info(playerid, "/creategarage, /setgaragepos, /removegarage, /gotogarage");
	return 1;
}

CMD:creategarage(playerid, params[])
{
	if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);

	new id = Iter_Free(Parks), query[512];
	if(id == -1) return Error(playerid, "Can't add any more Park Point.");
 	new Float: x, Float: y, Float: z;
 	GetPlayerPos(playerid, x, y, z);

	ppData[id][parkX] = x;
	ppData[id][parkY] = y;
	ppData[id][parkZ] = z;
	ppData[id][parkInt] = GetPlayerInterior(playerid);
	ppData[id][parkWorld] = GetPlayerVirtualWorld(playerid);

	new str[128];
	format(str, sizeof(str), "[P: %d]\n"AQUA"%s"YELLOW_E"\n/spawn /despawn", id, GetLocation(ppData[id][parkX], ppData[id][parkY], ppData[id][parkZ]));
	ppData[id][parkPickup] = CreateDynamicPickup(19131, 23, ppData[id][parkX], ppData[id][parkY], ppData[id][parkZ], ppData[id][parkWorld],  ppData[id][parkInt]);
	ppData[id][parkLabel] = CreateDynamic3DTextLabel(str, ARWIN, ppData[id][parkX], ppData[id][parkY], ppData[id][parkZ] + 0.3, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ppData[id][parkWorld], ppData[id][parkInt], -1, 10.0);
	Iter_Add(Parks, id);

	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO parks SET id=%d, posx='%f', posy='%f', posz='%f', interior=%d, world=%d", id, ppData[id][parkX], ppData[id][parkY], ppData[id][parkZ], GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
	mysql_tquery(g_SQL, query, "OnParkCreated", "ii", playerid, id);
	return 1;
}

function OnParkCreated(playerid, id)
{
	Park_Save(id);
	Servers(playerid, "You has created Park Point id: %d.", id);
	return 1;
}

CMD:setgaragepos(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);

	new id;
	if(sscanf(params, "i", id)) return Usage(playerid, "/setgaragepos [id]");
	if(!Iter_Contains(Parks, id)) return Error(playerid, "Invalid ID.");
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	ppData[id][parkX] = x;
	ppData[id][parkY] = y;
	ppData[id][parkZ] = z;
	ppData[id][parkInt] = GetPlayerInterior(playerid);
	ppData[id][parkWorld] = GetPlayerVirtualWorld(playerid);

	if(IsValidDynamicPickup(ppData[id][parkPickup]))
		DestroyDynamicPickup(ppData[id][parkPickup]), ppData[id][parkPickup] = -1;

	if(IsValidDynamic3DTextLabel(ppData[id][parkLabel]))
		DestroyDynamic3DTextLabel(ppData[id][parkLabel]), ppData[id][parkLabel] = Text3D: INVALID_3DTEXT_ID;

	new str[128];
	ppData[id][parkPickup] = CreateDynamicPickup(19131, 23, ppData[id][parkX], ppData[id][parkY], ppData[id][parkZ], ppData[id][parkWorld],  ppData[id][parkInt]);
	format(str, sizeof(str), "[P: %d]\n"AQUA"%s"YELLOW_E"\n/spawn /despawn", id, GetLocation(ppData[id][parkX], ppData[id][parkY], ppData[id][parkZ]));
	ppData[id][parkLabel] = CreateDynamic3DTextLabel(str, ARWIN, ppData[id][parkX], ppData[id][parkY], ppData[id][parkZ] + 0.3, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ppData[id][parkWorld], ppData[id][parkInt], -1, 10.0);
	Park_Save(id);
	return 1;
}

CMD:removegarage(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);

	new id, query[512];
	if(sscanf(params, "i", id)) return Usage(playerid, "/removegarage [id]");
	if(!Iter_Contains(Parks, id)) return Error(playerid, "Invalid ID.");

	DestroyDynamic3DTextLabel(ppData[id][parkLabel]);
	DestroyDynamicPickup(ppData[id][parkPickup]);

	ppData[id][parkX] = ppData[id][parkY] = ppData[id][parkZ] = 0.0;
	ppData[id][parkInt] = ppData[id][parkWorld] = 0;
	ppData[id][parkPickup] = -1;
	ppData[id][parkLabel] = Text3D: -1;
	Iter_Remove(Parks, id);

	mysql_format(g_SQL, query, sizeof(query), "DELETE FROM parks WHERE id=%d", id);
	mysql_tquery(g_SQL, query);
	Servers(playerid, "You has deleted garage ID %d.", id);
	return 1;
}

CMD:gotogarage(playerid, params[])
{
	new id;
	if(pData[playerid][pAdmin] < 3)
        return PermissionError(playerid);

	if(sscanf(params, "d", id))
		return Usage(playerid, "/gotogarage [id]");
	if(!Iter_Contains(Parks, id)) return Error(playerid, "No have garage point exist");

	SetPlayerPosition(playerid, ppData[id][parkX], ppData[id][parkY], ppData[id][parkZ], 2.0);
    SetPlayerInterior(playerid, ppData[id][parkInt]);
    SetPlayerVirtualWorld(playerid, ppData[id][parkWorld]);
	Servers(playerid, "You has Teleport to Garage point ID %d", id);
	return 1;
}

