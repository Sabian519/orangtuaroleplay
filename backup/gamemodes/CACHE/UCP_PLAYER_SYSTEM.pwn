#define MAX_CHARS 3

new PlayerChar[MAX_PLAYERS][MAX_CHARS][MAX_PLAYER_NAME + 1];
new tempUCP[64];

stock GetName(playerid)
{
	new name[MAX_PLAYER_NAME];
 	GetPlayerName(playerid,name,sizeof(name));
	return name;
}
stock CheckUCP(playerid)
{
	new query[256];
	format(query, sizeof(query), "SELECT * FROM `playerucp` WHERE `UCP` = '%s' LIMIT 1", GetName(playerid));
	mysql_tquery(g_SQL, query, "CheckPlayerUCP", "d", playerid);
	return 1;
}
function CheckPlayerUCP(playerid)
{
	new rows = cache_num_rows() > 0;
	new str[789], query[248], PlayerIP[16];
	if (rows)
	{
	    cache_get_value_name(0, "Password", pData[playerid][pPassword], 65);
	    cache_get_value_name(0, "salt", pData[playerid][pSalt], 17);
	    cache_get_value_name(0, "UCP", tempUCP[playerid]);
	    format(str, sizeof(str), ""YELLOW_E"Welcome to this Sever South Luxury Roleplay!\n\n{ffffff}UCP Name: "AQUA"%s\n"WHITE_E"Status: {00ff00}Verified\n{87cefa}Please input your password to login:", GetName(playerid));
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Account Login", str, "Login", "Exit");
	}
	else
	{
	    CheckVerify(playerid);
	}
	mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `banneds` WHERE `name` = '%s' OR `ip` = '%s' OR (`longip` != 0 AND (`longip` & %i) = %i) LIMIT 1", tempUCP[playerid], pData[playerid][pIP], BAN_MASK, (Ban_GetLongIP(PlayerIP) & BAN_MASK));
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
        format(strong, sizeof strong, "Dear: "LG_E2"%s\n\n"YELLOW_E"Checking Account Warning.\n"WHITE_E"There is account "BLUESKY"%s's "WHITE_E"doest not verified\n"WHITE_E"Please Registered UCP on Discord or Contact Moderator Servers\n"WHITE_E"- "YELLOW_E"https://discord.io//SouthLuxury-rp\n\n"PINK_E"copyrigh(c) by SouthLuxury-rp Team", name);
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "SouthLuxury:RP - UCP Protection", strong, "Close", "");
        SCM(playerid, ARWIN, "UCP: "YELLOW_E"Akun kamu belum terdaftar Database Server "RED_E"(Kicked)");
		SetTimerEx("DelayedKick", 1, false, "i", playerid);
    }
    else
    {
	    format(string, sizeof(string), ""BLUESKY"Your Account it's Registered UCP\n\n"YELLOW_E"Welcome to South Luxury Roleplay server!\n{ffffff}UCP:"AQUA" %s\n"WHITE_E"Status: "RED_E"Unverified\n\n{87cefa}You can register by input your passowrd below:", GetName(playerid));
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Account Register", string, "Register", "Exit");
		SendClientMessageEx(playerid, COLOR_YELLOW, "UCP: "X1_BLUE"database succesfully loaded account with Names "LG_E2"%s", ReturnName(playerid));
	}
    return 1;
}
stock FixedKick(playerid)
{
    KillTimer(kick_gTimer[playerid]);
    kick_gTimer[playerid] = SetTimerEx("DelayedKick", 1000, false, "i", playerid);
    return 1;
}
function CheckPlayerChar(playerid)
{
	cache_get_value_name_int(0, "extrac", pData[playerid][pExtraChar]);
	new query[256];
	format(query, sizeof(query), "SELECT `username` FROM `players` WHERE `UCP` = '%s' LIMIT %d;", GetName(playerid), MAX_CHARS + pData[playerid][pExtraChar]);
	mysql_tquery(g_SQL, query, "LoadCharacter", "d", playerid);
	return 1;
}
function LoadCharacter(playerid)
{
	for (new i = 0; i < MAX_CHARS; i ++)
	{
		PlayerChar[playerid][i][0] = EOS;
	}
	for (new i = 0; i < cache_num_rows(); i ++)
	{
		cache_get_value_name(i, "username", PlayerChar[playerid][i]);
	}
  	ShowCharacterList(playerid);
  	return 1;
}
ShowCharacterList(playerid)
{
	new name[256], count, sgstr[128];
	for (new i; i < MAX_CHARS; i ++) if(PlayerChar[playerid][i][0] != EOS)
	{
	    format(sgstr, sizeof(sgstr), ""YELLOW_E"%s"LG_E"(Actived)\n", PlayerChar[playerid][i], pData[playerid][pLevel]);
		strcat(name, sgstr);
		count++;
	}
	if(count < MAX_CHARS)
		strcat(name, ""WHITE_E"Add Slot Character");
	ShowPlayerDialog(playerid, DIALOG_CHARLIST, DIALOG_STYLE_LIST, "Listening Character Slot", name, "Select", "Quit");
	return 1;
}
function OnPlayerPassDone(playerid)
{
	CheckUCP(playerid);
	return 1;
}
