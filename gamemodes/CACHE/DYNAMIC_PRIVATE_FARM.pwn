#define MAX_FARM 100
#define MAX_FARM_EMPLOYEE 3
#define MAX_FARM_INT 7000

enum E_FARM
{
    farmID,
    farmName[24],
    farmOwner[MAX_PLAYER_NAME + 1],
	farmMoney,
	farmSeeds,
	farmPotato,
	farmWheat,
	farmOrange,
    Text3D:farmText,
    farmPickup,
    Float:farmX,
    Float:farmY,
    Float:farmZ,
    farmStatus,
    farmPrice
};
new FarmData[MAX_FARM][E_FARM],
    farmEmploy[MAX_FARM][3][MAX_PLAYER_NAME + 1],
    Iterator:Farm<MAX_FARM>;

Farm_Refresh(id)
{
    if(id > -1)
    {
        if(IsValidDynamic3DTextLabel(FarmData[id][farmText]))
            DestroyDynamic3DTextLabel(FarmData[id][farmText]), FarmData[id][farmText] = Text3D: INVALID_3DTEXT_ID;

        if(IsValidDynamicPickup(FarmData[id][farmPickup]))
            DestroyDynamicPickup(FarmData[id][farmPickup]), FarmData[id][farmPickup] = -1;

        new str[316], stats[64];
        if(FarmData[id][farmStatus] == 1)
        {
            stats = "{7fff00}OPEN{ffffff}";
        }
        else
        {
            stats = "{ff0000}CLOSED{ffffff}";
        }

        format(str, sizeof str,"[Field ID:%d]\n"YELLOW_E"Field Price: "LG_E"%s{ffffff}\n{ffffff}Type use "AQUA"'/buy' "WHITE_E"to purchased this Field", id, FormatMoney(FarmData[id][farmPrice]));

        if(strcmp(FarmData[id][farmOwner], "-", true))
            format(str, sizeof str,"[Field ID:%d]\n{ffffff}Field Name: "AQUA"%s\n{ffffff}Field Owner: "YELLOW_E"%s\n{ffffff}STATUS: %s", id, FarmData[id][farmName], FarmData[id][farmOwner], stats);

        FarmData[id][farmText] = CreateDynamic3DTextLabel(str, ARWIN, FarmData[id][farmX], FarmData[id][farmY], FarmData[id][farmZ]+0.5, 8.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1, -1, 8.0);
        FarmData[id][farmPickup] = CreateDynamicPickup(1239, 23, FarmData[id][farmX], FarmData[id][farmY], FarmData[id][farmZ]+0.2, -1);
    }
}

Farm_Save(id)
{
    new query[2248];
    format(query, sizeof query,"UPDATE farm SET owner='%s', name='%s', money=%d, seeds=%d, potato=%d, wheat=%d, orange=%d, posx='%f', posy='%f', posz='%f', status=%d, price=%d",
        FarmData[id][farmOwner],
        FarmData[id][farmName],
        FarmData[id][farmMoney],
        FarmData[id][farmSeeds],
        FarmData[id][farmPotato],
        FarmData[id][farmWheat],
        FarmData[id][farmOrange],
        FarmData[id][farmX],
        FarmData[id][farmY],
        FarmData[id][farmZ],
        FarmData[id][farmStatus],
        FarmData[id][farmPrice]);
    for(new z = 0; z < MAX_FARM_EMPLOYEE; z++)
    {
        format(query, sizeof query,"%s, employe%d='%s'", query, z, farmEmploy[id][z]);
    }
    format(query, sizeof query,"%s WHERE id = %d", query, id);
    return mysql_tquery(g_SQL, query);
}

Farm_Reset(id)
{
    format(FarmData[id][farmOwner], MAX_PLAYER_NAME, "-");
    format(farmEmploy[id][0], MAX_PLAYER_NAME, "-");
    format(farmEmploy[id][1], MAX_PLAYER_NAME, "-");
    format(farmEmploy[id][2], MAX_PLAYER_NAME, "-");
    FarmData[id][farmMoney] = 0;
    FarmData[id][farmSeeds] = 0;
    FarmData[id][farmPotato] = 0;
    FarmData[id][farmWheat] = 0;
    FarmData[id][farmOrange] = 0;
    for(new z = 0; z < MAX_FARM_EMPLOYEE; z++)
    {
        format(farmEmploy[id][z], MAX_PLAYER_NAME, "-");
    }
    Farm_Refresh(id);
}

IsFarmEmploye(playerid, id)
{
    if(!strcmp(farmEmploy[id][0], pData[playerid][pName], true)) return 1;
    if(!strcmp(farmEmploy[id][1], pData[playerid][pName], true)) return 1;
    if(!strcmp(farmEmploy[id][2], pData[playerid][pName], true)) return 1;
    return 0;
}

IsFarmOwner(playerid, id)
{
    if(!strcmp(FarmData[id][farmOwner], pData[playerid][pName], true))
        return 1;

    return 0;
}

function LoadFarm()
{
    static wid;

	new rows = cache_num_rows(), owner[128], name[128];
 	if(rows)
  	{
		for(new i; i < rows; i++)
		{
			cache_get_value_name_int(i, "id", wid);
			cache_get_value_name(i, "owner", owner);
			format(FarmData[wid][farmOwner], 128, owner);
			cache_get_value_name(i, "name", name);
			format(FarmData[wid][farmName], 128, name);
			cache_get_value_name_int(i, "price", FarmData[wid][farmPrice]);
			cache_get_value_name_float(i, "posx", FarmData[wid][farmX]);
			cache_get_value_name_float(i, "posy", FarmData[wid][farmY]);
			cache_get_value_name_float(i, "posz", FarmData[wid][farmZ]);
			cache_get_value_name_int(i, "money", FarmData[wid][farmMoney]);
			cache_get_value_name_int(i, "seeds", FarmData[wid][farmSeeds]);
            cache_get_value_name_int(i, "potato", FarmData[wid][farmPotato]);
            cache_get_value_name_int(i, "wheat", FarmData[wid][farmWheat]);
            cache_get_value_name_int(i, "orange", FarmData[wid][farmOrange]);
            for(new z = 0; z < MAX_FARM_EMPLOYEE; z++)
            {
                new str[64];
                format(str, sizeof str,"employe%d", z);
                cache_get_value_name(i, str, farmEmploy[wid][z]);
            }
			Farm_Refresh(wid);
			Iter_Add(Farm, wid);
		}
		printf("[FIELD FARM] Number of Loaded: %d.", rows);
	}
}

GetOwnedFarm(playerid)
{
	new tmpcount;
	foreach(new wid : Farm)
	{
	    if(!strcmp(FarmData[wid][farmOwner], pData[playerid][pName], true))
	    {
     		tmpcount++;
		}
	}
	return tmpcount;
}

ReturnPlayerFarmID(playerid, hslot)
{
	new tmpcount;
	if(hslot < 1 && hslot > LIMIT_PER_PLAYER) return -1;
	foreach(new wid : Farm)
	{
	    if(!strcmp(pData[playerid][pName], FarmData[wid][farmOwner], true))
	    {
     		tmpcount++;
       		if(tmpcount == hslot)
       		{
        		return wid;
  			}
	    }
	}
	return -1;
}

GetAnyFarm()
{
	new tmpcount;
	foreach(new id : Farm)
	{
     	tmpcount++;
	}
	return tmpcount;
}

ReturnFarmID(slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_FARM) return -1;
	foreach(new id : Farm)
	{
        tmpcount++;
        if(tmpcount == slot)
        {
            return id;
        }
	}
	return -1;
}

alias:farmsafe("farms")
CMD:farmsafe(playerid, params[])
{
    foreach(new id : Farm)
	{
        if(IsPlayerInRangeOfPoint(playerid, 4.0, FarmData[id][farmX], FarmData[id][farmY], FarmData[id][farmZ]))
        {
            if(!IsFarmOwner(playerid, id) && !IsFarmEmploye(playerid, id))
                return Error(playerid, "You're not the Owner or Employee of this Field Farmer");

            ShowFarmMenu(playerid, id);
        }
    }
    return 1;
}

ShowFarmMenu(playerid, id)
{
    pData[playerid][pMenuType] = 0;
    pData[playerid][pInFarm] = id;

    new str[256], vstr[64];
    format(vstr, sizeof vstr,"Farm Field (%s) Menu", FarmData[id][farmName]);
    format(str, sizeof str,"Toggle Farm\nSet Farm Name\nEmploye Menu\nMoney\t({7fff00}%s{ffffff})\nSeeds\t(%d/%d)\nPotato\t(%d/%d)\nWheat\t(%d/%d)\nOrang'e\t(%d/%d)",
        FormatMoney(FarmData[id][farmMoney]),
        FarmData[id][farmSeeds],
        MAX_FARM_INT,
        FarmData[id][farmPotato],
        MAX_FARM_INT,
        FarmData[id][farmWheat],
        MAX_FARM_INT,
        FarmData[id][farmOrange],
        MAX_FARM_INT);
    ShowPlayerDialog(playerid, FARM_MENU, DIALOG_STYLE_LIST, vstr, str, "Select", "Cancel");
    return 1;
}

alias:farmcreate("cfarms")
CMD:farmcreate(playerid, params[])
{
	if(pData[playerid][pAdmin] < 6)
		return PermissionError(playerid);

	new query[512];
	new wid = Iter_Free(Farm);
	if(wid == -1) return Error(playerid, "You cant create more farm!");
	new price;
	if(sscanf(params, "d", price)) return Usage(playerid, "/farmcreate [price]");
	new totalcash[25];
	format(totalcash, sizeof totalcash,"%d00",price);
	price = strval(totalcash);
	format(FarmData[wid][farmOwner], MAX_PLAYER_NAME, "-");
    format(farmEmploy[wid][0], MAX_PLAYER_NAME, "-");
    format(farmEmploy[wid][1], MAX_PLAYER_NAME, "-");
    format(farmEmploy[wid][2], MAX_PLAYER_NAME, "-");
    format(FarmData[wid][farmName], 24, "-");
	GetPlayerPos(playerid, FarmData[wid][farmX], FarmData[wid][farmY], FarmData[wid][farmZ]);
	FarmData[wid][farmPrice] = price;
	FarmData[wid][farmStatus] = 0;

    Farm_Refresh(wid);
	Iter_Add(Farm, wid);

	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO farm SET id=%d, owner='%s', price=%d, posx='%f', posy='%f', posz='%f', name='%s'", wid, FarmData[wid][farmOwner], FarmData[wid][farmPrice], FarmData[wid][farmX], FarmData[wid][farmY], FarmData[wid][farmZ], FarmData[wid][farmName]);
	mysql_tquery(g_SQL, query, "OnFarmCreated", "i", wid);
    Info(playerid, "Created private Farm ID:%d", wid);
	return 1;
}

function OnFarmCreated(wid)
{
	Farm_Save(wid);
    Farm_Refresh(wid);
	return 1;
}

alias:gotofarm("gotofarms")
CMD:gotofarm(playerid, params[])
{
	new wid;
	if(pData[playerid][pAdmin] < 2)
        return PermissionError(playerid);

	if(sscanf(params, "d", wid))
		return Usage(playerid, "/gotofarm [id]");
	if(!Iter_Contains(Farm, wid)) return Error(playerid, "The Private Farm you specified ID of doesn't exist.");
	SetPlayerPos(playerid, FarmData[wid][farmX], FarmData[wid][farmY], FarmData[wid][farmZ]);
    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);
	Info(playerid, "You has teleport to Farm Private ID %d", wid);
	return 1;
}

alias:editfarm("edifarms")
CMD:editfarm(playerid, params[])
{
    static
        wid,
        type[24],
        string[128];

    if(pData[playerid][pAdmin] < 6)
        return PermissionError(playerid);

    if(sscanf(params, "ds[24]S()[128]", wid, type, string))
    {
        Usage(playerid, "/editfarm [id] [name]");
        SendClientMessage(playerid, COLOR_YELLOW, "[NAMES]:{FFFFFF} location, status, owner, price, money, seeds, potato, wheat, orange");
        return 1;
    }
    if((wid < 0 || wid >= MAX_FARM))
        return Error(playerid, "You have specified an invalid ID.");
	if(!Iter_Contains(Farm, wid)) return Error(playerid, "The Private Farm you specified ID of doesn't exist.");

    if(!strcmp(type, "location", true))
    {
		GetPlayerPos(playerid, FarmData[wid][farmX], FarmData[wid][farmY], FarmData[wid][farmZ]);
        Farm_Save(wid);
		Farm_Refresh(wid);

        SendAdminMessage(COLOR_RED, "%s "X1_BLUE"has adjusted the location of Privte Farm ID: %d.", pData[playerid][pAdminname], wid);
    }
    else if(!strcmp(type, "status", true))
    {
        new locked;

        if(sscanf(string, "d", locked))
            return Usage(playerid, "/editfarm [id] [locked] [0/1]");

        if(locked < 0 || locked > 1)
            return Error(playerid, "You must specify at least 0 or 1.");

        FarmData[wid][farmStatus] = locked;
        Farm_Save(wid);
		Farm_Refresh(wid);

        if(locked)
		{
            SendAdminMessage(COLOR_RED, "%s "X1_BLUE"has Opened Private Farm ID: %d.", pData[playerid][pAdminname], wid);
        }
        else
		{
            SendAdminMessage(COLOR_RED, "%s "X1_BLUE"has Closed Private Farm ID: %d.", pData[playerid][pAdminname], wid);
        }
    }
    else if(!strcmp(type, "price", true))
    {
        new price;

        if(sscanf(string, "d", price))
            return Usage(playerid, "/editfarm [id] [Price] [Amount]");

        FarmData[wid][farmPrice] = price;

        Farm_Save(wid);
		Farm_Refresh(wid);
        SendAdminMessage(COLOR_RED, "%s "X1_BLUE"has adjusted the price of Private Farm ID: %d to %d.", pData[playerid][pAdminname], wid, price);
    }
	else if(!strcmp(type, "money", true))
    {
        new money;

        if(sscanf(string, "d", money))
            return Usage(playerid, "/editfarm [id] [money] [Ammount]");

        FarmData[wid][farmMoney] = money;
        Farm_Save(wid);
		Farm_Refresh(wid);
        SendAdminMessage(COLOR_RED, "%s "X1_BLUE"has adjusted the money of Private Farm ID: %d to %s.", pData[playerid][pAdminname], wid, FormatMoney(money));
    }
	else if(!strcmp(type, "seeds", true))
    {
        new amount;

        if(sscanf(string, "d", amount))
            return Usage(playerid, "/editfarm [id] [seeds] [Ammount]");

        FarmData[wid][farmSeeds] = amount;
        Farm_Save(wid);
		Farm_Refresh(wid);
        SendAdminMessage(COLOR_RED, "%s "X1_BLUE"has adjusted the seeds plants of Farm Private ID: %d to %d.", pData[playerid][pAdminname], wid, amount);
    }
	else if(!strcmp(type, "potato", true))
    {
        new amount;

        if(sscanf(string, "d", amount))
            return Usage(playerid, "/editfarm [id] [potato] [Ammount]");

        FarmData[wid][farmPotato] = amount;
        Farm_Save(wid);
		Farm_Refresh(wid);
        SendAdminMessage(COLOR_RED, "%s "X1_BLUE"has adjusted the potato plants of Farm Private ID: %d to %d.", pData[playerid][pAdminname], wid, amount);
    }
	else if(!strcmp(type, "wheat", true))
    {
        new amount;

        if(sscanf(string, "d", amount))
            return Usage(playerid, "/editfarm [id] [wheat] [Ammount]");

        FarmData[wid][farmWheat] = amount;
        Farm_Save(wid);
		Farm_Refresh(wid);
        SendAdminMessage(COLOR_RED, "%s "X1_BLUE"has adjusted the wheat plants of Farm Private ID: %d to %d.", pData[playerid][pAdminname], wid, amount);
    }
	else if(!strcmp(type, "orange", true))
    {
        new amount;

        if(sscanf(string, "d", amount))
            return Usage(playerid, "/editfarm [id] [orange] [Ammount]");

        FarmData[wid][farmOrange] = amount;
        Farm_Save(wid);
		Farm_Refresh(wid);
        SendAdminMessage(COLOR_RED, "%s "X1_BLUE"has adjusted the orange plants of Farm Private ID: %d to %d.", pData[playerid][pAdminname], wid, amount);
    }
	else if(!strcmp(type, "delete", true))
    {
		Farm_Reset(wid);

		DestroyDynamic3DTextLabel(FarmData[wid][farmText]);
        DestroyDynamicPickup(FarmData[wid][farmPickup]);

		FarmData[wid][farmX] = 0;
		FarmData[wid][farmY] = 0;
		FarmData[wid][farmZ] = 0;
		FarmData[wid][farmPrice] = 0;
		FarmData[wid][farmText] = Text3D: INVALID_3DTEXT_ID;
		FarmData[wid][farmPickup] = -1;

		Iter_Remove(Farm, wid);
		new query[128];
		mysql_format(g_SQL, query, sizeof(query), "DELETE FROM farm WHERE ID=%d", wid);
		mysql_tquery(g_SQL, query);
        SendAdminMessage(COLOR_RED, "%s has delete private farm ID: %d.", pData[playerid][pAdminname], wid);
	}
    return 1;
}

CMD:lockfarm(playerid, params[])
{
	foreach(new wid : Farm)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.5, FarmData[wid][farmX], FarmData[wid][farmY], FarmData[wid][farmZ]))
		{
			if(!IsFarmOwner(playerid, wid) && !IsFarmEmploye(playerid, wid)) return Error(playerid, "Kamu bukan pengurus Ladang Pribadi ini.");
			if(!FarmData[wid][farmStatus])
			{
				FarmData[wid][farmStatus] = 1;
				Farm_Save(wid);

				InfoTD_MSG(playerid, 4000, "Field has ben ~g~Unlocked!");
				PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			}
			else
			{
				FarmData[wid][farmStatus] = 0;
				Farm_Save(wid);

				InfoTD_MSG(playerid, 4000,"Field has ben ~r~Locked");
				PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			}
            Farm_Refresh(wid);
		}
	}
	return 1;
}

CMD:myfarm(playerid)
{
	if(!GetOwnedFarm(playerid)) return Error(playerid, "You don't have any Workshop.");
	new wid, _tmpstring[128], count = GetOwnedFarm(playerid), CMDSString[512];
	CMDSString = "";
	new lock[128];
	strcat(CMDSString,"No\tName(Status)\tLocation\n",sizeof(CMDSString));
	Loop(itt, (count + 1), 1)
	{
	    wid = ReturnPlayerFarmID(playerid, itt);
		if(FarmData[wid][farmStatus] == 1)
		{
			lock = "{7FFF00}Open{ffffff}";
		}
		else
		{
			lock = "{FF0000}Closed{ffffff}";
		}
		if(itt == count)
		{
		    format(_tmpstring, sizeof(_tmpstring), "%d\t%s{ffffff}(%s)\t%s{ffffff}\n", itt, FarmData[wid][farmName], lock, GetLocation(FarmData[wid][farmX], FarmData[wid][farmY], FarmData[wid][farmZ]));
		}
		else format(_tmpstring, sizeof(_tmpstring), "%d\t%s{ffffff}(%s)\t%s{ffffff}\n", itt, FarmData[wid][farmName], lock, GetLocation(FarmData[wid][farmX], FarmData[wid][farmY], FarmData[wid][farmZ]));
		strcat(CMDSString, _tmpstring);
	}
	ShowPlayerDialog(playerid, DIALOG_MY_WS, DIALOG_STYLE_TABLIST_HEADERS, "My Field/Farm", CMDSString, "Go to", "Cancel");
	return 1;
}

