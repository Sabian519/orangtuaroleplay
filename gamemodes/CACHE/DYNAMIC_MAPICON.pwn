// MAP ICON //
#define MAX_MAPICONS 20

enum mapiconInfo
{
	mpID,
	mpType,
	Float:mpX,
	Float:mpY,
	Float:mpZ
}
new MapIconInfo[MAX_MAPICONS][mapiconInfo];

stock SaveMapIcons()
{
	new idx = 0, File:file;
	new string[256];
	while(idx < MAX_MAPICONS)
	{
	    format(string, sizeof(string), "%d|%f|%f|%f\r\n",
		MapIconInfo[idx][mpType],
		MapIconInfo[idx][mpX],
		MapIconInfo[idx][mpY],
		MapIconInfo[idx][mpZ]);
	    if(idx == 0)
	    {
	        file = fopen("mapicons.cfg", io_write);
	    }
	    else
	    {
	    	file = fopen("mapicons.cfg", io_append);
	    }
		fwrite(file, string);
		fclose(file);
		idx++;
	}
	print("Mapicons saved successfully.");
}

stock LoadMapIcons()
{
	new dinfo[4][128];
	new string[256];
	new File:file = fopen("mapicons.cfg", io_read);
	if(file)
	{
	    new idx = 0;
		while(idx < MAX_MAPICONS)
		{
		    fread(file, string);
		    split(string, dinfo, '|');
		    MapIconInfo[idx][mpType] = strval(dinfo[0]);
			MapIconInfo[idx][mpX] = floatstr(dinfo[1]);
			MapIconInfo[idx][mpY] = floatstr(dinfo[2]);
			MapIconInfo[idx][mpZ] = floatstr(dinfo[3]);
			if(MapIconInfo[idx][mpType]) // If mapicon exists
			{
			    MapIconInfo[idx][mpID] = CreateDynamicMapIcon(MapIconInfo[idx][mpX], MapIconInfo[idx][mpY], MapIconInfo[idx][mpZ], MapIconInfo[idx][mpType], 0 ,0);
			}
			idx++;
	    }
	}
	print("MAPICON: Icon loaded successfully.");
	return 1;
}

CMD:mused(playerid, params[])
{
	new string[128];
	if(pData[playerid][pAdmin] < 5) return Error(playerid, "You are not an authorized to use this command.");
	Info(playerid, "[Used MapIcons]:");
	for(new idx=0; idx<MAX_MAPICONS; idx++)
	{
	    if(MapIconInfo[idx][mpType])
	    {
			format(string, sizeof(string), "MAPICON: "WHITE_E"ID: %d | Pickup: %d", idx, MapIconInfo[idx][mpType]);
			SendClientMessage(playerid, ARWIN, string);
	    }
	}
	return 1;
}

CMD:medit(playerid, params[])
{
	new string[128], idx;
	if(pData[playerid][pAdmin] < 6) return Error(playerid, "You are not authorized to use this command.");
	if(sscanf(params, "s[128]", params))
	{
		Usage(playerid, "/medit [option] [mapiconid]");
		SCM(playerid, ARWIN, "OPTIONS: "WHITE_E"Position | Icon");
		return 1;
	}
	if(!strcmp(params, "position", true, 8))
	{
	    if(sscanf(params, "s[128]i", params, idx)) return Usage(playerid, "/medit position [mapiconid]");
        if(MapIconInfo[idx][mpType] == 0) return Error(playerid, "Invalid mapicon id.");
        GetPlayerPos(playerid, MapIconInfo[idx][mpX], MapIconInfo[idx][mpY], MapIconInfo[idx][mpZ]);
        DestroyDynamicMapIcon(MapIconInfo[idx][mpID]);
		MapIconInfo[idx][mpID] = CreateDynamicMapIcon(MapIconInfo[idx][mpX], MapIconInfo[idx][mpY], MapIconInfo[idx][mpZ], MapIconInfo[idx][mpType], 0 ,0);
	    format(string, sizeof(string), "MAPICON: "WHITE_E"You have set mapicon ID %d's position to your coordinates.", idx);
	    SendClientMessage(playerid, ARWIN, string);
	    SaveMapIcons();
	}
	if(!strcmp(params, "icon", true, 4))
	{
	    new pickup;
	    if(sscanf(params, "s[128]ii", params, idx, pickup)) return Usage(playerid, "/medit icon [mapiconid] [iconid]");
        if(pickup == 0 || pickup == 1) return Error(playerid, "Invalid mapicon type.");
        if(MapIconInfo[idx][mpType] == 0) return Error(playerid, "Invalid mapicon id.");
        MapIconInfo[idx][mpType] = pickup;
        DestroyDynamicMapIcon(MapIconInfo[idx][mpID]);
		MapIconInfo[idx][mpID] = CreateDynamicMapIcon(MapIconInfo[idx][mpX], MapIconInfo[idx][mpY], MapIconInfo[idx][mpZ], MapIconInfo[idx][mpType], 0 ,0);
	    format(string, sizeof(string), "MAPICON: "WHITE_E"You have set mapicon ID %d's icon to %d.", idx, pickup);
	    SendClientMessage(playerid, ARWIN, string);
	    SaveMapIcons();
	}
	return 1;
}

CMD:gotomapicon(playerid, params[])
{
    new idx, string[128];
	if(pData[playerid][pAdmin] < 5) return Error(playerid, "You are not authorized to use this command.");
	if(sscanf(params, "i", idx)) return Usage(playerid, "/gotomapicon [doorid]");
	if(!MapIconInfo[idx][mpType]) return Error(playerid, "Invalid mapicon id.");
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerPos(playerid, MapIconInfo[idx][mpX], MapIconInfo[idx][mpY], MapIconInfo[idx][mpZ]);
	format(string, sizeof(string), "TELEPORT: "WHITE_E"You have teleported to mapicon ID %d.", idx);
	SendClientMessage(playerid, ARWIN, string);
	return 1;
}

CMD:deletemp(playerid, params[])
{
	new idx, string[128];
	if(pData[playerid][pAdmin] < 6) return Error(playerid, "You are not authorized to use this command.");
	if(sscanf(params, "i", idx)) return Usage(playerid, "/deletemapicon [mapiconid]");
	if(!MapIconInfo[idx][mpType]) return Error(playerid, "Invalid mapicon id.");
    MapIconInfo[idx][mpType] = 0;
    MapIconInfo[idx][mpX] = 0;
	MapIconInfo[idx][mpY] = 0;
	MapIconInfo[idx][mpZ] = 0;
	DestroyDynamicMapIcon(MapIconInfo[idx][mpID]);
    format(string, sizeof(string), "AdmCmd: "YELLOW_E"%s "WHITE_E"has deleted mapicon ID %d.", pData[playerid][pAdminname], idx);
    SendAdminMessage(COLOR_RED, string);
    SaveMapIcons();
	//Log("logs/mapicons.log", string);
	return 1;
}

CMD:createmp(playerid, params[])
{
	new string[128], type;
   	if(pData[playerid][pAdmin] < 6) return Error(playerid, "You are not authorized to use this command.");
	if(sscanf(params, "i", type)) return Usage(playerid, "/createmp [icon]");
	if(type == 0 || type == 1) return Error(playerid, "Invalid mapicon type.");
	for(new idx=0; idx<MAX_MAPICONS; idx++)
	{
	    if(!MapIconInfo[idx][mpType])
	    {
		    MapIconInfo[idx][mpType] = type;
		    GetPlayerPos(playerid, MapIconInfo[idx][mpX], MapIconInfo[idx][mpY], MapIconInfo[idx][mpZ]);
		    MapIconInfo[idx][mpID] = CreateDynamicMapIcon(MapIconInfo[idx][mpX], MapIconInfo[idx][mpY], MapIconInfo[idx][mpZ], MapIconInfo[idx][mpType], 0 ,0);
			format(string, sizeof(string), "AdmCmd: %s has created mapicon ID %d.", pData[playerid][pAdminname], idx);
		    SendAdminMessage(COLOR_RED, string);
			idx = MAX_MAPICONS;
			SaveMapIcons();
		}
	}
	return 1;
}

CMD:iconhelp(playerid, params[])
{
	Info(playerid, "/createmp, /deletemp, /mused, /medit, /gotomapicon");
	return 1;
}

