CreateJoinTruckPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, -77.38, -1136.52, 1.07, -1);
	format(strings, sizeof(strings), "[TRUCKER JOBS]\n{FFFFFF}/joinjob to join");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -77.38, -1136.52, 1.07, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // truck
}

//Container CheckPoint Defines Variable
#define containerpoint1 -1733.8103,187.5354,3.5547
#define containerpoint2 2869.1934,917.6111,10.7500

// Variables Trailer
new TrailerHauling[MAX_PLAYERS];

//Mission
GetRestockBisnis()
{
	new tmpcount;
	foreach(new id : Bisnis)
	{
	    if(bData[id][bRestock] == 1)
	    {
     		tmpcount++;
		}
	}
	return tmpcount;
}

ReturnRestockBisnisID(slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_BISNIS) return -1;
	foreach(new id : Bisnis)
	{
	    if(bData[id][bRestock] == 1)
	    {
     		tmpcount++;
       		if(tmpcount == slot)
       		{
        		return id;
  			}
	    }
	}
	return -1;
}

//Hauling
GetRestockGStation()
{
	new tmpcount;
	foreach(new id : GStation)
	{
	    if(gsData[id][gsStock] < 7000)
	    {
     		tmpcount++;
		}
	}
	return tmpcount;
}

ReturnRestockGStationID(slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_GSTATION) return -1;
	foreach(new id : GStation)
	{
	    if(gsData[id][gsStock] < 7000)
	    {
     		tmpcount++;
       		if(tmpcount == slot)
       		{
        		return id;
  			}
	    }
	}
	return -1;
}

//Dealership Hauling
GetRestockDealer()
{
	new tmpcount;
	foreach(new id : Dealer)
	{
	    if(DealerData[id][dealerRestock] == 1)
	    {
     		tmpcount++;
		}
	}
	return tmpcount;
}

ReturnRestockDealerID(slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_DEALERSHIP) return -1;
	foreach(new id : Dealer)
	{
	    if(DealerData[id][dealerRestock] == 1)
	    {
     		tmpcount++;
       		if(tmpcount == slot)
       		{
        		return id;
  			}
	    }
	}
	return -1;
}

//Mission Commands
CMD:mission(playerid, params[])
{
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		ShowPlayerDialog(playerid, DIALOG_LIST_HAULING, DIALOG_STYLE_LIST, "Trucker Hauking List", "Busines Restock Hauling\nDealership Restock\nGas Stations\nContainer", "Select", "Close");
		return 1;
	}
	return Error(playerid, "You are not trucker driver jobs");
}

CMD:storeproduct(playerid, params[])
{
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		new bid = pData[playerid][pMission], vehicleid = GetPlayerVehicleID(playerid), carid = -1, total, Float:percent, pay, convert;
		if(bid == -1) return Error(playerid, "You dont have mission.");
		if(IsPlayerInRangeOfPoint(playerid, 10.8, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && !IsATruck(vehicleid)) return Error(playerid, "Anda harus mengendarai truck.");
			if(VehProduct[vehicleid] < 1) return Error(playerid, "Product is empty in this vehicle.");
			total = VehProduct[vehicleid] * ProductPrice;
			percent = (total / 100) * 100;
			convert = floatround(percent, floatround_floor);
			pay = total + convert;
			bData[bid][bProd] += VehProduct[vehicleid];
			bData[bid][bMoney] -= pay;
			Info(playerid, "Anda menjual "RED_E"%d "WHITE_E"product dengan seharga "GREEN_E"%s", VehProduct[vehicleid], FormatMoney(pay));
			GivePlayerMoneyEx(playerid, pay);
			AddPlayerSalary(playerid, ""RED_E"TAX(Business)", -2754);
			if((carid = Vehicle_Nearest(playerid)) != -1)
			{
				pvData[carid][cProduct] = 0;
				Info(playerid, "Anda mendapatkan uang 20 percent dari hasil stock product anda.");
			}
			VehProduct[vehicleid] = 0;
			pData[playerid][pMission] = -1;
			pData[playerid][pTruckerTime] = 3750;
		}
		else return Error(playerid, "Anda harus berada didekat dengan bisnis mission anda.");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}

//Hauling Commands
CMD:storegas(playerid, params[])
{
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		new id = pData[playerid][pHauling], vehicleid = GetPlayerVehicleID(playerid), carid = -1, total, Float:percent, pay, convert;
		if(id == -1) return Error(playerid, "You dont have hauling.");
		if(IsPlayerInRangeOfPoint(playerid, 15.5, gsData[id][gsPosX], gsData[id][gsPosY], gsData[id][gsPosZ]))
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && !IsAHaulTruck(vehicleid)) return Error(playerid, "Anda harus mengendarai truck.");
			if(!IsTrailerAttachedToVehicle(vehicleid)) return Error(playerid, "Your Vehicle Trailer is not even attached");
			DetachTrailerFromVehicle(vehicleid);

			DestroyVehicle(GetVehicleTrailer(vehicleid));
			pData[playerid][pTrailer] = INVALID_VEHICLE_ID;

			if(VehGasOil[vehicleid] < 1) return Error(playerid, "GasOil is empty in this vehicle.");
			total = VehGasOil[vehicleid] * GasOilPrice;
			percent = (total / 100) * 150;
			AddPlayerSalary(playerid, ""RED_E"TAX(GasStation)", -2500);
			convert = floatround(percent, floatround_ceil);
			pay = total + convert;
			gsData[id][gsStock] += VehGasOil[vehicleid];
			Server_MinMoney(pay);
			Info(playerid, "Anda menjual "RED_E"%d "WHITE_E"liters gas oil dengan seharga "GREEN_E"%s", VehGasOil[vehicleid], FormatMoney(pay));
			GivePlayerMoneyEx(playerid, pay);
			if((carid = Vehicle_Nearest2(playerid)) != -1)
			{
				pvData[carid][cGasOil] = 0;
				Info(playerid, "Anda mendapatkan uang 20 percent dari hasil stock liters gas oil anda.");
			}
			VehGasOil[vehicleid] = 0;
			pData[playerid][pHauling] = -1;
			pData[playerid][pTruckerTime] = 3800;
			GStation_Refresh(id);
			GStation_Save(id);
		}
		else return Error(playerid, "Anda harus berada didekat dengan gas oil hauling anda.");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}

// Hauling Vehicles
CMD:dealermission(playerid)
{
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
    	if(pData[playerid][pTruckerTime] > 0)
		{
	    	Error(playerid, "You must be waiting "X1_BLUE"%d "GREY_E"second again.", pData[playerid][pTruckerTime]);
	    	return 1;
		}
		if(GetRestockDealer() <= 0) return Error(playerid, "The hauling mission is currently empty.");
		new id, count = GetRestockDealer(), dealermission[128], type[32], lstr[512];

		strcat(dealermission,"No\tDealerID\tDealerType\tDealerName\n",sizeof(dealermission));
		Loop(itt, (count + 1), 1)
		{
			id = ReturnRestockDealerID(itt);
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
				type= "Job Cars";
			}
			else if(DealerData[id][dealerType] == 5)
			{
				type= "Truck";
			}
			else
			{
				type= "Unknow";
			}
			if(itt == count)
			{
				format(lstr,sizeof(lstr), "%d\t%d\t%s\t%s\n", itt, id, type, DealerData[id][dealerName]);
			}
			else format(lstr,sizeof(lstr), "%d\t%d\t%s\t%s\n", itt, id, type, DealerData[id][dealerName]);
			strcat(dealermission,lstr,sizeof(dealermission));
		}
		ShowPlayerDialog(playerid, DIALOG_DEALER_RESTOCK, DIALOG_STYLE_TABLIST_HEADERS,"Dealership Mission",dealermission,"Start","Cancel");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}

alias:storevehicle("storeveh", "storedealer")
CMD:storevehicle(playerid, params[])
{
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		new bid = pData[playerid][pDealerMission], vehicleid = GetPlayerVehicleID(playerid);
		if(bid == -1) return Error(playerid, "You dont have dealermission.");
		if(!IsPlayerInRangeOfPoint(playerid, 15.5, DealerData[bid][dealerPointX], DealerData[bid][dealerPointY], DealerData[bid][dealerPointZ])) return Error(playerid, "You must be near in a dealership point");

		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && !IsATruck(vehicleid)) return Error(playerid, "Anda harus mengendarai truck.");
		DealerData[bid][dealerMoney] -= 500000;
	    new String[10000];
	    new task_dealership = Random(800, 2000);
	    format(String, sizeof String, "JOB: "YELLOW_E"Your "LG_E"succesfully "YELLOW_E"restocked dealership busines and takes payment in "X1_BLUE"/mysalary "RED_E"Task: "LG_E"$%s", FormatMoney(task_dealership));
        SendClientMessage(playerid, COLOR_LOGS, String);
		AddPlayerSalary(playerid, "Trucker Drivers(Dealership)", 35000);
		AddPlayerSalary(playerid, "Bonus Jobs(Trucker Dealership)", 500);
		AddPlayerSalary(playerid, ""RED_E"TAX(Dealership)", -5000);
		pData[playerid][pDealerMission] = -1;
		DealerData[bid][dealerStock] += 10;
		pData[playerid][pTruckerTime] += 3800;
		if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
		DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}

// Multi Funtion Container Jobs
function ContainerTake(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			InfoTD_MSG(playerid, 8000, "Done!");
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			pData[playerid][pEnergy] -= 5;
			TogglePlayerControllable(playerid, 1);

			SetPVarInt(playerid, "container", CreateDynamicObject(2935,0,0,0,0,0,0));
			AttachDynamicObjectToVehicle(GetPVarInt(playerid, "container"), GetPlayerVehicleID(playerid), 0.000, -1.009, 1.090, 0.000, 0.000, 0.000);
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
function ContainerDown(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			InfoTD_MSG(playerid, 8000, "Done!");
			AddPlayerSalary(playerid, "Trucker(Container)", 31500);
			Info(playerid, "Kamu berhasil mengantarkan sebuah Container, bayaran kamu telah masuk  '"YELLOW_E"/mysalary"WHITE_E"'.!");
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			pData[playerid][pEnergy] -= 5;
			TogglePlayerControllable(playerid, 1);
			DestroyDynamicObject(GetPVarInt(playerid, "container"));
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
