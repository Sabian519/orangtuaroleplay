#define MAX_AKTOR 562

enum aktor
{
    aid,
    amodel,
    aada,
    anama[128],
    Float:aposx,
    Float:aposy,
    Float:aposz,
    Float:aposa,
    aworld,
    aint,
    acreate,
    Text3D:alabel
}
new aData[MAX_AKTOR][aktor],
	Iterator:Act<MAX_AKTOR>;

stock Actor_Create(playerid, modelid)
{
    new Float:x,
        Float:y,
        Float:z,
        Float:angle;

    new query[123];

    if(GetPlayerPos(playerid, x, y, z) && GetPlayerFacingAngle(playerid, angle))
    {
        for(new i = 0; i < MAX_AKTOR; i++) if(!aData[i][aada])
        {
            aData[i][aada] = true;

            x += 1.0 * floatsin(-angle, degrees);
			y += 1.0 * floatcos(-angle, degrees);

            format(aData[i][anama], 128, "None");

            aData[i][aposx] = x;
            aData[i][aposy] = y;
            aData[i][aposz] = z;
            aData[i][aposa] = angle;
            aData[i][aworld] = GetPlayerVirtualWorld(playerid);
            aData[i][aint] = GetPlayerInterior(playerid);
            aData[i][amodel] = modelid;

            Actor_Refresh(i);
            mysql_format(g_SQL, query, sizeof(query), "INSERT INTO `actor` (`model`) VALUES('%d')", aData[i][amodel]);
            mysql_tquery(g_SQL, query, "OnActorCreate", "d", i);

            return i;
        }
    }
    printf("ACTOR: Add from ID: %d", modelid);
    return 1;
}

Actor_Refresh(id)
{
	if(id > -1)
    {
    	new string[256];
        if(IsValidDynamicActor(aData[id][acreate]))
            DestroyDynamicActor(aData[id][acreate]);

        if(IsValidDynamic3DTextLabel(aData[id][alabel]))
            DestroyDynamic3DTextLabel(aData[id][alabel]);

        format(string, sizeof(string), ""GREY_E"[Actor:%d]\n{FFFFFF}%s", id, aData[id][anama]);
        aData[id][acreate] = CreateDynamicActor(aData[id][amodel], aData[id][aposx], aData[id][aposy], aData[id][aposz], aData[id][aposa], 1, 100.0, aData[id][aworld], aData[id][aint]);
        aData[id][alabel] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, aData[id][aposx], aData[id][aposy], aData[id][aposz], 2.5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, aData[id][aworld], aData[id][aint]);
    }
    return 1;
}

Actor_Save(id)
{
    new cquery[500];
    mysql_format(g_SQL, cquery, sizeof(cquery), "UPDATE `actor` SET `model`='%d', `name`='%s', `posx`='%f', `posy`='%f', `posz`='%f', `angel`='%f', `world`='%d', `interior`='%d' WHERE `id`='%d'",
        aData[id][amodel],
        aData[id][anama],
        aData[id][aposx],
        aData[id][aposy],
        aData[id][aposz],
        aData[id][aposa],
        aData[id][aworld],
        aData[id][aint],
        id//aData[id][aid]
    );
    return mysql_tquery(g_SQL, cquery);
}

Actor_Delete(id)
{
    if (id > -1/* && SpeedData[speedid][speedExists]*/)
	{
    	new string[256];
        if(IsValidDynamicActor(aData[id][acreate]))
            DestroyDynamicActor(aData[id][acreate]);

        if(IsValidDynamic3DTextLabel(aData[id][alabel]))
            DestroyDynamic3DTextLabel(aData[id][alabel]);

        Iter_Remove(Act, id);
		format(string, sizeof(string), "DELETE FROM `actor` WHERE `id` = '%d'", id);
		mysql_tquery(g_SQL, string);
	}
	return 1;
}

function LoadActor()
{
	new id;

    new rows = cache_num_rows();
    if(rows)
    {
        for(new i; i < rows; i++)
        {
            aData[i][aada] = true;
            cache_get_value_name_int(i, "id", id);
            cache_get_value_name_int(i, "model", aData[id][amodel]);
            cache_get_value_name(i, "name", aData[id][anama], 128);
            cache_get_value_name_float(i, "posx", aData[id][aposx]);
            cache_get_value_name_float(i, "posy", aData[id][aposy]);
            cache_get_value_name_float(i, "posz", aData[id][aposz]);
            cache_get_value_name_float(i, "angel", aData[id][aposa]);
            cache_get_value_name_int(i, "world", aData[id][aworld]);
            cache_get_value_name_int(i, "interior", aData[id][aint]);

			new string[1280];
			format(string, sizeof(string), ""GREY_E"[Actor:%d]\n{FFFFFF}%s", id, aData[id][anama]);
			aData[id][acreate] = CreateDynamicActor(aData[id][amodel], aData[id][aposx], aData[id][aposy], aData[id][aposz], aData[id][aposa], 1, 100.0, aData[id][aworld], aData[id][aint]);
   			aData[id][alabel] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, aData[id][aposx], aData[id][aposy], aData[id][aposz], 2.5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, aData[id][aworld], aData[id][aint]);
			Iter_Add(Act, id);
            Actor_Refresh(id);
        }
        printf("[ACTOR] Number of actor loaded: %d", rows);
    }
    return 1;
}

// Additionals Command //
CMD:destroyactor(playerid, params[])
{
	static id = -1;

    if (pData[playerid][pAdmin] < 5)
	    return Error(playerid, "You don't have permission to use this command.");

	if (sscanf(params, "d", id))
	    return Usage(playerid, "/destroyactor [Act id]");

	if ((id < 0 || id >= MAX_AKTOR) || !aData[id][aada])
	    return Error(playerid, "You have specified an invalid Actors Dynamic ID.");

	Actor_Delete(id);
	Servers(playerid, "You have successfully destroyed Actors Dynamic ID: %d.", id);
	return 1;
}

CMD:createactor(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5)
        return PermissionError(playerid);

    static
        model,
		modelid;

    if(sscanf(params, "d", model)) return Usage(playerid, "/createactor [Model ID]");

	new id = Iter_Free(Act), query[512];
	if(id == -1) return Error(playerid, "You can't create more actor");

	new Float:x, Float:y, Float:z, Float:a;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);

    if(model < 0 || model > 299) return Error(playerid, "Invalid skin model id. 0-299 only!");
	id = Actor_Create(playerid, model);
	aData[id][aposx] = x;
	aData[id][aposy] = y;
	aData[id][aposz] = z;
 	aData[id][aposa] = a;
  	aData[id][aworld] = GetPlayerVirtualWorld(playerid);
   	aData[id][aint] = GetPlayerInterior(playerid);
   	aData[id][amodel] = modelid;
	format(aData[id][anama], 128, "None");

    Actor_Save(id);
	Actor_Refresh(id);
	Iter_Add(Act, id);
    printf("ACTOR: Create Actor Modelid %d", model);

	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO actor SET id='%d', model='%d', name='%s', posx='%f', posy='%f', posz='%f', angel='%f', world='%d', interior='%d'", id, aData[id][amodel], aData[id][anama], aData[id][aposx], aData[id][aposy], aData[id][aposz], aData[id][aposa], aData[id][aworld], aData[id][aint]);
    mysql_tquery(g_SQL, query, "OnActorCreate", "d", id);
    return 1;
}

function OnActorCreate(playerid, acid)
{
    Actor_Save(acid);
	Actor_Refresh(acid);
	Servers(playerid, "You has ben created Actor Dynamic ID: %d", acid);
    return 1;
}

CMD:editactor(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5) return PermissionError(playerid);

    static
        id = -1,
        type[25],
        string[256];

    if(sscanf(params, "ds[25]S()[256]", id, type, string))
    {
        Usage(playerid, "/editactor [ID Actor] [Option]");
        SCM(playerid, COLOR_YELLOW, "OPTION: "YELLOW_E"Location, Name, Model, Delete");
        return 1;
    }

    if((id < 0 || id >= MAX_AKTOR) || !aData[id][aada]) return Error(playerid, "Invalid ID");

    if(!strcmp(type, "location", true))
    {
        GetPlayerPos(playerid, aData[id][aposx], aData[id][aposy], aData[id][aposz]);
        GetPlayerFacingAngle(playerid, aData[id][aposa]);

        aData[id][aposx] += 1.0 * floatsin(-aData[id][aposa], degrees);
		aData[id][aposy] += 1.0 * floatcos(-aData[id][aposa], degrees);

        aData[id][aworld] = GetPlayerVirtualWorld(playerid);
        aData[id][aint] = GetPlayerInterior(playerid);

        Actor_Refresh(id);
        Actor_Save(id);
    }
    else if(!strcmp(type, "name", true))
    {
        new nam[128];
        if(sscanf(string, "s[128]", nam)) return Usage(playerid, "/editactor <id aktor><name><nama aktor>");
        if(strlen(nam) < 1 || strlen(nam) > 128) return Error(playerid, "Only 1-128 character");

        format(aData[id][anama], 128, nam);
        Actor_Refresh(id);
        Actor_Save(id);
    }
    else if(!strcmp(type, "model", true))
    {
        new idmod;
        if(sscanf(string, "d", idmod)) return Usage(playerid, "/editactor <id aktor><model><id skin>");
        if(idmod < 0 || idmod > 299) return Error(playerid, "Invalid skin model id. 0-299 only!");

        aData[id][amodel] = idmod;
        Actor_Refresh(id);
        Actor_Save(id);
    }
    else if(!strcmp(type, "delete", true))
    {
        Info(playerid, "use command /destroyactor");
    }
    return 1;
}

