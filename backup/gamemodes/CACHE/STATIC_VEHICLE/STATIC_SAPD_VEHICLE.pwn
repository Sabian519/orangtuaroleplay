// STATISTIC VEHICLE SAPD //
#include <YSI_Coding\y_hooks>

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_SAPD_GARAGE)
	{
		if(!response) return 1;
		switch(listitem)
		{
			case 0:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1568.40, -1695.66, 5.89))
				{
					SAPD_Garages[playerid] = CreateVehicle(596, 1538.42, -1682.46, 5.59, 92.4917,2,2,120000,0);
					AddVehicleComponent(SAPD_Garages[playerid], 1080);
				}
				Info(playerid, "You have succefully spawned SAPD Vehicles '"YELLOW_E"/despawn"WHITE_E"' to despawn vehicles");
			}
			case 1:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1568.40, -1695.66, 5.89))
				{
					SAPD_Garages[playerid] = CreateVehicle(599, 1538.42, -1682.46, 5.59, 92.4917,2,2,120000,0);
				}
				Info(playerid, "You have succefully spawned SAPD Vehicles '"YELLOW_E"/despawn"WHITE_E"' to despawn vehicles");
			}
			case 2:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1568.40, -1695.66, 5.89))
				{
					SAPD_Garages[playerid] = CreateVehicle(601, 1538.42, -1682.46, 5.59, 92.4917,2,2,120000,0);
				}
				Info(playerid, "You have succefully spawned SAPD Vehicles '"YELLOW_E"/despawn"WHITE_E"' to despawn vehicles");
			}
			case 3:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1568.40, -1695.66, 5.89))
				{
					SAPD_Garages[playerid] = CreateVehicle(427, 1538.42, -1682.46, 5.59, 92.4917,2,2,120000,0);
				}
				Info(playerid, "You have succefully spawned SAPD Vehicles '"YELLOW_E"/despawn"WHITE_E"' to despawn vehicles");
			}
			case 4:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1568.40, -1695.66, 5.89))
				{
					SAPD_Garages[playerid] = CreateVehicle(528, 1538.42, -1682.46, 5.59, 92.4917,2,2,120000,0);
				}
				Info(playerid, "You have succefully spawned SAPD Vehicles '"YELLOW_E"/despawn"WHITE_E"' to despawn vehicles");
			}
			case 5:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1568.40, -1695.66, 5.89))
				{
					SAPD_Garages[playerid] = CreateVehicle(411, 1538.42, -1682.46, 5.59, 92.4917,2,2,120000,0);
					AddVehicleComponent(SAPD_Garages[playerid], 1080);
				}
				Info(playerid, "You have succefully spawned SAPD Vehicles '"YELLOW_E"/despawn"WHITE_E"' to despawn vehicles");
			}
			case 6:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1568.40, -1695.66, 5.89))
				{
					SAPD_Garages[playerid] = CreateVehicle(560, 1538.42, -1682.46, 5.59, 92.4917,2,2,120000,0);
					AddVehicleComponent(SAPD_Garages[playerid], 1080);
				}
				Info(playerid, "You have succefully spawned SAPD Vehicles '"YELLOW_E"/despawn"WHITE_E"' to despawn vehicles");
			}
			case 7:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1568.40, -1695.66, 5.89))
				{
					SAPD_Garages[playerid] = CreateVehicle(468, 1538.42, -1682.46, 5.59, 92.4917,3,4,120000,0);
				}
				Info(playerid, "You have succefully spawned SAPD Vehicles '"YELLOW_E"/despawn"WHITE_E"' to despawn vehicles");
			}
			case 8:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1568.40, -1695.66, 5.89))
				{
					SAPD_Garages[playerid] = CreateVehicle(521, 1538.42, -1682.46, 5.59, 92.4917,3,4,120000,0);
				}
				Info(playerid, "You have succefully spawned SAPD Vehicles '"YELLOW_E"/despawn"WHITE_E"' to despawn vehicles");
			}
			case 9:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1568.40, -1695.66, 5.89))
				{
					SAPD_Garages[playerid] = CreateVehicle(523, 1538.42, -1682.46, 5.59, 92.4917,3,4,120000,0);
				}
				Info(playerid, "You have succefully spawned SAPD Vehicles '"YELLOW_E"/despawn"WHITE_E"' to despawn vehicles");
			}
			case 10:
			{
				if(IsPlayerInRangeOfPoint(playerid,2.0, 1568.40, -1695.66, 5.89))
				{
					SAPD_Garages[playerid] = CreateVehicle(497, 1569.1587,-1641.0361,28.5788,3,4,120000,0);
				}
				Info(playerid, "You have succefully spawned SAPD Vehicles '"YELLOW_E"/despawn"WHITE_E"' to despawn vehicles");
			}
		}
		pData[playerid][pvSpawnSapd] = 1;
		PutPlayerInVehicle(playerid, SAPD_Garages[playerid], 0);
	}
    return 1;
}

