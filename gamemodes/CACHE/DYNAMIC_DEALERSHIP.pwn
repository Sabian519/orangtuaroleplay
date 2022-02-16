#include <YSI_Coding\y_hooks>

#define MAX_DEALERSHIP 16

enum DealerVariabel
{
	dealerOwner[MAX_PLAYER_NAME],
	dealerName[128],
	dealerPrice,
	dealerType,
	dealerLocked,
	dealerMoney,
	Float:dealerPosX,
	Float:dealerPosY,
	Float:dealerPosZ,
	Float:dealerPosA,
	Float:dealerPointX,
	Float:dealerPointY,
	Float:dealerPointZ,
	Float:dealerPointA,
	dealerStock,
	dealerRestock,

	// Hooked by DealerRefresh
	dealerPickup,
	dealerPickupPoint,
	dealerMap,
	Text3D:dealerLabel,
	Text3D:dealerPointLabel,
};

new DealerData[MAX_DEALERSHIP][DealerVariabel];
new Iterator:Dealer<MAX_DEALERSHIP>;

CMD:editdealer(playerid, params[])
{
    static
        did,
        type[24],
        string[128];

    if(pData[playerid][pAdmin] < 6)
        return PermissionError(playerid);

    if(sscanf(params, "ds[24]S()[128]", did, type, string))
    {
        Usage(playerid, "/editdealer [id] [name]");
        SendClientMessage(playerid, COLOR_YELLOW, "[NAMES]:{FFFFFF} location, point, price, type, stock, restock, reset");
        return 1;
    }
    if((did < 0 || did > MAX_DEALERSHIP))
        return Error(playerid, "You have specified an invalid ID.");

	if(!Iter_Contains(Dealer, did)) return Error(playerid, "The dealership you specified ID of doesn't exist.");

    if(!strcmp(type, "location", true))
    {
		GetPlayerPos(playerid, DealerData[did][dealerPosX], DealerData[did][dealerPosY], DealerData[did][dealerPosZ]);
		GetPlayerFacingAngle(playerid, DealerData[did][dealerPosA]);
        DealerSave(did);
		DealerRefresh(did);

        SendAdminMessage(COLOR_RED, "%s Changes Location Dealer ID: %d.", pData[playerid][pAdminname], did);
    }
    else if(!strcmp(type, "price", true))
    {
        new price;

        if(sscanf(string, "d", price))
            return Usage(playerid, "/editdealer [id] [Price] [Amount]");

        DealerData[did][dealerPrice] = price;

        DealerSave(did);
		DealerRefresh(did);
        SendAdminMessage(COLOR_RED, "%s Changes Price Of The Dealer ID: %d to %d.", pData[playerid][pAdminname], did, price);
    }
	else if(!strcmp(type, "type", true))
    {
        new dtype;

        if(sscanf(string, "d", dtype))
            return Usage(playerid, "/editdealer [id] [Type] [1.Motorcycle 2.Cars 3.Unique Cars 4.Job Cars 5.Truck]");

        DealerData[did][dealerType] = dtype;
        DealerSave(did);
		DealerRefresh(did);
        SendAdminMessage(COLOR_RED, "%s Changes Type Of The Dealer ID: %d to %d.", pData[playerid][pAdminname], did, dtype);
    }
    else if(!strcmp(type, "stock", true))
    {
        new dStock;
        if(sscanf(string, "d", dStock))
            return Usage(playerid, "/editdealer [id] [stock]");

        DealerData[did][dealerStock] = dStock;
        DealerSave(did);
		DealerRefresh(did);
        SendAdminMessage(COLOR_RED, "%s Set Stock Of The Dealer ID: %d with stock %d.", pData[playerid][pAdminname], did, dStock);
    }
    else if(!strcmp(type, "reset", true))
    {
        DealerReset(did);
		DealerSave(did);
		DealerRefresh(did);
        SendAdminMessage(COLOR_RED, "%s has reset dealer ID: %d.", pData[playerid][pAdminname], did);
    }
	else if(!strcmp(type, "point", true))
    {
		new Float:x, Float:y, Float:z, Float:a;
        GetPlayerPos(playerid, x, y, z);
        GetPlayerFacingAngle(playerid, Float:a);
		DealerData[did][dealerPointX] = x;
		DealerData[did][dealerPointY] = y;
		DealerData[did][dealerPointZ] = z;
		DealerSave(did);
		DealerPointRefresh(did);
        SendAdminMessage(COLOR_RED, "%s Change Point Of The Dealer ID: %d.", pData[playerid][pAdminname], did);
    }
    return 1;
}

CMD:createdealer(playerid, params[])
{
	if(pData[playerid][pAdmin] < 6)
		return PermissionError(playerid);

	new query[512];
	new dealerid = Iter_Free(Dealer), address[128];

	new price, type;
	if(sscanf(params, "dd", price, type))
		return Usage(playerid, "/createdealer [price] [type 1.Motorcycle 2.Cars 3.Unique Cars 4. Jobs Vehicle 5. Truck]");

	if(dealerid == -1)
		return Error(playerid, "You cant create more dealership");

	if((dealerid < 0 || dealerid >= MAX_DEALERSHIP))
        return Error(playerid, "You have already input 15 dealership in this server.");

	if(type > 5 || type < 0)
		return Error(playerid, "Invalid dealership Type");

	format(DealerData[dealerid][dealerOwner], 128, "-");
	GetPlayerPos(playerid, DealerData[dealerid][dealerPosX], DealerData[dealerid][dealerPosY], DealerData[dealerid][dealerPosZ]);
	GetPlayerFacingAngle(playerid, DealerData[dealerid][dealerPosA]);

	DealerData[dealerid][dealerPrice] = price;
	DealerData[dealerid][dealerType] = type;

	address = GetLocation(DealerData[dealerid][dealerPosX], DealerData[dealerid][dealerPosY], DealerData[dealerid][dealerPosZ]);
	format(DealerData[dealerid][dealerName], 128, address);

	DealerData[dealerid][dealerLocked] = 1;
	DealerData[dealerid][dealerMoney] = 0;
	DealerData[dealerid][dealerStock] = 0;
	DealerData[dealerid][dealerRestock] = 0;

	Iter_Add(Dealer, dealerid);

	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO dealership SET ID='%d', owner='%s', price='%d', type='%d', posx='%f', posy='%f', posz='%f', posa='%f', name='%s'", dealerid, DealerData[dealerid][dealerOwner], DealerData[dealerid][dealerPrice], DealerData[dealerid][dealerType], DealerData[dealerid][dealerPosX], DealerData[dealerid][dealerPosY], DealerData[dealerid][dealerPosZ], DealerData[dealerid][dealerPosA], DealerData[dealerid][dealerName]);
	mysql_tquery(g_SQL, query, "OnDealerCreated", "i", dealerid);
	return 1;
}

CMD:deletedealer(playerid, params[])
{
	if(pData[playerid][pAdmin] < 6)
		return PermissionError(playerid);

	new bid;

	if(sscanf(params, "d", bid))
		return Usage(playerid, "/deletedealer [id]");

	if(bid < 0 || bid >= MAX_DEALERSHIP)
        return Error(playerid, "You have specified an invalid ID.");

	if(!Iter_Contains(Dealer, bid))
		return Error(playerid, "The dealership you specified ID of doesn't exist.");

	DealerReset(bid);

	DestroyDynamic3DTextLabel(DealerData[bid][dealerLabel]);
	DestroyDynamic3DTextLabel(DealerData[bid][dealerPointLabel]);

    DestroyDynamicPickup(DealerData[bid][dealerPickup]);
    DestroyDynamicPickup(DealerData[bid][dealerPickupPoint]);

	DealerData[bid][dealerPosX] = 0;
	DealerData[bid][dealerPosY] = 0;
	DealerData[bid][dealerPosZ] = 0;
	DealerData[bid][dealerPosA] = 0;
	DealerData[bid][dealerPointX] = 0;
	DealerData[bid][dealerPointY] = 0;
	DealerData[bid][dealerPointZ] = 0;
	DealerData[bid][dealerPrice] = 0;
	DealerData[bid][dealerLabel] = Text3D:INVALID_3DTEXT_ID;
	DealerData[bid][dealerPointLabel] = Text3D:INVALID_3DTEXT_ID;
	DealerData[bid][dealerPickup] = -1;
	DealerData[bid][dealerPickupPoint] = -1;

	Iter_Remove(Dealer, bid);
	new query[128];
	mysql_format(g_SQL, query, sizeof(query), "DELETE FROM dealership WHERE ID=%d", bid);
	mysql_tquery(g_SQL, query);
    SendAdminMessage(COLOR_RED, "%s has delete dealership ID: %d.", pData[playerid][pAdminname], bid);
    return 1;
}

CMD:gotodealer(playerid, params[])
{
	if(pData[playerid][pAdmin] < 6)
		return PermissionError(playerid);

	new bid;

	if(sscanf(params, "d", bid))
		return Usage(playerid, "/gotodealer [id]");

	if(bid < 0 || bid >= MAX_DEALERSHIP)
        return Error(playerid, "You have specified an invalid ID.");

	if(!Iter_Contains(Dealer, bid))
		return Error(playerid, "The dealership you specified ID of doesn't exist.");

	SetPlayerPos(playerid, DealerData[bid][dealerPosX], DealerData[bid][dealerPosY], DealerData[bid][dealerPosZ]);
	SetPlayerFacingAngle(playerid, DealerData[bid][dealerPosA]);

    SendClientMessageEx(playerid, COLOR_WHITE, "You has teleport to dealership id %d", bid);
    return 1;
}

CMD:gotodealerpoint(playerid, params[])
{
	if(pData[playerid][pAdmin] < 6)
		return PermissionError(playerid);

	new bid;

	if(sscanf(params, "d", bid))
		return Usage(playerid, "/gotodealerpoint [id]");

	if(bid < 0 || bid >= MAX_DEALERSHIP)
        return Error(playerid, "You have specified an invalid ID.");

	if(!Iter_Contains(Dealer, bid))
		return Error(playerid, "The dealership you specified ID of doesn't exist.");

	if(DealerData[bid][dealerPointX] == 0.0 && DealerData[bid][dealerPointY] == 0.0 && DealerData[bid][dealerPointZ] == 0.0)
		return Error(playerid, "That point is exists but doesnt have any position");

	SetPlayerPos(playerid, DealerData[bid][dealerPointX], DealerData[bid][dealerPointY], DealerData[bid][dealerPointZ]);

    SendClientMessageEx(playerid, COLOR_WHITE, "You has teleport to dealership id %d", bid);
    return 1;
}

CMD:buypv(playerid, params[])
{
	foreach(new dealerid : Dealer)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.8, DealerData[dealerid][dealerPosX], DealerData[dealerid][dealerPosY], DealerData[dealerid][dealerPosZ]) && strcmp(DealerData[dealerid][dealerOwner], "-") && DealerData[dealerid][dealerPointX] != 0.0 && DealerData[dealerid][dealerPointY] != 0.0 && DealerData[dealerid][dealerPointZ] != 0.0)
		{
			DealerBuyVehicle(playerid, dealerid);
		}
	}
	return 1;
}

alias:dealermanage("mydealer", "myd")
CMD:dealermanage(playerid, params[])
{
	foreach(new dealerid : Dealer)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, DealerData[dealerid][dealerPosX], DealerData[dealerid][dealerPosY], DealerData[dealerid][dealerPosZ]))
		{
			if(!PlayerOwnsDealership(playerid, dealerid)) return Error(playerid, "Dealership ini bukan milik anda!");
			ShowPlayerDialog(playerid, DIALOG_DEALER_MANAGE, DIALOG_STYLE_LIST, "Dealer Manage", "Dealer Information\nDealer Change Name\nDealer Vault\nDealer RequestStock", "Select", "Cancel");
		}
	}
	return 1;
}

/* ============ [ Stock goes here ] ============ */

DealerSave(id)
{
	new cQuery[2248];
	format(cQuery, sizeof(cQuery), "UPDATE dealership SET owner='%s', name='%s', price='%d', type='%d', locked='%d', money='%d', stock='%d', posx='%f', posy='%f', posz='%f', posa='%f', pointx='%f', pointy='%f', pointz='%f', restock='%d' WHERE ID='%d'",
	DealerData[id][dealerOwner],
	DealerData[id][dealerName],
	DealerData[id][dealerPrice],
	DealerData[id][dealerType],
	DealerData[id][dealerLocked],
	DealerData[id][dealerMoney],
	DealerData[id][dealerStock],
	DealerData[id][dealerPosX],
	DealerData[id][dealerPosY],
	DealerData[id][dealerPosZ],
	DealerData[id][dealerPosA],
	DealerData[id][dealerPointX],
	DealerData[id][dealerPointY],
	DealerData[id][dealerPointZ],
	DealerData[id][dealerRestock],
	id
	);
	return mysql_tquery(g_SQL, cQuery);
}

DealerPointRefresh(did)
{
	if(did != -1)
	{
		if(IsValidDynamic3DTextLabel(DealerData[did][dealerPointLabel]))
        DestroyDynamic3DTextLabel(DealerData[did][dealerPointLabel]);

    	if(IsValidDynamicPickup(DealerData[did][dealerPickupPoint]))
        	DestroyDynamicPickup(DealerData[did][dealerPickupPoint]);

		new tstr[218];
		/////////
		if(DealerData[did][dealerPointX] != 0 && DealerData[did][dealerPointY] != 0 && DealerData[did][dealerPointZ] != 0)
		{
        	DealerData[did][dealerPickupPoint] = CreateDynamicPickup(1239, 23, DealerData[did][dealerPointX], DealerData[did][dealerPointY], DealerData[did][dealerPointZ]);
			format(tstr, sizeof(tstr), "[Dealership: %s]\n"AQUA"%s Dealership Vehicle Spawn Point", DealerData[did][dealerName]);
			DealerData[did][dealerPointLabel] = CreateDynamic3DTextLabel(tstr, ARWIN, DealerData[did][dealerPointX], DealerData[did][dealerPointY], DealerData[did][dealerPointZ], 5.0);
		}
		else if(DealerData[did][dealerPointX], DealerData[did][dealerPointY], DealerData[did][dealerPointZ] != 0)
		{
        	DealerData[did][dealerPickupPoint] = CreateDynamicPickup(1239, 23, DealerData[did][dealerPointX], DealerData[did][dealerPointY], DealerData[did][dealerPointZ]);
			format(tstr, sizeof(tstr), "[Dealership: %s]\n"AQUA"%s Dealership Vehicle Spawn Point", DealerData[did][dealerName]);
			DealerData[did][dealerPointLabel] = CreateDynamic3DTextLabel(tstr, ARWIN, DealerData[did][dealerPointX], DealerData[did][dealerPointY], DealerData[did][dealerPointZ], 5.0);
    	}
	}
	return 1;
}

DealerRefresh(id)
{
	if(id != -1)
	{
		if(IsValidDynamic3DTextLabel(DealerData[id][dealerLabel]))
            DestroyDynamic3DTextLabel(DealerData[id][dealerLabel]);

        if(IsValidDynamicPickup(DealerData[id][dealerPickup]))
            DestroyDynamicPickup(DealerData[id][dealerPickup]);

        DestroyDynamicMapIcon(bData[id][bMap]);

        new type[128];
		if(DealerData[id][dealerType] == 1)
		{
			type= "Motorcycle";
		}
		else if(DealerData[id][dealerType] == 2)
		{
			type= "Cars";
		}
		else if(DealerData[id][dealerType] == 3)
		{
			type= "Unique Cars";
		}
		else if(DealerData[id][dealerType] == 4)
		{
			type= "Jobs Cars";
		}
		else if(DealerData[id][dealerType] == 5)
		{
			type= "Truck";
		}
		else
		{
			type= "Unknown";
		}
		new tstr[218];
        if(strcmp(DealerData[id][dealerOwner], "-"))
		{
			format(tstr, sizeof(tstr), "[ID: %d]\n"WHITE_E"Name: "AQUA"%s\n"WHITE_E"Stock: "YELLOW_E"%d\n"WHITE_E"Owners:"LG_E" %s\n"WHITE_E"Type: "YELLOW_E"%s\n"WHITE_E"Use commands "AQUA"/buypv "WHITE_E"to buy vehicle dealership", id, DealerData[id][dealerName], DealerData[id][dealerStock], DealerData[id][dealerOwner], type);
			DealerData[id][dealerLabel] = CreateDynamic3DTextLabel(tstr, COLOR_LBLUE, DealerData[id][dealerPosX], DealerData[id][dealerPosY], DealerData[id][dealerPosZ], 5.0);
            DealerData[id][dealerPickup] = CreateDynamicPickup(1239, 23, DealerData[id][dealerPosX], DealerData[id][dealerPosY], DealerData[id][dealerPosZ]);
		}
        else
        {
			format(tstr, sizeof(tstr), "[ID: %d]\n"WHITE_E"This dealership for sell\nLocation: %s\nPrice: "GREEN_E"%s\n"WHITE_E"Type: "YELLOW_E"%s", id, GetLocation(DealerData[id][dealerPosX], DealerData[id][dealerPosY], DealerData[id][dealerPosZ]), FormatMoney(DealerData[id][dealerPrice]), type);
			DealerData[id][dealerLabel] = CreateDynamic3DTextLabel(tstr, ARWIN, DealerData[id][dealerPosX], DealerData[id][dealerPosY], DealerData[id][dealerPosZ], 5.0);
            DealerData[id][dealerPickup] = CreateDynamicPickup(1239, 23, DealerData[id][dealerPosX], DealerData[id][dealerPosY], DealerData[id][dealerPosZ]);
   		}

        if(DealerData[id][dealerType] == 1)
		{
			DealerData[id][dealerMap] = CreateDynamicMapIcon(DealerData[id][dealerPosX], DealerData[id][dealerPosY], DealerData[id][dealerPosZ], 55, -1, -1, -1, -1, 70.0);
		}
		else if(DealerData[id][dealerType] == 2)
		{
			DealerData[id][dealerMap] = CreateDynamicMapIcon(DealerData[id][dealerPosX], DealerData[id][dealerPosY], DealerData[id][dealerPosZ], 55, -1, -1, -1, -1, 70.0);
		}
		else if(DealerData[id][dealerType] == 3)
		{
			DealerData[id][dealerMap] = CreateDynamicMapIcon(DealerData[id][dealerPosX], DealerData[id][dealerPosY], DealerData[id][dealerPosZ], 55, -1, -1, -1, -1, 70.0);
		}
		else if(DealerData[id][dealerType] == 4)
		{
			DealerData[id][dealerMap] = CreateDynamicMapIcon(DealerData[id][dealerPosX], DealerData[id][dealerPosX], DealerData[id][dealerPosZ], 55, -1, -1, -1, -1, 70.0);
		}
		else if(DealerData[id][dealerType] == 5)
		{
			DealerData[id][dealerMap] = CreateDynamicMapIcon(DealerData[id][dealerPosX], DealerData[id][dealerPosX], DealerData[id][dealerPosZ], 55, -1, -1, -1, -1, 70.0);
		}
		else
		{
			DestroyDynamicMapIcon(DealerData[id][dealerMap]);
		}
		//printf("DEBUG: DealerRefresh Called on Dealer ID %d", id);
	}
}

DealerReset(id)
{
	format(DealerData[id][dealerOwner], MAX_PLAYER_NAME, "-");
	DestroyDynamicPickup(DealerData[id][dealerPickup]);
	DestroyDynamicPickup(DealerData[id][dealerPickupPoint]);
	DealerData[id][dealerLocked] = 1;
    DealerData[id][dealerMoney] = 0;
	DealerData[id][dealerStock] = 0;
	DealerData[id][dealerRestock] = 0;
	DealerRefresh(id);
}

PlayerOwnsDealership(playerid, id)
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(id == -1) return 0;
	if(!strcmp(DealerData[id][dealerOwner], pData[playerid][pName], true)) return 1;
	return 0;
}

Player_DealerCount(playerid)
{
	#if LIMIT_PER_PLAYER != 0
    new count;
	foreach(new i : Dealer)
	{
		if(PlayerOwnsDealership(playerid, i)) count++;
	}
	return count;
	#else
		return 0;
	#endif
}

DealerBuyVehicle(playerid, dealerid)
{
	if(dealerid <= -1 )
        return 0;

    switch(DealerData[dealerid][dealerType])
    {
        case 1:
        {
			if(DealerData[dealerid][dealerStock] < 1)
				return Error(playerid, "This dealer is out of stock product.");

            new str[1024];
			format(str, sizeof(str), ""WHITE_E"%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n",
			GetVehicleModelName(481), FormatMoney(GetDealerVehicleCost(481)),
			GetVehicleModelName(509), FormatMoney(GetDealerVehicleCost(509)),
			GetVehicleModelName(510), FormatMoney(GetDealerVehicleCost(510)),
			GetVehicleModelName(462), FormatMoney(GetDealerVehicleCost(462)),
			GetVehicleModelName(586), FormatMoney(GetDealerVehicleCost(586)),
			GetVehicleModelName(581), FormatMoney(GetDealerVehicleCost(581)),
			GetVehicleModelName(461), FormatMoney(GetDealerVehicleCost(461)),
			GetVehicleModelName(521), FormatMoney(GetDealerVehicleCost(521)),
			GetVehicleModelName(463), FormatMoney(GetDealerVehicleCost(463)),
			GetVehicleModelName(468), FormatMoney(GetDealerVehicleCost(468))
			);

			ShowPlayerDialog(playerid, DIALOG_BUYMOTORCYCLEVEHICLE, DIALOG_STYLE_LIST, "Motorcyle Dealership", str, "Buy", "Close");
		}
        case 2:
        {
			if(DealerData[dealerid][dealerStock] < 1)
				return Error(playerid, "This dealer is out of stock product.");

            new str[1024];
			format(str, sizeof(str), ""WHITE_E"%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n",
			GetVehicleModelName(400), FormatMoney(GetDealerVehicleCost(400)),
			GetVehicleModelName(412), FormatMoney(GetDealerVehicleCost(412)),
			GetVehicleModelName(419), FormatMoney(GetDealerVehicleCost(419)),
			GetVehicleModelName(426), FormatMoney(GetDealerVehicleCost(426)),
			GetVehicleModelName(436), FormatMoney(GetDealerVehicleCost(436)),
			GetVehicleModelName(466), FormatMoney(GetDealerVehicleCost(466)),
			GetVehicleModelName(467), FormatMoney(GetDealerVehicleCost(467)),
			GetVehicleModelName(474), FormatMoney(GetDealerVehicleCost(474)),
			GetVehicleModelName(475), FormatMoney(GetDealerVehicleCost(475)),
			GetVehicleModelName(480), FormatMoney(GetDealerVehicleCost(480)),
			GetVehicleModelName(603), FormatMoney(GetDealerVehicleCost(603)),
			GetVehicleModelName(421), FormatMoney(GetDealerVehicleCost(421)),
			GetVehicleModelName(602), FormatMoney(GetDealerVehicleCost(602)),
			GetVehicleModelName(492), FormatMoney(GetDealerVehicleCost(492)),
			GetVehicleModelName(545), FormatMoney(GetDealerVehicleCost(545)),
			GetVehicleModelName(489), FormatMoney(GetDealerVehicleCost(489)),
			GetVehicleModelName(405), FormatMoney(GetDealerVehicleCost(405)),
			GetVehicleModelName(445), FormatMoney(GetDealerVehicleCost(445)),
			GetVehicleModelName(579), FormatMoney(GetDealerVehicleCost(579)),
			GetVehicleModelName(507), FormatMoney(GetDealerVehicleCost(507))
			);

			ShowPlayerDialog(playerid, DIALOG_BUYCARSVEHICLE, DIALOG_STYLE_LIST, "Cars Dealership", str, "Buy", "Close");
		}
        case 3:
        {
			if(DealerData[dealerid][dealerStock] < 1)
				return Error(playerid, "This dealer is out of stock product.");

            new str[1024];
			format(str, sizeof(str), ""WHITE_E"%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n",
			GetVehicleModelName(483), FormatMoney(GetDealerVehicleCost(483)),
			GetVehicleModelName(534), FormatMoney(GetDealerVehicleCost(534)),
			GetVehicleModelName(535), FormatMoney(GetDealerVehicleCost(535)),
			GetVehicleModelName(536), FormatMoney(GetDealerVehicleCost(536)),
			GetVehicleModelName(558), FormatMoney(GetDealerVehicleCost(558)),
			GetVehicleModelName(559), FormatMoney(GetDealerVehicleCost(559)),
			GetVehicleModelName(560), FormatMoney(GetDealerVehicleCost(560)),
			GetVehicleModelName(561), FormatMoney(GetDealerVehicleCost(561)),
			GetVehicleModelName(562), FormatMoney(GetDealerVehicleCost(562)),
			GetVehicleModelName(565), FormatMoney(GetDealerVehicleCost(565)),
			GetVehicleModelName(567), FormatMoney(GetDealerVehicleCost(567)),
			GetVehicleModelName(575), FormatMoney(GetDealerVehicleCost(575)),
			GetVehicleModelName(576), FormatMoney(GetDealerVehicleCost(576))
			);

			ShowPlayerDialog(playerid, DIALOG_BUYUCARSVEHICLE, DIALOG_STYLE_LIST, "Unique Cars Dealership", str, "Buy", "Close");
		}
        case 4:
		{
			if(DealerData[dealerid][dealerStock] < 1)
				return Error(playerid, "This dealer is out of stock product.");

			//Job Cars
			new str[1024];
			format(str, sizeof(str), ""WHITE_E"%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n",
			GetVehicleModelName(420), FormatMoney(GetDealerVehicleCost(420)),
			GetVehicleModelName(438), FormatMoney(GetDealerVehicleCost(438)),
			GetVehicleModelName(403), FormatMoney(GetDealerVehicleCost(403)),
			GetVehicleModelName(413), FormatMoney(GetDealerVehicleCost(413)),
			GetVehicleModelName(414), FormatMoney(GetDealerVehicleCost(414)),
			GetVehicleModelName(422), FormatMoney(GetDealerVehicleCost(422)),
			GetVehicleModelName(440), FormatMoney(GetDealerVehicleCost(440)),
			GetVehicleModelName(455), FormatMoney(GetDealerVehicleCost(455)),
			GetVehicleModelName(456), FormatMoney(GetDealerVehicleCost(456)),
			GetVehicleModelName(478), FormatMoney(GetDealerVehicleCost(478)),
			GetVehicleModelName(482), FormatMoney(GetDealerVehicleCost(482)),
			GetVehicleModelName(498), FormatMoney(GetDealerVehicleCost(498)),
			GetVehicleModelName(499), FormatMoney(GetDealerVehicleCost(499)),
			GetVehicleModelName(423), FormatMoney(GetDealerVehicleCost(423)),
			GetVehicleModelName(588), FormatMoney(GetDealerVehicleCost(588)),
			GetVehicleModelName(524), FormatMoney(GetDealerVehicleCost(524)),
			GetVehicleModelName(525), FormatMoney(GetDealerVehicleCost(525)),
			GetVehicleModelName(543), FormatMoney(GetDealerVehicleCost(543)),
			GetVehicleModelName(552), FormatMoney(GetDealerVehicleCost(552)),
			GetVehicleModelName(554), FormatMoney(GetDealerVehicleCost(554)),
			GetVehicleModelName(578), FormatMoney(GetDealerVehicleCost(578)),
			GetVehicleModelName(609), FormatMoney(GetDealerVehicleCost(609))
			//GetVehicleModelName(530), FormatMoney(GetDealerVehicleCost(530)) //fortklift
			);

			ShowPlayerDialog(playerid, DIALOG_BUYJOBCARSVEHICLE, DIALOG_STYLE_LIST, "Job Cars", str, "Buy", "Close");
		}
        case 5:
        {
			if(DealerData[dealerid][dealerStock] < 1)
				return Error(playerid, "This dealer is out of stock product.");

            new str[1024];
			format(str, sizeof(str), ""WHITE_E"%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n",
			GetVehicleModelName(414), FormatMoney(GetDealerVehicleCost(414)),
			GetVehicleModelName(499), FormatMoney(GetDealerVehicleCost(499)),
			GetVehicleModelName(498), FormatMoney(GetDealerVehicleCost(498)),
			GetVehicleModelName(455), FormatMoney(GetDealerVehicleCost(455)),
			GetVehicleModelName(524), FormatMoney(GetDealerVehicleCost(524)),
			GetVehicleModelName(578), FormatMoney(GetDealerVehicleCost(578)),
			GetVehicleModelName(403), FormatMoney(GetDealerVehicleCost(403)),
			GetVehicleModelName(514), FormatMoney(GetDealerVehicleCost(514)),
			GetVehicleModelName(515), FormatMoney(GetDealerVehicleCost(515))
			);

			ShowPlayerDialog(playerid, DIALOG_BUYTRUCKVEHICLE, DIALOG_STYLE_LIST, "Truck Dealership", str, "Buy", "Close");
		}
    }
    return 1;
}

GetDealerVehicleCost(carid)
{
	//Category Kendaraan Bike
	if(carid == 481) return 100;  //Bmx
	if(carid == 509) return 50; //Bike
	if(carid == 510) return 150; //Mt bike
	if(carid == 463) return 9000; //Freeway harley
	if(carid == 521) return 10500; //Fcr 900
	if(carid == 461) return 8000; //Pcj 600
	if(carid == 581) return 5000; //Bf
	if(carid == 468) return 6800; //Sancehz
	if(carid == 586) return 8500; //Wayfare
	if(carid == 462) return 3000; //Faggio

	//Category Kendaraan Cars
	if(carid == 445) return 10000; //Admiral
	if(carid == 496) return 20000; //Blista Compact
	if(carid == 401) return 15000; //Bravura
	if(carid == 518) return 14000; //Buccaneer
	if(carid == 527) return 13000; //Cadrona
	if(carid == 483) return 18000; //Camper
	if(carid == 542) return 13000; //Clover
	if(carid == 589) return 23000; //Club
	if(carid == 507) return 21000; //Elegant
	if(carid == 540) return 17000; //Vincent
	if(carid == 585) return 12000; //Emperor
	if(carid == 419) return 14000; //Esperanto
	if(carid == 526) return 23000; //Fortune
	if(carid == 466) return 15000; //Glendale
	if(carid == 492) return 16000; //Greenwood
	if(carid == 474) return 24000; //Hermes
	if(carid == 546) return 12000; //Intruder
	if(carid == 517) return 12000; //Majestic
	if(carid == 410) return 14000; //Manana
	if(carid == 551) return 16000; //Merit
	if(carid == 516) return 15000; //Nebula
	if(carid == 467) return 17000; //Oceanic
	if(carid == 404) return 10000; //Perenniel
	if(carid == 600) return 8000; //Picador
	if(carid == 426) return 18000; //Premier
	if(carid == 436) return 14000; //Previon
	if(carid == 547) return 12000; //Primo
	if(carid == 405) return 16000; //Sentinel
	if(carid == 458) return 23000; //Solair
	if(carid == 439) return 18000; //Stallion
	if(carid == 550) return 25000; //Sunrise
	if(carid == 566) return 13000; //Tahoma
	if(carid == 549) return 17000; //Tampa
	if(carid == 491) return 19000; //Virgo
	if(carid == 412) return 23000; //Voodoo
	if(carid == 421) return 21000; //Washington
	if(carid == 529) return 14000; //Willard
	if(carid == 555) return 44000; //Windsor
	if(carid == 580) return 43000; //Stafford
	if(carid == 475) return 50000; //Sabre
	if(carid == 545) return 55000; //Hustler

	//Category Kendaraan Lowriders
	if(carid == 536) return 23000; //Blade
	if(carid == 575) return 20000; //Broadway
	if(carid == 533) return 19000; //Feltzer
	if(carid == 534) return 36000; //Remington
	if(carid == 567) return 30000; //Savanna
	if(carid == 535) return 40000; //Slamvan
	if(carid == 576) return 27000; //Tornado
	if(carid == 566) return 13000; //Tahoma
	if(carid == 412) return 23000; //Voodoo

	//Category Kendaraan SUVS Cars
	if(carid == 579) return 28000; //Huntley
	if(carid == 400) return 22000; //Landstalker
	if(carid == 500) return 25000; //Mesa
	if(carid == 489) return 33000; //Rancher
	if(carid == 479) return 20000; //Regina
	if(carid == 482) return 19000; //Burrito
	if(carid == 418) return 15000; //Moonbeam
	if(carid == 413) return 17000; //Pony
	//if(carid == 554) return 18000; //Yosemite

	//Category Kendaraan Sports
	if(carid == 602) return 44000; //Alpha
	if(carid == 429) return 53000; //Banshee
	if(carid == 562) return 80000; //Elegy
	if(carid == 587) return 47000; //Euros
	if(carid == 565) return 51000; //Flash
	if(carid == 559) return 70000; //Jester
	if(carid == 561) return 62000; //Stratum
	if(carid == 560) return 85000; //Sultan
	if(carid == 506) return 75000; //Super GT
	if(carid == 558) return 70000; //Uranus
	if(carid == 477) return 70000; //Zr-350
	if(carid == 480) return 55000; //Comet

	//Category Kendaraan Non Dealer
	if(carid == 434) return 50000; //Hotknife
	if(carid == 502) return 50000; //Hotring Racer
	if(carid == 495) return 50000; //Sandking
	if(carid == 451) return 50000; //Turismo
	if(carid == 470) return 50000; //Patriot
	if(carid == 424) return 50000; //BF Injection
	if(carid == 522) return 50000; //Nrg
	if(carid == 411) return 50000; //Infernus
	if(carid == 541) return 50000; //Bullet
	if(carid == 504) return 50000; //Bloodring Banger
	if(carid == 603) return 50000; //Phoenix
	if(carid == 415) return 50000; //Cheetah
	if(carid == 402) return 50000; //Buffalo
	if(carid == 508) return 50000; //Journey
	if(carid == 457) return 50000; //Caddy
	if(carid == 471) return 50000; //Quad

	//Category Kendaraan Job
	if(carid == 420) return 7000; //Taxi
	if(carid == 438) return 6000; //Cabbie
	if(carid == 403) return 9000; //Linerunner
	if(carid == 414) return 8000; //Mule
	if(carid == 422) return 10000; //Bobcat
	if(carid == 440) return 8000; //Rumpo
	if(carid == 455) return 8000; //Flatbead
	if(carid == 456) return 9000; //Yankee
	if(carid == 478) return 7000; //Walton
	if(carid == 498) return 8000; //Boxville
	if(carid == 499) return 8000; //Benson
	if(carid == 514) return 19000; //Tanker
	if(carid == 515) return 19000; //Roadtrain
	if(carid == 524) return 19000; //Cement Truck
	if(carid == 525) return 9000; //Towtruck
	if(carid == 543) return 7500; //Sadler
	if(carid == 552) return 8000; //Utility Van
	if(carid == 554) return 18800; //Yosemite
	if(carid == 578) return 19000; //DFT-30
	if(carid == 609) return 8000; //Boxville
	if(carid == 423) return 5000; //Mr Whoopee/Ice cream
	if(carid == 588) return 8000; //Hotdog
 	return -1;
}

/* ============ [ Hook, Function goes here ] ============ */

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_BUYMOTORCYCLEVEHICLE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new modelid = 481;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 1:
				{
					new modelid = 509;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 2:
				{
					new modelid = 510;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 3:
				{
					new modelid = 462;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 4:
				{
					new modelid = 586;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 5:
				{
					new modelid = 581;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 6:
				{
					new modelid = 461;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 7:
				{
					new modelid = 521;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 8:
				{
					new modelid = 463;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 9:
				{
					new modelid = 468;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
			}
		}
	}
    if(dialogid == DIALOG_BUYCARSVEHICLE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new modelid = 400;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 1:
				{
					new modelid = 412;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 2:
				{
					new modelid = 419;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 3:
				{
					new modelid = 426;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 4:
				{
					new modelid = 436;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 5:
				{
					new modelid = 466;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 6:
				{
					new modelid = 467;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 7:
				{
					new modelid = 474;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 8:
				{
					new modelid = 475;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 9:
				{
					new modelid = 480;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 10:
				{
					new modelid = 603;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 11:
				{
					new modelid = 421;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 12:
				{
					new modelid = 602;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 13:
				{
					new modelid = 492;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 14:
				{
					new modelid = 545;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 15:
				{
					new modelid = 489;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 16:
				{
					new modelid = 405;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 17:
				{
					new modelid = 445;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 18:
				{
					new modelid = 579;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 19:
				{
					new modelid = 507;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
			}
		}
	}
	if(dialogid == DIALOG_BUYUCARSVEHICLE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new modelid = 483;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 1:
				{
					new modelid = 534;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 2:
				{
					new modelid = 535;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 3:
				{
					new modelid = 536;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 4:
				{
					new modelid = 558;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 5:
				{
					new modelid = 559;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 6:
				{
					new modelid = 560;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 7:
				{
					new modelid = 561;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 8:
				{
					new modelid = 562;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 9:
				{
					new modelid = 565;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 10:
				{
					new modelid = 567;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 11:
				{
					new modelid = 575;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 12:
				{
					new modelid = 576;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
			}
		}
	}
	if(dialogid == DIALOG_BUYJOBCARSVEHICLE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new modelid = 420;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 1:
				{
					new modelid = 438;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 2:
				{
					new modelid = 403;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 3:
				{
					new modelid = 413;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 4:
				{
					new modelid = 414;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 5:
				{
					new modelid = 422;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 6:
				{
					new modelid = 440;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 7:
				{
					new modelid = 455;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 8:
				{
					new modelid = 456;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 9:
				{
					new modelid = 478;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 10:
				{
					new modelid = 482;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 11:
				{
					new modelid = 498;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 12:
				{
					new modelid = 499;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 13:
				{
					new modelid = 423;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 14:
				{
					new modelid = 588;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 15:
				{
					new modelid = 524;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 16:
				{
					new modelid = 525;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 17:
				{
					new modelid = 543;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 18:
				{
					new modelid = 552;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 19:
				{
					new modelid = 554;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 20:
				{
					new modelid = 578;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 21:
				{
					new modelid = 609;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
			}
		}
	}
    if(dialogid == DIALOG_BUYTRUCKVEHICLE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new modelid = 414;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 1:
				{
					new modelid = 499;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 2:
				{
					new modelid = 498;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
                case 3:
				{
					new modelid = 455;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 4:
				{
					new modelid = 524;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 5:
				{
					new modelid = 578;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 6:
				{
					new modelid = 403;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 7:
				{
					new modelid = 514;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
				case 8:
				{
					new modelid = 515;
					new tstr[128], price = GetDealerVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_BUYDEALERCARS_CONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
				}
			}
		}
	}
	if(dialogid == DIALOG_BUYDEALERCARS_CONFIRM)
	{
		new modelid = pData[playerid][pBuyPvModel];
		foreach(new bid : Dealer)
		if(response)
		{
			if(modelid <= 0) return Error(playerid, "Invalid model id.");
			new cost = GetDealerVehicleCost(modelid);
			if(pData[playerid][pMoney] < cost)
			{
				Error(playerid, "Uang anda tidak mencukupi.!");
				return 1;
			}
			new count = 0, limit = MAX_PLAYER_VEHICLE + pData[playerid][pVip];
			foreach(new ii : PVehicles)
			{
				if(pvData[ii][cOwner] == pData[playerid][pID])
					count++;
			}
			if(count >= limit)
			{
				Error(playerid, "Slot kendaraan anda sudah penuh, silahkan jual beberapa kendaraan anda terlebih dahulu!");
				return 1;
			}
			GivePlayerMoneyEx(playerid, -cost);
			new dealerid = pData[playerid][pInDealer];
			new cQuery[1024];
			new Float:x,Float:y,Float:z, Float:a;
			new model, color1, color2;
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Purchase a vehicle at a dealership %s ", ReturnName(playerid), DealerData[dealerid][dealerName]);
			color1 = 1;
			color2 = 1;
			model = modelid;
			x = DealerData[dealerid][dealerPointX];
			y = DealerData[dealerid][dealerPointY];
			z = DealerData[dealerid][dealerPointZ];
			DealerData[dealerid][dealerMoney] += Server_Percent(cost);
			DealerData[dealerid][dealerStock]--;
			DealerSave(dealerid);
			DealerRefresh(dealerid);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "INSERT INTO `vehicle` (`owner`, `model`, `color1`, `color2`, `price`, `x`, `y`, `z`, `a`) VALUES (%d, %d, %d, %d, %d, '%f', '%f', '%f', '%f')", pData[playerid][pID], model, color1, color2, cost, x, y, z, a);
			mysql_tquery(g_SQL, cQuery, "OnVehDealer", "ddddddffff", playerid, pData[playerid][pID], model, color1, color2, cost, x, y, z, a);
			return 1;
		}
		else
		{
			pData[playerid][pBuyPvModel] = 0;
		}
	}
    if(dialogid == DIALOG_DEALER_MANAGE)
	{
		new dealerid = pData[playerid][pInDealer];
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new string[258];
					format(string, sizeof(string), "Dealer ID: %d\nDealer Name : %s\nDealer Location: %s\nDealership Vault: %s\nDealership Stock: %d",
					dealerid, DealerData[dealerid][dealerName], GetLocation(DealerData[dealerid][dealerPosX], DealerData[dealerid][dealerPosY], DealerData[dealerid][dealerPosZ]), FormatMoney(DealerData[dealerid][dealerMoney]), DealerData[dealerid][dealerStock]);

					ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_LIST, "Dealerhip Information", string, "Cancel", "");
				}
				case 1:
				{
					new string[218];
					format(string, sizeof(string), "Tulis Nama Dealer baru yang anda inginkan : ( Nama Dealer Lama %s )", DealerData[dealerid][dealerName]);
					ShowPlayerDialog(playerid, DIALOG_DEALER_NAME, DIALOG_STYLE_INPUT, "Dealership Change Name", string, "Select", "Cancel");
				}
				case 2:
				{
					ShowPlayerDialog(playerid, DIALOG_DEALER_VAULT, DIALOG_STYLE_LIST,"Dealership Vault","Dealership Deposit\nDealership Withdraw","Select","Cancel");
				}
				case 3:
				{
					if(DealerData[dealerid][dealerStock] > 100)
						return Error(playerid, "Dealership ini masih memiliki cukup produck.");
					if(DealerData[dealerid][dealerMoney] < 500000)
						return Error(playerid, "Setidaknya anda mempunyai uang dalam dealer anda senilai $5,000.00 untuk merestock product.");
					DealerData[dealerid][dealerRestock] = 1;
					Info(playerid, "Anda berhasil request untuk mengisi stock kendaraan kepada trucker, harap tunggu sampai pekerja trucker melayani.");
				}
			}
		}
		return 1;
	}
    if(dialogid == DIALOG_DEALER_NAME)
	{
		if(response)
		{
			new bid = pData[playerid][pInDealer];

			if(!PlayerOwnsDealership(playerid, pData[playerid][pInDealer])) return Error(playerid, "You don't own this Dealership.");

			if (isnull(inputtext))
			{
				new mstr[512];
				format(mstr,sizeof(mstr),""RED_E"NOTE: "WHITE_E"Nama Dealership tidak di perbolehkan kosong!\n\n"WHITE_E"Nama Dealership sebelumnya: %s\n\nMasukkan nama Dealer yang kamu inginkan\nMaksimal 32 karakter untuk nama Dealer", DealerData[bid][dealerName]);
				ShowPlayerDialog(playerid, DIALOG_DEALER_NAME, DIALOG_STYLE_INPUT,"Dealership Change Name", mstr,"Done","Back");
				return 1;
			}
			if(strlen(inputtext) > 32 || strlen(inputtext) < 5)
			{
				new mstr[512];
				format(mstr,sizeof(mstr),""RED_E"NOTE: "WHITE_E"Nama Dealership harus 5 sampai 32 kata.\n\n"WHITE_E"Nama Dealership sebelumnya: %s\n\nMasukkan nama Dealer yang kamu inginkan\nMaksimal 32 karakter untuk nama Dealer", DealerData[bid][dealerName]);
				ShowPlayerDialog(playerid, DIALOG_DEALER_NAME, DIALOG_STYLE_INPUT,"Dealership Change Name", mstr,"Done","Back");
				return 1;
			}
			format(DealerData[bid][dealerName], 32, ColouredText(inputtext));

			DealerRefresh(bid);
			DealerSave(bid);

			SendClientMessageEx(playerid, COLOR_LBLUE,"Dealer name set to: \"%s\".", DealerData[bid][dealerName]);
		}
		else return callcmd::dealermanage(playerid, "\0");
		return 1;
	}
    if(dialogid == DIALOG_DEALER_VAULT)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new mstr[512];
					format(mstr,sizeof(mstr),"Uang kamu: %s.\n\nMasukkan berapa banyak uang yang akan kamu simpan di dalam Dealership ini", FormatMoney(GetPlayerMoney(playerid)));
					ShowPlayerDialog(playerid, DIALOG_DEALER_DEPOSIT, DIALOG_STYLE_INPUT, "Dealer Deposit Input", mstr, "Deposit", "Cancel");
				}
				case 1:
				{
					new mstr[512];
					format(mstr,sizeof(mstr),"Dealer Vault: %s\n\nMasukkan berapa banyak uang yang akan kamu ambil di dalam Dealer ini", FormatMoney(DealerData[pData[playerid][pInDealer]][dealerMoney]));
					ShowPlayerDialog(playerid, DIALOG_DEALER_WITHDRAW, DIALOG_STYLE_INPUT,"Dealer Withdraw Input", mstr, "Withdraw","Cancel");
				}
			}
		}
	}
    if(dialogid == DIALOG_DEALER_WITHDRAW)
	{
		if(response)
		{
			new bid = pData[playerid][pInDealer];
			new amount = floatround(strval(inputtext));
			if(amount < 1 || amount > DealerData[bid][dealerMoney])
				return Error(playerid, "Invalid amount specified!");

			DealerData[bid][dealerMoney] -= amount;
			DealerSave(bid);

			GivePlayerMoneyEx(playerid, amount);

			Info(playerid, "You have withdrawn %s from the Dealership vault.", FormatMoney(strval(inputtext)));
		}
		else
			ShowPlayerDialog(playerid, DIALOG_DEALER_VAULT, DIALOG_STYLE_LIST,"Dealer Vault","Dealership Deposit\nDealership Withdraw","Next","Back");
		return 1;
	}
    if(dialogid == DIALOG_DEALER_DEPOSIT)
	{
		if(response)
		{
			new bid = pData[playerid][pInDealer];
			new amount = floatround(strval(inputtext));
			if(amount < 1 || amount > GetPlayerMoney(playerid))
				return Error(playerid, "Invalid amount specified!");

			DealerData[bid][dealerMoney] += amount;
			DealerSave(bid);

			GivePlayerMoneyEx(playerid, -amount);

			Info(playerid, "You have deposit %s into the Dealership vault.", FormatMoney(strval(inputtext)));
		}
		else
			ShowPlayerDialog(playerid, DIALOG_DEALER_VAULT, DIALOG_STYLE_LIST,"Dealership Vault","Dealership Deposit\nDealership Withdraw","Next","Back");
		return 1;
	}
	return 1;
}

function OnVehDealer(playerid, pid, model, color1, color2, cost, Float:x, Float:y, Float:z, Float:a)
{
	new i = Iter_Free(PVehicles);
	pvData[i][cID] = cache_insert_id();
	pvData[i][cOwner] = pid;
	pvData[i][cModel] = model;
	pvData[i][cColor1] = color1;
	pvData[i][cColor2] = color2;
	pvData[i][cPaintJob] = -1;
	pvData[i][cNeon] = 0;
	pvData[i][cTogNeon] = 0;
	pvData[i][cLocked] = 0;
	pvData[i][cInsu] = 3;
	pvData[i][cClaim] = 0;
	pvData[i][cClaimTime] = 0;
	pvData[i][cTicket] = 0;
	pvData[i][cPrice] = cost;
	pvData[i][cHealth] = 1000;
	pvData[i][cFuel] = 1000;
	format(pvData[i][cPlate], 16, "NoHave");
	pvData[i][cPlateTime] = 0;
	pvData[i][cPosX] = x;
	pvData[i][cPosY] = y;
	pvData[i][cPosZ] = z;
	pvData[i][cPosA] = a;
	pvData[i][cInt] = 0;
	pvData[i][cVw] = 0;
	pvData[i][cLumber] = -1;
	pvData[i][cMetal] = 0;
	pvData[i][cCoal] = 0;
	pvData[i][cProduct] = 0;
	pvData[i][cGasOil] = 0;
	for(new j = 0; j < 17; j++)
		pvData[i][cMod][j] = 0;
	Iter_Add(PVehicles, i);
	OnVehicleDealerRespawn(i);
	Servers(playerid, "Anda telah membeli kendaraan %s dengan harga %s", GetVehicleModelName(model), FormatMoney(GetDealerVehicleCost(model)));
	pData[playerid][pBuyPvModel] = 0;
	SetPlayerVirtualWorld(playerid, 0);
	return 1;
}

function OnVehicleDealerRespawn(i)
{
	pvData[i][cVeh] = CreateVehicle(pvData[i][cModel], pvData[i][cPosX], pvData[i][cPosY], pvData[i][cPosZ], pvData[i][cPosA], pvData[i][cColor1], pvData[i][cColor2], 60000);
	SetVehicleNumberPlate(pvData[i][cVeh], pvData[i][cPlate]);
	SetVehicleVirtualWorld(pvData[i][cVeh], pvData[i][cVw]);
	LinkVehicleToInterior(pvData[i][cVeh], pvData[i][cInt]);
	SetVehicleFuel(pvData[i][cVeh], pvData[i][cFuel]);
	if(pvData[i][cHealth] < 350.0)
	{
		SetValidVehicleHealth(pvData[i][cVeh], 350.0);
	}
	else
	{
		SetValidVehicleHealth(pvData[i][cVeh], pvData[i][cHealth]);
	}
	UpdateVehicleDamageStatus(pvData[i][cVeh], pvData[i][cDamage0], pvData[i][cDamage1], pvData[i][cDamage2], pvData[i][cDamage3]);
	if(pvData[i][cVeh] != INVALID_VEHICLE_ID)
    {
        if(pvData[i][cPaintJob] != -1)
        {
            ChangeVehiclePaintjob(pvData[i][cVeh], pvData[i][cPaintJob]);
        }
		for(new z = 0; z < 17; z++)
		{
			if(pvData[i][cMod][z]) AddVehicleComponent(pvData[i][cVeh], pvData[i][cMod][z]);
		}
		if(pvData[i][cLocked] == 1)
		{
			SwitchVehicleDoors(pvData[i][cVeh], true);
		}
		else
		{
			SwitchVehicleDoors(pvData[i][cVeh], false);
		}
	}
	return 1;
}

function OnDealerCreated(dealerid)
{
	DealerRefresh(dealerid);
	DealerSave(dealerid);
	return 1;
}

function LoadDealership()
{
    static bid;

	new rows = cache_num_rows(), owner[128], name[128];
 	if(rows)
  	{
		for(new i; i < rows; i++)
		{
			cache_get_value_name_int(i, "ID", bid);
			cache_get_value_name(i, "owner", owner);
			format(DealerData[bid][dealerOwner], 128, owner);
			cache_get_value_name(i, "name", name);
			format(DealerData[bid][dealerName], 128, name);
			cache_get_value_name_int(i, "type", DealerData[bid][dealerType]);
			cache_get_value_name_int(i, "price", DealerData[bid][dealerPrice]);
			cache_get_value_name_float(i, "posx", DealerData[bid][dealerPosX]);
			cache_get_value_name_float(i, "posy", DealerData[bid][dealerPosY]);
			cache_get_value_name_float(i, "posz", DealerData[bid][dealerPosZ]);
			cache_get_value_name_float(i, "posa", DealerData[bid][dealerPosA]);
			cache_get_value_name_int(i, "money", DealerData[bid][dealerMoney]);
			cache_get_value_name_int(i, "locked", DealerData[bid][dealerLocked]);
			cache_get_value_name_int(i, "stock", DealerData[bid][dealerStock]);
			cache_get_value_name_float(i, "pointx", DealerData[bid][dealerPointX]);
			cache_get_value_name_float(i, "pointy", DealerData[bid][dealerPointY]);
			cache_get_value_name_float(i, "pointz", DealerData[bid][dealerPointZ]);
			cache_get_value_name_int(i, "restock", DealerData[bid][dealerRestock]);
			DealerRefresh(bid);
			DealerPointRefresh(bid);
			Iter_Add(Dealer, bid);
		}
		printf("[Dynamic Dealership] Number of Loaded: %d.", rows);
	}
}


ptask PlayerDealerUpdate[1000](playerid)
{
	foreach(new vid : Dealer)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, DealerData[vid][dealerPosX], DealerData[vid][dealerPosY], DealerData[vid][dealerPosZ]))
		{
			pData[playerid][pInDealer] = vid;
			/*Info(playerid, "DEBUG MESSAGE: Kamu berada di dekat Dealer ID %d", vid);*/
		}
	}
	return 1;
}
