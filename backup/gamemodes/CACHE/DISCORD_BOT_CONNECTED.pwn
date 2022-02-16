// Discord Logs
#define DCMD_PREFIX '!'

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




