#include <YSI_Coding\y_hooks>

enum intEnum
{
    intName[32],
    intID,
    Float:intX,
    Float:intY,
    Float:intZ,
    Float:intA
}

// Interiors Names
new const interiorArray[][intEnum] =
{
    {"24/7 (Version 1)", 17, -25.7220, -187.8215, 1003.5468, 5.0760},
    {"24/7 (Version 2)", 10, 6.0854, -28.8966, 1003.5493, 5.0363},
    {"24/7 (Version 3)", 18, -30.9874, -89.6806, 1003.5468, 359.8399},
    {"24/7 (Version 4)", 16, -26.1856, -140.9163, 1003.5468, 2.9086},
    {"24/7 (Version 5)", 4, -27.8439, -26.6737, 1003.5573, 184.3117},
    {"24/7 (Version 6)", 6, -26.8339, -55.5844, 1003.5468, 3.9528},
    {"8-Track Stadium", 7, -1403.0114, -250.4526, 1043.5340, 355.8576},
    {"Abandoned AC Tower", 10, 419.8934, 2537.1154, 10.0000, 67.6537},
    {"Ammunation (Version 1)", 7, 315.2438, -140.8858, 999.6016, 7.4225},
    {"Ammunation (Version 2)", 1, 285.8359, -39.0166, 1001.5156, 0.7529},
    {"Ammunation (Version 3)", 4, 291.7626, -80.1305, 1001.5156, 290.2195},
    {"Ammunation (Version 4)", 6, 297.1440, -109.8702, 1001.5156, 20.2254},
    {"Ammunation (Version 5)", 6, 316.5025, -167.6271, 999.5938, 10.3030},
    {"Andromada", 9, 315.4544, 976.5972, 1960.8509, 359.6368},
    {"Angel Pine Trailer", 2, 1.1851, -3.2386, 999.4284, 87.5718},
    {"Area 69", 0, 215.1515, 1874.0577, 13.1406, 177.5538},
    {"Atrium", 18, 1727.2851, -1642.9449, 20.2254, 172.4192},
    {"B Dup's Apartment", 3, 1527.0467, -12.0235, 1002.0971, 350.0013},
    {"B Dup's Crack Palace", 2, 1523.5096, -47.8209, 1002.2697, 262.7037},
    {"Bar", 11, 501.9577, -70.5646, 998.7578, 171.5706},
    {"Barbara's Love nest", 5, 322.5014, 303.6906, 999.1483, 8.1745},
    {"Barber Shop (version 1)", 3, 418.4666, -80.4595, 1001.8046, 343.2358},
    {"Barber Shop (version 2)", 12, 411.9707, -51.9216, 1001.8983, 173.3448},
    {"Barber Shop (version 3)", 2, 414.2987, -18.8043, 1001.8046, 41.4263},
    {"Big Smoke's Crack Palace", 2, 2536.5322, -1294.8425, 1044.1250, 254.9548},
    {"Bike School (version 1)", 3, 1494.8587, 1306.4798, 1093.2951, 196.0650},
    {"Bike School (version 2)", 0, 1168.5118, 1360.1145, 10.9293, 196.5933},
    {"Binco", 15, 207.5218, -109.7446, 1005.1328, 358.6199},
    {"Blastin' Fools Records", 3, 1037.8276, 0.3970, 1001.2844, 353.9335},
    {"Blood Bowl Stadium", 15, -1417.8927, 932.4481, 1041.5312, 0.7013},
    {"Blueberry Liquor Store", 0, 255.2082, -59.6753, 1.5701, 1.4644},
    {"Brothel 1", 3, 974.0177, -9.5937, 1001.1483, 22.6044},
    {"Brothel 2", 3, 961.9307, -51.9071, 1001.1171, 95.5381},
    {"Budget Inn Motel Room", 12, 446.3247, 509.9660, 1001.4193, 330.5671},
    {"Burger Shot", 10, 366.0248, -73.3478, 1001.5078, 292.0083},
    {"Burglary House 1", 15, 295.1390, 1473.3719, 1080.2578, 352.9526},
    {"Burglary House 2", 3, 234.6087, 1187.8194, 1080.2578, 349.4844},
    {"Burglary House 3", 5, 227.7559, 1114.3842, 1080.9920, 266.2622},
    {"Burglary House 4", 4, 261.1163, 1287.2197, 1080.2578, 178.9149},
    {"Burglary House 5", 4, 221.6766, 1142.4962, 1082.6092, 184.9618},
    {"Burglary House 6", 10, 24.3768, 1341.1827, 1084.3750, 8.3304},
    {"Burglary House 7", 4, -262.1759, 1456.6158, 1084.3670, 82.4589},
    {"Burglary House 8", 5, 22.8610, 1404.9165, 1084.4295, 349.6158},
    {"Burglary House 9", 5, 140.3679, 1367.8835, 1083.8620, 349.2372},
    {"Burglary House 10", 6, 234.2825, 1065.2290, 1084.2099, 4.3864},
    {"Burglary House 11", 6, -68.5145, 1353.8485, 1080.2109, 3.5741},
    {"Burglary House 12", 2, 225.5706, 1240.0643, 1082.1406, 96.2852},
    {"Burglary House 13", 15, -285.2510, 1471.1970, 1084.3750, 85.6547},
    {"Burglary House 14", 8, -42.5265, 1408.2298, 1084.4295, 172.0679},
    {"Burglary House 15", 9, 84.9244, 1324.2983, 1083.8592, 159.5581},
    {"Burglary House 16", 9, 260.7420, 1238.2259, 1084.2578, 84.3084},
    {"Burglary House 17", 1, 224.2879, 1289.1905, 1082.1406, 359.8680},
    {"Burglary House 18", 5, 239.2819, 1114.1989, 1080.9920, 270.2654},
    {"Burglary House 19", 2, 446.6260, 1397.7380, 1084.3045, 343.9645},
    {"Burning Desire Building", 5, 2350.1596, -1181.0656, 1027.9764, 99.1864},
    {"Caligula's Casino", 1, 2233.9362, 1711.8038, 1011.6312, 184.3890},
    {"Caligula's Roof", 1, 2268.5156, 1647.7680, 1084.2342, 99.7331},
    {"Casino (Redsands West)", 12, 1133.3498, -7.8460, 1000.6796, 165.8482},
    {"Cemetary", 0, 818.7714, -1102.8687, 25.7940, 91.1437},
    {"Club", 17, 493.1441, -24.2607, 1000.6796, 356.9862},
    {"Cluckin' Bell", 9, 366.0002, -9.4336, 1001.8516, 160.5278},
    {"Cobra Gym", 6, 773.8886, -47.7696, 1000.5858, 10.7159},
    {"Colonel Furhberger's", 8, 2807.3603, -1171.7048, 1025.5703, 193.7117},
    {"Crack Den", 5, 227.3921, 1114.6572, 1080.9985, 267.4590},
    {"Denise's Bedroom", 1, 245.2306, 304.7632, 999.1483, 273.4364},
    {"Didier Sachs", 14, 204.1658, -165.7678, 1000.5233, 181.7583},
    {"Dillimore Gas Station", 0, 663.0587, -573.6273, 16.3358, 264.9829},
    {"Diner 1", 5, 454.9851, -107.2546, 999.4376, 309.0195},
    {"Dirtbike Stadium", 4, -1421.5616, -663.8261, 1059.5567, 170.9340},
    {"Driving School", 3, -2031.1196, -115.8285, 1035.1717, 190.1876},
    {"Fanny Batter's Whore House", 6, 748.4622, 1438.2376, 1102.9531, 0.6068},
    {"Four Dragons", 10, 2016.1156, 1017.1541, 996.8750, 88.0055},
    {"Francis International Airport", 14, -1813.2130, -58.0120, 1058.9641, 335.3197},
    {"Ganton Gym", 5, 770.8032, -0.7031, 1000.7266, 22.8598},
    {"Helena's Barn", 3, 290.6228, 309.0621, 999.1483, 89.9162},
    {"Inside Track Betting", 3, 830.6016, 5.9404, 1004.1796, 125.8149},
    {"Jay's Diner", 4, 449.0172, -88.9894, 999.5546, 89.6606},
    {"Jefferson Motel", 15, 2217.2810, -1150.5349, 1025.7967, 273.7326},
    {"Jet Interior", 1, 1.5491, 23.3183, 1199.5937, 359.9053},
    {"K.A.C.C. Military Fuels Depot", 0, 2548.4807, 2823.7429, 10.8203, 270.6003},
    {"Katie's Lovenest", 2, 269.6405, 305.9512, 999.1483, 215.6625},
    {"Kickstart Stadium", 14, -1420.4277, 1616.9221, 1052.5312, 159.1255},
    {"Las Venturas Gym", 7, 773.7318, -74.6957, 1000.6541, 5.2304},
    {"Las Venturas Police Department", 3, 288.4721, 170.0646, 1007.1793, 22.0477},
    {"Las Venturas Tattoo parlor", 3, -201.2236, -43.2463, 1002.2733, 45.8613},
    {"Liberty City", 1, -741.8494, 493.0036, 1371.9764, 71.7780},
    {"Lil' Probe Inn", 18, -227.5702, 1401.5544, 27.7656, 269.2976},
    {"Loco Low Co", 2, 611.3535, -77.5574, 997.9995, 320.9263},
    {"Los Santos Airport", 14, -1864.9433, 55.7323, 1055.5274, 85.8541},
    {"Los Santos Police Department", 6, 246.6694, 65.8039, 1003.6406, 7.9562},
    {"Los Santos Tattoo Parlor", 16, -202.8419, -24.0324, 1002.2733, 252.8153},
    {"Lost San Fierro Tattoo parlor", 17, -202.9380, -6.7006, 1002.2733, 204.2693},
    {"Madd Dogg's Mansion", 5, 1267.8405, -776.9586, 1091.9062, 231.3417},
    {"Michelle's Love Nest", 4, 306.1965, 307.8190, 1003.3046, 203.1354},
    {"Millie's Bedroom", 6, 344.9984, 307.1824, 999.1557, 193.6430},
    {"OG Loc's House", 3, 512.9290, -11.6927, 1001.5653, 198.7669},
    {"Old Venturas Strip Casino", 2, 2236.6997, -1078.9477, 1049.0234, 2.5706},
    {"Otto's Autos", 0, -1658.1656, 1215.0002, 7.2500, 103.9074},
    {"Oval Stadium", 1, -1402.6612, 106.3897, 1032.2734, 105.1354},
    {"Palamino Bank", 0, 2306.3825, -15.2363, 26.7495, 274.4898},
    {"Palamino Diner", 0, 2331.8984, 6.7814, 26.5032, 100.2357},
    {"Pizza Stack", 5, 372.5563, -131.3607, 1001.4921, 354.2283},
    {"Planning Department", 3, 386.5259, 173.6381, 1008.3828, 63.7397},
    {"Pro-Laps", 3, 206.4627, -137.7075, 1003.0938, 10.9347},
    {"RC Battlefield", 10, -1129.8907, 1057.5423, 1346.4139, 274.5267},
    {"Rosenberg's Office", 2, 2182.2016, 1628.5848, 1043.8723, 224.8601},
    {"Rusty Brown's Donuts", 17, 378.0260, -190.5155, 1000.6328, 141.0245},
    {"Ryder's House", 2, 2447.8703, -1704.4509, 1013.5078, 314.5252},
    {"Safe House (version 1)", 5, 2233.6918, -1112.8105, 1050.8828, 8.6483},
    {"Safe House (version 2)", 9, 2319.1271, -1023.9561, 1050.2109, 167.3959},
    {"Safe House (version 3)", 10, 2261.0976, -1137.8833, 1050.6328, 266.8800},
    {"San Fierro Garage", 1, -2041.2332, 178.3968, 28.8465, 156.2153},
    {"San Fierro Police Department", 10, 246.0688, 108.9701, 1003.2188, 0.2921},
    {"Secret Valley Diner", 6, 442.1293, -52.4780, 999.7166, 177.9394},
    {"Sex Shop", 3, -100.2674, -22.9375, 1000.7188, 17.2849},
    {"Sherman Dam", 17, -944.2401, 1886.1534, 5.0050, 179.8547},
    {"Sindacco Abatoir", 1, 963.0584, 2159.7563, 1011.0302, 175.3130},
    {"SubUrban", 1, 204.1174, -46.8045, 1001.8046, 357.5776},
    {"Sweet's House", 1, 2527.0175, -1679.2076, 1015.4984, 260.9707},
    {"The Big Spread Ranch", 3, 1212.1489, -28.5387, 1000.9531, 170.5691},
    {"The Camel's Toe Safehouse", 1, 2216.1281, -1076.3050, 1050.4842, 86.4280},
    {"The Johnson House", 3, 2496.0549, -1695.1749, 1014.7421, 179.2174},
    {"The Pig Pen (strip club 2)", 2, 1204.6689, -13.5429, 1000.9218, 350.0202},
    {"The Pleasure Domes", 3, -2638.8232, 1407.3393, 906.4608, 94.6792},
    {"The Welcome Pump", 1, 681.6215, -451.8933, -25.6172, 166.1660},
    {"Torreno's Ranch", 0, -688.1494, 942.0825, 13.6328, 177.6573},
    {"Transfenders", 1, 621.4528, -23.7289, 1000.9218, 15.6787},
    {"Unused Safe House", 12, 2323.7062, -1147.6507, 1050.7099, 206.5352},
    {"Verdant Bluffs Safehouse", 8, 2365.1088, -1133.0793, 1050.8750, 177.3946},
    {"Vice Stadium", 16, -1401.0670, 1265.3706, 1039.8670, 178.6483},
    {"Victim", 5, 225.0305, -9.1836, 1002.2180, 85.5322},
    {"Wang Cars", 0, -1961.6280, 295.2377, 35.4687, 264.4891},
    {"Wardrobe/Changing room", 14, 256.9046, -41.6537, 1002.0233, 85.8774},
    {"Warehouse 1", 18, 1290.4106, 1.9512, 1001.0200, 179.9418},
    {"Warehouse 2", 1, 1412.1472, -2.2836, 1000.9240, 114.6610},
    {"Warehouse 3", 0, 2135.2004, -2276.2814, 20.6718, 318.5899},
    {"Wheel Arch Angels", 3, 612.2191, -123.9028, 997.9921, 266.5704},
    {"Willowfield Safehouse", 11, 2283.3117, 1139.3070, 1050.8984, 19.7031},
    {"World of Coq", 1, 445.6003, -6.9822, 1000.7343, 172.2104},
    {"Wu-Zi Mu's", 1, -2158.6730, 642.0900, 1052.3750, 86.5401},
    {"Zero's RC Shop", 6, -2240.1027, 136.9730, 1035.4139, 269.0953},
    {"Zip", 18, 161.4048, -94.2416, 1001.8046, 0.7936},
    {"Zombotech", 0, -1916.1268, 714.8615, 46.5625, 152.2839}
};

CMD:interiors(playerid, params[])
{
	static list[4096];

	if(pData[playerid][pAdmin] < 6)
		return PermissionError(playerid);

	if(isnull(list))
	{
	    for(new i = 0; i < sizeof(interiorArray); i ++)
	    {
	        format(list, sizeof(list), "%s\n%s", list, interiorArray[i][intName]);
		}
	}

	ShowPlayerDialog(playerid, DIALOG_INTERIOR_MENU, DIALOG_STYLE_LIST, "Choose an interior to teleport to.", list, "Select", "Cancel");
	return 1;
}

TeleportToCoords(playerid, Float:x, Float:y, Float:z, Float:angle, interiorid, worldid, bool:freeze = false, bool:vehicle = true)
{
	new vehicleid = GetPlayerVehicleID(playerid);

	if((vehicle) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
	    foreach(new i : Player)
	    {
	        if(IsPlayerInVehicle(i, vehicleid))
	        {
	            SetPlayerInterior(i, interiorid);
	            SetPlayerVirtualWorld(i, worldid);
			}
	    }

        SetVehiclePos(vehicleid, x, y, z);
     	SetVehicleZAngle(vehicleid, angle);
	    SetVehicleVirtualWorld(vehicleid, worldid);
	    LinkVehicleToInterior(vehicleid, interiorid);
	}
	else
	{
	    SetPlayerPos(playerid, x, y, z);
	    SetPlayerFacingAngle(playerid, angle);
		SetPlayerInterior(playerid, interiorid);
		SetPlayerVirtualWorld(playerid, worldid);
		SetCameraBehindPlayer(playerid);
	}

	if((freeze) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
        SetTimerEx("VehicleUnfreeze", 3000, false, "iifffii", playerid, GetPlayerVehicleID(playerid), x, y, z, interiorid, worldid);
        //ShowFreezeTextdraw(playerid);
        TogglePlayerControllable(playerid, 0);
	}
}

forward VehicleUnfreeze(playerid, vehicleid, Float:x, Float:y, Float:z, interior, world);
public VehicleUnfreeze(playerid, vehicleid, Float:x, Float:y, Float:z, interior, world)
{
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInRangeOfPoint(playerid, 100.0, x, y, z) && GetPlayerInterior(playerid) == interior && GetPlayerVirtualWorld(playerid) == world)
	{
		SetVehiclePos(vehicleid, x, y, z);
	}

	TogglePlayerControllable(playerid, 1);
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new string[1280];
    if(dialogid == DIALOG_INTERIOR_MENU)
	{//Interiors
		if(response)
		{
  			TeleportToCoords(playerid, interiorArray[listitem][intX], interiorArray[listitem][intY], interiorArray[listitem][intZ], interiorArray[listitem][intA], interiorArray[listitem][intID], GetPlayerVirtualWorld(playerid));
     		GameTextForPlayer(playerid, "~w~Teleported", 5000, 1);
	    	format(string, sizeof(string), "INTERIOR: "WHITE_E"You teleported to interior.");
			SCM(playerid, ARWIN, string);
		}
	}
	return 0;
}

