// REFAMP ATM SYSTEM //
#define MAX_ATM 50

enum    E_ATM
{
	// loaded from db
	Float: atmX,
	Float: atmY,
	Float: atmZ,
	Float: atmRX,
	Float: atmRY,
	Float: atmRZ,
	atmInt,
	atmWorld,
	// temp
	atmObjID,
	Text3D: atmLabel,
	atmStatus
}

new AtmData[MAX_ATM][E_ATM],
	Iterator:ATMS<MAX_ATM>;

Atm_Refresh(id)
{
    if(id > -1)
    {
        if(IsValidDynamic3DTextLabel(AtmData[id][atmLabel]))
            DestroyDynamic3DTextLabel(AtmData[id][atmLabel]), AtmData[id][atmLabel] = Text3D: INVALID_3DTEXT_ID;

        if(IsValidDynamicObject(AtmData[id][atmObjID]))
            DestroyDynamicObject(AtmData[id][atmObjID]), AtmData[id][atmObjID] = -1;

        new str[316], stats[64];
        if(AtmData[id][atmStatus] == 0)
        {
            // ATM Dapat di Gunakan
            stats = ""GREEN_E"ENABLE{ffffff}";
        	AtmData[id][atmObjID] = CreateDynamicObject(19324,  AtmData[id][atmX], AtmData[id][atmY], AtmData[id][atmZ], AtmData[id][atmRX], AtmData[id][atmRY], AtmData[id][atmRZ], AtmData[id][atmWorld], AtmData[id][atmInt], -1, 10.0, 10.0);
        }
        else
        {
            // ATM Tidak Dapat di Gunakan
            stats = ""RED_E"DISABLE{ffffff}";
       	 	AtmData[id][atmObjID] = CreateDynamicObject(2943,  AtmData[id][atmX], AtmData[id][atmY], AtmData[id][atmZ], AtmData[id][atmRX], AtmData[id][atmRY], AtmData[id][atmRZ], AtmData[id][atmWorld], AtmData[id][atmInt], -1, 10.0, 10.0);
        }
       	format(str, sizeof str,"[A: %d]\n"WHITE_E"STATUS: %s\n"WHITE_E"use command '"YELLOW_E"/atm"WHITE_E"' to acces ATM", id, stats);
		AtmData[id][atmLabel] = CreateDynamic3DTextLabel(str, ARWIN, AtmData[id][atmX], AtmData[id][atmY], AtmData[id][atmZ] + 0.3, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, AtmData[id][atmWorld], AtmData[id][atmInt], -1, 10.0);
    }
}

GetClosestATM(playerid, Float: range = 3.0)
{
	new id = -1, Float: dist = range, Float: tempdist;
	foreach(new i : ATMS)
	{
	    tempdist = GetPlayerDistanceFromPoint(playerid, AtmData[i][atmX], AtmData[i][atmY], AtmData[i][atmZ]);

	    if(tempdist > range) continue;
		if(tempdist <= dist && GetPlayerInterior(playerid) == AtmData[i][atmInt] && GetPlayerVirtualWorld(playerid) == AtmData[i][atmWorld])
		{
			dist = tempdist;
			id = i;
		}
	}
	return id;
}

function LoadATM()
{
	new rows;
	cache_get_row_count(rows);
	if(rows)
  	{
 		new id, i = 0;//, str[55];
		while(i < rows)
		{
		    cache_get_value_name_int(i, "id", id);
			cache_get_value_name_float(i, "posx", AtmData[id][atmX]);
			cache_get_value_name_float(i, "posy", AtmData[id][atmY]);
			cache_get_value_name_float(i, "posz", AtmData[id][atmZ]);
			cache_get_value_name_float(i, "posrx", AtmData[id][atmRX]);
			cache_get_value_name_float(i, "posry", AtmData[id][atmRY]);
			cache_get_value_name_float(i, "posrz", AtmData[id][atmRZ]);
			cache_get_value_name_int(i, "interior", AtmData[id][atmInt]);
			cache_get_value_name_int(i, "world", AtmData[id][atmWorld]);
			cache_get_value_name_int(i, "status", AtmData[id][atmStatus]);
			//AtmData[id][atmObjID] = CreateDynamicObject(19324, AtmData[id][atmX], AtmData[id][atmY], AtmData[id][atmZ], AtmData[id][atmRX], AtmData[id][atmRY], AtmData[id][atmRZ], AtmData[id][atmWorld], AtmData[id][atmInt], -1, 10.0, 10.0);
        	//format(str, sizeof str,"[ID: %d]\n"WHITE_E"STATUS: %s\n"WHITE_E"use command '"YELLOW_E"/atm"WHITE_E"' to acces ATM", id, AtmData[id][atmStatus]);
			//AtmData[id][atmLabel] = CreateDynamic3DTextLabel(str, ARWIN, AtmData[id][atmX], AtmData[id][atmY], AtmData[id][atmZ]+0.3, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, AtmData[id][atmWorld], AtmData[id][atmInt], -1, 10.0);
			//AtmData[id][atmMap] = CreateDynamicMapIcon(ATMIslem[id][atmPos][0], ATMIslem[id][atmPos][1], ATMIslem[id][atmPos][2], 52, -1, -1, -1, -1, 100.0, 1);
			//AtmData[id][atmCP] = CreateDynamicCP(ATMIslem[id][atmPos][0], ATMIslem[id][atmPos][1], ATMIslem[id][atmPos][2], 1.5, -1, -1, -1, 3.0);
			Atm_Refresh(id);
			Iter_Add(ATMS, id);
	    	i++;
		}
		printf("[Dynamic ATM] Number of Loaded: %d.", i);
	}
}

Atm_Save(id)
{
	new cQuery[512];
	format(cQuery, sizeof(cQuery), "UPDATE atms SET posx='%f', posy='%f', posz='%f', posrx='%f', posry='%f', posrz='%f', interior='%d', world='%d', status=%d WHERE id='%d'",
	AtmData[id][atmX],
	AtmData[id][atmY],
	AtmData[id][atmZ],
	AtmData[id][atmRX],
	AtmData[id][atmRY],
	AtmData[id][atmRZ],
	AtmData[id][atmInt],
	AtmData[id][atmWorld],
	AtmData[id][atmStatus],
	id
	);
	return mysql_tquery(g_SQL, cQuery);
}

Atm_BeingEdited(id)
{
	if(!Iter_Contains(ATMS, id)) return 0;
	foreach(new i : Player) if(pData[i][EditingATMID] == id) return 1;
	return 0;
}

CMD:createatm(playerid, params[])
{
	if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);

	new id = Iter_Free(ATMS), query[512];
	if(id == -1) return Error(playerid, "Can't add any more ATM.");
 	new Float: x, Float: y, Float: z;
 	GetPlayerPos(playerid, x, y, z);
 	/*GetPlayerFacingAngle(playerid, a);
 	x += (3.0 * floatsin(-a, degrees));
	y += (3.0 * floatcos(-a, degrees));
	z -= 1.0;*/

	AtmData[id][atmX] = x;
	AtmData[id][atmY] = y;
	AtmData[id][atmZ] = z;
	AtmData[id][atmRX] = AtmData[id][atmRY] = AtmData[id][atmRZ] = 0.0;
	AtmData[id][atmInt] = GetPlayerInterior(playerid);
	AtmData[id][atmWorld] = GetPlayerVirtualWorld(playerid);
	AtmData[id][atmStatus] = 0;

	new str[128];
	AtmData[id][atmObjID] = CreateDynamicObject(2943, AtmData[id][atmX], AtmData[id][atmY], AtmData[id][atmZ], AtmData[id][atmRX], AtmData[id][atmRY], AtmData[id][atmRZ], AtmData[id][atmWorld], AtmData[id][atmInt], -1, 10.0, 10.0);
	format(str, sizeof str,"[A: %d]\n"WHITE_E"STATUS: %s\n"WHITE_E"use command '"YELLOW_E"/atm"WHITE_E"' to acces ATM", id, AtmData[id][atmStatus]);
	AtmData[id][atmLabel] = CreateDynamic3DTextLabel(str, ARWIN, AtmData[id][atmX], AtmData[id][atmY], AtmData[id][atmZ] + 0.3, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, AtmData[id][atmWorld], AtmData[id][atmInt], -1, 10.0);
	Atm_Refresh(id);
	Iter_Add(ATMS, id);

	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO atms SET id='%d', posx='%f', posy='%f', posz='%f', posrx='%f', posry='%f', posrz='%f', interior='%d', world='%d'", id, AtmData[id][atmX], AtmData[id][atmY], AtmData[id][atmZ], AtmData[id][atmRX], AtmData[id][atmRY], AtmData[id][atmRZ], GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
	mysql_tquery(g_SQL, query, "OnAtmCreated", "ii", playerid, id);
	return 1;
}

function OnAtmCreated(playerid, id)
{
	Atm_Save(id);
	Atm_Refresh(id);
	Servers(playerid, "You has created ATM id: %d.", id);
	return 1;
}

CMD:editatm(playerid, params[])
{
    static
        id,
        type[24],
        string[128];

    if(pData[playerid][pAdmin] < 6)
        return PermissionError(playerid);

    if(sscanf(params, "ds[24]S()[128]", id, type, string))
    {
        Usage(playerid, "/editatm [id] [opsi]");
        SCM(playerid, ARWIN, "OPSI: "WHITE_E"[posisi] [status]");
        return 1;
    }
    if(!strcmp(type, "posisi", true))
    {
		if(pData[playerid][EditingATMID] != -1) return Error(playerid, "You're already editing.");

		//new id;
		if(sscanf(params, "i", id)) return Usage(playerid, "/editatm [id]");
		if(!Iter_Contains(ATMS, id)) return Error(playerid, "Invalid ID.");
		if(!IsPlayerInRangeOfPoint(playerid, 30.0, AtmData[id][atmX], AtmData[id][atmY], AtmData[id][atmZ])) return Error(playerid, "You're not near the atm you want to edit.");
		pData[playerid][EditingATMID] = id;
		EditDynamicObject(playerid, AtmData[id][atmObjID]);
	}
    else if(!strcmp(type, "status", true))
    {
        new locked;

        if(sscanf(string, "d", locked))
            return Usage(playerid, "/editatm [id] [status] [0/1]");

        if(locked < 0 || locked > 1)
            return Error(playerid, "You must specify at least 0 or 1.");

        AtmData[id][atmStatus] = locked;
        Atm_Save(id);
		Atm_Refresh(id);

        if(locked)
		{
            SendAdminMessage(COLOR_RED, "%s "WHITE_E"has changes Enable ATM Status ID: %d.", pData[playerid][pAdminname], id);
        }
        else
		{
            SendAdminMessage(COLOR_RED, "%s "WHITE_E"has changes Disable ATM Status ID: %d.", pData[playerid][pAdminname], id);
        }
    }
	return 1;
}

CMD:removeatm(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);

	new id, query[512];
	if(sscanf(params, "i", id)) return Usage(playerid, "/removeatm [id]");
	if(!Iter_Contains(ATMS, id)) return Error(playerid, "Invalid ID.");

	if(Atm_BeingEdited(id)) return Error(playerid, "Can't remove specified atm because its being edited.");
	DestroyDynamicObject(AtmData[id][atmObjID]);
	DestroyDynamic3DTextLabel(AtmData[id][atmLabel]);

	AtmData[id][atmX] = AtmData[id][atmY] = AtmData[id][atmZ] = AtmData[id][atmRX] = AtmData[id][atmRY] = AtmData[id][atmRZ] = 0.0;
	AtmData[id][atmInt] = AtmData[id][atmWorld] = 0;
	AtmData[id][atmObjID] = -1;
	AtmData[id][atmLabel] = Text3D: -1;
	Iter_Remove(ATMS, id);

	mysql_format(g_SQL, query, sizeof(query), "DELETE FROM atms WHERE id=%d", id);
	mysql_tquery(g_SQL, query);
	Servers(playerid, "You removed ATM id %d.", id);
	return 1;
}

CMD:gotoatm(playerid, params[])
{
	new id;
	if(pData[playerid][pAdmin] < 3)
        return PermissionError(playerid);

	if(sscanf(params, "d", id))
		return Usage(playerid, "/gotoatm [id]");
	if(!Iter_Contains(ATMS, id)) return Error(playerid, "The atm you specified ID of doesn't exist.");

	SetPlayerPosition(playerid, AtmData[id][atmX], AtmData[id][atmY], AtmData[id][atmZ], 2.0);
    SetPlayerInterior(playerid, AtmData[id][atmInt]);
    SetPlayerVirtualWorld(playerid, AtmData[id][atmWorld]);
	Servers(playerid, "You has teleport to atm id %d", id);
	return 1;
}

CMD:atm(playerid, params[])
{
	if(pData[playerid][IsLoggedIn] == false) return Error(playerid, "You must logged in!");
	if(pData[playerid][pInjured] >= 1) return Error(playerid, "You can't use this at this moment!");

	new id = -1;
	id = GetClosestATM(playerid);
	if(AtmData[id][atmStatus] >= 1) return Error(playerid, "ATM ini sedang rusak");

	if(id > -1)
	{
		new tstr[128];
		format(tstr, sizeof(tstr), ""ORANGE_E"No Rek: "LB_E"%d", pData[playerid][pBankRek]);
		ShowPlayerDialog(playerid, DIALOG_ATM, DIALOG_STYLE_LIST, tstr, "Check Balance\nWithdraw Money\nTransfer Money\nSign Paycheck", "Select", "Cancel");
	}
	return 1;
}

