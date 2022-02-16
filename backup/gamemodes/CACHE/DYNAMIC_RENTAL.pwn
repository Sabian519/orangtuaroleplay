// Rental Dynamic
#include <YSI_Coding\y_hooks>

#define MAX_RENT 5

enum RentVariabel
{
	rentType,
	Float:rentPosX,
	Float:rentPosY,
	Float:rentPosZ,
	Float:rentPosA,
	Float:rentPointX,
	Float:rentPointY,
	Float:rentPointZ,
	Float:rentPointA,

	// Hooked by Rent Refresh
	rentPickup,
	rentPickupPoint,
	rentMap,
	Text3D:rentLabel,
	Text3D:rentPointLabel,
};

new RentData[MAX_RENT][RentVariabel];
new Iterator:Rent<MAX_RENT>;

// Commands Rented
CMD:rentcreate(playerid, params[])
{
	if(pData[playerid][pAdmin] < 6)
		return PermissionError(playerid);

	new query[512];
	new rentid = Iter_Free(Rent);

	new type;
	if(sscanf(params, "dd", type))
		return Usage(playerid, "/rentcreate [1.Bikes Type | 2.Trucker Type]");

	if(rentid == -1)
		return Error(playerid, "You cant create more Rentel vehicle");

	if((rentid < 0 || rentid >= MAX_RENT))
        return Error(playerid, "You have already input 15 rental vehicles in this server.");

	if(type > 2 || type < 0)
		return Error(playerid, "Invalid rental type Type");

	GetPlayerPos(playerid, RentData[rentid][rentPosX], RentData[rentid][rentPosY], RentData[rentid][rentPosZ]);
	GetPlayerFacingAngle(playerid, RentData[rentid][rentPosA]);

	RentData[rentid][rentType] = type;

	GetLocation(RentData[rentid][rentPosX], RentData[rentid][rentPosY], RentData[rentid][rentPosZ]);

	Iter_Add(Rent, rentid);

	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO rent SET ID='%d', type='%d', posx='%f', posy='%f', posz='%f', posa='%f'", rentid, RentData[rentid][rentType], RentData[rentid][rentPosX], RentData[rentid][rentPosY], RentData[rentid][rentPosZ], RentData[rentid][rentPosA]);
	mysql_tquery(g_SQL, query, "OnRentCreated", "i", rentid);
	return 1;
}

CMD:rentedit(playerid, params[])
{
    static
        did,
        type[24],
        string[128];

    if(pData[playerid][pAdmin] < 6)
        return PermissionError(playerid);

    if(sscanf(params, "ds[24]S()[128]", did, type, string))
    {
        Usage(playerid, "/rentedit [id] [option]");
        SendClientMessage(playerid, COLOR_YELLOW, "OPTION: "X1_BLUE"[lokasi], [point], [type]");
        return 1;
    }
    if((did < 0 || did > MAX_RENT))
        return Error(playerid, "You have specified an invalid ID.");

	if(!Iter_Contains(Rent, did)) return Error(playerid, "The rented you specified ID of doesn't exist.");

    if(!strcmp(type, "lokasi", true))
    {
		GetPlayerPos(playerid, RentData[did][rentPosX], RentData[did][rentPosY], RentData[did][rentPosZ]);
		GetPlayerFacingAngle(playerid, RentData[did][rentPosA]);
        RentSave(did);
		RentRefresh(did);

        SendAdminMessage(ARWIN, "EDIT: "RED_E"%s "YELLOW_E"Adjust Location Rented ID: %d.", pData[playerid][pAdminname], did);
    }
	else if(!strcmp(type, "type", true))
    {
        new dtype;

        if(sscanf(string, "d", dtype))
            return Usage(playerid, "/rentedit [id] [Type] [1.Truck] [2.Bikes]");

        RentData[did][rentType] = dtype;
        RentSave(did);
		RentRefresh(did);
        SendAdminMessage(ARWIN, "EDIT: "RED_E"%s "YELLOW_E"Adjust Type Of The Rented ID: %d to %d.", pData[playerid][pAdminname], did, dtype);
    }
	else if(!strcmp(type, "point", true))
    {
		new Float:x, Float:y, Float:z, Float:a;
        GetPlayerPos(playerid, x, y, z);
        GetPlayerFacingAngle(playerid, Float:a);
		RentData[did][rentPointX] = x;
		RentData[did][rentPointY] = y;
		RentData[did][rentPointZ] = z;
		RentSave(did);
		RentPointRefresh(did);
        SendAdminMessage(ARWIN, "EDIT: "RED_E"%s "YELLOW_E"Adjust Point Of The Rented ID: %d.", pData[playerid][pAdminname], did);
    }
    return 1;
}

CMD:deleterent(playerid, params[])
{
	if(pData[playerid][pAdmin] < 6)
		return PermissionError(playerid);

	new bid;

	if(sscanf(params, "d", bid))
		return Usage(playerid, "/deleterent [id]");

	if(bid < 0 || bid >= MAX_RENT)
        return Error(playerid, "You have specified an invalid ID.");

	if(!Iter_Contains(Rent, bid))
		return Error(playerid, "The rentals you specified ID of doesn't exist.");

	RentReset(bid);

	DestroyDynamic3DTextLabel(RentData[bid][rentLabel]);
	DestroyDynamic3DTextLabel(RentData[bid][rentPointLabel]);

    DestroyDynamicPickup(RentData[bid][rentPickup]);
    DestroyDynamicPickup(RentData[bid][rentPickupPoint]);

	RentData[bid][rentPosX] = 0;
	RentData[bid][rentPosY] = 0;
	RentData[bid][rentPosZ] = 0;
	RentData[bid][rentPosA] = 0;
	RentData[bid][rentPointX] = 0;
	RentData[bid][rentPointY] = 0;
	RentData[bid][rentPointZ] = 0;
	RentData[bid][rentLabel] = Text3D:INVALID_3DTEXT_ID;
	RentData[bid][rentPointLabel] = Text3D:INVALID_3DTEXT_ID;
	RentData[bid][rentPickup] = -1;
	RentData[bid][rentPickupPoint] = -1;

	Iter_Remove(Rent, bid);
	new query[128];
	mysql_format(g_SQL, query, sizeof(query), "DELETE FROM rent WHERE ID=%d", bid);
	mysql_tquery(g_SQL, query);
    SendAdminMessage(ARWIN, "REMOVE: "RED_E"%s "X1_BLUE"has delete Rentals vehicles ID: %d.", pData[playerid][pAdminname], bid);
    return 1;
}

CMD:gotorent(playerid, params[])
{
	if(pData[playerid][pAdmin] < 6)
		return PermissionError(playerid);

	new bid;

	if(sscanf(params, "d", bid))
		return Usage(playerid, "/gotorent [id]");

	if(bid < 0 || bid >= MAX_RENT)
        return Error(playerid, "You have specified an invalid ID.");

	if(!Iter_Contains(Rent, bid))
		return Error(playerid, "The rentals you specified ID of doesn't exist.");

	SetPlayerPos(playerid, RentData[bid][rentPosX], RentData[bid][rentPosY], RentData[bid][rentPosZ]);
	SetPlayerFacingAngle(playerid, RentData[bid][rentPosA]);

    SendClientMessageEx(playerid, ARWIN, "TELEPORT: "YELLOW_E"You has teleport to Rentals Vehicles id %d", bid);
    return 1;
}

CMD:rentveh(playerid, params[])
{
	foreach(new rentid : Rent)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.8, RentData[rentid][rentPosX], RentData[rentid][rentPosY], RentData[rentid][rentPosZ]) && RentData[rentid][rentPointX] != 0.0 && RentData[rentid][rentPointY] != 0.0 && RentData[rentid][rentPointZ] != 0.0)
		{
			RentBuyVehicle(playerid, rentid);
		}
	}
	return 1;
}

CMD:unrentveh(playerid, params[])
{
	new vehid, rentid;
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, RentData[rentid][rentPosX], RentData[rentid][rentPosY], RentData[rentid][rentPosZ])) return Error(playerid, "You must in rental center!");
	if(sscanf(params, "d", vehid)) return Usage(playerid, "/unrentveh [vehid]");
	if(vehid == INVALID_VEHICLE_ID) return Error(playerid, "Invalid id");

	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				if(pvData[i][cRent] != 0)
				{
					Info(playerid, "You has unrental the vehicle id %d (database id: %d).", vehid, pvData[i][cID]);
					new query[128];
					mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[i][cID]);
					mysql_tquery(g_SQL, query);
					if(IsValidVehicle(pvData[i][cVeh])) DestroyVehicle(pvData[i][cVeh]);
					pvData[i][cVeh] = INVALID_VEHICLE_ID;
					Iter_SafeRemove(PVehicles, i, i);
				}
				else return Error(playerid, "This is not rental vehicle! use /sellpv for sell owned vehicle.");
			}
			else return Error(playerid, "ID kendaraan ini bukan punya mu! gunakan /v my(/mypv) untuk mencari ID.");
		}
	}
	return 1;
}

/* ============ [ Stock goes here ] ============ */

RentSave(id)
{
	new cQuery[2248];
	format(cQuery, sizeof(cQuery), "UPDATE rent SET type='%d', posx='%f', posy='%f', posz='%f', posa='%f', pointx='%f', pointy='%f', pointz='%f' WHERE ID='%d'",
	RentData[id][rentType],
	RentData[id][rentPosX],
	RentData[id][rentPosY],
	RentData[id][rentPosZ],
	RentData[id][rentPosA],
	RentData[id][rentPointX],
	RentData[id][rentPointY],
	RentData[id][rentPointZ],
	id
	);
	return mysql_tquery(g_SQL, cQuery);
}

RentPointRefresh(id)
{
	if(id != -1)
	{
		if(IsValidDynamic3DTextLabel(RentData[id][rentPointLabel]))
        DestroyDynamic3DTextLabel(RentData[id][rentPointLabel]);

    	if(IsValidDynamicPickup(RentData[id][rentPickupPoint]))
        	DestroyDynamicPickup(RentData[id][rentPickupPoint]);

		new tstr[218];
		if(RentData[id][rentPointX] != 0 && RentData[id][rentPointY] != 0 && RentData[id][rentPointZ] != 0)
		{
			format(tstr, sizeof(tstr), "[ID: %d]\n"WHITE_E"Rentals Vehicle Spawn Point", id);
			RentData[id][rentPointLabel] = CreateDynamic3DTextLabel(tstr, ARWIN, RentData[id][rentPointX], RentData[id][rentPointY], RentData[id][rentPointZ], 5.0);
        	RentData[id][rentPickupPoint] = CreateDynamicPickup(1239, 23, RentData[id][rentPointX], RentData[id][rentPointY], RentData[id][rentPointZ]);
		}
		else if(RentData[id][rentPointX], RentData[id][rentPointY], RentData[id][rentPointZ] != 0)
		{
			format(tstr, sizeof(tstr), "[ID: %d]\n"WHITE_E"Rentals Vehicle Spawn Point", id);
			RentData[id][rentPointLabel] = CreateDynamic3DTextLabel(tstr, ARWIN, RentData[id][rentPointX], RentData[id][rentPointY], RentData[id][rentPointZ], 5.0);
        	RentData[id][rentPickupPoint] = CreateDynamicPickup(1239, 23, RentData[id][rentPointX], RentData[id][rentPointY], RentData[id][rentPointZ]);
		}
	}
}

RentRefresh(id)
{
	if(id != -1)
	{
		if(IsValidDynamic3DTextLabel(RentData[id][rentLabel]))
            DestroyDynamic3DTextLabel(RentData[id][rentLabel]);

        if(IsValidDynamicPickup(RentData[id][rentPickup]))
            DestroyDynamicPickup(RentData[id][rentPickup]);

        DestroyDynamicMapIcon(bData[id][bMap]);

        new type[128];
		if(RentData[id][rentType] == 1)
		{
			type= "Rental Bikes";
		}
		else if(RentData[id][rentType] == 2)
		{
			type= "Rental Trucker";
		}
		else
		{
			type= "Unknown";
		}

		new tstr[218];
		if(RentData[id][rentPosX] != 0 && RentData[id][rentPosY] != 0 && RentData[id][rentPosZ])
		{
			format(tstr, sizeof(tstr), "[ID: %d]\nuse '/rentveh' to rental vehicles\nuse '/unrentveh' to unrental your vehicle", id, type);
			RentData[id][rentLabel] = CreateDynamic3DTextLabel(tstr, COLOR_WHITE, RentData[id][rentPosX], RentData[id][rentPosY], RentData[id][rentPosZ], 5.0);
            RentData[id][rentPickup] = CreateDynamicPickup(1239, 23, RentData[id][rentPosX], RentData[id][rentPosY], RentData[id][rentPosZ]);
		}
		
        if(RentData[id][rentType] == 1)
		{
			RentData[id][rentMap] = CreateDynamicMapIcon(RentData[id][rentPosX], RentData[id][rentPosY], RentData[id][rentPosZ], 55, -1, -1, -1, -1, 70.0);
		}
		else if(RentData[id][rentType] == 2)
		{
			RentData[id][rentMap] = CreateDynamicMapIcon(RentData[id][rentPosX], RentData[id][rentPosY], RentData[id][rentPosZ], 55, -1, -1, -1, -1, 70.0);
		}
		else
		{
			DestroyDynamicMapIcon(RentData[id][rentMap]);
		}
		//printf("DEBUG: Rentals Refresh Called on Rental ID %d", id);
	}
}

RentReset(id)
{
	DestroyDynamicPickup(RentData[id][rentPickup]);
	DestroyDynamicPickup(RentData[id][rentPickupPoint]);
	RentRefresh(id);
}

RentBuyVehicle(playerid, rentid)
{
	if(rentid <= -1 )
        return 0;

    switch(RentData[rentid][rentType])
    {
        case 1:
        {
            new str[1024];
			format(str, sizeof(str), ""YELLOW_E"%s\t"LG_E"%s\n"YELLOW_E"%s\t"LG_E"%s\n"YELLOW_E"%s\t"LG_E"%s\n"YELLOW_E"%s\t"LG_E"%s\n"YELLOW_E"%s\t"LG_E"%s\n"YELLOW_E"%s\t"LG_E"%s\n\n",
			GetVehicleModelName(481), FormatMoney(GetRentVehicleCost(481)),
			GetVehicleModelName(509), FormatMoney(GetRentVehicleCost(509)),
			GetVehicleModelName(510), FormatMoney(GetRentVehicleCost(510)),
			GetVehicleModelName(462), FormatMoney(GetRentVehicleCost(462)),
			GetVehicleModelName(463), FormatMoney(GetRentVehicleCost(463)),
			GetVehicleModelName(586), FormatMoney(GetRentVehicleCost(586))
			);

			ShowPlayerDialog(playerid, DIALOG_RENTAL_BIKE, DIALOG_STYLE_LIST, "Rental Vehicles(Bikes)", str, "Rental", "Close");
		}
        case 2:
        {
            new str[1024];
			format(str, sizeof(str), ""WHITE_E"%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n%s\t"LG_E"%s\n",
			GetVehicleModelName(414), FormatMoney(GetRentVehicleCost(414)),
			GetVehicleModelName(499), FormatMoney(GetRentVehicleCost(499)),
			GetVehicleModelName(498), FormatMoney(GetRentVehicleCost(498)),
			GetVehicleModelName(455), FormatMoney(GetRentVehicleCost(455)),
			GetVehicleModelName(428), FormatMoney(GetRentVehicleCost(428)),
			GetVehicleModelName(578), FormatMoney(GetRentVehicleCost(578)),
			GetVehicleModelName(403), FormatMoney(GetRentVehicleCost(403)),
			GetVehicleModelName(514), FormatMoney(GetRentVehicleCost(514)),
			GetVehicleModelName(515), FormatMoney(GetRentVehicleCost(515))
			);

			ShowPlayerDialog(playerid, DIALOG_RENTAL_TRUCKER, DIALOG_STYLE_LIST, "Rental Trucker", str, "Rental", "Close");
		}
    }
    return 1;
}

GetRentVehicleCost(carid)
{
	//Category Kendaraan Bikes/Motor
    if(carid == 481) return 3500;  //Bmx
	if(carid == 509) return 3000; //Bike
	if(carid == 510) return 4500; //Mt bike
	if(carid == 463) return 8500; //Freeway harley
	if(carid == 586) return 7000; //Wayfare
	if(carid == 462) return 6500; //Faggio

	//Category Kendaraan Trucker
    if(carid == 414) return 30000;  //
	if(carid == 499) return 29500; //
	if(carid == 498) return 28700; //
	if(carid == 455) return 29900; //
	if(carid == 428) return 32000; //
	if(carid == 578) return 34500; //
    if(carid == 403) return 35000;  //
	if(carid == 514) return 30000; //
	if(carid == 515) return 37500; //
 	return -1;
}

/* ============ [ Hook, Function goes here ] ============ */

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_RENTAL_BIKE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new modelid = 481;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_BIKECONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 1:
				{
					new modelid = 509;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_BIKECONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 2:
				{
					new modelid = 510;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_BIKECONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 3:
				{
					new modelid = 462;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_BIKECONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 4:
				{
					new modelid = 463;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_BIKECONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 5:
				{
					new modelid = 586;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_BIKECONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
			}
		}
	}
    if(dialogid == DIALOG_RENTAL_TRUCKER)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new modelid = 414;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_TRUCKCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 1:
				{
					new modelid = 499;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_TRUCKCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 2:
				{
					new modelid = 498;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_TRUCKCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 3:
				{
					new modelid = 455;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_TRUCKCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 4:
				{
					new modelid = 528;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_TRUCKCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 5:
				{
					new modelid = 578;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_TRUCKCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 6:
				{
					new modelid = 403;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_TRUCKCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 7:
				{
					new modelid = 514;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_TRUCKCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
				case 8:
				{
					new modelid = 515;
					new tstr[1280], price = GetRentVehicleCost(modelid);
					pData[playerid][pBuyPvModel] = modelid;
					format(tstr, sizeof(tstr), ""YELLOW_E"You will a rent vehicle\n"X1_BLUE"Cars Model: "PINK_E"%s\n"X1_BLUE"Price: "LG_E"$%d\n"X1_BLUE"Durations: "RED_E"24 Hours\n\n"YELLOW_E"Please tap Confirm for Rental Vehicles", GetVehicleModelName(modelid), FormatMoney(price));
					ShowPlayerDialog(playerid, DIALOG_RENTAL_TRUCKCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Confirmations", tstr, "Confirm", "Cancel");
				}
			}
		}
	}
	if(dialogid == DIALOG_RENTAL_BIKECONFIRM)
	{
		new modelid = pData[playerid][pBuyPvModel];
		foreach(new bid : Rent)
		if(response)
		{
			if(modelid <= 0) return Error(playerid, "Invalid model id.");
			new cost = GetRentVehicleCost(modelid);
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
			new rentid = pData[playerid][pInRent];
			new cQuery[1024];
			new Float:x,Float:y,Float:z, Float:a;
			new model, color1, color2, rental;
			
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Rental Vehicles in Rental Center", ReturnName(playerid));
			color1 = 1;
			color2 = 1;
			model = modelid;
			x = RentData[rentid][rentPointX];
			y = RentData[rentid][rentPointY];
			z = RentData[rentid][rentPointZ];
			RentSave(bid);
			RentRefresh(bid);
			rental = gettime() + (1 * 86400);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "INSERT INTO `vehicle` (`owner`, `model`, `color1`, `color2`, `price`, `x`, `y`, `z`, `a`, `rental`) VALUES (%d, %d, %d, %d, %d, '%f', '%f', '%f', '%f', '%d')", pData[playerid][pID], model, color1, color2, cost, x, y, z, a, rental);
			mysql_tquery(g_SQL, cQuery, "OnVehRent", "ddddddffffd", playerid, pData[playerid][pID], model, color1, color2, cost, x, y, z, a, rental);
			return 1;
		}
		else
		{
			pData[playerid][pBuyPvModel] = 0;
		}
	}
	if(dialogid == DIALOG_RENTAL_TRUCKCONFIRM)
	{
		new modelid = pData[playerid][pBuyPvModel];
		foreach(new bid : Rent)
		if(response)
		{
			if(modelid <= 0) return Error(playerid, "Invalid model id.");
			new cost = GetRentVehicleCost(modelid);
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
			new rentid = pData[playerid][pInRent];
			new cQuery[1024];
			new Float:x,Float:y,Float:z, Float:a;
			new model, color1, color2, rental;

			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Rental Vehicles in Rental Center", ReturnName(playerid));
			color1 = 1;
			color2 = 1;
			model = modelid;
			x = RentData[rentid][rentPointX];
			y = RentData[rentid][rentPointY];
			z = RentData[rentid][rentPointZ];
			RentSave(bid);
			RentRefresh(bid);
			rental = gettime() + (1 * 86400);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "INSERT INTO `vehicle` (`owner`, `model`, `color1`, `color2`, `price`, `x`, `y`, `z`, `a`, `rental`) VALUES (%d, %d, %d, %d, %d, '%f', '%f', '%f', '%f', '%d')", pData[playerid][pID], model, color1, color2, cost, x, y, z, a, rental);
			mysql_tquery(g_SQL, cQuery, "OnVehRent", "ddddddffffd", playerid, pData[playerid][pID], model, color1, color2, cost, x, y, z, a, rental);
			return 1;
		}
		else
		{
			pData[playerid][pBuyPvModel] = 0;
		}
	}
	return 1;
}

function OnVehRent(playerid, pid, model, color1, color2, cost, Float:x, Float:y, Float:z, Float:a, rental)
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
	pvData[i][cRent] = rental;
	pvData[i][cPark] = -1;
	for(new j = 0; j < 17; j++)
		pvData[i][cMod][j] = 0;
	Iter_Add(PVehicles, i);
	OnVehicleRentRespawn(i);
	Servers(playerid, "Anda telah membeli kendaraan %s dengan harga %s", GetVehicleModelName(model), FormatMoney(GetRentVehicleCost(model)));
	pData[playerid][pBuyPvModel] = 0;
	SetPlayerVirtualWorld(playerid, 0);
	return 1;
}

function OnVehicleRentRespawn(i)
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

function OnRentCreated(rentid)
{
	RentRefresh(rentid);
	RentSave(rentid);
	return 1;
}

function LoadRentship()
{
    static bid;

	new rows = cache_num_rows();
 	if(rows)
  	{
		for(new i; i < rows; i++)
		{
			cache_get_value_name_int(i, "ID", bid);
			cache_get_value_name_int(i, "type", RentData[bid][rentType]);
			cache_get_value_name_float(i, "posx", RentData[bid][rentPosX]);
			cache_get_value_name_float(i, "posy", RentData[bid][rentPosY]);
			cache_get_value_name_float(i, "posz", RentData[bid][rentPosZ]);
			cache_get_value_name_float(i, "posa", RentData[bid][rentPosA]);
			cache_get_value_name_float(i, "pointx", RentData[bid][rentPointX]);
			cache_get_value_name_float(i, "pointy", RentData[bid][rentPointY]);
			cache_get_value_name_float(i, "pointz", RentData[bid][rentPointZ]);
			RentRefresh(bid);
			RentPointRefresh(bid);
			Iter_Add(Rent, bid);
		}
		printf("[Dynamic Rental] Number of Loaded: %d.", rows);
	}
}


ptask PlayerRentUpdate[1000](playerid)
{
	foreach(new vid : Rent)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, RentData[vid][rentPosX], RentData[vid][rentPosY], RentData[vid][rentPosZ]))
		{
			pData[playerid][pInRent] = vid;
			/*Info(playerid, "DEBUG MESSAGE: Kamu berada di dekat Rent ID %d", vid);*/
		}
	}
	return 1;
}

