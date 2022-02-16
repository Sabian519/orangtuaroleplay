//-------------[ Player Commands ]-------------//
CMD:help(playerid, params[])
{
	ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "Help Menu", ""GREY_E"Basic Commando\n"WHITE_E"Chat\n"GREY_E"Vehicle Command\n"WHITE_E"Job Help\n"GREY_E"Faction Command\n"WHITE_E"Business help command\n"GREY_E"House help command\n"WHITE_E"Robbery System Command\n"GREY_E"Donate Listening Clues\n"YELLOW_E"OrangTua Roleplay Credits", "Select", "Close");
	return 1;
}

CMD:credits(playerid)
{
	new line1[1200], line2[300], line3[500];
	strcat(line3, ""AQUA"Server Founder: "YELLOW_E"MasPuur\n");
	strcat(line3, ""RED_E"Support In Game: "YELLOW_E"Kentayam20\n");
	strcat(line3, ""LB_E"Mapper: "YELLOW_E"DIo and Barret\n");
	strcat(line3, ""LB_E"Discord Handler: "YELLOW_E"KucingGanteng\n\n");
	format(line2, sizeof(line2), ""LB_E"Server Support: "YELLOW_E"%s & All SA-MP Team\n\n\
	"X1_BLUE"Terima kasih telah bergabung dengan kami! Copyright © 2022 | OT:RP", pData[playerid][pName]);
	format(line1, sizeof(line1), "%s%s", line3, line2);
   	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""ORANGE_E"LRP: "WHITE_E"Server Credits", line1, "OK", "");
	return 1;
}

CMD:vip(playerid)
{
	new longstr2[3500];
	strcat(longstr2, ""X1_BLUE"Looking for bonus features and commands? Get premium status today!\n\n"RED_E"Premium features:\n\
	"dot""AQUA"Regular(1) "LG_E"Rp25.000/month"RED_E"|| "PINK_E"Features:\n\
	"YELLOW_E"1) "WHITE_E"Mendapatkan "LB_E"1500 "WHITE_E"VIP Gold.\n");
	strcat(longstr2, ""YELLOW_E"2) "WHITE_E"Mendapat "GREEN_E"1 "WHITE_E"Bisnis");

	strcat(longstr2, ""YELLOW_E"3) "WHITE_E"Akses custom VIP room dan VIP locker.\n\
	"YELLOW_E"4) "WHITE_E"Mempunya "LB_E"4 "WHITE_E"slot untuk kendaraan pribadi.\n\
	"YELLOW_E"5) "WHITE_E"Mempunya "LB_E"2 "WHITE_E"Slot untuk rumah.\n\
	"YELLOW_E"6) "WHITE_E"Mempunyai "LB_E"2 "WHITE_E"slot untuk bisnis.\n\
	"YELLOW_E"7) "WHITE_E"Mendapatkan 2X Paycheck dari player Biasa"WHITE_E".\n\
	"YELLOW_E"8) "WHITE_E"Waktu Paycheck/Payday "LB_E"5% "WHITE_E"lebih cepat.\n\
	"YELLOW_E"9) "WHITE_E"Mendapatkan "LB_E"10% "WHITE_E"bunga bank setiap kali paycheck\n\
	"YELLOW_E"10) "WHITE_E"Custom Gate Houses+Interior Custom\n");
	strcat(longstr2, ""YELLOW_E"11) "WHITE_E"Custom Mapping "LB_E"Business Exterior"WHITE_E".");


	strcat(longstr2, "\n\n"dot""YELLOW_E"Premium(2) "PINK_E"Rp.50,000/month "RED_E"|| "PINK_E"Features:\n\
	"YELLOW_E"1) "WHITE_E"Gratis "LB_E"1800"WHITE_E" VIP Gold.\n\
	"YELLOW_E"2) "WHITE_E"Mendapat "GREEN_E"1 "WHITE_E"Dealership Bisnis"LB_E"(Free Type).\n\
	"YELLOW_E"3) "WHITE_E"Akses custom VIP room dan VIP locker.\n");
	strcat(longstr2, ""YELLOW_E"4) "WHITE_E"Mempunyai "LB_E"5 "WHITE_E"slot untuk kendaraan pribadi.");

	strcat(longstr2, "\n"YELLOW_E"5) "WHITE_E"Mempunyai "LB_E"3 "WHITE_E"Slot untuk rumah.\n\
	"YELLOW_E"6) "WHITE_E"Mempunyai "LB_E"3 "WHITE_E"slot untuk bisnis.\n\
	"YELLOW_E"7) "WHITE_E"Custom Houses,Exterior,Gate"WHITE_E".\n\
	"YELLOW_E"8) "WHITE_E"Waktu Paycheck/Payday "LB_E"10% "WHITE_E"lebih cepat\n\
	"YELLOW_E"9) "WHITE_E"Mendapatkan "LB_E"15% "WHITE_E"bunga bank setiap kali paycheck.\n");
	strcat(longstr2, ""YELLOW_E"10) "WHITE_E"Custom Interior House "LB_E"Custom Mapping Bisnis "WHITE_E".\n");

	strcat(longstr2, "\n\n"dot""PURPLE_E"VIP Player(3) "PINK_E"Rp.70,000/month "RED_E"|| "PINK_E"Features:\n\
	"YELLOW_E"1) "WHITE_E"Mendapatkan "LB_E"1 Buah Workshop+Mapping "WHITE_E".\n\
	"YELLOW_E"2) "WHITE_E"Mendapat "YELLOW_E"2500 "WHITE_E"Gold.\n\
	"YELLOW_E"3) "WHITE_E"Akses custom VIP room dan VIP locker.\n\
	"YELLOW_E"4) "WHITE_E"Mempunyai "LB_E"6 "WHITE_E"slot untuk kendaraan pribadi.\n\
	"YELLOW_E"5) "WHITE_E"Mempunyai "LB_E"4 "WHITE_E"Slot untuk rumah.\n\
	"YELLOW_E"6) "WHITE_E"Mempunyai "LB_E"4 "WHITE_E"slot untuk bisnis.\n\
	"YELLOW_E"7) "WHITE_E"Mempunyai "LB_E"4 "WHITE_E"slot untuk workshop.\n\
	"YELLOW_E"8) "WHITE_E"Mempunyai "LB_E"4 "WHITE_E"slot untuk Dealership.\n\
	"YELLOW_E"9) "WHITE_E"Custom interior,exterior,gate houses"WHITE_E".\n\
	"YELLOW_E"10) "WHITE_E"Custom Exterior "LB_E"Business,Workshop,Dealership "WHITE_E".\n\
	"YELLOW_E"11) "WHITE_E"Waktu Paycheck/Payday "LB_E"15% "WHITE_E"lebih cepat.\n\
	"YELLOW_E"12) "WHITE_E"Mendapatkan "LB_E"20% "WHITE_E"bunga bank setiap kali paycheck.");

	strcat(longstr2, "\n\n"LB_E"Pembayaran Via Dana,Gopay,BANK. "LB2_E"Harga Gold "LB_E"Rp.10,000/ 250 gold.\n\
	"YELLOW_E"Untuk informasi selengkapnya hubungi Moch Aryy(Server Owner & Founder)!");
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""ORANGE_E"OT:RP "PINK_E"VIP SYSTEM", longstr2, "Close", "");
	return 1;
}

CMD:donate(playerid)
{
    new line3[3500];
    strcat(line3, ""RED_E"...:::... "DOOM_"Donate List OrangTua Roleplay "RED_E"...:::...\n");
    strcat(line3, ""RED_E"..:.. "DOOM_"GOLD(OOC) "RED_E"..:..\n\n");

    strcat(line3, ""DOOM_"1. 500 Gold >> "LG_E"Rp 15.000\n");
    strcat(line3, ""DOOM_"2. 900 Gold >> "LG_E"Rp 25.000\n");
	strcat(line3, ""DOOM_"3. 1200 Gold >> "LG_E"Rp 40.000\n");
    strcat(line3, ""DOOM_"4. 1700 Gold >> "LG_E"Rp 50.000\n");
	strcat(line3, ""DOOM_"5. 2500 Gold >> "RED_E"Rp 75.000\n");
    strcat(line3, ""DOOM_"6. 4200 Gold >> "RED_E"Rp 90.000\n\n");

	strcat(line3, ""RED_E"..::.. "DOOM_"VIP PLAYER "RED_E"..::..\n\n");
	
    strcat(line3, ""DOOM_"1. VIP Regular(1 Month) >> "RED_E"1000 Gold\n");
    strcat(line3, ""DOOM_"2. VIP Premium(1 Month) >> "RED_E"1750 Gold\n");
    strcat(line3, ""DOOM_"3. VIP Platinum(1 Month) >> "RED_E"2200 Gold\n\n");

	strcat(line3, ""RED_E"..:::.. "DOOM_"SERVER FEATURE "RED_E"..:::..\n\n");
    strcat(line3, ""DOOM_"1. Mapping(per object) >> "RED_E"120 Gold\n");
	strcat(line3, ""DOOM_"2. Private Door >> "RED_E"100 Gold\n");
	strcat(line3, ""DOOM_"3. Private Gate >> "RED_E"250 Gold\n");
	strcat(line3, ""DOOM_"4. Bisnis >> "RED_E"(Tergantung Lokasi)\n");
	strcat(line3, ""DOOM_"5. House >> "RED_E"(Tergantung Lokasi dan Type)\n");
	strcat(line3, ""DOOM_"6. Custom House Interior >> "RED_E"(Tergantung Interior)\n");
	strcat(line3, ""DOOM_"7. Custom Busines Exterior >> "RED_E"(Tergantung Banyak Object)\n");
	strcat(line3, ""DOOM_"8. Custom Dealership Exterior >> "RED_E"(Tergantung Banyak Object)\n");
	strcat(line3, ""DOOM_"9. Custom Workshop Exterior >> "RED_E"(Tergantung Exterior)\n");
	strcat(line3, ""DOOM_"10. Dealerehip Owner >> "RED_E"(Tergantung Lokasi dan Type)\n");
	strcat(line3, ""DOOM_"11. Business Workshop >> "RED_E"(Tergantung Lokasi )\n");
	
	strcat(line3, ""RED_E"..::::.. "DOOM_"SERVER VEHICLE "RED_E"..:::::..\n\n");
    strcat(line3, ""DOOM_"1. VEHICLE IN DEALER >> "RED_E"1200 Gold\n");
	strcat(line3, ""DOOM_"2. VEHICLE NON DEALER >> "RED_E"1800 Gold\n");
	strcat(line3, ""DOOM_"3. BOAT / HELI >> "RED_E"2300 Gold\n\n");

    strcat(line3, ""RED_E"..::.. "WHITE_E"CONTACT INFO "RED_E"..::..\n");
    strcat(line3, ""WHITE_E"1. NAMA : "RED_E"Moch Aryy\n");
    strcat(line3, ""WHITE_E"-  Discord: "RED_E"Aryy#8717\n\n");
	
    strcat(line3, ""WHITE_E"2. NAMA : "RED_E"-\n");
    strcat(line3, ""WHITE_E"-  Discord : "RED_E"-\n\n");

    strcat(line3, ""RED_E"..::.. "WHITE_E"NOTE "RED_E"..::..\n");
    strcat(line3, ""WHITE_E"Note: "RED_E"Pembayaran Via PayPal, Gopay, Dana,\n\n");

	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""ORANGE_E"OTRP: "WHITE_E"DONATE LIST", line3, "Okay", "");
	return 1;
}

CMD:email(playerid)
{
    if(pData[playerid][IsLoggedIn] == false)
		return Error(playerid, "You must be logged in to change your email address!");

	ShowPlayerDialog(playerid, DIALOG_EMAIL, DIALOG_STYLE_INPUT, ""WHITE_E"Set your email address", ""WHITE_E"Enter your email address below.\nThis will be used to reset your password incase you lose it.\n\n"RED_E"* "WHITE_E"Your e-mail is confidential and will not be displayed publicly\n"RED_E"* "WHITE_E"Emails will only be sent for a password reset or important news\n\
	"RED_E"* "WHITE_E"Be sure to double-check and enter a valid email address!", "Enter", "Exit");
	return 1;
}

CMD:changepass(playerid)
{
    if(pData[playerid][IsLoggedIn] == false)
		return Error(playerid, "You must be logged in to change your email address!");

	ShowPlayerDialog(playerid, DIALOG_PASSWORD, DIALOG_STYLE_INPUT, ""WHITE_E"Change your password", "Insert your new password to change!", "Change", "Exit");
	InfoTD_MSG(playerid, 3000, "~g~~h~Insert your current password!");
	return 1;
}

CMD:savestats(playerid, params[])
{
	if(pData[playerid][IsLoggedIn] == false)
		return Error(playerid, "You are not logged in!");
		
	UpdatePlayerData(playerid);
	Servers(playerid, "Your statistics has successfully saved in database!");
	return 1;
}

CMD:gshop(playerid, params[])
{
	new Dstring[512];
	format(Dstring, sizeof(Dstring), "Gold Shop\tPrice\nInstant Change Name\t"YELLOW_E"500 Gold\n");
	format(Dstring, sizeof(Dstring), "%sClear Warning"RED_E"(1 Warn)\t"YELLOW_E"50 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sVIP Level 1 "AQUA"(7 Days)\t"YELLOW_E"150 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sVIP Level 2 "AQUA"(7 Days)\t"YELLOW_E"250 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sVIP Level 3 "AQUA"(7 Days)\t"YELLOW_E"500 Gold\n", Dstring);
	ShowPlayerDialog(playerid, DIALOG_GOLDSHOP, DIALOG_STYLE_TABLIST_HEADERS, "Gold Shop Listening", Dstring, "Chooise", "Cancel");
	return 1;
}

CMD:mypos(playerid, params[])
{
	new int, Float:px,Float:py,Float:pz, Float:a;
	GetPlayerPos(playerid, px, py, pz);
	GetPlayerFacingAngle(playerid, a);
	int = GetPlayerInterior(playerid);
	new zone[MAX_ZONE_NAME];
	GetPlayer3DZone(playerid, zone, sizeof(zone));
	SendClientMessageEx(playerid, COLOR_WHITE, "Lokasi Anda Saat Ini: %s (%0.2f, %0.2f, %0.2f, %0.2f) Int = %d", zone, px, py, pz, a, int);
	return 1;
}

CMD:gps(playerid, params[])
{
	if(pData[playerid][pGPS] < 1) return Error(playerid, "You don't have GPS, Visit 24/7 to purchased.");
	ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "GPS Menu", "Disable GPS\nPublic GPS\nMy House\nMy Bisnis\nMy Vehicle\nDMV-Licenses\nMy Mission(Trucker)\nMy Hauling(Trucker)\nMy Hauling(Dealership)\nLos Santos City Hall\nPublic Bank Los Santos\nPalomino Bank\nShowroom/Dealer\nPublic Farm\nComponent Warehouse\nMaterial Warehouse\nFish Factory\nJobs", "Select", "Close");
	return 1;
}

CMD:gpsbis(playerid)
{
	new
 	han2[MAX_BISNIS * 32];

	han2 = "ID\tName\tType\tLocation\n";

    new type[128];
   	foreach(new bid : Bisnis)
	{
		if(bData[bid][bType] == 1)
		{
			type = "Fast Food";
		}
		else if(bData[bid][bType] == 2)
		{
			type = "Market";
		}
		else if(bData[bid][bType] == 3)
		{
			type = "Clothes";
		}
		else if(bData[bid][bType] == 4)
		{
			type = "Equipment";
		}
		else if(bData[bid][bType] == 5)
		{
			type = "Bar";
		}
		else
		{
			type = "Unknow";
		}

	    format(han2, sizeof(han2), "%s%d\t%s\t%s\t"RED_E"%.1f m\n", han2,
	    bid, bData[bid][bName], type, GetPlayerDistanceFromPoint(playerid, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]));
	}
	ShowPlayerDialog(playerid, DIALOG_FIND_BISNIS, DIALOG_STYLE_TABLIST_HEADERS, "Business Location", han2, "Select", "Close");
	return 1;
}

CMD:findatm(playerid)
{
	new
	han2[MAX_ATM * 32]; // Default 32

	han2 = "Place ATM\tLocation\tStatus\n";

   	foreach(new bid : Trees)
	{
	   new stats[9999];
	   if(AtmData[bid][atmStatus] == 0)
	   {
	  		// ATM Dapat di Gunakan
	   		stats = ""LG_E"ENABLE";
	   }
       else
	   {
	    	// ATM Tidak Dapat di Gunakan
			stats = ""RED_E"DISABLE";
	   }
 	   format(han2, sizeof(han2), "%sATM"LG_E" ID: %d\t"YELLOW_E"%.1f m\t%s\n", han2,
 	   bid, GetPlayerDistanceFromPoint(playerid, AtmData[bid][atmX], AtmData[bid][atmY], AtmData[bid][atmZ]), stats);
	}
	ShowPlayerDialog(playerid, DIALOG_FIND_ATM, DIALOG_STYLE_TABLIST_HEADERS, "GPS: Nearest ATM Location", han2, "Select", "Close");
	return 1;
}

CMD:gpsdealer(playerid)
{
	new
 	han2[MAX_DEALERSHIP * 32];

	han2 = "ID\tName\tType\tLocation\n";

    new type[128];
   	foreach(new bid : Dealer)
	{
		if(DealerData[bid][dealerType] == 1)
		{
			type = "Motorcycle";
		}
		else if(DealerData[bid][dealerType] == 2)
		{
			type = "Cars";
		}
		else if(DealerData[bid][dealerType] == 3)
		{
			type = "Unique Cars";
		}
		else if(DealerData[bid][dealerType] == 4)
		{
			type = "Job Cars";
		}
		else if(DealerData[bid][dealerType] == 5)
		{
			type = "Truck";
		}
		else
		{
			type = "Unknow";
		}

	    format(han2, sizeof(han2), "%s%d\t%s\t%s\t"RED_E"%.1f m\n", han2,
	    bid, DealerData[bid][dealerName], type, GetPlayerDistanceFromPoint(playerid, DealerData[bid][dealerPosX], DealerData[bid][dealerPosY], DealerData[bid][dealerPosZ]));
	}
	ShowPlayerDialog(playerid, DIALOG_FIND_DEALER, DIALOG_STYLE_TABLIST_HEADERS, "Dealership Location", han2, "Select", "Close");
	return 1;
}

CMD:death(playerid, params[])
{
    if(pData[playerid][pInjured] == 0)
        return Error(playerid, "You are not injured at the moment.");
		
	if(pData[playerid][pJail] > 0)
		return Error(playerid, "You can't do this when in jail!");
		
	if(pData[playerid][pArrest] > 0)
		return Error(playerid, "You can't do this when in arrest sapd!");

    if((gettime()-GetPVarInt(playerid, "GiveUptime")) < 100)
        return Error(playerid, "You must waiting 3 minutes for spawn to hospital");
        
	/*if(pMatiPukul[playerid] == 1)
	{
	    SetPlayerHealthEx(playerid, 50.0);
	    ClearAnimations(playerid);
	    pData[playerid][pInjured] = 0;
	    pMatiPukul[playerid] = 0;
    	Servers(playerid, "You have wake up and accepted death in your position.");
    	return 1;
	}*/
    Servers(playerid, "You have given up and accepted your death.");
	pData[playerid][pHospitalTime] = 0;
	pData[playerid][pHospital] = 1;
    return 1;
}

CMD:piss(playerid, params[])
{
    if(pData[playerid][pInjured] == 1)
        return Error(playerid, "You can't use this command at the injured moment.");
        
	new time = (100 - pData[playerid][pBladder]) * (300);
    SetTimerEx("UnfreezePee", time, 0, "i", playerid);
    SetPlayerSpecialAction(playerid, 68);
    return 1;
}

CMD:sleep(playerid, params[])
{
	if(pData[playerid][pInjured] == 1)
        return Error(playerid, "You can't use this command at the injured moment.");
	
	if(pData[playerid][pInHouse] == -1)
		return Error(playerid, "You must inside a house to sleep.");
	
	InfoTD_MSG(playerid, 10000, "Sleeping... Please wait!");
	TogglePlayerControllable(playerid, 0);
	new time = (100 - pData[playerid][pEnergy]) * (400);
    SetTimerEx("UnfreezeSleep", time, 0, "i", playerid);
	switch(random(6))
	{
		case 0: ApplyAnimation(playerid, "INT_HOUSE", "BED_In_L",4.1,0,0,0,1,1);
		case 1: ApplyAnimation(playerid, "INT_HOUSE", "BED_In_R",4.1,0,0,0,1,1);
		case 2: ApplyAnimation(playerid, "INT_HOUSE", "BED_Loop_L",4.1,1,0,0,1,1);
		case 3: ApplyAnimation(playerid, "INT_HOUSE", "BED_Loop_R",4.1,1,0,0,1,1);
		case 4: ApplyAnimation(playerid, "INT_HOUSE", "BED_Out_L",4.1,0,1,1,0,0);
		case 5: ApplyAnimation(playerid, "INT_HOUSE", "BED_Out_R",4.1,0,1,1,0,0);
	}
	return 1;
}

/*CMD:salary(playerid, params[])
{
	new query[256], count;
	format(query, sizeof(query), "SELECT * FROM salary WHERE owner='%d'", pData[playerid][pID]);
	new Cache:result = mysql_query(g_SQL, query);
	new rows = cache_num_rows();
	if(rows) 
	{
		new str[2048];
		for(new i; i < rows; i++)
		{
			new info[64];
			cache_get_value_int(i, "id", pSalary[playerid][i][salaryId]);
			cache_get_value_int(i, "money", pSalary[playerid][i][salaryMoney]);
			cache_get_value(i, "info", info);
			format(pSalary[playerid][i][salaryInfo], 64, "%s", info);
			cache_get_value_int(i, "date", pSalary[playerid][i][salaryDate]);
			
			format(str, sizeof(str), "%s%s\t%s\t%s\n", str, ReturnDate(pSalary[playerid][i][salaryDate]), pSalary[playerid][i][salaryInfo], FormatMoney(pSalary[playerid][i][salaryMoney]));
			count++;
			if(count >= 10) break;
		}
		format(str, sizeof(str), "Date\tInfo\tCash\n", str);
		if(count >= 10)
		{
			format(str, sizeof(str), "%s\nNext >>>", str);
		}
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "Salary Details", str, "Close", "");
	}
	else 
	{
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Notice", "Kamu tidak memiliki salary saat ini!", "Ok", "");
	}
	cache_delete(result);
	return 1;
}*/

CMD:delays(playerid)
{
	if(pData[playerid][IsLoggedIn] == false)
		return Error(playerid, "You must logged in!");

	new line2[1200], header[100];
	format(header,sizeof(header),"Delays Timers: "AQUA"(%s)", pData[playerid][pName]);
	format(line2, sizeof(line2), ""WHITE_E"Plant Time(Farmer): "YELLOW_E"%d second\n"WHITE_E"Arrest Time: "YELLOW_E"%d second\n"WHITE_E"Jail Time: "YELLOW_E"%d second\n"WHITE_E"Mining Delay Time: "YELLOW_E"%d second\n"WHITE_E"Trucker Drivers Time: "YELLOW_E"%d second\n"WHITE_E"Lumberjack Delay Time: "YELLOW_E"%d second\n"WHITE_E"Production Delay Time: "YELLOW_E"%d second\n"WHITE_E"Depositor Delay Time: "YELLOW_E"%d second\n"WHITE_E"Street Cleanner Delay: "YELLOW_E"%d second\n"WHITE_E"Bus Driver Delay: "YELLOW_E"%d second\n"WHITE_E"Forklift Driver Delay: "YELLOW_E"%d second\n"WHITE_E"Pizzaboy Delay: "YELLOW_E"%d second\n"RED_E"Smuggler Time: "YELLOW_E"%d second\n",
	pData[playerid][pPlantTime], pData[playerid][pArrestTime],
	// All Job Delays Time
	pData[playerid][pJailTime], pData[playerid][pJobTime], pData[playerid][pTruckerTime],
	pData[playerid][pLumberTime], pData[playerid][pProductionTime], pData[playerid][pDepositorTime],
 	// All SideJob Delays Time
	 pData[playerid][pSideJobTime], pData[playerid][pBusTime], pData[playerid][pForTime], pData[playerid][pPizzaTime],
	// All Jobs Ilegal Time
	pData[playerid][pSmugglerTime]);
   	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, header, line2, "Okay", "");
	return 1;
}

CMD:time(playerid)
{
	if(pData[playerid][IsLoggedIn] == false)
		return Error(playerid, "You must logged in!");

	new line2[1200];
	new paycheck = 3600 - pData[playerid][pPaycheck];
	if(paycheck < 1)
	{
		paycheck = 0;
	}

	format(line2, sizeof(line2), ""WHITE_E"Paycheck Time: "YELLOW_E"%d remaining\n"WHITE_E"Bank Money: "LG_E"%d\n"WHITE_E"Rekening Bank: "AQUA"%d\n\n"YELLOW_E"Your Online for %d hour(s) %d minute(s) Righ Now", paycheck, pData[playerid][pBankMoney], pData[playerid][pBankRek], pData[playerid][pHours], pData[playerid][pMinutes]);
   	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""AQUA"OT RP: "WHITE_E"My Time", line2, "Okay", "");
	return 1;
}

CMD:cc(playerid, params[])
{
	for(new i = 0; i < 20; i++)
	{
		SendClientMessage(playerid, -1, "");
	}
	return 1;
}

CMD:idcard(playerid, params[])
{
	if(pData[playerid][pIDCard] == 0) return Error(playerid, "Anda tidak memiliki id card!");
	new sext[40];
	if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
	SendNearbyMessage(playerid, 20.0, COLOR_GREEN, "[ID-Card] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pIDCardTime]));
	return 1;
}

CMD:drivelic(playerid, params[])
{
	if(pData[playerid][pDriveLic] == 0) return Error(playerid, "Anda tidak memiliki Driving License/SIM!");
	new sext[40];
	if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
	SendNearbyMessage(playerid, 20.0, COLOR_GREEN, "[Drive-Lic] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pDriveLicTime]));
	return 1;
}

CMD:claimsp(playerid, params[])
{
	if(pData[playerid][pStarterpack] == 1) return Error(playerid, "Anda sudah pernah mengclaim starterpack");

    SendStaffMessage(COLOR_RED, "* %s "WHITE_E"Has claimed starterpack", pData[playerid][pName]);
    Info(playerid, "Kamu telah berhasil mengclaim starterpack, kamu mendapat uang sebesar "LG_E"$45,00 "WHITE_E"dan "YELLOW_E"10 Gold VIP");
    pData[playerid][pStarterpack]++;
    pData[playerid][pGold] = 10;
	GivePlayerMoneyEx(playerid, 4500);
	SavePlayerAccount(playerid);
	return 1;
}

CMD:createidcard(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 361.8575, 173.5981, 1008.3828)) return Error(playerid, "Anda harus berada di City Hall!");
	if(pData[playerid][pIDCard] != 0) return Error(playerid, "Anda sudah memiliki ID Card!");
	if(GetPlayerMoney(playerid) < 500) return Error(playerid, "Anda butuh $05,00 untuk membuat ID Card");
	new sext[400], mstr[10000];
	if(pData[playerid][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(mstr, sizeof(mstr), "{FFFFFF}Nama: "YELLOW_E"%s\n"WHITE_E"Negara: "YELLOW_E"San Andreas\n"WHITE_E"Tgl Lahir: "YELLOW_E"%s\n"WHITE_E"Jenis Kelamin: "AQUA"%s\n\n"LG_E2"Berlaku hingga 14 hari!\n{FFFFFF}Pay ID Card: "LG_E2"$5,00", pData[playerid][pName], pData[playerid][pAge], sext);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "My ID-Card", mstr, "Tutup", "");
	pData[playerid][pIDCard] = 1;
	pData[playerid][pIDCardTime] = gettime() + (15 * 86400);
	GivePlayerMoneyEx(playerid, -500);
	Server_AddMoney(25);
	return 1;
}

CMD:dmvproof(playerid, params[])
{
	if(pData[playerid][pDMVProof] == 0) return Error(playerid, "Anda belum menyelesaikan Tes Mengemudi!");

	new otherid;
	if(sscanf(params, "ud", otherid))
	{
	    Usage(playerid, "/dmvproof <ID/Name>");
	    return true;
	}

	new sext[40], mstr[10000];
	if(pData[playerid][pGender] == 1)
	{
		sext = "Male";
	}
	else
	{
		sext = "Female";
	}
	format(mstr, sizeof(mstr), ""YELLOW_E"Name: "LG_E"%s\n"YELLOW_E"Gender: "LG_E"%s\n"YELLOW_E"Brithday: "LG_E"%s\n"YELLOW_E"Drive Test: "LG_E"Lulus\n"YELLOW_E"Test Teori: "LG_E"Lulus\n\n"YELLOW_E"TTD: "LB_E"DMV-Los Santos\n", pData[playerid][pName], pData[playerid][pAge], sext);
	ShowPlayerDialog(otherid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "DMV-Proof Licenses", mstr, "Close", "");
	return 1;
}

CMD:newage(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 361.8575, 173.5981, 1008.3828)) return Error(playerid, "Anda harus berada di City Hall!");
	//if(pData[playerid][pIDCard] != 0) return Error(playerid, "Anda sudah memiliki ID Card!");
	if(GetPlayerMoney(playerid) < 1500) return Error(playerid, "Anda butuh $15,00 untuk mengganti tgl lahir anda!");
	if(pData[playerid][IsLoggedIn] == false) return Error(playerid, "Anda harus login terlebih dahulu!");
	ShowPlayerDialog(playerid, DIALOG_CHANGEAGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun): 15/04/1998", "Change", "Cancel");
	return 1;
}

/*CMD:buyplate(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 240.80, 112.95, 1003.21)) return Error(playerid, "Anda harus berada di SAPD!");
	
	new bool:found = false, msg2[512], Float:fx, Float:fy, Float:fz;
	format(msg2, sizeof(msg2), "ID\tModel\tPlate\tPlate Time\n");
	foreach(new i : PVehicles)
	{
		if(pvData[i][cOwner] == pData[playerid][pID])
		{
			if(strcmp(pvData[i][cPlate], "NoHave"))
			{
				GetVehiclePos(pvData[i][cVeh], fx, fy, fz);
				format(msg2, sizeof(msg2), "%s%d\t%s\t%s\t%s\n", msg2, pvData[i][cVeh], GetVehicleModelName(pvData[i][cModel]), pvData[i][cPlate], ReturnTimelapse(gettime(), pvData[i][cPlateTime]));
				found = true;
			}
			else
			{
				GetVehiclePos(pvData[i][cVeh], fx, fy, fz);
				format(msg2, sizeof(msg2), "%s%d\t%s\t%s\tNone\n", msg2, pvData[i][cVeh], GetVehicleModelName(pvData[i][cModel]), pvData[i][cPlate]);
				found = true;
			}
		}
	}
	if(found)
		ShowPlayerDialog(playerid, DIALOG_BUYPLATE, DIALOG_STYLE_TABLIST_HEADERS, "Vehicles Plate", msg2, "Buy", "Close");
	else
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Vehicles Plate", "Anda tidak memeliki kendaraan", "Close", "");
			
	return 1;
}*/

CMD:payticket(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 246.45, 118.53, 1003.21)) return Error(playerid, "Anda harus berada di kantor SAPD!");
	
	new vehid;
	if(sscanf(params, "d", vehid))
		return Usage(playerid, "/payticket [vehid] | /v my(/mypv) - for find vehid");
		
	if(vehid == INVALID_VEHICLE_ID || !IsValidVehicle(vehid))
		return Error(playerid, "Invalid id");
		
	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				new ticket = pvData[i][cTicket];
				
				if(ticket > GetPlayerMoney(playerid))
					return Error(playerid, "Not enough money! check your ticket in /v insu.");
					
				if(ticket > 0)
				{
					GivePlayerMoneyEx(playerid, -ticket);
					pvData[i][cTicket] = 0;
					Info(playerid, "Anda telah berhasil membayar ticket tilang kendaraan %s(id: %d) sebesar "RED_E"%s", GetVehicleName(vehid), vehid, FormatMoney(ticket));
					return 1;
				}
			}
			else return Error(playerid, "Kendaraan ini bukan milik anda! /v my(/mypv) - for find vehid");
		}
	}
	return 1;
}

CMD:buyplate(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 240.80, 112.95, 1003.21)) return Error(playerid, "Anda harus berada di SAPD!");
		
	new vehid;
	if(sscanf(params, "d", vehid)) return Usage(playerid, "/buyplate [vehid] | /v my(/mypv) - for find vehid");
	
	if(vehid == INVALID_VEHICLE_ID || !IsValidVehicle(vehid))
		return Error(playerid, "Invalid id");
			
	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				if(GetPlayerMoney(playerid) < 650) return Error(playerid, "Anda butuh $06,50 untuk membeli Plate baru.");
				GivePlayerMoneyEx(playerid, -650);
				new rand = RandomEx(1111, 9999);
				format(pvData[i][cPlate], 32, "S:CityPride-%d", rand);
				SetVehicleNumberPlate(pvData[i][cVeh], pvData[i][cPlate]);
				pvData[i][cPlateTime] = gettime() + (15 * 86400);
				Info(playerid, "Model: %s || New plate: %s || Plate Time: %s || Plate Price: $325,00", GetVehicleModelName(pvData[i][cModel]), pvData[i][cPlate], ReturnTimelapse(gettime(), pvData[i][cPlateTime]));
			}
			else return Error(playerid, "ID kendaraan ini bukan punya mu! gunakan /v my(/mypv) untuk mencari ID.");
		}
	}
	return 1;
}

CMD:buyinsu(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 358.6334,164.8016,1008.3828)) return Error(playerid, "Anda harus berada di City Hall!");
		
	new vehid;
	if(sscanf(params, "d", vehid)) return Usage(playerid, "/buyinsu [vehid] | /v my(mypv) - for find vehid");
	if(vehid == INVALID_VEHICLE_ID) return Error(playerid, "Invalid id");
			
	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID] && pvData[i][cClaim] == 0)
			{
				if(GetPlayerMoney(playerid) < 1000) return Error(playerid, "Anda butuh $10,00 untuk membeli Insurance.");
				GivePlayerMoneyEx(playerid, -1000);
				pvData[i][cInsu]++;
				Info(playerid, "Model: %s || Total Insurance: %d || Insurance Price: $65,00", GetVehicleModelName(pvData[i][cModel]), pvData[i][cInsu]);
			}
			else return Error(playerid, "ID kendaraan ini bukan punya mu! gunakan /v my(/mypv) untuk mencari ID.");
		}
	}
	return 1;
}

CMD:claimpv(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 358.6334,164.8016,1008.3828)) return Error(playerid, "Anda harus berada di City Hall!");
	new found = 0;
	foreach(new i : PVehicles)
	{
		if(pvData[i][cClaim] == 1 && pvData[i][cClaimTime] == 0)
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				pvData[i][cClaim] = 0;

				OnPlayerVehicleRespawn(i);
				pvData[i][cPosX] = 1475.71;
				pvData[i][cPosY] = -1709.31;
				pvData[i][cPosZ] = 14.04;
				pvData[i][cPosA] = 183.05;
				SetValidVehicleHealth(pvData[i][cVeh], 1500);
				SetVehiclePos(pvData[i][cVeh], 1475.71, -1709.31, 14.04);
				SetVehicleZAngle(pvData[i][cVeh], 183.05);
				SetVehicleFuel(pvData[i][cVeh], 1000);
				found++;
				Info(playerid, "Anda telah mengclaim kendaraan %s anda.", GetVehicleModelName(pvData[i][cModel]));
			}
			//else return Error(playerid, "ID kendaraan ini bukan punya mu! gunakan /v my(/mypv) untuk mencari ID.");
		}
	}
	if(found == 0)
	{
		Info(playerid, "Sekarang belum saatnya anda mengclaim kendaraan anda!");
	}
	else
	{
		Info(playerid, "Anda berhasil mengclaim %d kendaraan anda!", found);
	}
	return 1;
}

CMD:sellpv(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 358.6334,164.8016,1008.3828)) return Error(playerid, "Anda harus berada di City Hall!");
	
	new vehid;
	if(sscanf(params, "d", vehid)) return Usage(playerid, "/sellpv [vehid] | /v my(mypv) - for find vehid");
	if(vehid == INVALID_VEHICLE_ID) return Error(playerid, "Invalid id");
			
	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				if(!IsValidVehicle(pvData[i][cVeh])) return Error(playerid, "Your vehicle is not spanwed!");
				if(pvData[i][cRent] != 0) return Error(playerid, "You can't sell rental vehicle!");
				new pay = pvData[i][cPrice] / 2;
				GivePlayerMoneyEx(playerid, pay);
				
				Info(playerid, "Anda menjual kendaraan model %s(%d) dengan seharga "LG_E"%s", GetVehicleName(vehid), GetVehicleModel(vehid), FormatMoney(pay));
				new query[128];
				mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[i][cID]);
				mysql_tquery(g_SQL, query);
				if(IsValidVehicle(pvData[i][cVeh])) DestroyVehicle(pvData[i][cVeh]);
				Iter_SafeRemove(PVehicles, i, i);
			}
			else return Error(playerid, "ID kendaraan ini bukan punya mu! gunakan /v my(/mypv) untuk mencari ID.");
		}
	}
	return 1;
}

CMD:newrek(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1375.7867,-21.3897,1000.8729))
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1428.882324, -986.068542, 996.105041)) return Error(playerid, "Anda harus berada di Bank!");
	if(GetPlayerMoney(playerid) < 500) return Error(playerid, "Not enough money!");
	new query[128], rand = RandomEx(111111, 999999);
	new rek = rand+pData[playerid][pID];
	mysql_format(g_SQL, query, sizeof(query), "SELECT brek FROM players WHERE brek='%d'", rek);
	mysql_tquery(g_SQL, query, "BankRek", "id", playerid, rek);
	Info(playerid, "New rekening bank!");
	GivePlayerMoneyEx(playerid, -500);
	Server_AddMoney(50);
	return 1;
}

CMD:pay(playerid, params[])
{
	if(pData[playerid][pLevel] < 2)
		return Error(playerid, "You must level 2 to pay!");

    new id, cash[32], String[256];
    new dollars, cents, totalcash[25];
    if(sscanf(params, "us[32]", id, cash)) return SendClientMessage(playerid, ARWIN, "USAGE: /pay [playerid] [amount]");

    if(strfind(cash, ".", true) != -1)
    {
        sscanf(cash, "p<.>dd", dollars, cents);
        format(totalcash, sizeof(totalcash), "%d%02d", dollars, cents);
        if(IsPlayerConnected(id) && id != playerid)
        {
            if(GetPlayerMoney(playerid) >= strval(totalcash))
            {
				if(!IsPlayerConnected(id) || !NearPlayer(playerid, id, 4.0))
			        return Error(playerid, "The specified player is disconnected or not near you.");

    			if(strval(totalcash) < 0) return SendClientMessageEx(playerid, COLOR_RED, "ERROR: {FFFFFF}Tidak bisa dibawah $0.00");
        		GivePlayerMoneyEx(playerid, -strval(totalcash));
 			    GivePlayerMoneyEx(id, strval(totalcash));
      		    format(String, sizeof(String), "PAYINFO: {ffffff}You've given {ffff00}%s {00ff00}$%s", ReturnName(playerid), FormatMoney(strval(totalcash)));
           		SendClientMessage(playerid, COLOR_LOGS, String);
                format(String, sizeof(String), "PAYINFO: {ffffff}You've received {00ff00}$%s {ffffff}from {ffff00}%s ", FormatMoney(strval(totalcash)), ReturnName(playerid));
                SendClientMessage(id, COLOR_LOGS, String);
                SendStaffMessage(COLOR_YELLOW, "PAYLOG: %s give money in the amount of %s for %s", ReturnName(playerid), FormatMoney(strval(totalcash)), ReturnName(id));
               	ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
				ApplyAnimation(id, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
			    new ip[32], ipex[32];
			    GetPlayerIp(playerid, ip, sizeof(ip));
			    GetPlayerIp(id, ipex, sizeof(ipex));
			}
            else Error(playerid, "Anda tidak memiliki uang sebesar itu.");
        }
    }
    else
    {
        sscanf(cash, "d", dollars);
        format(totalcash, sizeof(totalcash), "%d00", dollars);
        if(IsPlayerConnected(id) && id != playerid)
        {
            if(GetPlayerMoney(playerid) >= strval(totalcash))
            {
				if(!IsPlayerConnected(id) || !NearPlayer(playerid, id, 4.0))
			        return Error(playerid, "The specified player is disconnected or not near you.");

			    if(strval(totalcash) < 0) return SendClientMessageEx(playerid, COLOR_GREY, "Tidak bisa dibawah $0.00");
       	        GivePlayerMoneyEx(playerid, -strval(totalcash));
     		    GivePlayerMoneyEx(id, strval(totalcash));
          	    format(String, sizeof(String), "PAYINFO: {ffffff}You've given {ffff00}%s {00ff00}$%s", ReturnName(playerid), FormatMoney(strval(totalcash)));
	          	SendClientMessage(playerid, COLOR_LOGS, String);
                format(String, sizeof(String), "PAYINFO: {ffffff}You've received {00ff00}$%s {ffffff}from {ffff00}%s ", FormatMoney(strval(totalcash)), ReturnName(playerid));
                SendClientMessage(id, COLOR_LOGS, String);
                SendStaffMessage(COLOR_YELLOW, "PAYLOG: %s give money in the amount of %s for %s", ReturnName(playerid), FormatMoney(strval(totalcash)), ReturnName(id));
               	ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
				ApplyAnimation(id, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
	    		new ip[32], ipex[32];
	    		GetPlayerIp(playerid, ip, sizeof(ip));
	    		GetPlayerIp(id, ipex, sizeof(ipex));
			}
            else Error(playerid, "Anda tidak memiliki uang sebesar itu.");
        }
    }
    return 1;
}
CMD:stats(playerid, params[])
{
	if(pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be logged in to check statistics!");
	    return 1;
	}
	
	DisplayStats(playerid, playerid);
	return 1;
}

CMD:id(playerid, params[])
{
	new string[128], version[128], giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return Usage(playerid, "/id [playerid/partofname]");

	if(pData[giveplayerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be logged in to check statistics!");
	    return 1;
	}
	GetPlayerVersion(giveplayerid, version, sizeof version);
	format(string, sizeof(string), "[ID:%d] %s - Level:%d - Ping:%d - Version: %s", giveplayerid, ReturnName(giveplayerid),  pData[giveplayerid][pLevel], GetPlayerPing(giveplayerid), version);
	SendClientMessage(playerid, ARWIN, string);
	return 1;
}

CMD:settings(playerid)
{
	if(pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be logged in to check statistics!");
	    return 1;
	}
	
	new str[1024], hbemode[64], togpm[64], toglog[64], togads[64], togwt[64];
	if(pData[playerid][pHBEMode] == 1)
	{
		hbemode = ""LG_E"Simple";
	}
	else if(pData[playerid][pHBEMode] == 2)
	{
		hbemode = ""LG_E"Modern";
	}
	else
	{
		hbemode = ""RED_E"Disable";
	}
	
	if(pData[playerid][pTogPM] == 0)
	{
		togpm = ""RED_E"Disable";
	}
	else
	{
		togpm = ""LG_E"Enable";
	}
	
	if(pData[playerid][pTogLog] == 0)
	{
		toglog = ""RED_E"Disable";
	}
	else
	{
		toglog = ""LG_E"Enable";
	}
	
	if(pData[playerid][pTogAds] == 0)
	{
		togads = ""RED_E"Disable";
	}
	else
	{
		togads = ""LG_E"Enable";
	}
	
	if(pData[playerid][pTogWT] == 0)
	{
		togwt = ""RED_E"Disable";
	}
	else
	{
		togwt = ""LG_E"Enable";
	}
	
	format(str, sizeof(str), ""WHITEP_E"Email:\t"GREY3_E"%s\n"WHITEP_E"Change Password\n"WHITEP_E"HUD HBE Mode:\t%s\n"WHITEP_E"Toggle PM:\t%s\n"WHITEP_E"Toggle Log Server:\t%s\n"WHITEP_E"Toggle Ads:\t%s\n"WHITEP_E"Toggle WT:\t%s",
	pData[playerid][pEmail], 
	hbemode, 
	togpm,
	toglog,
	togads,
	togwt
	);
	
	ShowPlayerDialog(playerid, DIALOG_SETTINGS, DIALOG_STYLE_LIST, "Settings", str, "Set", "Close");
	return 1;
}

CMD:items(playerid, params[])
{
	if(pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be logged in to check items!");
	    return true;
	}
	DisplayItems(playerid, playerid);
	return 1;
}

CMD:joinjob(playerid, params[])
{
	if(pData[playerid][pIDCard] <= 0)
		return Error(playerid, "Anda tidak memiliki ID-Card.");

	if(pData[playerid][pJob] == 0 || pData[playerid][pJob2] == 0)
	{
		if(pData[playerid][pJob] == 0)
		{
			if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -2159.04, 640.36, 1052.38))
			{
				pData[playerid][pGetJob] = 1;
				Info(playerid, "Anda telah berhasil mendaftarkan job Taxi. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 2330.11, -2315.34, 13.54))
			{
				pData[playerid][pGetJob] = 2;
				Info(playerid, "Anda telah berhasil mendaftarkan job mechanic. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -1438.63, -1544.56, 102.07))
			{
				pData[playerid][pGetJob] = 3;
				Info(playerid, "Anda telah berhasil mendaftarkan job lumber jack. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -77.38, -1136.52, 1.07))
			{
				pData[playerid][pGetJob] = 4;
				Info(playerid, "Anda telah berhasil mendaftarkan job trucker. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -1919.6445,-1713.1741,21.7500))
			{
				pData[playerid][pGetJob] = 5;
				Info(playerid, "Anda telah berhasil mendaftarkan job miner. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -283.02, -2174.36, 28.66))
			{
				pData[playerid][pGetJob] = 6;
				Info(playerid, "Anda telah berhasil mendaftarkan job production. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -383.67, -1438.90, 26.32))
			{
				pData[playerid][pGetJob] = 7;
				Info(playerid, "Anda telah berhasil mendaftarkan job farmer. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1432.51, -967.69, 37.40))
			{
				pData[playerid][pGetJob] = 8;
				Info(playerid, "Anda telah berhasil mendaftarkan job Depositor. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1294.75, 391.92, 19.55))
			{
				if(pData[playerid][pLevel] < 5) return Error(playerid, "You must level 5 to join this job");
				pData[playerid][pGetJob] = 12;
				Info(playerid, "Anda telah berhasil mendaftarkan job Smuggler. /accept job untuk konfirmasi.");
			}
			else return Error(playerid, "Anda sudah memiliki job atau tidak berada di dekat pendaftaran job.");
		}
		else if(pData[playerid][pJob2] == 0)
		{
			if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -2159.04, 640.36, 1052.38))
			{
				pData[playerid][pGetJob2] = 1;
				Info(playerid, "Anda telah berhasil mendaftarkan job Taxi. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 2330.11, -2315.34, 13.54))
			{
				pData[playerid][pGetJob2] = 2;
				Info(playerid, "Anda telah berhasil mendaftarkan job mechanic. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -1438.63, -1544.56, 102.07))
			{
				pData[playerid][pGetJob2] = 3;
				Info(playerid, "Anda telah berhasil mendaftarkan job lumber jack. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -77.38, -1136.52, 1.07))
			{
				pData[playerid][pGetJob2] = 4;
				Info(playerid, "Anda telah berhasil mendaftarkan job trucker. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 319.94, 874.77, 20.39))
			{
				pData[playerid][pGetJob2] = 5;
				Info(playerid, "Anda telah berhasil mendaftarkan job miner. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -283.02, -2174.36, 28.66))
			{
				pData[playerid][pGetJob2] = 6;
				Info(playerid, "Anda telah berhasil mendaftarkan job production. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -383.67, -1438.90, 26.32))
			{
				pData[playerid][pGetJob2] = 7;
				Info(playerid, "Anda telah berhasil mendaftarkan job farmer. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1432.51, -967.69, 37.40))
			{
				pData[playerid][pGetJob2] = 8;
				Info(playerid, "Anda telah berhasil mendaftarkan job Depositor. /accept job untuk konfirmasi.");
			}
			else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 5.0, 1294.75, 391.92, 19.55))
			{
				if(pData[playerid][pLevel] < 5) return Error(playerid, "You must level 5 to join this job");
				pData[playerid][pGetJob2] = 15;
				Info(playerid, "Anda telah berhasil mendaftarkan job Smuggler. /accept job untuk konfirmasi.");
			}
			else return Error(playerid, "Anda sudah memiliki job atau tidak berada di dekat pendaftaran job.");
		}
		else return Error(playerid, "Anda sudah memiliki 2 pekerjaan!");
	}
	else return Error(playerid, "Anda sudah memiliki 2 job atau tidak berada di dekat pendaftaran job.");
	return 1;
}

CMD:frisk(playerid, params[])
{
	new otherid;
	if(sscanf(params, "u", otherid))
        return Usage(playerid, "/frisk [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "The specified player is disconnected or not near you.");

    if(otherid == playerid)
        return Error(playerid, "You cannot frisk yourself.");

    pData[otherid][pFriskOffer] = playerid;

    Info(otherid, "%s has offered to frisk you (type \"/accept frisk or /deny frisk\").", ReturnName(playerid));
    Info(playerid, "You have offered to frisk %s.", ReturnName(otherid));
	return 1;
}

CMD:accept(playerid, params[])
{
	if(IsPlayerConnected(playerid)) 
	{
        if(isnull(params)) 
		{
            Usage(playerid, "USAGE: /accept [name]");
            Info(playerid, "Names: faction, family, drag, frisk, job, robbery");
            return 1;
        }
		if(strcmp(params,"faction",true) == 0) 
		{
            if(IsPlayerConnected(pData[playerid][pFacOffer])) 
			{
                if(pData[playerid][pFacInvite] > 0) 
				{
                    pData[playerid][pFaction] = pData[playerid][pFacInvite];
					pData[playerid][pFactionRank] = 1;
					Info(playerid, "Anda telah menerima invite faction dari %s", pData[pData[playerid][pFacOffer]][pName]);
					Info(pData[playerid][pFacOffer], "%s telah menerima invite faction yang anda tawari", pData[playerid][pName]);
					pData[playerid][pFacInvite] = 0;
					pData[playerid][pFacOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid faction id!");
					return 1;
				}
            }
            else 
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
		if(strcmp(params,"family",true) == 0) 
		{
            if(IsPlayerConnected(pData[playerid][pFamOffer])) 
			{
                if(pData[playerid][pFamInvite] > -1) 
				{
                    pData[playerid][pFamily] = pData[playerid][pFamInvite];
					pData[playerid][pFamilyRank] = 1;
					Info(playerid, "Anda telah menerima invite family dari %s", pData[pData[playerid][pFamOffer]][pName]);
					Info(pData[playerid][pFamOffer], "%s telah menerima invite family yang anda tawari", pData[playerid][pName]);
					pData[playerid][pFamInvite] = 0;
					pData[playerid][pFamOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid family id!");
					return 1;
				}
            }
            else 
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
		else if(strcmp(params,"drag",true) == 0)
		{
			new dragby = GetPVarInt(playerid, "DragBy");
			if(dragby == INVALID_PLAYER_ID || dragby == playerid)
				return Error(playerid, "That player is disconnected.");
        
			if(!NearPlayer(playerid, dragby, 5.0))
				return Error(playerid, "You must be near this player.");
        
			pData[playerid][pDragged] = 1;
			pData[playerid][pDraggedBy] = dragby;

			pData[playerid][pDragTimer] = SetTimerEx("DragUpdate", 1000, true, "ii", dragby, playerid);
			SendNearbyMessage(dragby, 30.0, COLOR_PURPLE, "* %s grabs %s and starts dragging them, (/undrag).", ReturnName(dragby), ReturnName(playerid));
			return true;
		}
		else if(strcmp(params,"frisk",true) == 0)
		{
			if(pData[playerid][pFriskOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
				return Error(playerid, "That player not connected!");
			
			if(!NearPlayer(playerid, pData[playerid][pFriskOffer], 5.0))
				return Error(playerid, "You must be near this player.");
				
			DisplayItems(pData[playerid][pFriskOffer], playerid);
			Servers(playerid, "Anda telah berhasil menaccept tawaran frisk kepada %s.", ReturnName(pData[playerid][pFriskOffer]));
			pData[playerid][pFriskOffer] = INVALID_PLAYER_ID;
		}
		else if(strcmp(params,"job",true) == 0) 
		{
			if(pData[playerid][pGetJob] > 0)
			{
				pData[playerid][pJob] = pData[playerid][pGetJob];
				Info(playerid, "Anda telah berhasil mendapatkan pekerjaan baru. gunakan /help untuk informasi.");
				pData[playerid][pGetJob] = 0;
				pData[playerid][pExitJob] = gettime() + (1 * 86400);
			}
			else if(pData[playerid][pGetJob2] > 0)
			{
				pData[playerid][pJob2] = pData[playerid][pGetJob2];
				Info(playerid, "Anda telah berhasil mendapatkan pekerjaan baru. gunakan /help untuk informasi.");
				pData[playerid][pGetJob2] = 0;
				pData[playerid][pExitJob] = gettime() + (1 * 86400);
			}
		}
		if(strcmp(params,"robbery",true) == 0)
		{
            if(IsPlayerConnected(pData[playerid][pRobOffer]))
			{
                if(pData[playerid][pRobInvite] > -1)
				{
                    RobTim[playerid] = pData[playerid][pRobInvite];
					Info(playerid, "Anda telah menerima invite robbert dari %s", pData[pData[playerid][pRobOffer]][pName]);
					Info(pData[playerid][pRobOffer], "%s telah menerima invite robbery yang anda tawari", pData[playerid][pName]);
					pData[playerid][pRobInvite] = 0;
					pData[playerid][pRobOffer] = -1;
					RobTim[playerid] += 1;
				}
				else
				{
					Error(playerid, "Invalid Robbery id!");
					return 1;
				}
            }
            else
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
	}
	return 1;
}

CMD:deny(playerid, params[])
{
	if(IsPlayerConnected(playerid)) 
	{
        if(isnull(params)) 
		{
            Usage(playerid, "USAGE: /deny [name]");
            Info(playerid, "Names: faction, drag, frisk, job1, job2");
            return 1;
        }
		if(strcmp(params,"faction",true) == 0) 
		{
            if(pData[playerid][pFacOffer] > -1) 
			{
                if(pData[playerid][pFacInvite] > 0) 
				{
					Info(playerid, "Anda telah menolak faction dari %s", ReturnName(pData[playerid][pFacOffer]));
					Info(pData[playerid][pFacOffer], "%s telah menolak invite faction yang anda tawari", ReturnName(playerid));
					pData[playerid][pFacInvite] = 0;
					pData[playerid][pFacOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid faction id!");
					return 1;
				}
            }
            else 
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
		else if(strcmp(params,"drag",true) == 0)
		{
			new dragby = GetPVarInt(playerid, "DragBy");
			if(dragby == INVALID_PLAYER_ID || dragby == playerid)
				return Error(playerid, "That player is disconnected.");

			Info(playerid, "Anda telah menolak drag.");
			Info(dragby, "Player telah menolak drag yang anda tawari.");
			
			DeletePVar(playerid, "DragBy");
			pData[playerid][pDragged] = 0;
			pData[playerid][pDraggedBy] = INVALID_PLAYER_ID;
			return 1;
		}
		else if(strcmp(params,"frisk",true) == 0)
		{
			if(pData[playerid][pFriskOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
				return Error(playerid, "That player not connected!");
			
			Info(playerid, "Anda telah menolak tawaran frisk kepada %s.", ReturnName(pData[playerid][pFriskOffer]));
			pData[playerid][pFriskOffer] = INVALID_PLAYER_ID;
			return 1;
		}
		else if(strcmp(params,"job1",true) == 0) 
		{
			if(pData[playerid][pJob] == 0) return Error(playerid, "Anda tidak memiliki job apapun.");
			if(pData[playerid][pExitJob] != 0) return Error(playerid, "You must wait 1 days for exit from your current job!");
			if(pData[playerid][pJob] != 0)
			{
				pData[playerid][pJob] = 0;
				Info(playerid, "Anda berhasil keluar dari pekerjaan anda.");
				return 1;
			}
		}
		else if(strcmp(params,"job2",true) == 0) 
		{
			if(pData[playerid][pJob2] == 0) return Error(playerid, "Anda tidak memiliki job apapun.");
			if(pData[playerid][pJob2] != 0)
			{
				pData[playerid][pJob2] = 0;
				Info(playerid, "Anda berhasil keluar dari pekerjaan anda.");
				return 1;
			}
		}
	}
	return 1;
}

CMD:give(playerid, params[])
{
	if(IsPlayerConnected(playerid)) 
	{
		new name[24], ammount, otherid;
        if(sscanf(params, "us[24]d", otherid, name, ammount))
		{
			Usage(playerid, "/give [playerid] [name] [ammount]");
			Info(playerid, "Names: bandage, medicine, snack, boombox, gps, sprunk, material, component, marijuana");
			return 1;
		}
		if(otherid == INVALID_PLAYER_ID || otherid == playerid || !NearPlayer(playerid, otherid, 3.0))
			return Error(playerid, "Invalid playerid!");
			
		if(strcmp(name,"bandage",true) == 0) 
		{
			if(pData[playerid][pBandage] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
			
			pData[playerid][pBandage] -= ammount;
			pData[otherid][pBandage] += ammount;
			Info(playerid, "Anda telah berhasil memberikan perban kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan perban kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"medicine",true) == 0) 
		{
			if(pData[playerid][pMedicine] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
			
			pData[playerid][pMedicine] -= ammount;
			pData[otherid][pMedicine] += ammount;
			Info(playerid, "Anda telah berhasil memberikan medicine kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan medicine kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"snack",true) == 0) 
		{
			if(pData[playerid][pSnack] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
			
			pData[playerid][pSnack] -= ammount;
			pData[otherid][pSnack] += ammount;
			Info(playerid, "Anda telah berhasil memberikan snack kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan snack kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"sprunk",true) == 0) 
		{
			if(pData[playerid][pSprunk] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
			
			pData[playerid][pSprunk] -= ammount;
			pData[otherid][pSprunk] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Sprunk kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Sprunk kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"material",true) == 0) 
		{
			if(pData[playerid][pMaterial] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
			
			if(ammount > 500)
				return Error(playerid, "Invalid ammount 1 - 500");
			
			new maxmat = pData[otherid][pMaterial] + ammount;
			
			if(maxmat > 500)
				return Error(playerid, "That player already have maximum material!");
			
			pData[playerid][pMaterial] -= ammount;
			pData[otherid][pMaterial] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Material kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Material kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"component",true) == 0) 
		{
			if(pData[playerid][pComponent] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
			
			if(ammount > 5000)
				return Error(playerid, "Invalid ammount 1 - 500");
			
			new maxcomp = pData[otherid][pComponent] + ammount;
			
			if(maxcomp > 50000)
				return Error(playerid, "That player already have maximum component!");
			
			pData[playerid][pComponent] -= ammount;
			pData[otherid][pComponent] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Component kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Component kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"marijuana",true) == 0) 
		{
			if(pData[playerid][pMarijuana] < ammount)
				return Error(playerid, "Item anda tidak cukup.");
			
			pData[playerid][pMarijuana] -= ammount;
			pData[otherid][pMarijuana] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Marijuana kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Marijuana kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"gps",true) == 0)
		{
			if(pData[playerid][pGPS] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			pData[playerid][pGPS] -= ammount;
			pData[otherid][pGPS] += ammount;
			Info(playerid, "Anda telah berhasil memberikan GPS kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan GPS kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"boombox",true) == 0)
		{
			if(pData[playerid][pBoombox] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			pData[playerid][pBoombox] -= ammount;
			pData[otherid][pBoombox] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Boombox kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Boombox kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
	}
	return 1;
}

CMD:use(playerid, params[])
{
	if(IsPlayerConnected(playerid)) 
	{
        if(isnull(params)) 
		{
            Usage(playerid, "USAGE: /use [name]");
            Info(playerid, "Names: bandage, snack, sprunk, gas, medicine, boombox, marijuana");
            return 1;
        }
		if(strcmp(params,"bandage",true) == 0) 
		{
			if(pData[playerid][pBandage] < 1)
				return Error(playerid, "Anda tidak memiliki perban.");
			
			new Float:darah;
			GetPlayerHealth(playerid, darah);
			pData[playerid][pBandage]--;
			SetPlayerHealthEx(playerid, darah+25);
			Info(playerid, "Anda telah berhasil menggunakan perban.");
			InfoTD_MSG(playerid, 3000, "Restore +25 Health");
		}
		else if(strcmp(params,"snack",true) == 0) 
		{
			if(pData[playerid][pSnack] < 1)
				return Error(playerid, "Anda tidak memiliki snack.");
			
			pData[playerid][pSnack]--;
			pData[playerid][pHunger] += 15;
			Info(playerid, "Anda telah berhasil menggunakan snack.");
			InfoTD_MSG(playerid, 3000, "Restore +15 Hunger");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"sprunk",true) == 0) 
		{
			if(pData[playerid][pSprunk] < 1)
				return Error(playerid, "Anda tidak memiliki sprunk.");
			
			pData[playerid][pSprunk]--;
			pData[playerid][pEnergy] += 15;
			Info(playerid, "Anda telah berhasil meminum sprunk.");
			InfoTD_MSG(playerid, 3000, "Restore +15 Energy");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		/*else if(strcmp(params,"sprunk",true) == 0) 
		{
			if(pData[playerid][pSprunk] < 1)
				return Error(playerid, "Anda tidak memiliki snack.");
			
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_SPRUNK);
			//SendNearbyMessage(playerid, 10.0, COLOR_PURPLE,"* %s opens a can of sprunk.", ReturnName(playerid));
			SetPVarInt(playerid, "UsingSprunk", 1);
			pData[playerid][pSprunk]--;
		}*/
		else if(strcmp(params,"gas",true) == 0) 
		{
			if(pData[playerid][pGas] < 1)
				return Error(playerid, "Anda tidak memiliki gas.");
				
			if(IsPlayerInAnyVehicle(playerid))
				return Error(playerid, "Anda harus berada diluar kendaraan!");
			
			if(pData[playerid][pActivityTime] > 5) return Error(playerid, "Anda masih memiliki activity progress!");
			
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			if(IsValidVehicle(vehicleid))
			{
				new fuel = GetVehicleFuel(vehicleid);
			
				if(GetEngineStatus(vehicleid))
					return Error(playerid, "Turn off vehicle engine.");
			
				if(fuel >= 999.0)
					return Error(playerid, "This vehicle gas is full.");
			
				if(!IsEngineVehicle(vehicleid))
					return Error(playerid, "This vehicle can't be refull.");

				if(!GetHoodStatus(vehicleid))
					return Error(playerid, "The hood must be opened before refull the vehicle.");

				pData[playerid][pGas]--;
				Info(playerid, "Don't move from your position or you will failed to refulling this vehicle.");
				ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
				pData[playerid][pActivity] = SetTimerEx("RefullCar", 1000, true, "id", playerid, vehicleid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Refulling...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				/*InfoTD_MSG(playerid, 10000, "Refulling...");
				//SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s starts to refulling the vehicle.", ReturnName(playerid));*/
				return 1;
			}
		}
		else if(strcmp(params,"medicine",true) == 0) 
		{
			if(pData[playerid][pMedicine] < 1)
				return Error(playerid, "Anda tidak memiliki medicine.");
				
   			new Float:darah;
			GetPlayerHealth(playerid, darah);
			pData[playerid][pMedicine]--;
			SetPlayerHealthEx(playerid, darah+30);
			/*pData[playerid][pSick] = 0;
			pData[playerid][pSickTime] = 0;
			SetPlayerDrunkLevel(playerid, 0);*/
			Info(playerid, "Anda menggunakan medicine.");
			
			//InfoTD_MSG(playerid, 3000, "Restore +15 Hunger");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"marijuana",true) == 0) 
		{
			if(pData[playerid][pMarijuana] < 1)
				return Error(playerid, "You dont have marijuana.");
			
			new Float:armor;
			GetPlayerArmour(playerid, armor);
			if(armor+10 > 90) return Error(playerid, "Over dosis!");
			
			pData[playerid][pMarijuana]--;
			SetPlayerArmourEx(playerid, armor+10);
			SetPlayerDrunkLevel(playerid, 4000);
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"boombox",true) == 0)
		{
			if(pData[playerid][pBoombox] < 1)
				return Error(playerid, "You dont have boombox");

			new string[128], Float:BBCoord[4], pNames[MAX_PLAYER_NAME];
		    GetPlayerPos(playerid, BBCoord[0], BBCoord[1], BBCoord[2]);
		    GetPlayerFacingAngle(playerid, BBCoord[3]);
		    SetPVarFloat(playerid, "BBX", BBCoord[0]);
		    SetPVarFloat(playerid, "BBY", BBCoord[1]);
		    SetPVarFloat(playerid, "BBZ", BBCoord[2]);
		    GetPlayerName(playerid, pNames, sizeof(pNames));
		    BBCoord[0] += (2 * floatsin(-BBCoord[3], degrees));
		   	BBCoord[1] += (2 * floatcos(-BBCoord[3], degrees));
		   	BBCoord[2] -= 1.0;
			if(GetPVarInt(playerid, "PlacedBB")) return SCM(playerid, -1, "Kamu Sudah Memasang Boombox");
			foreach(new i : Player)
			{
		 		if(GetPVarType(i, "PlacedBB"))
		   		{
		  			if(IsPlayerInRangeOfPoint(playerid, 30.0, GetPVarFloat(i, "BBX"), GetPVarFloat(i, "BBY"), GetPVarFloat(i, "BBZ")))
					{
		   				Error(playerid, "You can't placed boombox here, because there's already another boombox");
					    return 1;
					}
				}
			}
			new string2[128];
			format(string2, sizeof(string2), "%s has placed boombox!", pNames);
			SendNearbyMessage(playerid, 15, COLOR_PURPLE, string2);
			SetPVarInt(playerid, "PlacedBB", CreateDynamicObject(2102, BBCoord[0], BBCoord[1], BBCoord[2], 0.0, 0.0, 0.0, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid)));
			format(string, sizeof(string), "Boombox\n"WHITE_E"Owner: "AQUA"%s\n"WHITE_E"use command '"YELLOW_E"/bbhelp"WHITE_E"' to find boombox info", pNames);
			SetPVarInt(playerid, "BBLabel", _:CreateDynamic3DTextLabel(string, ARWIN, BBCoord[0], BBCoord[1], BBCoord[2]+0.6, 5, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid)));
			SetPVarInt(playerid, "BBArea", CreateDynamicSphere(BBCoord[0], BBCoord[1], BBCoord[2], 30.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid)));
			SetPVarInt(playerid, "BBInt", GetPlayerInterior(playerid));
			SetPVarInt(playerid, "BBVW", GetPlayerVirtualWorld(playerid));
			ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0);
		    ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0);
		}
	}
	return 1;
}

CMD:bbhelp(playerid, params[])
{
	if(pData[playerid][pBoombox] < 1)
		return Error(playerid, "You dont have boombox");

	Usage(playerid, "/use boombox /setbb /pickupbb");
	return 1;
}

CMD:setbb(playerid, params[])
{
    if(pData[playerid][pBoombox] == 0)
	    return SendClientMessage(playerid, 0xCECECEFF, "you dont have boombox");

	if(GetPVarType(playerid, "PlacedBB"))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, GetPVarFloat(playerid, "BBX"), GetPVarFloat(playerid, "BBY"), GetPVarFloat(playerid, "BBZ")))
		{
			ShowPlayerDialog(playerid,DIALOG_BOOMBOX,DIALOG_STYLE_LIST,"Boombox","Turn Off Boombox\nInput URL","Select", "Cancel");
		}
		else
		{
   			return Error(playerid, "You're not near from your boombox");
		}
    }
    else
    {
        Error(playerid, "you didnt place boombox before");
	}
	return 1;
}

CMD:pickupbb(playerid, params [])
{
    if(pData[playerid][pBoombox] == 0)
	    return Error(playerid, "you dont have boombox");

	if(!GetPVarInt(playerid, "PlacedBB"))
    {
        Error(playerid, "you dont have placedboombox to take");
    }
	if(IsPlayerInRangeOfPoint(playerid, 3.0, GetPVarFloat(playerid, "BBX"), GetPVarFloat(playerid, "BBY"), GetPVarFloat(playerid, "BBZ")))
    {
        PickUpBoombox(playerid);
        Info(playerid, "boombox pickup");
    }
    return 1;
}
stock StopStream(playerid)
{
	DeletePVar(playerid, "pAudioStream");
    StopAudioStreamForPlayer(playerid);
}

stock PlayStream(playerid, url[], Float:posX = 0.0, Float:posY = 0.0, Float:posZ = 0.0, Float:distance = 50.0, usepos = 0)
{
	if(GetPVarType(playerid, "pAudioStream")) StopAudioStreamForPlayer(playerid);
	else SetPVarInt(playerid, "pAudioStream", 1);
    PlayAudioStreamForPlayer(playerid, url, posX, posY, posZ, distance, usepos);
}

stock PickUpBoombox(playerid)
{
    foreach(new i : Player)
	{
 		if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "BBArea")))
   		{
     		StopStream(i);
		}
	}
	DeletePVar(playerid, "BBArea");
	DestroyDynamicObject(GetPVarInt(playerid, "PlacedBB"));
	DestroyDynamic3DTextLabel(Text3D:GetPVarInt(playerid, "BBLabel"));
	DeletePVar(playerid, "PlacedBB"); DeletePVar(playerid, "BBLabel");
 	DeletePVar(playerid, "BBX"); DeletePVar(playerid, "BBY"); DeletePVar(playerid, "BBZ");
	DeletePVar(playerid, "BBInt");
	DeletePVar(playerid, "BBVW");
	DeletePVar(playerid, "BBStation");
	return 1;
}
CMD:enter(playerid, params[])
{
	if(pData[playerid][pInjured] == 0)
    {
		foreach(new did : Doors)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
			{
				if(dData[did][dGarage] == 1 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
				{
					if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
						return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

					if(dData[did][dLocked])
						return Error(playerid, "This entrance is locked at the moment.");
						
					if(dData[did][dFaction] > 0)
					{
						if(dData[did][dFaction] != pData[playerid][pFaction])
							return Error(playerid, "This door only for faction.");
					}
					if(dData[did][dFamily] > 0)
					{
						if(dData[did][dFamily] != pData[playerid][pFamily])
							return Error(playerid, "This door only for family.");
					}
					
					if(dData[did][dVip] > pData[playerid][pVip])
						return Error(playerid, "Your VIP level not enough to enter this door.");
					
					if(dData[did][dAdmin] > pData[playerid][pAdmin])
						return Error(playerid, "Your admin level not enough to enter this door.");
						
					if(strlen(dData[did][dPass]))
					{
						if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
						if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
						
						if(dData[did][dCustom])
						{
							SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						else
						{
							SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						pData[playerid][pInDoor] = did;
						SetPlayerInterior(playerid, dData[did][dIntint]);
						SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, 0);
					}
					else
					{
						if(dData[did][dCustom])
						{
							SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						else
						{
							SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						pData[playerid][pInDoor] = did;
						SetPlayerInterior(playerid, dData[did][dIntint]);
						SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, 0);
					}
				}
				else
				{
					if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
						return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

					if(dData[did][dLocked])
						return Error(playerid, "This entrance is locked at the moment.");
						
					if(dData[did][dFaction] > 0)
					{
						if(dData[did][dFaction] != pData[playerid][pFaction])
							return Error(playerid, "This door only for faction.");
					}
					if(dData[did][dFamily] > 0)
					{
						if(dData[did][dFamily] != pData[playerid][pFamily])
							return Error(playerid, "This door only for family.");
					}
					
					if(dData[did][dVip] > pData[playerid][pVip])
						return Error(playerid, "Your VIP level not enough to enter this door.");
					
					if(dData[did][dAdmin] > pData[playerid][pAdmin])
						return Error(playerid, "Your admin level not enough to enter this door.");

					if(strlen(dData[did][dPass]))
					{
						if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
						if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
						
						if(dData[did][dCustom])
						{
							SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						else
						{
							SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						pData[playerid][pInDoor] = did;
						SetPlayerInterior(playerid, dData[did][dIntint]);
						SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, 0);
					}
					else
					{
						if(dData[did][dCustom])
						{
							SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						else
						{
							SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						pData[playerid][pInDoor] = did;
						SetPlayerInterior(playerid, dData[did][dIntint]);
						SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, 0);
					}
				}
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
			{
				if(dData[did][dGarage] == 1 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
				{
					if(dData[did][dFaction] > 0)
					{
						if(dData[did][dFaction] != pData[playerid][pFaction])
							return Error(playerid, "This door only for faction.");
					}
				
					if(dData[did][dCustom])
					{
						SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
					}
					else
					{
						SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
					}
					pData[playerid][pInDoor] = -1;
					SetPlayerInterior(playerid, dData[did][dExtint]);
					SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, WorldWeather);
				}
				else
				{
					if(dData[did][dFaction] > 0)
					{
						if(dData[did][dFaction] != pData[playerid][pFaction])
							return Error(playerid, "This door only for faction.");
					}
					
					if(dData[did][dCustom])
						SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);

					else
						SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
					
					pData[playerid][pInDoor] = -1;
					SetPlayerInterior(playerid, dData[did][dExtint]);
					SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, WorldWeather);
				}
			}
        }
		//Houses
		foreach(new hid : Houses)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
			{
				if(hData[hid][hIntposX] == 0.0 && hData[hid][hIntposY] == 0.0 && hData[hid][hIntposZ] == 0.0)
					return Error(playerid, "Interior house masih kosong, atau tidak memiliki interior.");

				if(hData[hid][hLocked])
					return Error(playerid, "This house is locked!");

				pData[playerid][pInHouse] = hid;
				SetPlayerPositionEx(playerid, hData[hid][hIntposX], hData[hid][hIntposY], hData[hid][hIntposZ], hData[hid][hIntposA]);

				SetPlayerInterior(playerid, hData[hid][hInt]);
				SetPlayerVirtualWorld(playerid, hid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inhouseid = pData[playerid][pInHouse];
		if(pData[playerid][pInHouse] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, hData[inhouseid][hIntposX], hData[inhouseid][hIntposY], hData[inhouseid][hIntposZ]))
		{
			SetPlayerPositionEx(playerid, hData[inhouseid][hExtposX], hData[inhouseid][hExtposY], hData[inhouseid][hExtposZ], hData[inhouseid][hExtposA]);

			pData[playerid][pInHouse] = -1;
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Bisnis
		foreach(new bid : Bisnis)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
			{
				if(bData[bid][bIntposX] == 0.0 && bData[bid][bIntposY] == 0.0 && bData[bid][bIntposZ] == 0.0)
					return Error(playerid, "Interior bisnis masih kosong, atau tidak memiliki interior.");

				if(bData[bid][bLocked])
					return Error(playerid, "This bisnis is locked!");
					
				pData[playerid][pInBiz] = bid;
				SetPlayerPositionEx(playerid, bData[bid][bIntposX], bData[bid][bIntposY], bData[bid][bIntposZ], bData[bid][bIntposA]);
				
				SetPlayerInterior(playerid, bData[bid][bInt]);
				SetPlayerVirtualWorld(playerid, bid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inbisnisid = pData[playerid][pInBiz];
		if(pData[playerid][pInBiz] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, bData[inbisnisid][bIntposX], bData[inbisnisid][bIntposY], bData[inbisnisid][bIntposZ]))
		{
			SetPlayerPositionEx(playerid, bData[inbisnisid][bExtposX], bData[inbisnisid][bExtposY], bData[inbisnisid][bExtposZ], bData[inbisnisid][bExtposA]);
			
			pData[playerid][pInBiz] = -1;
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Family
		foreach(new fid : FAMILYS)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ]))
			{
				if(fData[fid][fIntposX] == 0.0 && fData[fid][fIntposY] == 0.0 && fData[fid][fIntposZ] == 0.0)
					return Error(playerid, "Interior masih kosong, atau tidak memiliki interior.");

				if(pData[playerid][pFaction] == 0)
					if(pData[playerid][pFamily] == -1)
						return Error(playerid, "You dont have registered for this door!");
					
				SetPlayerPositionEx(playerid, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ], fData[fid][fIntposA]);

				SetPlayerInterior(playerid, fData[fid][fInt]);
				SetPlayerVirtualWorld(playerid, fid);
				SetCameraBehindPlayer(playerid);
				//pData[playerid][pInBiz] = fid;
				SetPlayerWeather(playerid, 0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ]))
			{
				SetPlayerPositionEx(playerid, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ], fData[fid][fExtposA]);

				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
				//pData[playerid][pInBiz] = -1;
			}
        }
	}
	return 1;
}

CMD:drag(playerid, params[])
{
	new otherid;
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/drag [playerid/PartOfName] || /undrag [playerid]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "That player is disconnected.");

    if(otherid == playerid)
        return Error(playerid, "You cannot drag yourself.");

    if(!NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "You must be near this player.");

    if(!pData[otherid][pInjured])
        return Error(playerid, "kamu tidak bisa drag orang yang tidak mati.");

    SetPVarInt(otherid, "DragBy", playerid);
    Info(otherid, "%s Telah menawari drag kepada anda, /accept drag untuk menerimanya /deny drag untuk membatalkannya.", ReturnName(playerid));
	Info(playerid, "Anda berhasil menawari drag kepada player %s", ReturnName(otherid));
    return 1;
}

CMD:undrag(playerid, params[])
{
	new otherid;
    if(sscanf(params, "u", otherid)) return Usage(playerid, "/undrag [playerid]");
	if(pData[otherid][pDragged])
    {
        DeletePVar(playerid, "DragBy");
        DeletePVar(otherid, "DragBy");
        pData[otherid][pDragged] = 0;
        pData[otherid][pDraggedBy] = INVALID_PLAYER_ID;

        KillTimer(pData[otherid][pDragTimer]);
        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s releases %s from their grip.", ReturnName(playerid), ReturnName(otherid));
    }
    return 1;
}

CMD:mask(playerid, params[])
{
	if(pData[playerid][pMask] <= 0)
		return Error(playerid, "Anda tidak memiliki topeng!");
		
	switch (pData[playerid][pMaskOn])
    {
        case 0:
        {
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s takes out a mask and puts it on.", ReturnName(playerid));
            pData[playerid][pMaskOn] = 1;
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				ShowPlayerNameTagForPlayer(i, playerid, 0);
			}
			//SetPlayerAttachedObject(playerid, 9, 18911, 2,0.078534, 0.041857, -0.001727, 268.970458, 1.533374, 269.223754);
        }
        case 1:
        {
            pData[playerid][pMaskOn] = 0;
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s takes their mask off and puts it away.", ReturnName(playerid));
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				ShowPlayerNameTagForPlayer(i, playerid, 1);
			}
			//RemovePlayerAttachedObject(playerid, 9);
        }
    }
	return 1;
}

//Text and Chat Commands
CMD:try(playerid, params[])
{

    if(isnull(params))
        return Usage(playerid, "/try [action]");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %.64s ..", ReturnName(playerid), params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s, %s", params[64], (random(2) == 0) ? ("and success") : ("but fail"));
    }
    else {
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %s, %s", ReturnName(playerid), params, (random(2) == 0) ? ("and success") : ("but fail"));
    }
	printf("[TRY] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:ado(playerid, params[])
{
    new flyingtext[164], Float:x, Float:y, Float:z;

    if(isnull(params))
	{
        Usage(playerid, "/ado [text]");
		Info(playerid, "Use /ado off to disable or delete the ado tag.");
		return 1;
	}
    if(strlen(params) > 128)
        return Error(playerid, "Max text can only maximmum 128 characters.");

    if (!strcmp(params, "off", true))
    {
        if (!pData[playerid][pAdoActive])
            return Error(playerid, "You're not actived your 'ado' text.");

        if (IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pAdoTag]);

        Servers(playerid, "You're removed your ado text.");
        pData[playerid][pAdoActive] = false;
        return 1;
    }

    FixText(params);
    format(flyingtext, sizeof(flyingtext), "* %s *\n(( %s ))", ReturnName(playerid), params);

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* [ADO]: %.64s ..", params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s", params[64]);
    }
    else 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* [ADO]: %s", params);
    }

    GetPlayerPos(playerid, x, y, z);
    if(pData[playerid][pAdoActive])
    {
        if (IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            UpdateDynamic3DTextLabelText(pData[playerid][pAdoTag], COLOR_PURPLE, flyingtext);
        else
            pData[playerid][pAdoTag] = CreateDynamic3DTextLabel(flyingtext, COLOR_PURPLE, x, y, z, 15, _, _, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    }
    else
    {
        pData[playerid][pAdoActive] = true;
        pData[playerid][pAdoTag] = CreateDynamic3DTextLabel(flyingtext, COLOR_PURPLE, x, y, z, 15, _, _, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    }
	printf("[ADO] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:ame(playerid, params[])
{
    new flyingtext[164];

    if(isnull(params))
        return Usage(playerid, "/ame [action]");

    if(strlen(params) > 128)
        return Error(playerid, "Max action can only maximmum 128 characters.");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* [AME]: %.64s ..", params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s", params[64]);
    }
    else 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* [AME]: %s", params);
    }
    format(flyingtext, sizeof(flyingtext), "* %s %s*", ReturnName(playerid), params);
    SetPlayerChatBubble(playerid, flyingtext, COLOR_PURPLE, 10.0, 10000);
	printf("[AME] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:me(playerid, params[])
{

    if(isnull(params))
        return Usage(playerid, "/me [action]");
	
	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %.64s ..", ReturnName(playerid), params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s", params[64]);
    }
    else 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %s", ReturnName(playerid), params);
    }
	printf("[ME] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:do(playerid, params[])
{
    if(isnull(params))
        return Usage(playerid, "/do [description]");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %.64s ..", params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s (( %s ))", params[64], ReturnName(playerid));
    }
    else 
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s (( %s ))", params, ReturnName(playerid));
    }
	printf("[DO] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:toglog(playerid)
{
	if(!pData[playerid][pTogLog])
	{
		pData[playerid][pTogLog] = 1;
		Info(playerid, "Anda telah menonaktifkan log server.");
	}
	else
	{
		pData[playerid][pTogLog] = 0;
		Info(playerid, "Anda telah mengaktifkan log server.");
	}
	return 1;
}

CMD:togpm(playerid)
{
	if(!pData[playerid][pTogPM])
	{
		pData[playerid][pTogPM] = 1;
		Info(playerid, "Anda telah menonaktifkan PM");
	}
	else
	{
		pData[playerid][pTogPM] = 0;
		Info(playerid, "Anda telah mengaktifkan PM");
	}
	return 1;
}

CMD:togads(playerid)
{
	if(!pData[playerid][pTogAds])
	{
		pData[playerid][pTogAds] = 1;
		Info(playerid, "Anda telah menonaktifkan Ads/Iklan.");
	}
	else
	{
		pData[playerid][pTogAds] = 0;
		Info(playerid, "Anda telah mengaktifkan Ads/Iklan.");
	}
	return 1;
}

CMD:togwt(playerid)
{
	if(!pData[playerid][pTogWT])
	{
		pData[playerid][pTogWT] = 1;
		Info(playerid, "Anda telah menonaktifkan Walkie Talkie.");
	}
	else
	{
		pData[playerid][pTogWT] = 0;
		Info(playerid, "Anda telah mengaktifkan Walkie Talkie.");
	}
	return 1;
}

CMD:pm(playerid, params[])
{
    static text[128], otherid;
    if(sscanf(params, "us[128]", otherid, text))
        return Usage(playerid, "/pm [playerid/PartOfName] [message]");

    /*if(pData[playerid][pTogPM])
        return Error(playerid, "You must enable private messaging first.");*/

    /*if(pData[otherid][pAdminDuty])
        return Error(playerid, "You can't pm'ing admin duty now!");*/
		
	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");

    if(otherid == playerid)
        return Error(playerid, "You can't private message yourself.");

    if(pData[otherid][pTogPM] && pData[playerid][pAdmin] < 1)
        return Error(playerid, "That player has disabled private messaging.");

    //GameTextForPlayer(otherid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~New message!", 3000, 3);
    PlayerPlaySound(otherid, 1085, 0.0, 0.0, 0.0);

    SendClientMessageEx(otherid, COLOR_YELLOW, "(( PM from %s (%d): %s ))", pData[playerid][pName], playerid, text);
    SendClientMessageEx(playerid, COLOR_YELLOW, "(( PM to %s (%d): %s ))", pData[otherid][pName], otherid, text);
	Info(otherid, "/togpm for tog enable/disable PM");

    foreach(new i : Player) if((pData[i][pAdmin]) && pData[playerid][pSPY] > 0)
    {
        SendClientMessageEx(i, COLOR_LIGHTGREEN, "[SPY PM] %s (%d) to %s (%d): %s", pData[playerid][pName], playerid, pData[otherid][pName], otherid, text);
    }
    return 1;
}

CMD:whisper(playerid, params[])
{
	new text[128], otherid;
    if(sscanf(params, "us[128]", otherid, text))
        return Usage(playerid, "/(w)hisper [playerid/PartOfName] [text]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "That player is disconnected or not near you.");

    if(otherid == playerid)
        return Error(playerid, "You can't whisper yourself.");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(text) > 64) 
	{
        SendClientMessageEx(otherid, COLOR_YELLOW, "** Whisper from %s (%d): %.64s", ReturnName(playerid), playerid, text);
        SendClientMessageEx(otherid, COLOR_YELLOW, "...%s **", text[64]);

        SendClientMessageEx(playerid, COLOR_YELLOW, "** Whisper to %s (%d): %.64s", ReturnName(otherid), otherid, text);
        SendClientMessageEx(playerid, COLOR_YELLOW, "...%s **", text[64]);
    }
    else 
	{
        SendClientMessageEx(otherid, COLOR_YELLOW, "** Whisper from %s (%d): %s **", ReturnName(playerid), playerid, text);
        SendClientMessageEx(playerid, COLOR_YELLOW, "** Whisper to %s (%d): %s **", ReturnName(otherid), otherid, text);
    }
    SendNearbyMessage(playerid, 10.0, COLOR_PURPLE, "* %s mutters something in %s's ear.", ReturnName(playerid), ReturnName(otherid));
	
	foreach(new i : Player) if((pData[i][pAdmin]) && pData[i][pSPY] > 0)
    {
        SendClientMessageEx(i, COLOR_YELLOW2, "[SPY Whisper] %s (%d) to %s (%d): %s", pData[playerid][pName], playerid, pData[otherid][pName], otherid, text);
    }
    return 1;
}

CMD:l(playerid, params[])
{
    if(isnull(params))
        return Usage(playerid, "/(l)ow [low text]");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
	if(IsPlayerInAnyVehicle(playerid))
	{
		foreach(new i : Player)
		{
			if(IsPlayerInAnyVehicle(i) && GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid))
			{
				if(strlen(params) > 64) 
				{
					SendClientMessageEx(i, COLOR_WHITE, "[car] %s says: %.64s ..", ReturnName(playerid), params);
					SendClientMessageEx(i, COLOR_WHITE, "...%s", params[64]);
				}
				else 
				{
					SendClientMessageEx(i, COLOR_WHITE, "[car] %s says: %s", ReturnName(playerid), params);
				}
				printf("[CAR] %s(%d) : %s", pData[playerid][pName], playerid, params);
			}
		}
	}
	else
	{
		if(strlen(params) > 64) 
		{
			SendNearbyMessage(playerid, 5.0, COLOR_WHITE, "[low] %s says: %.64s ..", ReturnName(playerid), params);
			SendNearbyMessage(playerid, 5.0, COLOR_WHITE, "...%s", params[64]);
		}
		else 
		{
			SendNearbyMessage(playerid, 5.0, COLOR_WHITE, "[low] %s says: %s", ReturnName(playerid), params);
		}
		printf("[LOW] %s(%d) : %s", pData[playerid][pName], playerid, params);
	}
    return 1;
}

CMD:s(playerid, params[])
{

    if(isnull(params))
        return Usage(playerid, "/(s)hout [shout text] /ds for in the door");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64) 
	{
        SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "%s shouts: %.64s ..", ReturnName(playerid), params);
        SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "...%s!", params[64]);
    }
    else 
	{
        SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "%s shouts: %s!", ReturnName(playerid), params);
    }
	new flyingtext[128];
	format(flyingtext, sizeof(flyingtext), "%s!", params);
    SetPlayerChatBubble(playerid, flyingtext, COLOR_WHITE, 10.0, 10000);
	printf("[SHOUTS] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:b(playerid, params[])
{
    if(isnull(params))
        return Usage(playerid, "/b [local OOC]");
		
	if(pData[playerid][pAdminDuty] == 1)
    {
		if(strlen(params) > 64)
		{
			SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %.64s ..", ReturnName(playerid), params);
            SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", params[64]);
		}
		else
        {
            SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %s ))", ReturnName(playerid), params);
            return 1;
        }
	}
	else
	{
		if(strlen(params) > 64)
		{
			SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "%s: (( %.64s ..", ReturnName(playerid), params);
            SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", params[64]);
		}
		else
        {
            SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "%s: (( %s ))", ReturnName(playerid), params);
            return 1;
        }
	}
	//printf("[OOC] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:call(playerid, params[])
{
	new ph;
	if(pData[playerid][pPhoneOff] == 1) return Error(playerid, "You must be turn on your phone");
	if(pData[playerid][pPhone] == 0) return Error(playerid, "You dont have phone!");
	if(pData[playerid][pPhoneCredit] <= 0) return Error(playerid, "You dont have phone credits!");
	
	if(sscanf(params, "d", ph))
	{
		Usage(playerid, "/call [phone number] 933 - Taxi Call | 911 - SAPD Crime Call | 922 - SAMD Medic Call");
		foreach(new ii : Player)
		{	
			if(pData[ii][pMechDuty] == 1)
			{
				SendClientMessageEx(playerid, COLOR_GREEN, "Mekanik Duty: %s | PH: [%d]", ReturnName(ii), pData[ii][pPhone]);
			}
		}
		return 1;
	}
	if(ph == 911)
	{
		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		Info(playerid, "Warning: This number for emergency crime only! please wait for SAPD respon!");
		SendFactionMessage(1, COLOR_BLUE, "[EMERGENCY CALL] "WHITE_E"%s calling the emergency crime! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
	
		pData[playerid][pCallTime] = gettime() + 60;
	}
	if(ph == 922)
	{
		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		Info(playerid, "Warning: This number for emergency medical only! please wait for SAMD respon!");
		SendFactionMessage(3, COLOR_PINK2, "[EMERGENCY CALL] "WHITE_E"%s calling the emergency medical! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
	
		pData[playerid][pCallTime] = gettime() + 60;
	}
	if(ph == 933)
	{
		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());
		
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		Info(playerid, "Your calling has sent to the taxi driver. please wait for respon!");
		pData[playerid][pCallTime] = gettime() + 60;
		foreach(new tx : Player)
		{
			if(pData[tx][pJob] == 1 || pData[tx][pJob2] == 1)
			{
				SendClientMessageEx(tx, COLOR_YELLOW, "[TAXI CALL] "LB_E"%s "WHITE_E"calling the taxi for order! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
			}
		}
	}
	if(ph == pData[playerid][pPhone]) return Error(playerid, "Nomor sedang sibuk!");
	foreach(new ii : Player)
	{
		if(pData[ii][pPhone] == ph)
		{
			if(pData[ii][IsLoggedIn] == false || !IsPlayerConnected(ii)) return Error(playerid, "This number is not actived!");

			if(pData[ii][pCall] == INVALID_PLAYER_ID)
			{
				pData[playerid][pCall] = ii;
				
				SendClientMessageEx(playerid, COLOR_YELLOW, "[CELLPHONE to %d] "WHITE_E"phone begins to ring, please wait for answer!", ph);
				SendClientMessageEx(ii, COLOR_YELLOW, "[CELLPHONE form %d] "WHITE_E"Your phonecell is ringing, type '/p' to answer it!", pData[playerid][pPhone]);
				PlayerPlaySound(playerid, 3600, 0,0,0);
				PlayerPlaySound(ii, 6003, 0,0,0);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
				SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s takes out a cellphone and calling someone.", ReturnName(playerid));
				return 1;
			}
			else
			{
				Error(playerid, "Nomor ini sedang sibuk.");
				return 1;
			}
		}
	}
	return 1;
}

CMD:p(playerid, params[])
{
	if(pData[playerid][pCall] != INVALID_PLAYER_ID)
		return Error(playerid, "Anda sudah sedang menelpon seseorang!");
		
	if(pData[playerid][pInjured] != 0)
		return Error(playerid, "You cant do that in this time.");
		
	foreach(new ii : Player)
	{
		if(playerid == pData[ii][pCall])
		{
			pData[ii][pPhoneCredit]--;
			
			pData[playerid][pCall] = ii;
			SendClientMessageEx(ii, COLOR_YELLOW, "[CELLPHONE] "WHITE_E"phone is connected, type '/hu' to stop!");
			SendClientMessageEx(playerid, COLOR_YELLOW, "[CELLPHONE] "WHITE_E"phone is connected, type '/hu' to stop!");
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
			SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s answers their cellphone.", ReturnName(playerid));
			return 1;
		}
	}
	return 1;
}

CMD:hu(playerid, params[])
{
	new caller = pData[playerid][pCall];
	if(IsPlayerConnected(caller) && caller != INVALID_PLAYER_ID)
	{
		pData[caller][pCall] = INVALID_PLAYER_ID;
		SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
		SendNearbyMessage(caller, 20.0, COLOR_PURPLE, "* %s puts away their cellphone.", ReturnName(caller));
		
		SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s puts away their cellphone.", ReturnName(playerid));
		pData[playerid][pCall] = INVALID_PLAYER_ID;
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
	}
	return 1;
}

CMD:sms(playerid, params[])
{
	new ph, text[50];
	if(pData[playerid][pPhone] == 0) return Error(playerid, "You dont have phone!");
	if(pData[playerid][pPhoneCredit] <= 0) return Error(playerid, "You dont have phone credits!");
	if(pData[playerid][pInjured] != 0) return Error(playerid, "You cant do at this time.");
	
	if(sscanf(params, "ds[50]", ph, text))
        return Usage(playerid, "/sms [phone number] [message max 50 text]");
	
	foreach(new ii : Player)
	{
		if(pData[ii][pPhone] == ph)
		{
			if(ii == INVALID_PLAYER_ID || !IsPlayerConnected(ii)) return Error(playerid, "This number is not actived!");
			SendClientMessageEx(playerid, COLOR_YELLOW, "[SMS to %d]"WHITE_E" %s", ph, text);
			SendClientMessageEx(ii, COLOR_YELLOW, "[SMS from %d]"WHITE_E" %s", pData[playerid][pPhone], text);
			Info(ii, "Gunakan "LB_E"'@<text>' "WHITE_E"untuk membalas SMS!");
			PlayerPlaySound(ii, 6003, 0,0,0);
			pData[ii][pSMS] = pData[playerid][pPhone];
			
			pData[playerid][pPhoneCredit] -= 1;
			return 1;
		}
	}
	return 1;
}

CMD:number(playerid, params[])
{
	if(pData[playerid][pPhoneBook] == 0)
		return Error(playerid, "You dont have a phone book.");
	
	new otherid;
	if(sscanf(params, "u", otherid))
        return Usage(playerid, "/number [playerid]");
	
	if(!IsPlayerConnected(otherid))
		return Error(playerid, "That player is not listed in phone book.");
		
	if(pData[otherid][pPhone] == 0)
		return Error(playerid, "That player is not listed in phone book.");
	
	SendClientMessageEx(playerid, COLOR_YELLOW, "[CELLPHONE] Name: %s | Ph: %d.", ReturnName(otherid), pData[otherid][pPhone]);
	return 1;
}


CMD:setfreq(playerid, params[])
{
	if(pData[playerid][pWT] == 0)
		return Error(playerid, "You dont have walkie talkie!");
	
	new channel;
	if(sscanf(params, "d", channel))
		return Usage(playerid, "/setfreq [channel 1 - 1000]");
	
	if(pData[playerid][pTogWT] == 1) return Error(playerid, "Your walkie talkie is turned off.");
	if(channel == pData[playerid][pWT]) return Error(playerid, "You are already in this channel.");
	
	if(channel > 0 && channel <= 1000)
	{
		foreach(new i : Player)
		{
		    if(pData[i][pWT] == channel)
		    {
				SendClientMessageEx(i, COLOR_LIME, "[WT] "WHITE_E"%s has joined in to this channel!", ReturnName(playerid));
		    }
		}
		Info(playerid, "You have set your walkie talkie channel to "LIME_E"%d", channel);
		pData[playerid][pWT] = channel;
	}
	else
	{
		Error(playerid, "Invalid channel id! 1 - 1000");
	}
	return 1;
}

CMD:wt(playerid, params[])
{
	if(pData[playerid][pWT] == 0)
		return Error(playerid, "You dont have walkie talkie!");
		
	if(pData[playerid][pTogWT] == 1)
		return Error(playerid, "Your walkie talkie is turned off!");
	
	new msg[128];
	if(sscanf(params, "s[128]", msg)) return Usage(playerid, "/wt [message]");
	foreach(new i : Player)
	{
	    if(pData[i][pTogWT] == 0)
	    {
	        if(pData[i][pWT] == pData[playerid][pWT])
	        {
				SendClientMessageEx(i, COLOR_LIME, "[WT] "WHITE_E"%s: %s", ReturnName(playerid), msg);
	        }
	    }
	}
	return 1;
}

/*CMD:savestats(playerid, params[])
{
	UpdateWeapons(playerid);
	UpdatePlayerData(playerid);
	Info(playerid, "Your data have been saved!");
	return 1;
}*/

CMD:ads(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 2461.21, 2270.42, 91.67)) return Error(playerid, "You must in SANA Station!");
	if(pData[playerid][pPhone] == 0) return Error(playerid, "You dont have phone!");
	
	if(isnull(params))
	{
		Usage(playerid, "/ads [text] | 1 character pay $2");
		return 1;
	}
	if(strlen(params) >= 100 ) return Error(playerid, "Maximum character is 100 text." );
	new payout = strlen(params) * 2;
	if(GetPlayerMoney(playerid) < payout) return Error(playerid, "Not enough money.");
	
	GivePlayerMoneyEx(playerid, -payout);
	Server_AddMoney(payout);
	foreach(new ii : Player)
	{
		if(pData[ii][pTogAds] == 0)
		{
			SendClientMessageEx(ii, COLOR_ORANGE2, "[ADS] "GREEN_E"%s.", params);
			SendClientMessageEx(ii, COLOR_ORANGE2, "Contact Info: ["GREEN_E"%s"ORANGE_E2"] Ph: ["GREEN_E"%d"ORANGE_E2"] Bank Rek: ["GREEN_E"%d"ORANGE_E2"]", pData[playerid][pName], pData[playerid][pPhone], pData[playerid][pBankRek]);
		}
	}
	//SendClientMessageToAllEx(COLOR_ORANGE2, "[ADS] "GREEN_E"%s.", params);
	//SendClientMessageToAllEx(COLOR_ORANGE2, "Contact Info: ["GREEN_E"%s"ORANGE_E2"] Ph: ["GREEN_E"%d"ORANGE_E2"] Bank Rek: ["GREEN_E"%d"ORANGE_E2"]", pData[playerid][pName], pData[playerid][pPhone], pData[playerid][pBankRek]);
	return 1;
}

CMD:shareloc(playerid, params[])
{
    if(pData[playerid][pPhone] == 0) return Error(playerid, "You dont have phone!");

	new ph;
	if(sscanf(params, "d", ph))
	{
		Usage(playerid, "/shareloc [phone number]");
		return 1;
	}
	foreach(new ii : Player)
	{
		if(pData[ii][pPhone] == ph)
		{
			if(pData[ii][IsLoggedIn] == false || !IsPlayerConnected(ii) || pData[playerid][pPhoneOff] == 1) return Error(playerid, "This number is not actived!");

			Servers(playerid, "Send Your location to phone number  %d", ph);
			Info(ii, "Anda Dikirimi Lokasi Oleh Seseorang");

			SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s mengirimkan lokasinya kepada seseorang", ReturnName(playerid));

			new
				Float: X,
				Float: Y,
				Float: Z;

			GetPlayerPos(playerid, X, Y, Z);
			SetPlayerCheckpoint(ii, X, Y, Z, 5.0);
			return 1;
		}
	}
	return 1;
}

CMD:tweet(playerid, params[])
{
    if(GetPVarInt(playerid, "maketw") > gettime())
        return Error(playerid, "Mohon Tunggu 5 Detik Untuk Menggunakan kembali (Don't Spam).");


	if(!pData[playerid][pTweet]) return Error(playerid, "Anda tidak mempunyai akun twitter");
    if(!strcmp(pData[playerid][pTname], "None"))
		return Error(playerid, "Kamu Harus set nama untuk nama akun Twitter mu.");
    if(pData[playerid][pPhoneCredit] <= 0) return Error(playerid, "You dont have phone credits!");

	if(!strlen(params)) return Usage(playerid, "/tweet [teks]");

	new string[300];
	format(string, sizeof(string), "TWITTER: "AQUA"@%s: %s ", pData[playerid][pTname], params);
	SendTweetMessage(ARWIN, string);
	pData[playerid][pPhoneCredit] -= 1;
	SetPVarInt(playerid, "maketw", gettime() + 5);
	return 1;
}
CMD:twlist(playerid)
{
	new mstr[4000];
	mstr = "Player Name\tTweet Name\n";
	foreach (new i : Player)
	{
		if(pData[i][pTweet] == 1)
		{
			format(mstr, sizeof(mstr), "%s%s[%d]\t"YELLOW_E"%s\n", mstr, pData[i][pName], i, pData[i][pTname]);
			ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "List Tweet Account", mstr, "Close","");
		}
	}
}

CMD:settwname(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
		return PermissionError(playerid);

	new tname[128], otherid, query[128];
	if(sscanf(params, "us[128]", otherid, tname))
	{
	    Usage(playerid, "/settwname <ID/Name> <twit name>");
	    return true;
	}

	mysql_format(g_SQL, query, sizeof(query), "SELECT tnames FROM players WHERE tnames='%s'", tname);
	mysql_tquery(g_SQL, query, "ChangeTwitName", "iis", otherid, playerid, tname);
	return 1;
}

function ChangeTwitName(otherplayer, playerid, nname[])
{
	if(cache_num_rows() > 0)
	{
		// Name Exists
		Error(playerid, "The name "DARK_E"'%s' "GREY_E"already exists in the database, please use a different name!", nname);
	}
	else
	{
		new query[512];
	    format(query, sizeof(query), "UPDATE players SET tnames='%e' WHERE reg_id=%d", nname, pData[otherplayer][pID]);
		mysql_tquery(g_SQL, query);
		format(pData[otherplayer][pTname], MAX_PLAYER_NAME, "%s", nname);
		Servers(playerid, "You has set twitter name %s to %s", pData[otherplayer][pName], nname);
	}
    return true;
}
function ChangeTwitUserName(otherplayer, nname[])
{
	if(cache_num_rows() > 0)
	{
		// Name Exists
		Error(otherplayer, "This Username "DARK_E"'%s' "GREY_E"already exists, please use a different name!", nname);
	}
	else
	{
		new query[512];
	    format(query, sizeof(query), "UPDATE players SET tnames='%e' WHERE reg_id=%d", nname, pData[otherplayer][pID]);
		mysql_tquery(g_SQL, query);
		format(pData[otherplayer][pTname], MAX_PLAYER_NAME, "%s", nname);
		Servers(otherplayer, "Your username account has changed to %s", nname);
		pData[otherplayer][pTweet] = 1;
	}
    return true;
}

CMD:paytoll(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 40.3993, -1522.9064, 5.1910))
	{
		SetDynamicObjectRot(Tflint[0], 0.000000, 0.000000, 270.67565917969);
		GivePlayerMoneyEx(playerid, -500);
		new String[1280];
		format(String, sizeof(String), "%s Give money toll amount of $05,00 to security guard", ReturnName(playerid));
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, String);
		format(String, sizeof(String), "Toll_Scurity Receiving money $05,00 with the right hand");
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, String);
		SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "Toll Scurity says: terimakasih sudah membayar toll, nikmati perjalan mu");
		SetTimer("F1CloseToll", 5500, 0);
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, 62.3336, -1540.1075, 5.0645))
	{
		SetDynamicObjectRot(Tflint[1], 0.000000, 0.000000, 87.337799072266);
		GivePlayerMoneyEx(playerid, -500);
		new String[1280];
		format(String, sizeof(String), "%s Give money toll amount of $05,00 to security guard", ReturnName(playerid));
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, String);
		format(String, sizeof(String), "Toll_Scurity Receiving money $05,00 with the right hand");
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, String);
		SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "Toll Scurity says: terimakasih sudah membayar toll, nikmati perjalan mu");
		SetTimer("F2CloseToll", 5500, 0);
	}
	//LV toll
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1795.9447, 704.2550, 15.0006))
	{
		SetDynamicObjectRot(TollLv[1], 0.000000, 0.000000, 169.43664550781);
		GivePlayerMoneyEx(playerid, -500);
		new String[1280];
		format(String, sizeof(String), "%s Give money toll amount of $05,00 to security guard", ReturnName(playerid));
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, String);
		format(String, sizeof(String), "Toll_Scurity Receiving money $05,00 with the right hand");
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, String);
		SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "Toll Scurity says: terimakasih sudah membayar toll, nikmati perjalan mu");
		SetTimer("LV1CloseToll", 5500, 0);
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1778.9886, 702.6728, 15.2574))
	{
		SetDynamicObjectRot(TollLv[0], 0.000000, 0.000000, 348.10229492188);
		GivePlayerMoneyEx(playerid, -500);
		new String[1280];
		format(String, sizeof(String), "%s Give money toll amount of $05,00 to security guard", ReturnName(playerid));
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, String);
		format(String, sizeof(String), "Toll_Scurity Receiving money $05,00 with the right hand");
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, String);
		SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "Toll Scurity says: terimakasih sudah membayar toll, nikmati perjalan mu");
		SetTimer("LV2CloseToll", 5500, 0);
	}
	return 1;
}

//------------------[ Bisnis and Buy Commands ]-------
CMD:buy(playerid, params[])
{
	//trucker product
	if(IsPlayerInRangeOfPoint(playerid, 3.5, -279.67, -2148.42, 28.54))
	{
		if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				new mstr[128];
				format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah product:\nProduct Stock: "GREEN_E"%d\n"WHITE_E"Product Price"GREEN_E"%s / item", Product, FormatMoney(ProductPrice));
				ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_INPUT, "Buy Product", mstr, "Buy", "Cancel");
			}
			else return Error(playerid, "You are not in vehicle trucker.");
		}
		else return Error(playerid, "You are not trucker job.");
	}
	//Material
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -2184.5906,-209.5870,36.5156))
	{
		if(pData[playerid][pMaterial] >= 500) return Error(playerid, "Anda sudah membawa 500 Material!");
		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah material:\nMaterial Stock: "GREEN_E"%d\n"WHITE_E"Material Price"GREEN_E"%s / item", Material, FormatMoney(MaterialPrice));
		ShowPlayerDialog(playerid, DIALOG_MATERIAL, DIALOG_STYLE_INPUT, "Buy Material", mstr, "Buy", "Cancel");
	}
	//Component
	if(IsPlayerInRangeOfPoint(playerid, 1.2, -1819.4456,-151.3634,9.3984))
	{
		if(pData[playerid][pComponent] >= 500) return Error(playerid, "Anda sudah membawa 500 Component!");
		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah component:\nComponent Stock: "GREEN_E"%d\n"WHITE_E"Component Price"GREEN_E"%s / item", Component, FormatMoney(ComponentPrice));
		ShowPlayerDialog(playerid, DIALOG_COMPONENT, DIALOG_STYLE_INPUT, "Buy Component", mstr, "Buy", "Cancel");
	}
	//Apotek
	if(IsPlayerInRangeOfPoint(playerid, 2.5, 1448.85, -32.467, 1000.92))
	{
		if(pData[playerid][pFaction] != 3)
			return Error(playerid, "Medical only!");
			
		new mstr[10000];
		format(mstr, sizeof(mstr), "Hospital Menu\tPrice\nMedicine\t"LG_E2"%s\nMedkit\t"LG_E2"%s\nBandage\t"LG_E2"$3,00\n", FormatMoney(MedicinePrice), FormatMoney(MedkitPrice));
		ShowPlayerDialog(playerid, DIALOG_APOTEK, DIALOG_STYLE_TABLIST_HEADERS, "Apotek", mstr, "Buy", "Cancel");
	}
	//Food and Seed
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -381.44, -1426.13, 25.93))
	{
		new mstr[10000];
		format(mstr, sizeof(mstr), "Product\tPrice\nFood\t"LG_E2"%s\nSeed\t"LG_E2"%s\n", FormatMoney(FoodPrice), FormatMoney(SeedPrice));
		ShowPlayerDialog(playerid, DIALOG_FOOD, DIALOG_STYLE_TABLIST_HEADERS, "Food(s) menu", mstr, "Buy", "Cancel");
	}
	//Drugs
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -3811.65, 1313.72, 71.42))
	{
		if(pData[playerid][pMarijuana] >= 100) return Error(playerid, "Anda sudah membawa 100 kg Marijuana!");
		if(pData[playerid][pFamily] == -1) return Error(playerid, "Only for family member!");
		
		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah marijuana:\nMarijuana Stock: "GREEN_E"%d\n"WHITE_E"Marijuana Price"GREEN_E"%s / item", Marijuana, FormatMoney(MarijuanaPrice));
		ShowPlayerDialog(playerid, DIALOG_DRUGS, DIALOG_STYLE_INPUT, "Buy Drugs", mstr, "Buy", "Cancel");
	}
	// Robbery
	if(IsPlayerInRangeOfPoint(playerid, 2.0, 882.16, -21.96, 63.23))
	{
		if(RobTim[playerid] == 0)
			return Error(playerid, "Anda tidak memiliki anggota robbery");

		new string[1280];
		pData[playerid][pAlatRob]++;
		GivePlayerMoneyEx(playerid, -10000);
		format(string, sizeof(string), "ROBBERY: "WHITE_E"Kamu telah membeli alat perampokan, berhati-hati bila membawa alat ini");
		SCM(playerid, ARWIN, string);
		SavePlayerAccount(playerid);
	}
	//Buy House
	foreach(new hid : Houses)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
		{
			if(hData[hid][hPrice] > GetPlayerMoney(playerid)) return Error(playerid, "Not enough money, you can't afford this houses.");
			if(strcmp(hData[hid][hOwner], "-")) return Error(playerid, "Someone already owns this house.");
			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 2) return Error(playerid, "You can't buy any more houses.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 3) return Error(playerid, "You can't buy any more houses.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 4) return Error(playerid, "You can't buy any more houses.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more houses.");
				#endif
			}
			GivePlayerMoneyEx(playerid, -hData[hid][hPrice]);
			Server_AddMoney(hData[hid][hPrice]);
			GetPlayerName(playerid, hData[hid][hOwner], MAX_PLAYER_NAME);
			hData[hid][hVisit] = gettime();
			
			House_Refresh(hid);
			House_Save(hid);
		}
	}
	//Buy Bisnis
	foreach(new bid : Bisnis)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
		{
			if(bData[bid][bPrice] > GetPlayerMoney(playerid)) return Error(playerid, "Not enough money, you can't afford this bisnis.");
			if(strcmp(bData[bid][bOwner], "-")) return Error(playerid, "Someone already owns this bisnis.");
			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 2) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 3) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 4) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			GivePlayerMoneyEx(playerid, -bData[bid][bPrice]);
			Server_AddMoney(bData[bid][bPrice]);
			GetPlayerName(playerid, bData[bid][bOwner], MAX_PLAYER_NAME);
			bData[bid][bVisit] = gettime();

			Bisnis_Refresh(bid);
			Bisnis_Save(bid);
		}
	}
	//Buy Bisnis menu
	if(pData[playerid][pInBiz] >= 0 && IsPlayerInRangeOfPoint(playerid, 2.5, bData[pData[playerid][pInBiz]][bPointX], bData[pData[playerid][pInBiz]][bPointY], bData[pData[playerid][pInBiz]][bPointZ]))
	{
		Bisnis_BuyMenu(playerid, pData[playerid][pInBiz]);
	}
	//Buy Workshop
	foreach(new id : Workshop)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, wsData[id][wX], wsData[id][wY], wsData[id][wZ]))
		{
			if(wsData[id][wPrice] > pData[playerid][pGold]) return Error(playerid, "You have to donate or have VIP gold to buy at workshop.");
			if(strcmp(wsData[id][wOwner], "-")) return Error(playerid, "Someone already owns this Workshop.");
			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(ReturnWorkshopID(playerid) + 1 > 2) return Error(playerid, "You can't buy any more Workshop.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(ReturnWorkshopID(playerid) + 1 > 3) return Error(playerid, "You can't buy any more Workshop.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(ReturnWorkshopID(playerid) + 1 > 4) return Error(playerid, "You can't buy any more Workshop.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(ReturnWorkshopID(playerid) + 1 > 1) return Error(playerid, "You can't buy any more Workshop.");
				#endif
			}
			pData[playerid][pGold] -= wsData[id][wPrice];
			Server_AddMoney(wsData[id][wPrice]);
			GetPlayerName(playerid, wsData[id][wOwner], MAX_PLAYER_NAME);
			SendStaffMessage(COLOR_RED, "BUYLOGS: "YELLOW_E"Players "AQUA"%s "YELLOW_E"Have purchased workshop ID: %d", pData[playerid][pName], id);
			//bData[bid][bVisit] = gettime();

			Workshop_Refresh(id);
			Workshop_Save(id);
		}
	}
	// Buy Farm Privates
	foreach(new id : Farm)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, FarmData[id][farmX], FarmData[id][farmY], FarmData[id][farmZ]))
		{
			if(FarmData[id][farmPrice] > GetPlayerMoney(playerid)) return Error(playerid, "Not enough money, you can't afford this Privates Farm.");
			if(strcmp(FarmData[id][farmOwner], "-")) return Error(playerid, "Someone already owns this Privat Farms.");
			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(ReturnFarmID(playerid) + 1 > 2) return Error(playerid, "You can't buy any more Farm.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(ReturnFarmID(playerid) + 1 > 3) return Error(playerid, "You can't buy any more Farm.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(ReturnFarmID(playerid) + 1 > 4) return Error(playerid, "You can't buy any more Farm.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(ReturnFarmID(playerid) + 1 > 1) return Error(playerid, "You can't buy any more Farm.");
				#endif
			}
			GivePlayerMoneyEx(playerid, -FarmData[id][farmPrice]);
			Server_AddMoney(FarmData[id][farmPrice]);
			GetPlayerName(playerid, FarmData[id][farmOwner], MAX_PLAYER_NAME);
			//bData[bid][bVisit] = gettime();

			Farm_Refresh(id);
			Farm_Save(id);
		}
	}
	// Buy Dealer
	foreach(new bid : Dealer)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, DealerData[bid][dealerPosX], DealerData[bid][dealerPosY], DealerData[bid][dealerPosZ]))
		{
			if(DealerData[bid][dealerPrice] > GetPlayerMoney(playerid))
				return Error(playerid, "Not enough money, you can't afford this dealership.");

			if(strcmp(DealerData[bid][dealerOwner], "-"))
				return Error(playerid, "Someone already owns this dealership.");

			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_DealerCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more dealership.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_DealerCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more dealership.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_DealerCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more dealership.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(Player_DealerCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more dealership.");
				#endif
			}

			GivePlayerMoneyEx(playerid, -DealerData[bid][dealerPrice]);
			Server_AddMoney(DealerData[bid][dealerPrice]);
			GetPlayerName(playerid, DealerData[bid][dealerOwner], MAX_PLAYER_NAME);

			DealerRefresh(bid);
			DealerSave(bid);
		}
	}
	return 1;
}
CMD:buymembership(playerid, params[])
{
    pData[playerid][pGymVip] = 1;
    GivePlayerMoneyEx(playerid, -300);
    Info(playerid, "You has bought GYM Membership.");

}
