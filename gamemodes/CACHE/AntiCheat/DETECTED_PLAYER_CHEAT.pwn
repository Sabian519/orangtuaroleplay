new JetPack[MAX_PLAYERS];

stock AutoBan(playerid)
{
   new ban_time = gettime() + (5 * 86400), query[512], PlayerIP[16], giveplayer[24];
   GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
   GetPlayerName(playerid, giveplayer, sizeof(giveplayer));

   SendClientMessageToAllEx(COLOR_RED, "BotCmd: "GREY2_E" %s Has Been Banned Permanently", giveplayer);
   SendClientMessageToAllEx(COLOR_RED, "Reason: "GREY2_E"Citer");

   mysql_format(g_SQL, query, sizeof(query), "INSERT INTO banneds(name, ip, admin, reason, ban_date, ban_expire) VALUES ('%s', '%s', 'Server Ban', 'Using Cheat!', %i, %d)", giveplayer, PlayerIP, gettime(), ban_time);
   mysql_tquery(g_SQL, query);
   KickEx(playerid);
}

forward antiCheat();
public antiCheat()
{
	/*new ban_time = gettime() + (5 * 86400), query[512], PlayerIP[16], giveplayer[24];
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	GetPlayerName(playerid, giveplayer, sizeof(giveplayer));*/

	foreach(new i: Player)
	{
  		if(GetPlayerSpecialAction(i) == SPECIAL_ACTION_USEJETPACK && JetPack[i] == 0 && pData[i][pAdmin] < 1)
		{
		   /*mysql_format(g_SQL, query, sizeof(query), "INSERT INTO banneds(name, ip, admin, reason, ban_date, ban_expire) VALUES ('%s', '%s', 'Server Ban', 'Using Cheat!', %i, %d)", giveplayer, PlayerIP, gettime(), ban_time);
		   mysql_tquery(g_SQL, query);
		   SendClientMessageToAllEx(COLOR_RED, "BotCmd: "GREY2_E"%s have ben kicked and banned the servers", pData[i][pName]);
		   SendClientMessageToAllEx(COLOR_RED, "Reason: Use Cheating Jetpack");
		   KickEx(i);*/
		   AutoBan(i);
		}
	}
	return 1;
}

// CHEN COMMANDO KONTOL!!!! //
stock ClientChentMemek(playerid)
{
   new ban_time = gettime() + (5 * 86400), query[512], PlayerIP[16], giveplayer[24];
   GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
   GetPlayerName(playerid, giveplayer, sizeof(giveplayer));

   SendClientMessageToAllEx(COLOR_RED, "BotCmd: "GREY2_E" %s Has Been Banned Permanently", giveplayer);
   SendClientMessageToAllEx(COLOR_RED, "Reason: "GREY2_E"Ilegal client");

   mysql_format(g_SQL, query, sizeof(query), "INSERT INTO banneds(name, ip, admin, reason, ban_date, ban_expire) VALUES ('%s', '%s', 'Server Ban', 'Using Cheat!', %i, %d)", giveplayer, PlayerIP, gettime(), ban_time);
   mysql_tquery(g_SQL, query);
   KickEx(playerid);
}

CMD:weather1(playerid)
{
	SCM(playerid, COLOR_YELLOW, "WARNING!: "GREY2_E"Your client ilegal, Please changed client and requestion unbanned");
    ClientChentMemek(playerid);
}
