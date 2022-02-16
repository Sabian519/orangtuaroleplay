//--- Vehicle Trunk
enum StorageData
{
	tMoney,
	tComp,
	tMats,
	tMarijuana,
	tFish,
	tWeapon[5],
	tAmmo[5]
};
new vsData[MAX_PRIVATE_VEHICLE][StorageData];

Trunk_WeaponStorage(playerid, vehicleid)
{
    if(vehicleid == -1)
        return 0;

    static
        string[320];

    string[0] = 0;

    for (new i = 0; i < 5; i ++)
    {
    	if(!vsData[vehicleid][tWeapon][i])
    		format(string, sizeof(string), "%sEmpty Slot\n", string);

		else
        	format(string, sizeof(string), "%s%s (Ammo: %d)\n", string, ReturnWeaponName(vsData[vehicleid][tWeapon][i]), vsData[vehicleid][tAmmo][i]);
    }
    ShowPlayerDialog(playerid, TRUNK_WEAPONS, DIALOG_STYLE_LIST, "Weapon Storage", string, "Select", "Cancel");
    return 1;
}

Trunk_OpenStorage(playerid, vehicleid)
{
    if(vehicleid == -1)
        return 0;

    new
        items[1],
        string[10 * 32];

    for (new i = 0; i < 5; i ++) if(vsData[vehicleid][tWeapon][i])
	{
        items[0]++;
    }
	format(string, sizeof(string), "Weapon Storage (%d/5)\nMoney Safe (%s)\nComponent (%d/150)\nMaterial (%d/150)\nMarijuana (%d/150)\nFish (%d/150)\nTakes Crate", items[0], FormatMoney(vsData[vehicleid][tMoney]), vsData[vehicleid][tComp], vsData[vehicleid][tMats], vsData[vehicleid][tMarijuana], vsData[vehicleid][tFish]);

    ShowPlayerDialog(playerid, TRUNK_STORAGE, DIALOG_STYLE_LIST, "Vehicle Trunk", string, "Select", "Cancel");
    return 1;
}

MySQL_LoadVehicleStorage(vehicleid)
{
	new query[128];
	mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `trunk` WHERE Owner='%d' LIMIT 1", pvData[vehicleid][cID]);
	mysql_tquery(g_SQL, query, "LoadVehicleTrunk", "i", vehicleid);
}

function LoadVehicleTrunk(vehicleid)
{
	new rows = cache_num_rows(), vehid = pvData[vehicleid][cVeh];
 	if(rows)
  	{
		for(new z = 0; z < rows; z++)
		{
			pvData[vehid][LoadedStorage] = true;
			cache_get_value_name_int(z, "money", vsData[vehid][tMoney]);
			cache_get_value_name_int(z, "component", vsData[vehid][tComp]);
			cache_get_value_name_int(z, "material", vsData[vehid][tMats]);
			cache_get_value_name_int(z, "marijuana", vsData[vehid][tMarijuana]);
			cache_get_value_name_int(z, "fish", vsData[vehid][tFish]);
			cache_get_value_name_int(z, "weapon1", vsData[vehid][tWeapon][0]);
			cache_get_value_name_int(z, "ammo1", vsData[vehid][tAmmo][0]);
			cache_get_value_name_int(z, "weapon2", vsData[vehid][tWeapon][1]);
			cache_get_value_name_int(z, "ammo2", vsData[vehid][tAmmo][1]);
			cache_get_value_name_int(z, "weapon3", vsData[vehid][tWeapon][2]);
			cache_get_value_name_int(z, "ammo3", vsData[vehid][tAmmo][2]);
			cache_get_value_name_int(z, "weapon4", vsData[vehid][tWeapon][3]);
			cache_get_value_name_int(z, "ammo4", vsData[vehid][tAmmo][3]);
			cache_get_value_name_int(z, "weapon5", vsData[vehid][tWeapon][4]);
			cache_get_value_name_int(z, "ammo5", vsData[vehid][tAmmo][4]);
		}
	}
}

Trunk_Save(vehicleid)
{
	new cQuery[1536], x = pvData[vehicleid][cVeh];
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE `trunk` SET ");
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`money`= %d,", cQuery, vsData[x][tMoney]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`component`= %d,", cQuery, vsData[x][tComp]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`material`= %d,", cQuery, vsData[x][tMats]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`marijuana`= %d,", cQuery, vsData[x][tMarijuana]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`fish`= %d,", cQuery, vsData[x][tFish]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`weapon1` = %d, `ammo1` = %d,", cQuery, vsData[x][tWeapon][0], vsData[x][tAmmo][0]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`weapon2` = %d, `ammo2` = %d,", cQuery, vsData[x][tWeapon][1], vsData[x][tAmmo][1]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`weapon3` = %d, `ammo3` = %d,", cQuery, vsData[x][tWeapon][2], vsData[x][tAmmo][2]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`weapon4` = %d, `ammo4` = %d,", cQuery, vsData[x][tWeapon][3], vsData[x][tAmmo][3]);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`weapon5` = %d, `ammo5` = %d ", cQuery, vsData[x][tWeapon][4], vsData[x][tAmmo][4]);
    mysql_format(g_SQL, cQuery, sizeof(cQuery), "%sWHERE `Owner` = %d", cQuery, pvData[vehicleid][cID]);
	mysql_query(g_SQL, cQuery);
	return 1;
}

function MySQL_CreateVehicleStorage(vehicleid)
{
	new query[512];

	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO `trunk` (`Owner`) VALUES ('%d')", pvData[vehicleid][cID]);
	mysql_tquery(g_SQL, query);

	vsData[vehicleid][tMoney] = 0;
	vsData[vehicleid][tComp] = 0;
	vsData[vehicleid][tMats] = 0;
	vsData[vehicleid][tMarijuana] = 0;
	vsData[vehicleid][tFish] = 0;
	for (new h4n = 0; h4n < 5; h4n ++)
    {
        vsData[vehicleid][tWeapon][h4n] = 0;

		vsData[vehicleid][tAmmo][h4n] = 0;
    }
}
