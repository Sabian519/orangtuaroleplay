
//----------[ Function Login Register]----------

function OnPlayerDataLoaded(playerid, race_check)
{
	InterpolateCameraPos(playerid, 1533.116943, -1367.901367, 332.058013, 628.761047, -1764.393554, 19.677539, 35000);
    InterpolateCameraLookAt(playerid, 1529.958251, -1371.210693, 330.040313, 629.909790, -1769.228637, 19.127872, 35000);
    TogglePlayerControllable(playerid, 0);
	if (race_check != g_MysqlRaceCheck[playerid]) return Kick(playerid);

	new string[1150], query[248], PlayerIP[16];
	if(cache_num_rows() > 0)
	{
		cache_get_value_name_int(0, "reg_id", pData[playerid][pID]);
		cache_get_value_name(0, "password", pData[playerid][pPassword], 65);
		cache_get_value_name(0, "salt", pData[playerid][pSalt], 17);

		//pData[playerid][Cache_ID] = cache_save();

		format(string, sizeof string, ""YELLOW_E"Welcome to this Sever OrangTua Roleplay!\n\n{ffffff}UCP Name: "AQUA"%s\n"WHITE_E"Status: {00ff00}Verified\n{87cefa}Please input your password to login:", pData[playerid][pName]);
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login Account", string, "Login", "Abort");

		//pData[playerid][LoginTimer] = SetTimerEx("OnLoginTimeout", SECONDS_TO_LOGIN * 1000, false, "i", playerid);
	}
	else
	{
	    CheckVerify(playerid);
	}
	mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `banneds` WHERE `name` = '%s' OR `ip` = '%s' OR (`longip` != 0 AND (`longip` & %i) = %i) LIMIT 1", pData[playerid][pName], pData[playerid][pIP], BAN_MASK, (Ban_GetLongIP(PlayerIP) & BAN_MASK));
	mysql_tquery(g_SQL, query, "CheckBan", "i", playerid);
	return 1;
}

function CheckVerify(playerid)
{
	new name[MAX_PLAYER_NAME+1];
    GetPlayerName(playerid, name, sizeof(name));
    new player[200];
    new strong[1000];
    new string[1000];
    format(player,sizeof(player),"UCP/%s.txt",name);
    if(!dini_Exists(player))
    {
        format(strong, sizeof strong, "Dear: "LG_E2"%s\n\n"YELLOW_E"Checking Account Warning.\n"WHITE_E"There is account "BLUESKY"%s's "WHITE_E"doest not verified\n"WHITE_E"Please Registered UCP on Discord or Contact Moderator Servers\n"WHITE_E"- "YELLOW_E"https://discord.io//orangtuaroleplay\n\n"PINK_E"copyrigh(c) by OrangTua RP Team", pData[playerid][pName], pData[playerid][pName]);
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "OT:RP - UCP Protection", strong, "Close", "");
        SCM(playerid, ARWIN, "UCP: "YELLOW_E"Akun kamu belum terdaftar Database Server "RED_E"(Kicked)");
		KickEx(playerid);
    }
    else
    {
	    format(string, sizeof(string), ""BLUESKY"Your Account it's Registered UCP\n\n"YELLOW_E"Welcome to OrangTua Roleplay server!\n{ffffff}UCP:"AQUA" %s\n"WHITE_E"Status: "RED_E"Unverified\n\n{87cefa}You can register by input your passowrd below:", GetName(playerid));
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Account Register", string, "Register", "Exit");
		SendClientMessageEx(playerid, COLOR_YELLOW, "UCP: "X1_BLUE"database succesfully loaded account with Names "LG_E2"%s", ReturnName(playerid));
	}
    return 1;
}
function CheckBan(playerid)
{
	if(cache_num_rows() > 0)
	{
		new Reason[40], PlayerName[24], BannedName[24];
	    new banTime_Int, banDate, banIP[16];
		new hours, minutes, seconds, years, months, days;
	    gettime(hours, minutes, seconds);
	    getdate(years, months, days);
		cache_get_value_name(0, "name", BannedName);
		cache_get_value_name(0, "admin", PlayerName);
		cache_get_value_name(0, "reason", Reason);
		cache_get_value_name(0, "ip", banIP);
		cache_get_value_name_int(0, "ban_expire", banTime_Int);
		cache_get_value_name_int(0, "ban_date", banDate);

		new currentTime = gettime();
        if(banTime_Int != 0 && banTime_Int <= currentTime) // Unban the player.
		{
			new query[248];
			mysql_format(g_SQL, query, sizeof(query), "DELETE FROM banneds WHERE name = '%s'", pData[playerid][pName]);
			mysql_tquery(g_SQL, query);

			Servers(playerid, "Welcome back to server, its been %s since your ban was lifted.", ReturnTimelapse(banTime_Int, gettime()));
		}
		else
		{
			foreach(new pid : Player)
			{
				if(pData[pid][pTogLog] == 0)
				{
					SendClientMessageEx(pid, COLOR_RED, "Server: "GREY2_E"%s(%i) has been auto-kicked for ban evading.", pData[playerid][pName], playerid);
				}
			}
			new query[248], PlayerIP[16];
  			mysql_format(g_SQL, query, sizeof query, "UPDATE `banneds` SET `last_activity_timestamp` = %i WHERE `name` = '%s'", gettime(), pData[playerid][pName]);
			mysql_tquery(g_SQL, query);

			pData[playerid][IsLoggedIn] = false;
			printf("[BANNED INFO]: Ban Getting Called on %s", pData[playerid][pName]);
			GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));

			InfoTD_MSG(playerid, 5000, "~r~~h~You are banned from this server!");
			//for(new l; l < 20; l++) SendClientMessage(playerid, COLOR_DARK, "\n");
			SendClientMessage(playerid, COLOR_RED, "You are banned from this server!");
			if(banTime_Int == 0)
			{
				new lstr[10000];
				format(lstr, sizeof(lstr), ""YELLOW_E"Your UCP account is blocked!\n\n"YELLOW_E"Ban Description:\n"BLUESKY"Username: "RED_E"%s\n"BLUESKY"IP Addreas: "LG_E2"%s\n"BLUESKY"Banned by: "RED_E"%s\n"BLUESKY"Ban Date: "WHITE_E"%02d:%02d (%02d/%02d/%d)\n"BLUESKY"Ban Reason: "RED_E"%s\n"BLUESKY"Ban Time: "RED_E"Permanently\n\n"YELLOW_E"See you around Erasers\n\n"LG_E2"Please give honest clarification for unbanned\n"LG_E"Please give honest clarification for unbanned\n"YELLOW_E"[+]"WHITE_E" http:/discord.io/orangtuaroleplay", pData[playerid][pName], PlayerIP, PlayerName, hours, minutes, months, days, years, Reason);
				ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Account Blocked", lstr, "Exit", "");
			}
			else
			{
				new lstr[512];
				format(lstr, sizeof(lstr), ""YELLOW_E"Your UCP account is blocked!!\n\n"YELLOW_E"Ban Description:\n"BLUESKY"Username: "RED_E"%s\n"BLUESKY"IP Address: "LG_E2"%s\n"BLUESKY"Banned by: "RED_E"%s\n"BLUESKY"Ban Date: "WHITE_E"%02d:%02d (%02d/%02d/%d)\n"BLUESKY"Ban Reason: "RED_E"%s\n"BLUESKY"Ban Time: "RED_E"%s\n\n"YELLOW_E"See you around Erasers\n\n"LG_E"Please give honest clarification for unbanned\n"YELLOW_E"[+]"WHITE_E" http:/discord.io/orangtuaroleplay", pData[playerid][pName], PlayerIP, PlayerName, hours, minutes, months, days, years, Reason, ReturnTimelapse(gettime(), banTime_Int));
				ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Account Blocked", lstr, "Exit", "");
			}
			KickEx(playerid);
			return 1;
  		}
	}
	return 1;
}

function AssignPlayerData(playerid)
{
	new aname[MAX_PLAYER_NAME],  tname[MAX_PLAYER_NAME], email[40], age[128], ip[128], regdate[50], lastlogin[50];
	
	/*if(pData[playerid][pID] < 1)
	{
		Error(playerid, "Database player not found!");
		KickEx(playerid);
		return 1;
	}*/
	cache_get_value_name_int(0, "reg_id", pData[playerid][pID]);
	cache_get_value_name(0, "username", pData[playerid][pName], MAX_PLAYER_NAME+1);
	cache_get_value_name(0, "adminname", aname);
	format(pData[playerid][pAdminname], MAX_PLAYER_NAME, "%s", aname);
	cache_get_value_name(0, "tnames", tname);
	format(pData[playerid][pTname], MAX_PLAYER_NAME, "%s", tname);
	cache_get_value_name(0, "ip", ip);
	format(pData[playerid][pIP], 128, "%s", ip);
	cache_get_value_name(0, "email", email);
	format(pData[playerid][pEmail], 40, "%s", email);
	cache_get_value_name_int(0, "admin", pData[playerid][pAdmin]);
	cache_get_value_name_int(0, "helper", pData[playerid][pHelper]);
	cache_get_value_name_int(0, "level", pData[playerid][pLevel]);
	cache_get_value_name_int(0, "levelup", pData[playerid][pLevelUp]);
	cache_get_value_name_int(0, "vip", pData[playerid][pVip]);
	cache_get_value_name_int(0, "vip_time", pData[playerid][pVipTime]);
	cache_get_value_name_int(0, "gold", pData[playerid][pGold]);
	cache_get_value_name(0, "reg_date", regdate);
	format(pData[playerid][pRegDate], 128, "%s", regdate);
	cache_get_value_name(0, "last_login", lastlogin);
	format(pData[playerid][pLastLogin], 128, "%s", lastlogin);
	cache_get_value_name_int(0, "money", pData[playerid][pMoney]);
	cache_get_value_name_int(0, "bmoney", pData[playerid][pBankMoney]);
	cache_get_value_name_int(0, "brek", pData[playerid][pBankRek]);
	cache_get_value_name_int(0, "phone", pData[playerid][pPhone]);
	cache_get_value_name_int(0, "phoneoff", pData[playerid][pPhoneOff]);
	cache_get_value_name_int(0, "phonecredit", pData[playerid][pPhoneCredit]);
	cache_get_value_name_int(0, "phonebook", pData[playerid][pPhoneBook]);
	cache_get_value_name_int(0, "wt", pData[playerid][pWT]);
	cache_get_value_name_int(0, "hours", pData[playerid][pHours]);
	cache_get_value_name_int(0, "minutes", pData[playerid][pMinutes]);
	cache_get_value_name_int(0, "seconds", pData[playerid][pSeconds]);
	cache_get_value_name_int(0, "paycheck", pData[playerid][pPaycheck]);
	cache_get_value_name_int(0, "skin", pData[playerid][pSkin]);
	cache_get_value_name_int(0, "facskin", pData[playerid][pFacSkin]);
	cache_get_value_name_int(0, "gender", pData[playerid][pGender]);
	cache_get_value_name(0, "age", age);
	format(pData[playerid][pAge], 128, "%s", age);
	cache_get_value_name_int(0, "indoor", pData[playerid][pInDoor]);
	cache_get_value_name_int(0, "inhouse", pData[playerid][pInHouse]);
	cache_get_value_name_int(0, "inbiz", pData[playerid][pInBiz]);
	cache_get_value_name_float(0, "posx", pData[playerid][pPosX]);
	cache_get_value_name_float(0, "posy", pData[playerid][pPosY]);
	cache_get_value_name_float(0, "posz", pData[playerid][pPosZ]);
	cache_get_value_name_float(0, "posa", pData[playerid][pPosA]);
	cache_get_value_name_int(0, "interior", pData[playerid][pInt]);
	cache_get_value_name_int(0, "world", pData[playerid][pWorld]);
	cache_get_value_name_float(0, "health", pData[playerid][pHealth]);
	cache_get_value_name_float(0, "armour", pData[playerid][pArmour]);
	cache_get_value_name_int(0, "hunger", pData[playerid][pHunger]);
	cache_get_value_name_int(0, "bladder", pData[playerid][pBladder]);
	cache_get_value_name_int(0, "energy", pData[playerid][pEnergy]);
	cache_get_value_name_int(0, "fstyle", pData[playerid][pFightStyle]);
	cache_get_value_name_int(0, "gvip", pData[playerid][pGymVip]);
	cache_get_value_name_int(0, "sick", pData[playerid][pSick]);
	cache_get_value_name_int(0, "hospital", pData[playerid][pHospital]);
	cache_get_value_name_int(0, "injured", pData[playerid][pInjured]);
	cache_get_value_name_int(0, "duty", pData[playerid][pOnDuty]);
	cache_get_value_name_int(0, "dutytime", pData[playerid][pOnDutyTime]);
	cache_get_value_name_int(0, "faction", pData[playerid][pFaction]);
	cache_get_value_name_int(0, "factionrank", pData[playerid][pFactionRank]);
	cache_get_value_name_int(0, "factionlead", pData[playerid][pFactionLead]);
	cache_get_value_name_int(0, "family", pData[playerid][pFamily]);
	cache_get_value_name_int(0, "familyrank", pData[playerid][pFamilyRank]);
	cache_get_value_name_int(0, "jail", pData[playerid][pJail]);
	cache_get_value_name_int(0, "jail_time", pData[playerid][pJailTime]);
	cache_get_value_name_int(0, "arrest", pData[playerid][pArrest]);
	cache_get_value_name_int(0, "arrest_time", pData[playerid][pArrestTime]);
	cache_get_value_name_int(0, "warn", pData[playerid][pWarn]);
	cache_get_value_name_int(0, "job", pData[playerid][pJob]);
	cache_get_value_name_int(0, "job2", pData[playerid][pJob2]);
	cache_get_value_name_int(0, "jobtime", pData[playerid][pJobTime]);
	cache_get_value_name_int(0, "sidejobtime", pData[playerid][pSideJobTime]);
	cache_get_value_name_int(0, "bustime", pData[playerid][pBusTime]);
	cache_get_value_name_int(0, "forklifttime", pData[playerid][pForTime]);
	cache_get_value_name_int(0, "pizzatime", pData[playerid][pPizzaTime]);
	cache_get_value_name_int(0, "exitjob", pData[playerid][pExitJob]);
	cache_get_value_name_int(0, "taxitime", pData[playerid][pTaxiTime]);
	cache_get_value_name_int(0, "medicine", pData[playerid][pMedicine]);
	cache_get_value_name_int(0, "medkit", pData[playerid][pMedkit]);
	cache_get_value_name_int(0, "mask", pData[playerid][pMask]);
	cache_get_value_name_int(0, "helmet", pData[playerid][pHelmet]);
	cache_get_value_name_int(0, "snack", pData[playerid][pSnack]);
	cache_get_value_name_int(0, "sprunk", pData[playerid][pSprunk]);
	cache_get_value_name_int(0, "gas", pData[playerid][pGas]);
	cache_get_value_name_int(0, "bandage", pData[playerid][pBandage]);
	cache_get_value_name_int(0, "gps", pData[playerid][pGPS]);
	cache_get_value_name_int(0, "material", pData[playerid][pMaterial]);
	cache_get_value_name_int(0, "component", pData[playerid][pComponent]);
	cache_get_value_name_int(0, "food", pData[playerid][pFood]);
	cache_get_value_name_int(0, "seed", pData[playerid][pSeed]);
	cache_get_value_name_int(0, "potato", pData[playerid][pPotato]);
	cache_get_value_name_int(0, "wheat", pData[playerid][pWheat]);
	cache_get_value_name_int(0, "orange", pData[playerid][pOrange]);
	cache_get_value_name_int(0, "price1", pData[playerid][pPrice1]);
	cache_get_value_name_int(0, "price2", pData[playerid][pPrice2]);
	cache_get_value_name_int(0, "price3", pData[playerid][pPrice3]);
	cache_get_value_name_int(0, "price4", pData[playerid][pPrice4]);
	cache_get_value_name_int(0, "marijuana", pData[playerid][pMarijuana]);
	cache_get_value_name_int(0, "plant", pData[playerid][pPlant]);
	cache_get_value_name_int(0, "plant_time", pData[playerid][pPlantTime]);
	cache_get_value_name_int(0, "fishtool", pData[playerid][pFishTool]);
	cache_get_value_name_int(0, "fish", pData[playerid][pFish]);
	cache_get_value_name_int(0, "worm", pData[playerid][pWorm]);
	cache_get_value_name_int(0, "idcard", pData[playerid][pIDCard]);
	cache_get_value_name_int(0, "idcard_time", pData[playerid][pIDCardTime]);
	cache_get_value_name_int(0, "drivelic", pData[playerid][pDriveLic]);
	cache_get_value_name_int(0, "drivelic_time", pData[playerid][pDriveLicTime]);
	cache_get_value_name_int(0, "hbemode", pData[playerid][pHBEMode]);
	cache_get_value_name_int(0, "akuntw", pData[playerid][pTweet]);
	cache_get_value_name_int(0, "togpm", pData[playerid][pTogPM]);
	cache_get_value_name_int(0, "toglog", pData[playerid][pTogLog]);
	cache_get_value_name_int(0, "togads", pData[playerid][pTogAds]);
	cache_get_value_name_int(0, "togwt", pData[playerid][pTogWT]);
	cache_get_value_name_int(0, "togtweet", pData[playerid][pTogTweet]);
	
	cache_get_value_name_int(0, "Gun1", pData[playerid][pGuns][0]);
	cache_get_value_name_int(0, "Gun2", pData[playerid][pGuns][1]);
	cache_get_value_name_int(0, "Gun3", pData[playerid][pGuns][2]);
	cache_get_value_name_int(0, "Gun4", pData[playerid][pGuns][3]);
	cache_get_value_name_int(0, "Gun5", pData[playerid][pGuns][4]);
	cache_get_value_name_int(0, "Gun6", pData[playerid][pGuns][5]);
	cache_get_value_name_int(0, "Gun7", pData[playerid][pGuns][6]);
	cache_get_value_name_int(0, "Gun8", pData[playerid][pGuns][7]);
	cache_get_value_name_int(0, "Gun9", pData[playerid][pGuns][8]);
	cache_get_value_name_int(0, "Gun10", pData[playerid][pGuns][9]);
	cache_get_value_name_int(0, "Gun11", pData[playerid][pGuns][10]);
	cache_get_value_name_int(0, "Gun12", pData[playerid][pGuns][11]);
	cache_get_value_name_int(0, "Gun13", pData[playerid][pGuns][12]);
	
	cache_get_value_name_int(0, "Ammo1", pData[playerid][pAmmo][0]);
	cache_get_value_name_int(0, "Ammo2", pData[playerid][pAmmo][1]);
	cache_get_value_name_int(0, "Ammo3", pData[playerid][pAmmo][2]);
	cache_get_value_name_int(0, "Ammo4", pData[playerid][pAmmo][3]);
	cache_get_value_name_int(0, "Ammo5", pData[playerid][pAmmo][4]);
	cache_get_value_name_int(0, "Ammo6", pData[playerid][pAmmo][5]);
	cache_get_value_name_int(0, "Ammo7", pData[playerid][pAmmo][6]);
	cache_get_value_name_int(0, "Ammo8", pData[playerid][pAmmo][7]);
	cache_get_value_name_int(0, "Ammo9", pData[playerid][pAmmo][8]);
	cache_get_value_name_int(0, "Ammo10", pData[playerid][pAmmo][9]);
	cache_get_value_name_int(0, "Ammo11", pData[playerid][pAmmo][10]);
	cache_get_value_name_int(0, "Ammo12", pData[playerid][pAmmo][11]);
	cache_get_value_name_int(0, "Ammo13", pData[playerid][pAmmo][12]);
	
	for (new i; i < 17; i++)
	{
		WeaponSettings[playerid][i][Position][0] = -0.116;
		WeaponSettings[playerid][i][Position][1] = 0.189;
		WeaponSettings[playerid][i][Position][2] = 0.088;
		WeaponSettings[playerid][i][Position][3] = 0.0;
		WeaponSettings[playerid][i][Position][4] = 44.5;
		WeaponSettings[playerid][i][Position][5] = 0.0;
		WeaponSettings[playerid][i][Bone] = 1;
		WeaponSettings[playerid][i][Hidden] = false;
	}
	WeaponTick[playerid] = 0;
	EditingWeapon[playerid] = 0;
	new string[128];
	mysql_format(g_SQL, string, sizeof(string), "SELECT * FROM weaponsettings WHERE Owner = '%d'", pData[playerid][pID]);
	mysql_tquery(g_SQL, string, "OnWeaponsLoaded", "d", playerid);
	
	KillTimer(pData[playerid][LoginTimer]);
	pData[playerid][LoginTimer] = 0;
	pData[playerid][IsLoggedIn] = true;

	SetSpawnInfo(playerid, NO_TEAM, pData[playerid][pSkin], pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ], pData[playerid][pPosA], 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	
	MySQL_LoadPlayerToys(playerid);
	LoadPlayerVehicle(playerid);
	LoadPlayerAccount(playerid);
	return 1;
}

function OnPlayerRegister(playerid)
{
	if(pData[playerid][IsLoggedIn] == true)
		return Error(playerid, "You already logged in!");

	pData[playerid][pID] = cache_insert_id();
	pData[playerid][IsLoggedIn] = true;

	pData[playerid][pPosX] = DEFAULT_POS_X;
	pData[playerid][pPosY] = DEFAULT_POS_Y;
	pData[playerid][pPosZ] = DEFAULT_POS_Z;
	pData[playerid][pPosA] = DEFAULT_POS_A;
	pData[playerid][pInt] = 0;
	pData[playerid][pWorld] = 0;
	pData[playerid][pGender] = 0;

	format(pData[playerid][pUCP], 22, GetName(playerid));
	format(pData[playerid][pAdminname], MAX_PLAYER_NAME, "None");
	format(pData[playerid][pEmail], 40, "None");
	pData[playerid][pHealth] = 100.0;
	pData[playerid][pArmour] = 0.0;
	pData[playerid][pLevel] = 1;
	pData[playerid][pHunger] = 100;
	pData[playerid][pBladder] = 100;
	pData[playerid][pEnergy] = 100;
	pData[playerid][pMoney] = 2500;
	pData[playerid][pBankMoney] = 3000;
	/*new rand = RandomEx(111111, 999999);
	new rek = rand+pData[playerid][pID];
	pData[playerid][pBankRek] = rek;*/

	new query[128], rand = RandomEx(111111, 999999);
	new rek = rand+pData[playerid][pID];
	mysql_format(g_SQL, query, sizeof(query), "SELECT brek FROM players WHERE brek='%d'", rek);
	mysql_tquery(g_SQL, query, "BankRek", "id", playerid, rek);
	
	SetSpawnInfo(playerid, NO_TEAM, 0, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ], pData[playerid][pPosA], 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	return 1;
}

function BankRek(playerid, brek)
{
	if(cache_num_rows() > 0)
	{
		//Rekening Exist
		new query[128], rand = RandomEx(11111, 99999);
		new rek = rand+pData[playerid][pID];
		mysql_format(g_SQL, query, sizeof(query), "SELECT brek FROM players WHERE brek='%d'", rek);
		mysql_tquery(g_SQL, query, "BankRek", "is", playerid, rek);
		Info(playerid, "Your Bank rekening number is same with someone. We will research new.");
	}
	else
	{
		new query[128];
	    mysql_format(g_SQL, query, sizeof(query), "UPDATE players SET brek='%d' WHERE reg_id=%d", brek, pData[playerid][pID]);
		mysql_tquery(g_SQL, query);
		pData[playerid][pBankRek] = brek;
	}
    return true;
}

function PhoneNumber(playerid, phone)
{
	if(cache_num_rows() > 0)
	{
		//Rekening Exist
		new query[128], rand = RandomEx(1111, 9888);
		new phones = rand+pData[playerid][pID];
		mysql_format(g_SQL, query, sizeof(query), "SELECT phone FROM players WHERE phone='%d'", phones);
		mysql_tquery(g_SQL, query, "PhoneNumber", "is", playerid, phones);
		Info(playerid, "Your Phone number is same with someone. We will research new.");
	}
	else
	{
		new query[128];
	    mysql_format(g_SQL, query, sizeof(query), "UPDATE players SET phone='%d' WHERE reg_id=%d", phone, pData[playerid][pID]);
		mysql_tquery(g_SQL, query);
		pData[playerid][pPhone] = phone;
	}
    return true;
}

function OnLoginTimeout(playerid)
{
	pData[playerid][LoginTimer] = 0;

	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Login", "You have been kicked for taking too long to login successfully to your account.", "Okay", "");
	KickEx(playerid);
	return 1;
}


function _KickPlayerDelayed(playerid)
{
	Kick(playerid);
	return 1;
}


//---------[ Textdraw ]----------

// Info textdraw timer for hiding the textdraw
function InfoTD_MSG(playerid, ms_time, text[])
{
	if(GetPVarInt(playerid, "InfoTDshown") != -1)
	{
	    PlayerTextDrawHide(playerid, InfoTD[playerid]);
	    KillTimer(GetPVarInt(playerid, "InfoTDshown"));
	}

    PlayerTextDrawSetString(playerid, InfoTD[playerid], text);
    PlayerTextDrawShow(playerid, InfoTD[playerid]);
	SetPVarInt(playerid, "InfoTDshown", SetTimerEx("InfoTD_Hide", ms_time, false, "i", playerid));
}

function InfoTD_Hide(playerid)
{
	SetPVarInt(playerid, "InfoTDshown", -1);
	PlayerTextDrawHide(playerid, InfoTD[playerid]);
}

//---------[Admin Function ]----------

function a_ChangeAdminName(otherplayer, playerid, nname[])
{
	if(cache_num_rows() > 0)
	{
		// Name Exists
		Error(playerid, "The name "DARK_E"'%s' "GREY_E"already exists in the database, please use a different name!", nname);
	}
	else
	{
		new query[512];
	    format(query, sizeof(query), "UPDATE players SET adminname='%e' WHERE reg_id=%d", nname, pData[otherplayer][pID]);
		mysql_tquery(g_SQL, query);
		format(pData[otherplayer][pAdminname], MAX_PLAYER_NAME, "%s", nname);
		Servers(playerid, "You has set admin name player %s to %s", pData[otherplayer][pName], nname);
	}
    return true;
}

function LoadStats(playerid, PlayersName[])
{
	if(!cache_num_rows())
	{
		Error(playerid, "Account '%s' does not exist.", PlayersName);
	}
	else
	{
		new email[40], admin, helper, level, levelup, vip, viptime, coin, regdate[40], lastlogin[40], money, bmoney, brek,
			jam, menit, detik, gender, age[40], faction, family, warn, job, job2, int, world;
		cache_get_value_index(0, 0, email);
		cache_get_value_index_int(0, 1, admin);
		cache_get_value_index_int(0, 2, helper);
		cache_get_value_index_int(0, 3, level);
		cache_get_value_index_int(0, 4, levelup);
		cache_get_value_index_int(0, 5, vip);
		cache_get_value_index_int(0, 6, viptime);
		cache_get_value_index_int(0, 7, coin);
		cache_get_value_index(0, 8, regdate);
		cache_get_value_index(0, 9, lastlogin);
		cache_get_value_index_int(0, 10, money);
		cache_get_value_index_int(0, 11, bmoney);
		cache_get_value_index_int(0, 12, brek);
		cache_get_value_index_int(0, 13, jam);
		cache_get_value_index_int(0, 14, menit);
		cache_get_value_index_int(0, 15, detik);
		cache_get_value_index_int(0, 16, gender);
		cache_get_value_index(0, 17, age);
		cache_get_value_index_int(0, 18, faction);
		cache_get_value_index_int(0, 19, family);
		cache_get_value_index_int(0, 20, warn);
		cache_get_value_index_int(0, 21, job);
		cache_get_value_index_int(0, 22, job2);
		cache_get_value_index_int(0, 23, int);
		cache_get_value_index_int(0, 24, world);
		
		new header[248], scoremath = ((level)*8), fac[400], Cache:checkfamily, gstr[9999], query[128];
	
		if(faction == 1)
		{
			fac = ""BLUE_E"San Andreas Police";
		}
		else if(faction == 2)
		{
			fac = ""YELLOW_E"San Andreas Goverment";
		}
		else if(faction == 3)
		{
			fac = ""PINK_E"San Andreas Medic";
		}
		else if(faction == 4)
		{
			fac = ""ORANGE_E"San Andreas News";
		}
		else
		{
			fac = ""RED_E"None";
		}
		
		new name[40];
		if(admin == 1)
		{
			name = "{00fa9a}Helper(1)";
		}
		else if(admin == 2)
		{
			name = "{7fffd4}Senior Helper(2)";
		}
		else if(admin == 3)
		{
			name = ""RED_E"Administrator(3)";
		}
		else if(admin == 4)
		{
			name = ""PINK_E"Head Admin(4)";
		}
		else if(admin== 5)
		{
			name = ""YELLOW_E"CO-Devloper(5)";
		}
		else if(admin== 6)
		{
			name = "{E94290}Devloper(6)";
		}
		else if(helper >= 1 && admin == 0)
		{
			name = ""GREEN_E"Mapper";
		}
		else
		{
			name = ""GREY_E"None";
		}
		
		new name1[30];
		if(vip == 1)
		{
			name1 = ""LG_E"Regular(1)";
		}
		else if(vip == 2)
		{
			name1 = ""YELLOW_E"Premium(2)";
		}
		else if(vip == 3)
		{
			name1 = ""PURPLE_E"VIP Player(3)";
		}
		else
		{
			name1 = ""GREY_E"None";
		}
		
		format(query, sizeof(query), "SELECT * FROM `familys` WHERE `ID`='%d'", family);
		checkfamily = mysql_query(g_SQL, query);
		
		new rows = cache_num_rows(), fname[128];
		
		if(rows)
		{
			new fam[128];
			cache_get_value_name(0, "name", fam);
			format(fname, 128, fam);
		}
		else
		{
			format(fname, 128, ""RED_E"None");
		}

		format(header,sizeof(header),"Stats:"YELLOW_E"%s"WHITE_E" ("BLUE_E"%s"WHITE_E")", PlayersName, ReturnTime());
		format(gstr,sizeof(gstr),""RED_E"In Character"WHITE_E"\n");
		format(gstr,sizeof(gstr),"%sGender: [{afeeee}%s"WHITE_E"] | Money: ["GREEN_E"%s"WHITE_E"] | Bank: ["GREEN_E"%s"WHITE_E"] | Rekening Bank: ["YELLOW_E"%d"WHITE_E"]\n", gstr,(gender == 2) ? ("Female") : ("Male") , FormatMoney(money), FormatMoney(bmoney), brek);
		format(gstr,sizeof(gstr),"%sPhone Number: ["RED_E"None"WHITE_E"] | Phone Status: [%s"WHITE_E"] | Twitter Status: [%s"WHITE_E"]\n", gstr);
		format(gstr,sizeof(gstr),"%Faction: [%s"WHITE_E"] | Family: ["AQUA"%s"WHITE_E"] | Character Story: [%s"WHITE_E"]\n", gstr, fac, fname, GetCS(playerid));
		format(gstr,sizeof(gstr),"%sBirdthdate: [{00ffff}%s"WHITE_E"] | Job: [{afeeee}None"WHITE_E"] [{afeeee}None"WHITE_E"]\n\n", gstr, age);
		format(gstr,sizeof(gstr),"%s"RED_E"Out of Character"WHITE_E"\n",gstr);
		format(gstr,sizeof(gstr),"%s"YELLOW_E"Users UCP: "WHITE_E"["AQUA"%s"WHITE_E"] | Level score: ["YELLOW_E"%d/%d"WHITE_E"] | Email: [{adff2f}%s"WHITE_E"] | Warning:["RED_E"%d/10"WHITE_E"] | Last Login: ["AQUA"%s"WHITE_E"]\n", gstr, levelup, scoremath, email, warn, lastlogin);
		format(gstr,sizeof(gstr),"%sStaff: [%s"WHITE_E"] | Time Played: [{b0e0e6}%d hour(s) %d minute(s) %02d second(s)"WHITE_E"] | Gold Coin: [{ffd700}%d"WHITE_E"]\n", gstr, name, jam, menit, detik, coin);
		if(vip != 0)
		{
			format(gstr,sizeof(gstr),"%sInterior: [{66cdaa}%d"WHITE_E"] | Virtual World: [{87cefa}%d"WHITE_E"] | Register Date: [{adff2f}%s"WHITE_E"] | VIP Level: [%s"WHITE_E"] | VIP Expired: [{add8e6}%s"WHITE_E"]", gstr, int, world, regdate, name1, ReturnTimelapse(gettime(), viptime));
		}
		else
		{
			format(gstr,sizeof(gstr),"%sInterior: [{66cdaa}%d"WHITE_E"] | Virtual World: [{87cefa}%d"WHITE_E"] | Register Date: [{adff2f}%s"WHITE_E"] | VIP Level: [%s"WHITE_E"] | VIP Expired: ["RED_E"None"WHITE_E"]", gstr, int, world, regdate, name1);
		}
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, header, gstr, "Close", "");

		cache_delete(checkfamily);
	}
	return true;
}

function CheckPlayerIP(playerid, zplayerIP[])
{
	new count = cache_num_rows(), datez, line[248], tstr[64], lstr[128];
	if(count)
	{
		datez = 0;
 		line = "";
 		format(line, sizeof(line), "Names matching IP: %s:\n\n", zplayerIP);
 		for(new i = 0; i != count; i++)
		{
			// Get the name  ache and append it to the dialog content
			cache_get_value_index(i, 0, lstr);
			strcat(line, lstr);
			datez ++;

			if(datez == 5)
				strcat(line, "\n"), datez = 0;
			else
				strcat(line, "\t\t");
		}

		tstr = "{ACB5BA}Aliases for {70CAFA}", strcat(tstr, zplayerIP);
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, tstr, line, "Close", "");
	}
	else
 	{
		Error(playerid, "No other accounts from this IP!");
	}
	return 1;
}

function CheckPlayerIP2(playerid, zplayerIP[])
{
	new rows = cache_num_rows(), datez, line[248], tstr[64], lstr[128];
	if(!rows)
	{
		Error(playerid, "No other accounts from this IP!");
	}
	else
 	{
 		datez = 0;
 		line = "";
 		format(line, sizeof(line), "Names matching IP: %s:\n\n", zplayerIP);
 		for(new i = 0; i != rows; i++)
		{
			// Get the name from the cache and append it to the dialog content
			cache_get_value_index(i, 0, lstr);
			strcat(line, lstr);
			datez ++;

			if(datez == 5)
				strcat(line, "\n"), datez = 0;
			else
				strcat(line, "\t\t");
		}

		tstr = "{ACB5BA}Aliases for {70CAFA}", strcat(tstr, zplayerIP);
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, tstr, line, "Close", "");
	}
	return 1;
}

function JailPlayer(playerid)
{
	ShowPlayerDialog(playerid, -1, DIALOG_STYLE_LIST, "Close", "Close", "Close", "Close");
	SetPlayerPositionEx(playerid, -310.64, 1894.41, 34.05, 178.17, 2000);
	SetPlayerInterior(playerid, 10);
	SetPlayerVirtualWorld(playerid, 100);
	SetPlayerWantedLevel(playerid, 0);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	//ResetPlayerWeaponsEx(playerid);
	pData[playerid][pInBiz] = -1;
	pData[playerid][pInHouse] = -1;
	pData[playerid][pInDoor] = -1;
	pData[playerid][pCuffed] = 0;
	PlayerPlaySound(playerid, 1186, 0, 0, 0);
	return true;
}

//-----------[ Banneds Function ]----------

function OnOBanQueryData(adminid, NameToBan[], banReason[], banTime)
{
	new mstr[512];
	mstr = "";
	if(!cache_num_rows())
	{
		Error(adminid, "Account '%s' does not exist.", NameToBan);
	}
	else
	{
		new datez, PlayerIP[16];
		cache_get_value_index(0, 0, PlayerIP);
		if(banTime != 0)
	    {
			datez = gettime() + (banTime * 86400);
	        Servers(adminid, "You have temp-banned %s (IP: %s) from the server.", NameToBan, PlayerIP);
			SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s telah membanned offline player %s selama %d hari. [Reason: %s]", pData[adminid][pAdminname], NameToBan, banTime, banReason);
		}
		else
		{
			Servers(adminid, "You have permanent-banned %s (IP: %s) from the server.", NameToBan, PlayerIP);
			SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s telah membanned offline player %s secara permanent. [Reason: %s]", pData[adminid][pAdminname], NameToBan, banReason);
		}
		new query[512];
		mysql_format(g_SQL, query, sizeof(query), "INSERT INTO banneds(name, ip, admin, reason, ban_date, ban_expire) VALUES ('%s', '%s', '%s', '%s', UNIX_TIMESTAMP(), %d)", NameToBan, PlayerIP, pData[adminid][pAdminname], banReason, datez);
		mysql_tquery(g_SQL, query);
	}
	return true;
}


//-------------[ Player Update Function ]----------

function DragUpdate(playerid, targetid)
{
    if(pData[targetid][pDragged] && pData[targetid][pDraggedBy] == playerid)
    {
        static
        Float:fX,
        Float:fY,
        Float:fZ,
        Float:fAngle;

        GetPlayerPos(playerid, fX, fY, fZ);
        GetPlayerFacingAngle(playerid, fAngle);

        fX -= 3.0 * floatsin(-fAngle, degrees);
        fY -= 3.0 * floatcos(-fAngle, degrees);

        SetPlayerPos(targetid, fX, fY, fZ);
        SetPlayerInterior(targetid, GetPlayerInterior(playerid));
        SetPlayerVirtualWorld(targetid, GetPlayerVirtualWorld(playerid));
		//ApplyAnimation(targetid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
		ApplyAnimation(targetid,"PED","WALK_civi",4.1,1,1,1,1,1);
    }
    return 1;
}

function UnfreezePee(playerid)
{
    TogglePlayerControllable(playerid, 1);
    pData[playerid][pBladder] = 100;
    ClearAnimations(playerid);
	StopLoopingAnim(playerid);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	return 1;
}

function UnfreezeSleep(playerid)
{
    TogglePlayerControllable(playerid, 1);
    pData[playerid][pEnergy] = 100;
	pData[playerid][pHunger] -= 3;
    ClearAnimations(playerid);
	StopLoopingAnim(playerid);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	InfoTD_MSG(playerid, 3000, "Sleeping Done!");
	return 1;
}

function RefullCar(playerid, vehicleid)
{
	if(!IsPlayerConnected(playerid)) return 0;
	//if(!IsValidVehicle(vehicleid)) return 0;
	if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	if(GetNearestVehicleToPlayer(playerid, 3.8, false) == vehicleid)
    {
		if(pData[playerid][pActivityTime] >= 100 && IsValidVehicle(vehicleid))
		{
			new fuels = GetVehicleFuel(vehicleid);
		
			SetVehicleFuel(vehicleid, fuels+300);
			InfoTD_MSG(playerid, 8000, "Refulling done!");
			//SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s has successfully refulling the vehicle.", ReturnName(playerid));
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
		}
		else if(pData[playerid][pActivityTime] < 100 && IsValidVehicle(vehicleid))
		{
			pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		}
		else
		{
			Error(playerid, "Refulling fail! Anda tidak berada didekat kendaraan tersebut!");
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
		}
	}
	else
	{
		Error(playerid, "Refulling fail! Anda tidak berada didekat kendaraan tersebut!");
		KillTimer(pData[playerid][pActivity]);
		pData[playerid][pActivityTime] = 0;
		HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
		PlayerTextDrawHide(playerid, ActiveTD[playerid]);
		return 1;
	}
	return 1;
}

//Bank
function SearchRek(playerid, rek)
{
	if(!cache_num_rows())
	{
		// Rekening tidak ada
		Error(playerid, "Rekening bank "YELLOW_E"'%d' "WHITE_E"tidak terdaftar!", rek);
		pData[playerid][pTransfer] = 0;
	    
	}
	else
	{
	    // Proceed
		new query[128];
		mysql_format(g_SQL, query, sizeof(query), "SELECT username,brek FROM players WHERE brek='%d'", rek);
		mysql_tquery(g_SQL, query, "SearchRek2", "id", playerid, rek);
	}
}

function SearchRek2(playerid, rek)
{
	if(cache_num_rows())
	{
		new name[128], brek, mstr[128];
		cache_get_value_index(0, 0, name);
		cache_get_value_index_int(0, 1, brek);
		
		//format(pData[playerid][pTransferName], 128, "%s" name);
		pData[playerid][pTransferName] = name;
		pData[playerid][pTransferRek] = brek;
		format(mstr, sizeof(mstr), ""WHITE_E"No Rek Target: "YELLOW_E"%d\n"WHITE_E"Nama Target: "YELLOW_E"%s\n"WHITE_E"Jumlah: "GREEN_E"%s\n\n"WHITE_E"Anda yakin akan melanjutkan mentransfer?", brek, name, FormatMoney(pData[playerid][pTransfer]));
		ShowPlayerDialog(playerid, DIALOG_BANKCONFIRM, DIALOG_STYLE_MSGBOX, ""LB_E"Bank", mstr, "Transfer", "Cancel");
	}
	return true;
}

//----------[ JOB FUNCTION ]-------------

//Server Timer
function pCountDown()
{
	Count--;
	if(0 >= Count)
	{
		Count = -1;
		KillTimer(countTimer);
		foreach(new ii : Player)
		{
 			if(showCD[ii] == 1)
   			{
   				GameTextForPlayer(ii, "~w~GO~r~!~g~!~b~!", 2500, 6);
   				PlayerPlaySound(ii, 1057, 0, 0, 0);
   				showCD[ii] = 0;
			}
		}
	}
	else
	{
		foreach(new ii : Player)
		{
 			if(showCD[ii] == 1)
   			{
				GameTextForPlayer(ii, CountText[Count-1], 2500, 6);
				PlayerPlaySound(ii, 1056, 0, 0, 0);
   			}
		}
	}
	return 1;
}

//Player Update Time
function onlineTimer()
{	
	//Date and Time Textdraw
	new datestring[64];
	new hours,
	minutes,
	days,
	months,
	years,
	second;
	new MonthName[12][] =
	{
		"January", "February", "March", "April", "May", "June",
		"July",	"August", "September", "October", "November", "December"
	};
	getdate(years, months, days);
 	gettime(hours, minutes);
	format(datestring, sizeof datestring, "%s%d %s %s%d", ((days < 10) ? ("0") : ("")), days, MonthName[months-1], (years < 10) ? ("0") : (""), years);
	TextDrawSetString(TextDate, datestring);
	new tim[128];
	gettime(hours, minutes, second);
	format(tim, sizeof(tim), "%02d:%02d:%02d", hours, minutes, second);
	TextDrawSetString(td_waktu, tim);

    /*foreach (new i : Player) 
	{
		SetPlayerTime(i, hours, minutes);
		if(pData[i][pInDoor] <= -1 || pData[i][pInHouse] <= -1 || pData[i][pInBiz] <= -1)
        {
			SetPlayerWeather(i, GetGVarInt("g_Weather"));
		}
	}*/
	// Increase server uptime
	up_seconds ++;
	if(up_seconds == 60)
	{
	    up_seconds = 0, up_minutes ++;
	    if(up_minutes == 60)
	    {
	        up_minutes = 0, up_hours ++;
	        if(up_hours == 24) up_hours = 0, up_days ++;
			new tstr[128], rand = RandomEx(0, 20);
			format(tstr, sizeof(tstr), ""BLUE_E"UPTIME: "WHITE_E"The server has been online for %s.", Uptime());
			SendClientMessageToAll(COLOR_WHITE, tstr);
			if(hours > 18)
			{
				SetWorldTime(0);
				WorldTime = 0;
			}
			else
			{
				SetWorldTime(hours);
				WorldTime = hours;
			}
			SetWeather(rand);
			WorldWeather = rand;

			// Sync Server
			mysql_tquery(g_SQL, "OPTIMIZE TABLE `bisnis`,`houses`,`toys`,`vehicle`");
			//SetTimer("changeWeather", 10000, false);
		}
	}
	foreach(new ii : Player)
	{
		// Online Timer
		if(pData[ii][IsLoggedIn] == true /*&& cAFK[ii] == 0*/)
		{
			pData[ii][pPaycheck] ++;
			/*if(pData[ii][pPaycheck] >= 3600)
			{
				Info(ii, "Waktunya mengambil paycheck!");
				Servers(ii, "silahkan pergi ke bank atau ATM terdekat untuk mengambil paycheck.");
			}*/
			
			pData[ii][pSeconds] ++, pData[ii][pCurrSeconds] ++;
			if(pData[ii][pOnDuty] >= 1)
			{
				pData[ii][pOnDutyTime]++;
			}
			if(pData[ii][pTaxiDuty] >= 1)
			{
				pData[ii][pTaxiTime]++;
			}
			if(pData[ii][pSeconds] == 60)
			{
		    	pData[ii][pMinutes]++, pData[ii][pCurrMinutes] ++;
		    	pData[ii][pSeconds] = 0, pData[ii][pCurrSeconds] = 0;
				
				new scoremath = ((pData[ii][pLevel])*8);
				switch(pData[ii][pMinutes])
				{
				    case 10, 20, 30, 40, 50:
		            {
					    /*if(pData[ii][pHours] != 0)
					   	{
						   	format(lstr, sizeof(lstr), "~y~You have been online for ~r~~h~%d~y~ hours and ~r~~h~%d~y~ minutes.", pData[ii][pHours], pData[ii][pMinutes]);
							format(mstr, sizeof(mstr), ""RED_E"*** {FFE4C4}You have been online for %d hours and %d minutes.", pData[ii][pHours], pData[ii][pMinutes]);
						}
						else
						{
				            format(lstr, sizeof(lstr), "~y~You have been online for ~r~~h~%d~y~ minutes.", pData[ii][pMinutes]);
							format(mstr, sizeof(mstr), ""RED_E"*** {FFE4C4}You have been online for %d minutes.", pData[ii][pMinutes]);
						}
						InfoTD_MSG(ii, 10000, lstr);
						SendClientMessage(ii, 0xFFE4C4FF, mstr);
 						PlayerPlaySound(ii, 1138, 0.0, 0.0, 0.0);*/
						//SetPlayerTime(ii, hours, minutes);
						if(pData[ii][pPaycheck] >= 3600)
						{
							Info(ii, "It's time to claim paycheck!");
							Servers(ii, "silahkan pergi ke bank atau ATM terdekat untuk mengambil paycheck.");
							PlayerPlaySound(ii, 1139, 0.0, 0.0, 0.0);
						}
					}
					case 60:
					{
						if(pData[ii][pPaycheck] >= 3600)
						{
							Info(ii, "It's time to claim paycheck!");
							Servers(ii, "silahkan pergi ke bank atau ATM terdekat untuk mengambil paycheck.");
							PlayerPlaySound(ii, 1139, 0.0, 0.0, 0.0);
						}
						
						pData[ii][pHours] ++;
						pData[ii][pLevelUp] ++;
						pData[ii][pMinutes] = 0;
						UpdatePlayerData(ii);
			            
						/*PlayerPlaySound(ii, 1139, 0.0, 0.0, 0.0);

						if(pData[ii][pHours] != 1)
						{
							format(lstr, sizeof(lstr), "~y~You have been online for ~r~~h~%d~y~ hours.", pData[ii][pHours]);
							format(mstr, sizeof(mstr), ""RED_E"*** {FFE4C4}You have been online for %d hours.", pData[ii][pHours]);
						}
						else
						{
						    format(lstr, sizeof(lstr), "~y~You have been online for ~r~~h~one~y~ hour.");
						    format(mstr, sizeof(mstr), ""RED_E"*** {FFE4C4}You have been online for an hour.");
						}
						InfoTD_MSG(ii, 10000, lstr);
						SendClientMessage(ii, 0xFFE4C4FF, mstr);*/
						if(pData[ii][pLevelUp] >= scoremath)
						{
							new mstr[128];
							pData[ii][pLevelUp]= 0;
							pData[ii][pLevel] ++;
							SetPlayerScore(ii, pData[ii][pLevel]);
							format(mstr,sizeof(mstr),"~g~New level unlocked~n~~w~Now you're level ~r~%d", pData[ii][pLevel]);
							GameTextForPlayer(ii, mstr, 6000, 1);
						}
					}
				}
				if(pData[ii][pCurrMinutes] == 60)
				{
				    pData[ii][pCurrMinutes] = 0;
				    pData[ii][pCurrHours] ++;
				}
			}
   		}
		
		//VIP Expired Checking
		if(pData[ii][pVip] > 0)
		{
			if(pData[ii][pVipTime] != 0 && pData[ii][pVipTime] <= gettime())
			{
				Info(ii, "Maaf, Level VIP player anda sudah habis! sekarang anda adalah player biasa!");
				pData[ii][pVip] = 0;
				pData[ii][pVipTime] = 0;
			}
		}
		//ID Card Expired Checking
		if(pData[ii][pIDCard] > 0)
		{
			if(pData[ii][pIDCardTime] != 0 && pData[ii][pIDCardTime] <= gettime())
			{
				Info(ii, "Masa berlaku ID Card anda telah habis, silahkan perpanjang kembali!");
				pData[ii][pIDCard] = 0;
				pData[ii][pIDCardTime] = 0;
			}
		}

		if(pData[ii][pExitJob] != 0 && pData[ii][pExitJob] <= gettime())
		{
			Info(ii, "Now you can exit from your current job!");
			pData[ii][pExitJob] = 0;
		}
		if(pData[ii][pDriveLic] > 0)
		{
			if(pData[ii][pDriveLicTime] != 0 && pData[ii][pDriveLicTime] <= gettime())
			{
				Info(ii, "Masa berlaku Driving anda telah habis, silahkan perpanjang kembali!");
				pData[ii][pDriveLic] = 0;
				pData[ii][pDriveLicTime] = 0;
			}
		}
		// Player Time Job
		if(pData[ii][pJobTime] > 0)
		{
			pData[ii][pJobTime]--;
		}
		if(pData[ii][pLumberTime] > 0)
		{
			pData[ii][pLumberTime]--;
		}
		if(pData[ii][pTruckerTime] > 0)
		{
			pData[ii][pTruckerTime]--;
		}
		if(pData[ii][pProductionTime] > 0)
		{
			pData[ii][pProductionTime]--;
		}
		if(pData[ii][pDepositorTime] > 0)
		{
			pData[ii][pDepositorTime]--;
		}
		// Player Time SideJob
		if(pData[ii][pSideJobTime] > 0)
		{
			pData[ii][pSideJobTime]--;
		}
		if(pData[ii][pBusTime] > 0)
		{
			pData[ii][pBusTime]--;
		}
		if(pData[ii][pForTime] > 0)
		{
			pData[ii][pForTime]--;
		}
		if(pData[ii][pPizzaTime] > 0)
		{
			pData[ii][pPizzaTime]--;
		}
		// Player Ilegal Timing
		if(pData[ii][pSmugglerTime] > 0)
		{
			pData[ii][pSmugglerTime]--;
		}
		//Warn Player Check
		if(pData[ii][pWarn] >= 20)
		{
			new ban_time = gettime() + (5 * 86400), query[512], PlayerIP[16], giveplayer[24];
			GetPlayerIp(ii, PlayerIP, sizeof(PlayerIP));
			GetPlayerName(ii, giveplayer, sizeof(giveplayer));
			pData[ii][pWarn] = 0;
			//SetPlayerPosition(ii, 227.46, 110.0, 999.02, 360.0000, 10);
			BanPlayerMSG(ii, ii, "20 Total Warning", true);
			SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Player %s(%d) telah otomasti dibanned permanent dari server. [Reason: 20 Total Warning]", giveplayer, ii);
			
			mysql_format(g_SQL, query, sizeof(query), "INSERT INTO banneds(name, ip, admin, reason, ban_date, ban_expire) VALUES ('%s', '%s', 'Server Ban', '20 Total Warning', %i, %d)", giveplayer, PlayerIP, gettime(), ban_time);
			mysql_tquery(g_SQL, query);
			KickEx(ii);
		}
		//Farmer
		if(pData[ii][pPlant] >= 20)
		{
			pData[ii][pPlant] = 0;
			pData[ii][pPlantTime] = 600;
		}
		if(pData[ii][pPlantTime] > 0)
		{
			pData[ii][pPlantTime]--;
			if(pData[ii][pPlantTime] < 1)
			{
				pData[ii][pPlantTime] = 0;
				pData[ii][pPlant] = 0;
			}
		}
		new pid = GetClosestPlant(ii);
		if(pid != -1)
		{
			if(IsPlayerInDynamicCP(ii, PlantData[pid][PlantCP]) && pid != -1)
			{
				new type[24], mstr[128];
				if(PlantData[pid][PlantType] == 1)
				{
					type = "Potato";
				}
				else if(PlantData[pid][PlantType] == 2)
				{
					type = "Wheat";
				}
				else if(PlantData[pid][PlantType] == 3)
				{
					type = "Orange";
				}
				else if(PlantData[pid][PlantType] == 4)
				{
					type = "Marijuana";
				}
				if(PlantData[pid][PlantTime] > 1)
				{
					format(mstr, sizeof(mstr), "~w~Plant Type: ~g~%s ~n~~w~Plant Time: ~r~%s", type, ConvertToMinutes(PlantData[pid][PlantTime]));
					InfoTD_MSG(ii, 1000, mstr);
				}
				else
				{
					format(mstr, sizeof(mstr), "~w~Plant Type: ~g~%s ~n~~w~Plant Time: ~g~Now", type);
					InfoTD_MSG(ii, 1000, mstr);
				}
			}
		}
	}
	return 1;
}

//----------[ Other Function ]-----------

function SetPlayerToUnfreeze(playerid, Float:x, Float:y, Float:z, Float:a)
{
    if(!IsPlayerInRangeOfPoint(playerid, 15.0, x, y, z))
        return 0;

    pData[playerid][pFreeze] = 0;
    SetPlayerPos(playerid, x, y, z);
	SetPlayerFacingAngle(playerid, a);
    TogglePlayerControllable(playerid, 1);
    return 1;
}

function SetVehicleToUnfreeze(playerid, vehicleid, Float:x, Float:y, Float:z, Float:a)
{
    if(!IsPlayerInRangeOfPoint(playerid, 15.0, x, y, z))
        return 0;

    pData[playerid][pFreeze] = 0;
    SetVehiclePos(vehicleid, x, y, z);
	SetVehicleZAngle(vehicleid, a);
    TogglePlayerControllable(playerid, 1);
    return 1;
}
