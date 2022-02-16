// Discord Logs
#define DCMD_PREFIX '!'

new DCC_Channel:g_Admin_Command;

forward DCC_DM(gmail[]);
public DCC_DM(gmail[])
{
    new DCC_Channel:PM;
	PM = DCC_GetCreatedPrivateChannel();
	DCC_SendChannelMessage(PM, gmail);
	return 1;
}

function DJailPlayer(NameToJail[], jailTime, jailReason[])
{
	if(cache_num_rows() < 1)
	{
		DCC_SendChannelMessage(inchanel, "This Account Does Not Exist!");
	}
	else
	{
	    new RegID, JailMinutes = jailTime * 60;
		cache_get_value_index_int(0, 0, RegID);

		SendClientMessageToAllEx(COLOR_RED, "BotCmd: "WHITE_E"jail(offline) player %s selama %d menit.", NameToJail, jailTime);
		SendClientMessageToAllEx(COLOR_RED, "[Reason: "WHITE_E"%s]", jailReason);
		DCC_SendChannelMessage(inchanel, "Succesfull Jail This Player!");
		new query[512];
		mysql_format(g_SQL, query, sizeof(query), "UPDATE players SET jail=%d WHERE reg_id=%d", JailMinutes, RegID);
		mysql_tquery(g_SQL, query);
	}
	return 1;
}
function DcOnUnbanQueryData(BannedName[])
{
	if(cache_num_rows() > 0)
	{
		new banIP[16], query[128];
		cache_get_value_name(0, "ip", banIP);
		mysql_format(g_SQL, query, sizeof(query), "DELETE FROM banneds WHERE ip = '%s'", banIP);
		mysql_tquery(g_SQL, query);
	}
	else
	{
		DCC_SendChannelMessage(inchanel, "This Account Does Not found on ban list!");
	}
	return 1;
}

DCMD:ucp(user, channel, params[])
{
	if(channel == ucp)
	{
		if(sscanf(params, "s[64]", params[0])) return DCC_SendChannelMessage(channel, "**GUNAKAN: !ucp [Firstname_LastName]**");
		new queen[266];
		format(queen, sizeof(queen), "UCP/%s.txt", params[0]);
		if(dini_Exists(queen))
		{
		    DCC_SendChannelMessage(channel, "__***The name is already at the database***__");
		}
		else
		{
			new Kj[256];
		    format(Kj, sizeof(Kj), "UCP/%s.txt", params[0]);
		    dini_Create(Kj);
			new query[256];
			format(query, sizeof(query), "**```%s succesfully registered in the UCP database, Happy Roleplay```**", params[0]);
			DCC_SendChannelMessage(channel, query);
		}
	}
	else
	{
		return DCC_SendChannelMessage(channel, "***__You are not on the register channel UCP__***");
	}
	return 1;
}
DCMD:dcmd(user, channel, params[])
{
    if(channel == inchanel)
	{
		if(sscanf(params, "s[64]", params[0])) return DCC_SendChannelMessage(channel, "**GUNAKAN: !ucp [Firstname_LastName]**");
}

	 DCC_SendChannelMessage(channel, "Admin Cmd : !ojail , !unban");
}
DCMD:ojail(user, channel, params[])
{
    if(channel == inchanel)
	{
		if(sscanf(params, "s[64]", params[0])) return DCC_SendChannelMessage(channel, "**GUNAKAN: !ojail [Firstname_LastName]**");
}

 	new player[24], datez, tmp[50], PlayerName[MAX_PLAYER_NAME];
 	inchanel = channel;
 	if(sscanf(params, "s[24]ds[50]", player, datez, tmp))

    if(channel == g_Admin_Command)
	{
		foreach(new ii : Player)
		{
			GetPlayerName(ii, PlayerName, MAX_PLAYER_NAME);

		    if(strfind(PlayerName, player, true) != -1)
			{
				DCC_SendChannelMessage(channel, "This Player is Online!");
		  	}
		}
		new query[512];
		mysql_format(g_SQL, query, sizeof(query), "SELECT reg_id FROM players WHERE username='%e'", player);
		mysql_tquery(g_SQL, query, "DJailPlayer", "sis", player, datez, tmp);
	}
}
DCMD:unban(user, channel, params[])
{
    if(channel == inchanel)
	{
		if(sscanf(params, "s[64]", params[0])) return DCC_SendChannelMessage(channel, "**GUNAKAN: !unban [Firstname_LastName]**");
}
	new tmp[24];
	if(sscanf(params, "s[24]", tmp))
    if(channel == inchanel)
	if(channel == g_Admin_Command)
	{
		new query[128];
		mysql_format(g_SQL, query, sizeof(query), "SELECT name,ip FROM banneds WHERE name = '%e'", tmp);
		mysql_tquery(g_SQL, query, "DcOnUnbanQueryData", "s", tmp);
	}

	return 1;
}
DCMD:register(user, channel, params[])
{
	if(channel == ucpdc)
	{
	    extract params -> new string:ucp_name[30]; else return DCC_SendChannelMessage(ucpdc, "```\n!register <name>```");

	    new Id[DCC_ID_SIZE];

	    DCC_GetUserId(user, Id, DCC_ID_SIZE);

	    new discord = strval(Id), str[200];

		new query[200], Cache: result;
		mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM ucp WHERE name='%s'", ucp_name);
		result = mysql_query(g_SQL, query);

		if(cache_num_rows()){
		    DCC_SendChannelMessage(ucpdc, ":x: **UCP Ini Sudah Terdaftar**");
		    cache_delete(result);
		    return 1;
		}

        mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM ucp WHERE discord='%d'", discord);
		result = mysql_query(g_SQL, query);

		if(cache_num_rows()){
		    DCC_SendChannelMessage(ucpdc, ":x: **Kamu sudah pernah mendaftar UCP Sebelumnya**");
		    cache_delete(result);
	        return 1;
		}

		new token = random(50000);
		mysql_format(g_SQL, query, sizeof(query), "INSERT INTO ucp (name, discord, token) VALUES ('%s', '%d', '%d')", ucp_name, discord, token);
		mysql_query(g_SQL, query, false);

		format(str, sizeof(str), ":white_check_mark: UCP **%s** Is now Verifed.", ucp_name);
		DCC_SendChannelMessage(ucpdc, str);

		new mail[200];
		format(mail, 200, "```\nSelamat UCP Anda Di Luxury Roleplay\nBerhasil Kami Verifikasi, Gunakan\nUCP: %s\nToken: %d\nSegera Login Dan Verifikasi```", ucp_name, token);

		/*format(str, sizeof(str), "```Berhasil mengirim email dari permintaan verify UCP ID %d```", strval(Id));
	    DCC_SendChannelMessage(verifydc, str);*/

        DCC_CreatePrivateChannel(user, "DCC_DM", "s", mail);

	    new DCC_Role: ucprole;
		ucprole = DCC_FindRoleById("930461171990032445");// nah di sini buat id role
        DCC_SetGuildMemberNickname(serverguild, user, ucp_name);
        DCC_AddGuildMemberRole(serverguild, user, ucprole);
	}
	return 1;
}
