#include <YSI_Coding\y_hooks>

// Vehicle attach editing textdraw
const FloatX =  1;
const FloatY =  2;
const FloatZ =  3;
const FloatRX = 4;
const FloatRY = 5;
const FloatRZ = 6;

new Float:NudgeVal[MAX_PLAYERS];

MySQL_LoadVehicleToys(vehicleid)
{
	new tstr[512];
	mysql_format(g_SQL, tstr, sizeof(tstr), "SELECT * FROM vtoys WHERE Owner='%d' LIMIT 1", pvData[vehicleid][cID]);
	mysql_tquery(g_SQL, tstr, "LoadVehicleToys", "i", vehicleid);
}

function LoadVehicleToys(vehicleid)
{
	new rows = cache_num_rows(), vehid = pvData[vehicleid][cVeh];
 	if(rows)
  	{
		pvData[vehid][PurchasedvToy] = true;
		cache_get_value_name_int(0, "Slot0_Modelid", vtData[vehid][0][vtoy_modelid]);
  		cache_get_value_name_float(0, "Slot0_XPos", vtData[vehid][0][vtoy_x]);
  		cache_get_value_name_float(0, "Slot0_YPos", vtData[vehid][0][vtoy_y]);
  		cache_get_value_name_float(0, "Slot0_ZPos", vtData[vehid][0][vtoy_z]);
  		cache_get_value_name_float(0, "Slot0_XRot", vtData[vehid][0][vtoy_rx]);
  		cache_get_value_name_float(0, "Slot0_YRot", vtData[vehid][0][vtoy_ry]);
  		cache_get_value_name_float(0, "Slot0_ZRot", vtData[vehid][0][vtoy_rz]);

		cache_get_value_name_int(0, "Slot1_Modelid", vtData[vehid][1][vtoy_modelid]);
  		cache_get_value_name_float(0, "Slot1_XPos", vtData[vehid][1][vtoy_x]);
  		cache_get_value_name_float(0, "Slot1_YPos", vtData[vehid][1][vtoy_y]);
  		cache_get_value_name_float(0, "Slot1_ZPos", vtData[vehid][1][vtoy_z]);
  		cache_get_value_name_float(0, "Slot1_XRot", vtData[vehid][1][vtoy_rx]);
  		cache_get_value_name_float(0, "Slot1_YRot", vtData[vehid][1][vtoy_ry]);
  		cache_get_value_name_float(0, "Slot1_ZRot", vtData[vehid][1][vtoy_rz]);

		cache_get_value_name_int(0, "Slot2_Modelid", vtData[vehid][2][vtoy_modelid]);
  		cache_get_value_name_float(0, "Slot2_XPos", vtData[vehid][2][vtoy_x]);
  		cache_get_value_name_float(0, "Slot2_YPos", vtData[vehid][2][vtoy_y]);
  		cache_get_value_name_float(0, "Slot2_ZPos", vtData[vehid][2][vtoy_z]);
  		cache_get_value_name_float(0, "Slot2_XRot", vtData[vehid][2][vtoy_rx]);
  		cache_get_value_name_float(0, "Slot2_YRot", vtData[vehid][2][vtoy_ry]);
  		cache_get_value_name_float(0, "Slot2_ZRot", vtData[vehid][2][vtoy_rz]);

		cache_get_value_name_int(0, "Slot3_Modelid", vtData[vehid][3][vtoy_modelid]);
  		cache_get_value_name_float(0, "Slot3_XPos", vtData[vehid][3][vtoy_x]);
  		cache_get_value_name_float(0, "Slot3_YPos", vtData[vehid][3][vtoy_y]);
  		cache_get_value_name_float(0, "Slot3_ZPos", vtData[vehid][3][vtoy_z]);
  		cache_get_value_name_float(0, "Slot3_XRot", vtData[vehid][3][vtoy_rx]);
  		cache_get_value_name_float(0, "Slot3_YRot", vtData[vehid][3][vtoy_ry]);
  		cache_get_value_name_float(0, "Slot3_ZRot", vtData[vehid][3][vtoy_rz]);

		AttachVehicleToys(vehid);
	}
}

MySQL_SaveVehicleToys(vehicleid)
{
	new line4[1600], lstr[1024], x = pvData[vehicleid][cVeh];

	//if(pvData[x][PurchasedvToy] == false) return true;

	mysql_format(g_SQL, lstr, sizeof(lstr),
	"UPDATE `vtoys` SET \
	`Slot0_Modelid` = %d, `Slot0_XPos` = %.3f, `Slot0_YPos` = %.3f, `Slot0_ZPos` = %.3f, `Slot0_XRot` = %.3f, `Slot0_YRot` = %.3f, `Slot0_ZRot` = %.3f,",
		vtData[x][0][vtoy_modelid],
        vtData[x][0][vtoy_x],
        vtData[x][0][vtoy_y],
        vtData[x][0][vtoy_z],
        vtData[x][0][vtoy_rx],
        vtData[x][0][vtoy_ry],
        vtData[x][0][vtoy_rz]);
	strcat(line4, lstr);

	mysql_format(g_SQL, lstr, sizeof(lstr),
	" `Slot1_Modelid` = %d, `Slot1_XPos` = %.3f, `Slot1_YPos` = %.3f, `Slot1_ZPos` = %.3f, `Slot1_XRot` = %.3f, `Slot1_YRot` = %.3f, `Slot1_ZRot` = %.3f,",
		vtData[x][1][vtoy_modelid],
        vtData[x][1][vtoy_x],
        vtData[x][1][vtoy_y],
        vtData[x][1][vtoy_z],
        vtData[x][1][vtoy_rx],
        vtData[x][1][vtoy_ry],
        vtData[x][1][vtoy_rz]);
  	strcat(line4, lstr);

    mysql_format(g_SQL, lstr, sizeof(lstr),
	" `Slot2_Modelid` = %d, `Slot2_XPos` = %.3f, `Slot2_YPos` = %.3f, `Slot2_ZPos` = %.3f, `Slot2_XRot` = %.3f, `Slot2_YRot` = %.3f, `Slot2_ZRot` = %.3f,",
		vtData[x][2][vtoy_modelid],
	    vtData[x][2][vtoy_x],
	    vtData[x][2][vtoy_y],
	    vtData[x][2][vtoy_z],
	    vtData[x][2][vtoy_rx],
	    vtData[x][2][vtoy_ry],
	    vtData[x][2][vtoy_rz]);
  	strcat(line4, lstr);

    mysql_format(g_SQL, lstr, sizeof(lstr),
	" `Slot3_Modelid` = %d, `Slot3_XPos` = %.3f, `Slot3_YPos` = %.3f, `Slot3_ZPos` = %.3f, `Slot3_XRot` = %.3f, `Slot3_YRot` = %.3f, `Slot3_ZRot` = %.3f WHERE `Owner` = '%d'",
		vtData[x][3][vtoy_modelid],
	    vtData[x][3][vtoy_x],
	    vtData[x][3][vtoy_y],
	    vtData[x][3][vtoy_z],
	    vtData[x][3][vtoy_rx],
	    vtData[x][3][vtoy_ry],
	    vtData[x][3][vtoy_rz],
	    pvData[vehicleid][cID]);
  	strcat(line4, lstr);

    mysql_tquery(g_SQL, line4);
    return 1;
}

MySQL_CreateVehicleToy(vehicleid)
{
	new query[512];

	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO `vtoys` (`Owner`) VALUES ('%d')", pvData[vehicleid][cID]);
	mysql_tquery(g_SQL, query);
	pvData[vehicleid][PurchasedvToy] = true;

	for(new i = 0; i < 4; i++)
	{
		vtData[vehicleid][i][vtoy_modelid] = 0;
		vtData[vehicleid][i][vtoy_x] = 0.0;
		vtData[vehicleid][i][vtoy_y] = 0.0;
		vtData[vehicleid][i][vtoy_z] = 0.0;
		vtData[vehicleid][i][vtoy_rx] = 0.0;
		vtData[vehicleid][i][vtoy_ry] = 0.0;
		vtData[vehicleid][i][vtoy_rz] = 0.0;
	}
}

AttachVehicleToys(vehicleid)
{
	if(pvData[vehicleid][PurchasedvToy] == false) return 1;

	if(vtData[vehicleid][0][vtoy_model] == 0)
	{
		vtData[vehicleid][0][vtoy_model] = CreateDynamicObject(vtData[vehicleid][0][vtoy_modelid],
 	 	vtData[vehicleid][0][vtoy_x],
		vtData[vehicleid][0][vtoy_y],
		vtData[vehicleid][0][vtoy_z],
		vtData[vehicleid][0][vtoy_rx],
		vtData[vehicleid][0][vtoy_ry],
		vtData[vehicleid][0][vtoy_rz]);

		AttachDynamicObjectToVehicle(vtData[vehicleid][0][vtoy_model],
		vehicleid,
		vtData[vehicleid][0][vtoy_x],
		vtData[vehicleid][0][vtoy_y],
		vtData[vehicleid][0][vtoy_z],
		vtData[vehicleid][0][vtoy_rx],
		vtData[vehicleid][0][vtoy_ry],
		vtData[vehicleid][0][vtoy_rz]);
	}
	if(vtData[vehicleid][1][vtoy_model] == 0)
	{
		vtData[vehicleid][1][vtoy_model] = CreateDynamicObject(vtData[vehicleid][1][vtoy_modelid],
 	 	vtData[vehicleid][1][vtoy_x],
		vtData[vehicleid][1][vtoy_y],
		vtData[vehicleid][1][vtoy_z],
		vtData[vehicleid][1][vtoy_rx],
		vtData[vehicleid][1][vtoy_ry],
		vtData[vehicleid][1][vtoy_rz]);

		AttachDynamicObjectToVehicle(vtData[vehicleid][1][vtoy_model],
		vehicleid,
		vtData[vehicleid][1][vtoy_x],
		vtData[vehicleid][1][vtoy_y],
		vtData[vehicleid][1][vtoy_z],
		vtData[vehicleid][1][vtoy_rx],
		vtData[vehicleid][1][vtoy_ry],
		vtData[vehicleid][1][vtoy_rz]);
	}
	if(vtData[vehicleid][2][vtoy_model] == 0)
	{
		vtData[vehicleid][2][vtoy_model] = CreateDynamicObject(vtData[vehicleid][2][vtoy_modelid],
 	 	vtData[vehicleid][2][vtoy_x],
		vtData[vehicleid][2][vtoy_y],
		vtData[vehicleid][2][vtoy_z],
		vtData[vehicleid][2][vtoy_rx],
		vtData[vehicleid][2][vtoy_ry],
		vtData[vehicleid][2][vtoy_rz]);

		AttachDynamicObjectToVehicle(vtData[vehicleid][2][vtoy_model],
		vehicleid,
		vtData[vehicleid][2][vtoy_x],
		vtData[vehicleid][2][vtoy_y],
		vtData[vehicleid][2][vtoy_z],
		vtData[vehicleid][2][vtoy_rx],
		vtData[vehicleid][2][vtoy_ry],
		vtData[vehicleid][2][vtoy_rz]);
	}
	if(vtData[vehicleid][3][vtoy_model] == 0)
	{
		vtData[vehicleid][3][vtoy_model] = CreateDynamicObject(vtData[vehicleid][3][vtoy_modelid],
 	 	vtData[vehicleid][3][vtoy_x],
		vtData[vehicleid][3][vtoy_y],
		vtData[vehicleid][3][vtoy_z],
		vtData[vehicleid][3][vtoy_rx],
		vtData[vehicleid][3][vtoy_ry],
		vtData[vehicleid][3][vtoy_rz]);

		AttachDynamicObjectToVehicle(vtData[vehicleid][3][vtoy_model],
		vehicleid,
		vtData[vehicleid][3][vtoy_x],
		vtData[vehicleid][3][vtoy_y],
		vtData[vehicleid][3][vtoy_z],
		vtData[vehicleid][3][vtoy_rx],
		vtData[vehicleid][3][vtoy_ry],
		vtData[vehicleid][3][vtoy_rz]);
	}
	return 1;
}

function AddVObjPos(playerid)
{
	new vehid = GetPlayerVehicleID(playerid), gametext[36];
	new idxs = pvData[vehid][vtoySelected];
	if(pData[playerid][EditStatus] == FloatX)
	{
		vtData[vehid][idxs][vtoy_x] += NudgeVal[playerid];
		format(gametext, 36, "Float X: ~w~%f", vtData[vehid][idxs][vtoy_x]);
	}
	else if(pData[playerid][EditStatus] == FloatY)
	{
		vtData[vehid][idxs][vtoy_y] += NudgeVal[playerid];
		format(gametext, 36, "Float Y: ~w~%f", vtData[vehid][idxs][vtoy_y]);
	}
	else if(pData[playerid][EditStatus] == FloatZ)
	{
		vtData[vehid][idxs][vtoy_z] += NudgeVal[playerid];
		format(gametext, 36, "Float Z: ~w~%f", vtData[vehid][idxs][vtoy_z]);
	}
	else if(pData[playerid][EditStatus] == FloatRX)
	{
		vtData[vehid][idxs][vtoy_rx] += NudgeVal[playerid];
		format(gametext, 36, "Float RX: ~w~%f", vtData[vehid][idxs][vtoy_rx]);
	}
	else if(pData[playerid][EditStatus] == FloatRY)
	{
		vtData[vehid][idxs][vtoy_ry] += NudgeVal[playerid];
		format(gametext, 36, "Float RY: ~w~%f", vtData[vehid][idxs][vtoy_ry]);
	}
	else if(pData[playerid][EditStatus] == FloatRZ)
	{
		vtData[vehid][idxs][vtoy_rz] += NudgeVal[playerid];
		format(gametext, 36, "Float RZ: ~w~%f", vtData[vehid][idxs][vtoy_rz]);
	}
	PlayerTextDrawSetString(playerid, EditVObjTD[playerid][5], gametext);
	AttachDynamicObjectToVehicle(vtData[vehid][idxs][vtoy_model], vehid,
		vtData[vehid][idxs][vtoy_x],
		vtData[vehid][idxs][vtoy_y],
		vtData[vehid][idxs][vtoy_z],
		vtData[vehid][idxs][vtoy_rx],
		vtData[vehid][idxs][vtoy_ry],
		vtData[vehid][idxs][vtoy_rz]);
}

function SubVObjPos(playerid)
{
	new vehid = GetPlayerVehicleID(playerid), gametext[36];
	new idxs = pvData[vehid][vtoySelected];
	if(pData[playerid][EditStatus] == FloatX)
	{
		vtData[vehid][idxs][vtoy_x] -= NudgeVal[playerid];
		format(gametext, 36, "Float X: ~w~%f", vtData[vehid][idxs][vtoy_x]);
	}
	else if(pData[playerid][EditStatus] == FloatY)
	{
		vtData[vehid][idxs][vtoy_y] -= NudgeVal[playerid];
		format(gametext, 36, "Float Y: ~w~%f", vtData[vehid][idxs][vtoy_y]);
	}
	else if(pData[playerid][EditStatus] == FloatZ)
	{
		vtData[vehid][idxs][vtoy_z] -= NudgeVal[playerid];
		format(gametext, 36, "Float Z: ~w~%f", vtData[vehid][idxs][vtoy_z]);
	}
	else if(pData[playerid][EditStatus] == FloatRX)
	{
		vtData[vehid][idxs][vtoy_rx] -= NudgeVal[playerid];
		format(gametext, 36, "Float RX: ~w~%f", vtData[vehid][idxs][vtoy_rx]);
	}
	else if(pData[playerid][EditStatus] == FloatRY)
	{
		vtData[vehid][idxs][vtoy_ry] -= NudgeVal[playerid];
		format(gametext, 36, "Float RY: ~w~%f", vtData[vehid][idxs][vtoy_ry]);
	}
	else if(pData[playerid][EditStatus] == FloatRZ)
	{
		vtData[vehid][idxs][vtoy_rz] -= NudgeVal[playerid];
		format(gametext, 36, "Float RZ: ~w~%f", vtData[vehid][idxs][vtoy_rz]);
	}
	PlayerTextDrawSetString(playerid, EditVObjTD[playerid][5], gametext);

	AttachDynamicObjectToVehicle(vtData[vehid][idxs][vtoy_model],
		vehid,
		vtData[vehid][idxs][vtoy_x],
		vtData[vehid][idxs][vtoy_y],
		vtData[vehid][idxs][vtoy_z],
		vtData[vehid][idxs][vtoy_rx],
		vtData[vehid][idxs][vtoy_ry],
		vtData[vehid][idxs][vtoy_rz]);
}

stock ShowEditVehicleTD(pid)
{
	for(new x; x < 8; x++)
	{
		SelectTextDraw(pid, 0xFF0000FF);
		PlayerTextDrawShow(pid, EditVObjTD[pid][x]);
	}
}
stock HideEditVehicleTD(pid)
{
	for(new x; x < 8; x++)
	{
		PlayerTextDrawHide(pid, EditVObjTD[pid][x]);
		CancelSelectTextDraw(pid);
	}
}

CMD:kontol(playerid)
{
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new string[350];
		new x = GetPlayerVehicleID(playerid);
		foreach(new i: PVehicles)
		{
			if(x == pvData[i][cVeh])
			{
				pData[playerid][VehicleID] = pvData[i][cVeh];
				if(vtData[pvData[i][cVeh]][0][vtoy_modelid] == 0)
				{
				    strcat(string, ""dot"Slot 1\n");
				}
				else strcat(string, ""dot"Slot 1 "RED_E"(Used)\n");

				if(vtData[pvData[i][cVeh]][1][vtoy_modelid] == 0)
				{
				    strcat(string, ""dot"Slot 2\n");
				}
				else strcat(string, ""dot"Slot 2 "RED_E"(Used)\n");

				if(vtData[pvData[i][cVeh]][2][vtoy_modelid] == 0)
				{
				    strcat(string, ""dot"Slot 3\n");
				}
				else strcat(string, ""dot"Slot 3 "RED_E"(Used)\n");

				if(vtData[pvData[i][cVeh]][3][vtoy_modelid] == 0)
				{
				    strcat(string, ""dot"Slot 4\n");
				}
				else strcat(string, ""dot"Slot 4 "RED_E"(Used)\n");

				ShowPlayerDialog(playerid, DIALOG_VTOYBUY, DIALOG_STYLE_LIST, ""RED_E"RANUM-RP: "WHITE_E"Vehicle Toys", string, "Select", "Cancel");
			}
		}
	}
	else return Error(playerid, "Anda harus mengendarai kendaraan!");

	return 1;
}

CMD:myov(playerid)
{
    for(new aaa = 1; aaa < sizeof(ModsPoint); aaa++)
	if(IsPlayerInRangeOfPoint(playerid, 5.0, ModsPoint[aaa][ModsPos][0], ModsPoint[aaa][ModsPos][1], ModsPoint[aaa][ModsPos][2]))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new string[350];
			new x = GetPlayerVehicleID(playerid);
			foreach(new i: PVehicles)
			if(x == pvData[i][cVeh])
			{
				pData[playerid][VehicleID] = pvData[i][cVeh];
				if(vtData[pvData[i][cVeh]][0][vtoy_modelid] == 0)
				{
				    strcat(string, ""dot"Slot 1\n");
				}
				else strcat(string, ""dot"Slot 1 "RED_E"(Used)\n");

				if(vtData[pvData[i][cVeh]][1][vtoy_modelid] == 0)
				{
				    strcat(string, ""dot"Slot 2\n");
				}
				else strcat(string, ""dot"Slot 2 "RED_E"(Used)\n");

				if(vtData[pvData[i][cVeh]][2][vtoy_modelid] == 0)
				{
				    strcat(string, ""dot"Slot 3\n");
				}
				else strcat(string, ""dot"Slot 3 "RED_E"(Used)\n");

				if(vtData[pvData[i][cVeh]][3][vtoy_modelid] == 0)
				{
				    strcat(string, ""dot"Slot 4\n");
				}
				else strcat(string, ""dot"Slot 4 "RED_E"(Used)\n");

				strcat(string, ""dot""X1_BLUE"Buy Vehicle Object\n");
				strcat(string, ""dot""RED_E"Reset All Object\n");
				strcat(string, ""dot""RED_E"Refresh All Object");
				ShowPlayerDialog(playerid, DIALOG_VTOY, DIALOG_STYLE_LIST, ""RED_E"RANUM-RP: "WHITE_E"My object vehicle", string, "Select", "Cancel");
			}
		}
		else return Error(playerid, "Anda harus mengendarai kendaraan!");
	}
	return 1;
}

// FUNCTION DIALOG //
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	//--------------[ Vehicle Toy Dialog ]-------------
	if(dialogid == DIALOG_VTOY)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: //slot 1
				{
					new x = pData[playerid][VehicleID];
					pvData[x][vtoySelected] = 0;
					if(vtData[x][0][vtoy_modelid] == 0)
					{

					}
					else
					{
						new string[512];
						format(string, sizeof(string), ""dot" "GREY_E"Edit Toy Position PC\n"dot" "GREY_E"Edit Toy Position(Android)\n"dot"Remove Object\n"dot"Show/Hide Object\n"dot"Change Colour\n"dot"Share Position\nPosX: %f\nPosY: %f\nPosZ: %f\nPosRX: %f\nPosRY: %f\nPosRZ: %f",
						vtData[x][pvData[x][vtoySelected]][vtoy_x], vtData[x][pvData[x][vtoySelected]][vtoy_y], vtData[x][pvData[x][vtoySelected]][vtoy_z],
						vtData[x][pvData[x][vtoySelected]][vtoy_rx], vtData[x][pvData[x][vtoySelected]][vtoy_ry], vtData[x][pvData[x][vtoySelected]][vtoy_rz]);
						ShowPlayerDialog(playerid, DIALOG_VTOYEDIT, DIALOG_STYLE_LIST, ""RED_E"RANUMRP: "WHITE_E"Object Vehicle", string, "Select", "Cancel");
					}
				}
				case 1: //slot 2
				{
					new x = pData[playerid][VehicleID];
					pvData[x][vtoySelected] = 1;
					if(vtData[x][1][vtoy_modelid] == 0)
					{

					}
					else
					{
						new string[512];
						format(string, sizeof(string), ""dot" "GREY_E"Edit Toy Position PC\n"dot" "GREY_E"Edit Toy Position(Android)\n"dot"Remove Object\n"dot"Show/Hide Object\n"dot"Change Colour\n"dot"Share Position\nPosX: %f\nPosY: %f\nPosZ: %f\nPosRX: %f\nPosRY: %f\nPosRZ: %f",
						vtData[x][pvData[x][vtoySelected]][vtoy_x], vtData[x][pvData[x][vtoySelected]][vtoy_y], vtData[x][pvData[x][vtoySelected]][vtoy_z],
						vtData[x][pvData[x][vtoySelected]][vtoy_rx], vtData[x][pvData[x][vtoySelected]][vtoy_ry], vtData[x][pvData[x][vtoySelected]][vtoy_rz]);
						ShowPlayerDialog(playerid, DIALOG_VTOYEDIT, DIALOG_STYLE_LIST, ""RED_E"RANUM-RP: "WHITE_E"Object Vehicle", string, "Select", "Cancel");
					}
				}
				case 2: //slot 3
				{
					new x = pData[playerid][VehicleID];
					pvData[x][vtoySelected] = 2;
					if(vtData[x][2][vtoy_modelid] == 0)
					{

					}
					else
					{
						new string[512];
						format(string, sizeof(string), ""dot" "GREY_E"Edit Toy Position PC\n"dot" "GREY_E"Edit Toy Position(Android)\n"dot"Remove Object\n"dot"Show/Hide Object\n"dot"Change Colour\n"dot"Share Position\nPosX: %f\nPosY: %f\nPosZ: %f\nPosRX: %f\nPosRY: %f\nPosRZ: %f",
						vtData[x][pvData[x][vtoySelected]][vtoy_x], vtData[x][pvData[x][vtoySelected]][vtoy_y], vtData[x][pvData[x][vtoySelected]][vtoy_z],
						vtData[x][pvData[x][vtoySelected]][vtoy_rx], vtData[x][pvData[x][vtoySelected]][vtoy_ry], vtData[x][pvData[x][vtoySelected]][vtoy_rz]);
						ShowPlayerDialog(playerid, DIALOG_VTOYEDIT, DIALOG_STYLE_LIST, ""RED_E"RANUM-RP: "WHITE_E"Object Vehicle", string, "Select", "Cancel");
					}
				}
				case 3: //slot 4
				{
					new x = pData[playerid][VehicleID];
					pvData[x][vtoySelected] = 3;
					if(vtData[x][3][vtoy_modelid] == 0)
					{

					}
					else
					{
						new string[512];
						format(string, sizeof(string), ""dot" "GREY_E"Edit Toy Position PC\n"dot" "GREY_E"Edit Toy Position(Android)\n"dot"Remove Object\n"dot"Show/Hide Object\n"dot"Change Colour\n"dot"Share Position\nPosX: %f\nPosY: %f\nPosZ: %f\nPosRX: %f\nPosRY: %f\nPosRZ: %f",
						vtData[x][pvData[x][vtoySelected]][vtoy_x], vtData[x][pvData[x][vtoySelected]][vtoy_y], vtData[x][pvData[x][vtoySelected]][vtoy_z],
						vtData[x][pvData[x][vtoySelected]][vtoy_rx], vtData[x][pvData[x][vtoySelected]][vtoy_ry], vtData[x][pvData[x][vtoySelected]][vtoy_rz]);
						ShowPlayerDialog(playerid, DIALOG_VTOYEDIT, DIALOG_STYLE_LIST, ""RED_E"RANUM-RP: "WHITE_E"Object Vehicle", string, "Select", "Cancel");
					}
				}
				case 4: // Buy Object
				{
				    return callcmd::kontol(playerid);
				}
				case 5:
				{
					new x = pData[playerid][VehicleID];
					if(pvData[x][PurchasedvToy] == true)
					{
						for(new i = 0; i < 4; i++)
						{
							DestroyDynamicObject(vtData[x][i][vtoy_model]);
							vtData[x][i][vtoy_modelid] = 0;
							vtData[x][i][vtoy_x] = 0.0;
							vtData[x][i][vtoy_y] = 0.0;
							vtData[x][i][vtoy_z] = 0.0;
							vtData[x][i][vtoy_rx] = 0.0;
							vtData[x][i][vtoy_ry] = 0.0;
							vtData[x][i][vtoy_rz] = 0.0;
						}
						new string[128];
						mysql_format(g_SQL, string, sizeof(string), "DELETE FROM vtoys WHERE Owner = '%d'", pvData[x][cID]);
						mysql_tquery(g_SQL, string);
						pvData[x][PurchasedvToy] = false;

						GameTextForPlayer(playerid, "~r~~h~Reset All Object!~y~!", 3000, 4);
					}
				}
				case 6:
				{
					new vehid = pData[playerid][VehicleID];
					for(new i = 0; i < 4; i++)
					{
						DestroyDynamicObject(vtData[vehid][i][vtoy_model]);

						vtData[vehid][i][vtoy_model] = CreateDynamicObject(vtData[vehid][i][vtoy_modelid],
						vtData[vehid][i][vtoy_x],
						vtData[vehid][i][vtoy_y],
						vtData[vehid][i][vtoy_z],
						vtData[vehid][i][vtoy_rx],
						vtData[vehid][i][vtoy_ry],
						vtData[vehid][i][vtoy_rz]);

						AttachDynamicObjectToVehicle(vtData[vehid][i][vtoy_model],
						vehid,
						vtData[vehid][i][vtoy_x],
						vtData[vehid][i][vtoy_y],
						vtData[vehid][i][vtoy_z],
						vtData[vehid][i][vtoy_rx],
						vtData[vehid][i][vtoy_ry],
						vtData[vehid][i][vtoy_rz]);
					}
					GameTextForPlayer(playerid, "~r~~h~All object Refresh!~y~!", 3000, 4);
				}
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_VTOYBUY)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: //slot 1
				{
					new x = pData[playerid][VehicleID];
					pvData[x][vtoySelected] = 0;
					if(vtData[x][0][vtoy_modelid] == 0)
					{
						ShowModelSelectionMenu(playerid, vtoylist, "Choose Object", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
					}
					else
					{
						ShowPlayerDialog(playerid, DIALOG_VTOYEDIT, DIALOG_STYLE_LIST, ""RED_E"Ranum-RP: "WHITE_E"Vehicle Object", ""dot"Edit Toy Position\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
					}
				}
				case 1: //slot 2
				{
					new x = pData[playerid][VehicleID];
					pvData[x][vtoySelected] = 1;
					if(vtData[x][1][vtoy_modelid] == 0)
					{
						ShowModelSelectionMenu(playerid, vtoylist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
					}
					else
					{
						ShowPlayerDialog(playerid, DIALOG_VTOYEDIT, DIALOG_STYLE_LIST, ""RED_E"Ranum-RP "WHITE_E"Vehicle Toys", ""dot"Edit Toy Position\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
					}
				}
				case 2: //slot 3
				{
					new x = pData[playerid][VehicleID];
					pvData[x][vtoySelected] = 2;
					if(vtData[x][2][vtoy_modelid] == 0)
					{
						ShowModelSelectionMenu(playerid, vtoylist, "Choose Object", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
					}
					else
					{
						ShowPlayerDialog(playerid, DIALOG_VTOYEDIT, DIALOG_STYLE_LIST, ""RED_E"Ranum-RP: "WHITE_E"Vehicle Object", ""dot"Edit Toy Position\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
					}
				}
				case 3: //slot 4
				{
					new x = pData[playerid][VehicleID];
					pvData[x][vtoySelected] = 3;
					if(vtData[x][3][vtoy_modelid] == 0)
					{
						ShowModelSelectionMenu(playerid, vtoylist, "Choose Object", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
					}
					else
					{
						ShowPlayerDialog(playerid, DIALOG_VTOYEDIT, DIALOG_STYLE_LIST, ""RED_E"Ranum-RP: "WHITE_E"Vehicle Object", ""dot"Edit Toy Position\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
					}
				}
			}
		}
		return 1;
	}
	if(dialogid == DIALOG_VTOYEDIT)
	{
		if(response)
		{
			switch(listitem)
			{
			    case 0:
			    {
			        /*new i = GetPlayerVehicleID(playerid);
			        new vehid = pvData[i][cVeh];
			        new x = pvehEditID[playerid];
					pvEdit[playerid] = 1;
					pvEditID[playerid] = listitem;
					pvehEditID[playerid] = x;
					GetDynamicObjectPos(vtData[vehid][pvData[x][vtoySelected]][vtoy_model], pvPos[playerid][0], pvPos[playerid][1], pvPos[playerid][2]);
					GetDynamicObjectRot(vtData[vehid][pvData[x][vtoySelected]][vtoy_model], pvRot[playerid][0], pvRot[playerid][1], pvRot[playerid][2]);
		   			EditDynamicObject(playerid, vtData[vehid][pvData[x][vtoySelected]][vtoy_model]);
	            */}
				case 1: // edit
				{
					Info(playerid,"Fungsi ini belum tersedia.");
					ShowPlayerDialog(playerid, VTOYSET_VALUE, DIALOG_STYLE_INPUT, "Vehicle Toy Position Edit", ""LB_E"Info penggunaan\n"YELLOW_E"Fungsi ini untuk mengatur posisi object dengan textdraw\n\n"PINK_E"[+] Masukan beberapa Jumlah untuk mengatur Object Kordinat\n"PINK_E"[+] Paling biasa di gunakan = 0.05\n"PINK_E"[+] Bila belum sesuai Posisi, coba masukan Angka lain\n\nSilahkan tulis Jumlah di bawah ini sesuai perkiraan posisi object:", "Select", "Cancel");
   				}
				case 2: // remove toy
				{
					new vehid = GetPlayerVehicleID(playerid);
		    		foreach(new i: PVehicles)
					{
						if(vehid == pvData[i][cVeh])
						{
		    				new x = pvData[i][cVeh];
							vtData[x][pvData[x][vtoySelected]][vtoy_modelid] = 0;
							DestroyDynamicObject(vtData[x][pvData[x][vtoySelected]][vtoy_model]);
							GameTextForPlayer(playerid, "~r~~h~Removed Vehicle Object~y~!", 3000, 4);
							TogglePlayerControllable(playerid, true);
							MySQL_SaveVehicleToys(i);
		    			}
		    		}
				}
				case 3:	//hide/show
				{
					new vehid = pData[playerid][VehicleID];
					if(IsValidObject(vtData[vehid][pvData[vehid][vtoySelected]][vtoy_model]))
					{
						DestroyDynamicObject(vtData[vehid][pvData[vehid][vtoySelected]][vtoy_model]);
						GameTextForPlayer(playerid, "~r~~h~Object Hide~y~!", 3000, 4);
					}
					else
					{
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_model] = CreateDynamicObject(vtData[vehid][pvData[vehid][vtoySelected]][vtoy_modelid],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_x],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_y],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_z],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_rx],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_ry],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_rz]);

						AttachDynamicObjectToVehicle(vtData[vehid][pvData[vehid][vtoySelected]][vtoy_model],
						vehid,
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_x],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_y],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_z],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_rx],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_ry],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_rz]);
						GameTextForPlayer(playerid, "~r~~h~Object Show~y~!", 3000, 4);
					}
				}
				case 4:	//change toy colour
				{
					Servers(playerid,"This function is not permanent");
					ShowPlayerDialog(playerid, VTOYSET_COLOUR, DIALOG_STYLE_LIST, "Changes Object Colour", ""WHITE_E"White\n{0F0C0D}Black\n"RED_E"Red\n"BLUE_E"Blue\n"YELLOW_E"Yellow", "Select", "Back");
				}
				case 5:	//share toy pos
				{
					new x = pData[playerid][VehicleID];
					SendNearbyMessage(playerid, 10.0, ARWIN, "[OBJ BY %s] "YELLOW_E"PosX: %.3f | PosY: %.3f | PosZ: %.3f | PosRX: %.3f | PosRY: %.3f | PosRZ: %.3f",
					ReturnName(playerid), vtData[x][pvData[x][vtoySelected]][vtoy_x], vtData[x][pvData[x][vtoySelected]][vtoy_y], vtData[x][pvData[x][vtoySelected]][vtoy_z],
					vtData[x][pvData[x][vtoySelected]][vtoy_rx], vtData[x][pvData[x][vtoySelected]][vtoy_ry], vtData[x][pvData[x][vtoySelected]][vtoy_rz]);
				}
				case 6: //Pos X
				{
					new x = pData[playerid][VehicleID];
					new mstr[128];
					format(mstr, sizeof(mstr), ""WHITE_E"Current vehicle Toy PosX: %f\nInput new Toy PosX:(Float)", vtData[x][pvData[x][vtoySelected]][vtoy_x]);
					ShowPlayerDialog(playerid, DIALOG_VTOYPOSX, DIALOG_STYLE_INPUT, "Vehicle Object Position X", mstr, "Select", "Cancel");
				}
				case 7: //Pos Y
				{
					new x = pData[playerid][VehicleID];
					new mstr[128];
					format(mstr, sizeof(mstr), ""WHITE_E"Current vehicle Toy PosY: %f\nInput new Toy PosY:(Float)", vtData[x][pvData[x][vtoySelected]][vtoy_y]);
					ShowPlayerDialog(playerid, DIALOG_VTOYPOSY, DIALOG_STYLE_INPUT, "Vehicle Object Position Y", mstr, "Select", "Cancel");
				}
				case 8: //Pos Z
				{
					new x = pData[playerid][VehicleID];
					new mstr[128];
					format(mstr, sizeof(mstr), ""WHITE_E"Current vehicle Toy PosZ: %f\nInput new Toy PosZ:(Float)", vtData[x][pvData[x][vtoySelected]][vtoy_z]);
					ShowPlayerDialog(playerid, DIALOG_VTOYPOSZ, DIALOG_STYLE_INPUT, "Vehicle Object Position Z", mstr, "Select", "Cancel");
				}
				case 9: //Pos RX
				{
					new x = pData[playerid][VehicleID];
					new mstr[128];
					format(mstr, sizeof(mstr), ""WHITE_E"Current vehicle Toy PosRX: %f\nInput new Toy PosRX:(Float)", vtData[x][pvData[x][vtoySelected]][vtoy_rx]);
					ShowPlayerDialog(playerid, DIALOG_VTOYPOSRX, DIALOG_STYLE_INPUT, "Vehicle Object Rotatin X", mstr, "Select", "Cancel");
				}
				case 10: //Pos RY
				{
					new x = pData[playerid][VehicleID];
					new mstr[128];
					format(mstr, sizeof(mstr), ""WHITE_E"Current vehicle Toy PosRY: %f\nInput new Toy PosRY:(Float)", vtData[x][pvData[x][vtoySelected]][vtoy_ry]);
					ShowPlayerDialog(playerid, DIALOG_VTOYPOSRY, DIALOG_STYLE_INPUT, "Vehicle Object Rotatin Y", mstr, "Select", "Cancel");
				}
				case 11: //Pos RZ
				{
					new x = pData[playerid][VehicleID];
					new mstr[128];
					format(mstr, sizeof(mstr), ""WHITE_E"Current vehicle Toy PosRZ: %f\nInput new Toy PosRZ:(Float)", vtData[x][pvData[x][vtoySelected]][vtoy_rz]);
					ShowPlayerDialog(playerid, DIALOG_VTOYPOSRZ, DIALOG_STYLE_INPUT, "Vehicle Object Rotatin Z", mstr, "Select", "Cancel");
				}
			}
		}
		return 1;
	}
	if(dialogid == VTOY_ACCEPT)
	{
		if(response)
		{
			new x = GetPlayerVehicleID(playerid);
			foreach(new i: PVehicles)
			{
				if(x == pvData[i][cVeh])
				{
				    MySQL_SaveVehicleToys(i);
				    //
				    new vehid = pvData[i][cVeh];
                    vtData[vehid][pvData[vehid][vtoySelected]][vtoy_model] = CreateDynamicObject(vtData[vehid][pvData[vehid][vtoySelected]][vtoy_modelid], 0.0, 0.0, -14.0, 0.0, 0.0, 0.0);
					AttachDynamicObjectToVehicle(vtData[vehid][pvData[vehid][vtoySelected]][vtoy_model], vehid,
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_x],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_y],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_z],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_rx],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_ry],
						vtData[vehid][pvData[vehid][vtoySelected]][vtoy_rz]);

					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memasang object kendaraan untuk vehicleid(%d)", ReturnName(playerid), vehid);
					pvData[pvData[i][cVeh]][PurchasedvToy] = true;
					Servers(playerid, "Succes Save This Object");
				}
			}
		}
		else
		{
			new vehid = GetPlayerVehicleID(playerid);
    		foreach(new i: PVehicles)
			{
				if(vehid == pvData[i][cVeh])
				{
    				/*new x = pvData[i][cVeh];
					vtData[x][pvData[x][vtoySelected]][pvtoy_modelid] = 0;
					DestroyDynamicObject(vtData[x][pvData[x][vtoySelected]][pvtoy_model]);*/
					GameTextForPlayer(playerid, "~r~~h~Vehicle Toy Removed~y~!", 3000, 4);
					//pvData[pvData[i][cVeh]][PurchasedvToy] = true;
    			}
    		}
		}
	}
	if(dialogid == VTOYSET_COLOUR)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: //White
				{
					new x = pData[playerid][VehicleID];
					SetDynamicObjectMaterial(vtData[x][pvData[x][vtoySelected]][vtoy_model], 0, 18955, "Jester", "wall6", 0xFFFFFFAA);
					Servers(playerid, "Anda Telah berhasil mengubah warna object");
					Info(playerid, "Changes Colour object white");
				}
				case 1: //Black
				{
					new x = pData[playerid][VehicleID];
					SetDynamicObjectMaterial(vtData[x][pvData[x][vtoySelected]][vtoy_model], 0, 18955, "Jester", "wall6", 0xFF000000);
					Info(playerid, "Changes Colour object {0F0C0D}Black");
				}
				case 2: //Red
				{
					new x = pData[playerid][VehicleID];
					SetDynamicObjectMaterial(vtData[x][pvData[x][vtoySelected]][vtoy_model], 0, 18955, "Jester", "wall6", 0xFF0000FF);
					Info(playerid, "Changes Colour object "RED_E"Red");
				}
				case 3: //Blue
				{
					new x = pData[playerid][VehicleID];
					SetDynamicObjectMaterial(vtData[x][pvData[x][vtoySelected]][vtoy_model], 0, 18955, "Jester", "wall6", 0x004BFFFF);
					Info(playerid, "Changes Colour object "BLUE_E"Blue");
				}
				case 4: //Yellow
				{
					new x = pData[playerid][VehicleID];
					SetDynamicObjectMaterial(vtData[x][pvData[x][vtoySelected]][vtoy_model], 0, 18955, "Jester", "wall6", 0xFFFF00FF);
					Info(playerid, "Changes Colour object "YELLOW_E"Yellow");
				}
			}
		}
	}
	if(dialogid == DIALOG_VTOYPOSX)
	{
		if(response)
		{
			new Float:posisi = floatstr(inputtext), vehid = pData[playerid][VehicleID], idxs = pvData[pData[playerid][VehicleID]][vtoySelected];

			AttachDynamicObjectToVehicle(vtData[vehid][idxs][vtoy_model],
			vehid,
			posisi,
			vtData[vehid][idxs][vtoy_y],
			vtData[vehid][idxs][vtoy_z],
			vtData[vehid][idxs][vtoy_rx],
			vtData[vehid][idxs][vtoy_ry],
			vtData[vehid][idxs][vtoy_rz]);

			vtData[vehid][idxs][vtoy_x] = posisi;
			new x = GetPlayerVehicleID(playerid);
			foreach(new i: PVehicles)
			{
				if(x == pvData[i][cVeh])
				{
					MySQL_SaveVehicleToys(i);
					SendClientMessageEx(playerid, ARWIN, "MOD: "WHITE_E"Succesfully adjust X Pos to %f", posisi);
				}
			}
		}
	}
	if(dialogid == DIALOG_VTOYPOSY)
	{
		if(response)
		{
			new Float:posisi = floatstr(inputtext), vehid = pData[playerid][VehicleID], idxs = pvData[pData[playerid][VehicleID]][vtoySelected];

			AttachDynamicObjectToVehicle(vtData[vehid][idxs][vtoy_model],
			vehid,
			vtData[vehid][idxs][vtoy_x],
			posisi,
			vtData[vehid][idxs][vtoy_z],
			vtData[vehid][idxs][vtoy_rx],
			vtData[vehid][idxs][vtoy_ry],
			vtData[vehid][idxs][vtoy_rz]);

			vtData[vehid][idxs][vtoy_y] = posisi;
			new x = GetPlayerVehicleID(playerid);
			foreach(new i: PVehicles)
			{
				if(x == pvData[i][cVeh])
				{
					MySQL_SaveVehicleToys(i);
					SendClientMessageEx(playerid, ARWIN, "MOD: "WHITE_E"Succesfully adjust X Pos to %f", posisi);
				}
			}
		}
	}
	if(dialogid == DIALOG_VTOYPOSZ)
	{
		if(response)
		{
			new Float:posisi = floatstr(inputtext), vehid = pData[playerid][VehicleID], idxs = pvData[pData[playerid][VehicleID]][vtoySelected];

			AttachDynamicObjectToVehicle(vtData[vehid][idxs][vtoy_model],
			vehid,
			vtData[vehid][idxs][vtoy_x],
			vtData[vehid][idxs][vtoy_y],
			posisi,
			vtData[vehid][idxs][vtoy_rx],
			vtData[vehid][idxs][vtoy_ry],
			vtData[vehid][idxs][vtoy_rz]);

			vtData[vehid][idxs][vtoy_z] = posisi;
			new x = GetPlayerVehicleID(playerid);
			foreach(new i: PVehicles)
			{
				if(x == pvData[i][cVeh])
				{
					MySQL_SaveVehicleToys(i);
					SendClientMessageEx(playerid, ARWIN, "MOD: "WHITE_E"Succesfully adjust X Pos to %f", posisi);
				}
			}
		}
	}
	if(dialogid == DIALOG_VTOYPOSRX)
	{
		if(response)
		{
			new Float:posisi = floatstr(inputtext), vehid = pData[playerid][VehicleID], idxs = pvData[pData[playerid][VehicleID]][vtoySelected];

			AttachDynamicObjectToVehicle(vtData[vehid][idxs][vtoy_model],
			vehid,
			vtData[vehid][idxs][vtoy_x],
			vtData[vehid][idxs][vtoy_y],
			vtData[vehid][idxs][vtoy_z],
			posisi,
			vtData[vehid][idxs][vtoy_ry],
			vtData[vehid][idxs][vtoy_rz]);

			vtData[vehid][idxs][vtoy_rx] = posisi;
			new x = GetPlayerVehicleID(playerid);
			foreach(new i: PVehicles)
			{
				if(x == pvData[i][cVeh])
				{
					MySQL_SaveVehicleToys(i);
					SendClientMessageEx(playerid, ARWIN, "MOD: "WHITE_E"Succesfully adjust X Pos to %f", posisi);
				}
			}
		}
	}
	if(dialogid == DIALOG_VTOYPOSRY)
	{
		if(response)
		{
			new Float:posisi = floatstr(inputtext), vehid = pData[playerid][VehicleID], idxs = pvData[pData[playerid][VehicleID]][vtoySelected];

			AttachDynamicObjectToVehicle(vtData[vehid][idxs][vtoy_model],
			vehid,
			vtData[vehid][idxs][vtoy_x],
			vtData[vehid][idxs][vtoy_y],
			vtData[vehid][idxs][vtoy_z],
			vtData[vehid][idxs][vtoy_rx],
			posisi,
			vtData[vehid][idxs][vtoy_rz]);

			vtData[vehid][idxs][vtoy_ry] = posisi;
			new x = GetPlayerVehicleID(playerid);
			foreach(new i: PVehicles)
			{
				if(x == pvData[i][cVeh])
				{
					MySQL_SaveVehicleToys(i);
					SendClientMessageEx(playerid, ARWIN, "MOD: "WHITE_E"Succesfully adjust X Pos to %f", posisi);
				}
			}
		}
	}
	if(dialogid == DIALOG_VTOYPOSRZ)
	{
		if(response)
		{
			new Float:posisi = floatstr(inputtext), vehid = pData[playerid][VehicleID], idxs = pvData[pData[playerid][VehicleID]][vtoySelected];

			AttachDynamicObjectToVehicle(vtData[vehid][idxs][vtoy_model],
			vehid,
			vtData[vehid][idxs][vtoy_x],
			vtData[vehid][idxs][vtoy_y],
			vtData[vehid][idxs][vtoy_z],
			vtData[vehid][idxs][vtoy_rx],
			vtData[vehid][idxs][vtoy_ry],
			posisi);

			vtData[vehid][idxs][vtoy_rz] = posisi;
			new x = GetPlayerVehicleID(playerid);
			foreach(new i: PVehicles)
			{
				if(x == pvData[i][cVeh])
				{
					MySQL_SaveVehicleToys(i);
					SendClientMessageEx(playerid, ARWIN, "MOD: "WHITE_E"Succesfully adjust X Pos to %f", posisi);
				}
			}
		}
	}
	if(dialogid == VTOYSET_VALUE)
	{
		if(response)
		{
			if(isnull(inputtext))
			{
				NudgeVal[playerid] = 0.05;
				ShowPlayerDialog(playerid, VSELECT_POS, DIALOG_STYLE_LIST, "Select Editing Pos", "Position X\nPosition Y\nPosition Z\nPosition RX\nPosition RY\nPosition RZ", "Select", "Back");
			}
			else
			{
				NudgeVal[playerid] = floatstr(inputtext);
				ShowPlayerDialog(playerid, VSELECT_POS, DIALOG_STYLE_LIST, "Select Editing Pos", "Position X\nPosition Y\nPosition Z\nPosition RX\nPosition RY\nPosition RZ", "Select", "Back");
			}
		}
	}
	if(dialogid == VSELECT_POS)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: //Pos X
				{
					pData[playerid][EditStatus] = FloatX;
					ShowEditVehicleTD(playerid);
					Servers(playerid, "You are now editing vehicle toys position 'X', one click to add %f", NudgeVal[playerid]);
				}
				case 1: //Pos Y
				{
					pData[playerid][EditStatus] = FloatY;
					ShowEditVehicleTD(playerid);
					Servers(playerid, "You are now editing vehicle toys position 'Y', one click to add %f", NudgeVal[playerid]);
				}
				case 2: //Pos Z
				{
					pData[playerid][EditStatus] = FloatZ;
					ShowEditVehicleTD(playerid);
					Servers(playerid, "You are now editing vehicle toys position 'Z', one click to add %f", NudgeVal[playerid]);
				}
				case 3: //Pos RX
				{
					pData[playerid][EditStatus] = FloatRX;
					ShowEditVehicleTD(playerid);
					Servers(playerid, "You are now editing vehicle toys position 'RX', one click to add %f", NudgeVal[playerid]);
				}
				case 4: //Pos RY
				{
					pData[playerid][EditStatus] = FloatRY;
					ShowEditVehicleTD(playerid);
					Servers(playerid, "You are now editing vehicle toys position 'RY', one click to add %f", NudgeVal[playerid]);
				}
				case 5: //Pos RZ
				{
					pData[playerid][EditStatus] = FloatRZ;
					ShowEditVehicleTD(playerid);
					Servers(playerid, "You are now editing vehicle toys position 'RZ', one click to add %f", NudgeVal[playerid]);
				}
			}
		}
	}
	return 1;
}

























































