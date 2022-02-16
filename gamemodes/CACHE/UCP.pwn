#define MAX_CHARS 3

new PlayerChar[MAX_PLAYERS][MAX_CHARS][MAX_PLAYER_NAME + 1];
new tempUCP[64];

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
	new str[789];
	if (rows)
	{
	    cache_get_value_name(0, "Password", pData[playerid][pPassword], 65);
	    cache_get_value_name(0, "salt", pData[playerid][pSalt], 17);
	    cache_get_value_name(0, "UCP", tempUCP[playerid]);
	    format(str, sizeof(str), "{800080}Welcome Back to Dewata Roleplay!\n\n{ffffff}Your Account: %s\nStatus: {00ff00}Registered\n{ffffff}Plesae input your password to login:", GetName(playerid));
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Account Login", str, "Login", "Exit");
	}
	else
	{
	    format(str, sizeof(str), "{800080}Welcome to Dewata Roleplay!\n\n{ffffff}Your Account: %s\nStatus: {ff0000}unregistered\n{ffffff}Plesae input your password to register:", GetName(playerid));
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Account Register", str, "Register", "Exit");
	}
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
	    format(sgstr, sizeof(sgstr), "%s\n", PlayerChar[playerid][i]);
		strcat(name, sgstr);
		count++;
	}
	if(count < MAX_CHARS)
		strcat(name, ""BLUE_E"Create Character");
	ShowPlayerDialog(playerid, DIALOG_CHARLIST, DIALOG_STYLE_LIST, "Character List", name, "Select", "Quit");
	return 1;
}
function OnPlayerPassDone(playerid)
{
	CheckUCP(playerid);
	return 1;
}
