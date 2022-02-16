#define MAX_BANK_POINT 10

enum enum_bank_point
{
	Float:BankPos[3],
	Text3D:BankText,
	BankPickup,
	BankVw,
	BankInt
};
new BankPoint[MAX_BANK_POINT][enum_bank_point];

stock SaveBankPoint()
{
	new idx = 1, File:file;
	new string[200];
	while(idx < MAX_BANK_POINT)
	{
		format(string, sizeof(string), "%f, %f, %f, %d, %d\r\n",
		BankPoint[idx][BankPos][0],
		BankPoint[idx][BankPos][1],
		BankPoint[idx][BankPos][2],
		BankPoint[idx][BankVw],
		BankPoint[idx][BankInt]);
	    if(idx == 1)
	    {
	        file = fopen("Bankpoint.cfg", io_write);
		}
		else
		{
		    file = fopen("Bankpoint.cfg", io_append);
		}
		fwrite(file, string);
		fclose(file);
		idx++;
	}
	return 1;
}

stock LoadBankPoint()
{
	new minfo[5][256];
	new string[200];
	new File:file = fopen("Bankpoint.cfg", io_read);
	if(file)
	{
	    new idx = 1;
		while(idx < MAX_BANK_POINT)
		{
			fread(file, string);
			split(string, minfo, ',');
			BankPoint[idx][BankPos][0] = floatstr(minfo[0]);
			BankPoint[idx][BankPos][1] = floatstr(minfo[1]);
			BankPoint[idx][BankPos][2] = floatstr(minfo[2]);
			BankPoint[idx][BankVw] = strval(minfo[3]);
			BankPoint[idx][BankInt] = strval(minfo[4]);
			if(BankPoint[idx][BankPos][0])
			{
				BankPoint[idx][BankPickup] = CreateDynamicPickup(1239, 23, BankPoint[idx][BankPos][0], BankPoint[idx][BankPos][1], BankPoint[idx][BankPos][2], BankPoint[idx][BankVw], BankPoint[idx][BankInt]);
				format(string, 128, "[ID: %d]\nBank Point\n{FFFFFF}use '"YELLOW_E"/bank"WHITE_E"' here", idx);
				BankPoint[idx][BankText] = CreateDynamic3DTextLabel(string, ARWIN, BankPoint[idx][BankPos][0], BankPoint[idx][BankPos][1], BankPoint[idx][BankPos][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, BankPoint[idx][BankVw], BankPoint[idx][BankInt], -1, 10.0);
			}
			idx++;
		}
		printf("[Dynamic Bank Point]: Has ben loaded bank of number %d", idx);
	}
	return 1;
}

CMD:createbankpoint(playerid, params[])
{
    new String[200];
	if(pData[playerid][pAdmin] < 5) return PermissionError(playerid);
	for(new idx=1; idx<MAX_BANK_POINT; idx++)
 	{
	    if(!BankPoint[idx][BankPos][0])
	    {
	        new Float:X, Float:Y, Float:Z;
	        GetPlayerPos(playerid, X, Y, Z);
	        BankPoint[idx][BankPos][0] = X;
	        BankPoint[idx][BankPos][1] = Y;
	        BankPoint[idx][BankPos][2] = Z;
	        BankPoint[idx][BankVw] = GetPlayerVirtualWorld(playerid);
	        BankPoint[idx][BankInt] = GetPlayerInterior(playerid);
	        BankPoint[idx][BankPickup] = CreateDynamicPickup(1239, 23, X, Y, Z, BankPoint[idx][BankVw], BankPoint[idx][BankInt]);
	        format(String, 128, "[ID: %d]\nBank Point\n{FFFFFF}use '"YELLOW_E"/bank"WHITE_E"' here", idx);
			BankPoint[idx][BankText] = CreateDynamic3DTextLabel(String, ARWIN, X, Y, Z, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, BankPoint[idx][BankVw], BankPoint[idx][BankInt], -1, 10.0);

			idx = MAX_BANK_POINT;
			SaveBankPoint();
		}
	}
	return 1;
}

CMD:editbankpoint(playerid, params[])
{
	new id, String[200];
	if(pData[playerid][pAdmin] < 5) return PermissionError(playerid);
	if(sscanf(params, "s[32]", params))
	{
	    Usage(playerid, "/editbankpoint [Opsi]");
	    Info(playerid, "Posisi");
	    return 1;
	}
	if(!strcmp(params, "posisi", true, 6))
	{
	    if(sscanf(params, "s[32]i", params, id)) return Usage(playerid, "/editbankpoint posisi [id]");
		if(!BankPoint[id][BankPos][0])
		{
			Error(playerid, "invalid Bank Point id");
			return 1;
		}
		new Float:X, Float:Y, Float:Z;
  		GetPlayerPos(playerid, X, Y, Z);
		DestroyDynamicPickup(BankPoint[id][BankPickup]);
		DestroyDynamic3DTextLabel(BankPoint[id][BankText]);
		BankPoint[id][BankPickup] = CreateDynamicPickup(1239, 23, X, Y, Z, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), -1, 150.0);
  		format(String, 128, "[ID: %d]\nBank Point\n{FFFFFF}use '"YELLOW_E"/bank"WHITE_E"' here", id);
		BankPoint[id][BankText] = CreateDynamic3DTextLabel(String, ARWIN, X, Y, Z, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, BankPoint[id][BankVw], BankPoint[id][BankInt], -1, 10.0);
		GetPlayerPos(playerid, BankPoint[id][BankPos][0], BankPoint[id][BankPos][1], BankPoint[id][BankPos][2]);
		SaveBankPoint();
	}
	return 1;
}

CMD:deletebankpoint(playerid, params[])
{
	new idx;
	if(pData[playerid][pAdmin] < 5) return PermissionError(playerid);
	if(sscanf(params, "i", idx)) return Usage(playerid, "/deletempoint [id]");
	if(!BankPoint[idx][BankPos][0])
	{
		SendClientMessage(playerid, COLOR_GREY, "invalid Bank Point id");
		return 1;
	}
	BankPoint[idx][BankPos][0] = 0.0;
 	BankPoint[idx][BankPos][1] = 0.0;
  	BankPoint[idx][BankPos][2] = 0.0;
  	DestroyDynamicPickup(BankPoint[idx][BankPickup]);
	DestroyDynamic3DTextLabel(BankPoint[idx][BankText]);
	SaveBankPoint();
	return 1;
}

// PUBLIC COMMANDO //
CMD:bank(playerid, params[])
{
    for(new aaa = 1; aaa < sizeof(BankPoint); aaa++)
	if(IsPlayerInRangeOfPoint(playerid, 3.0, BankPoint[aaa][BankPos][0], BankPoint[aaa][BankPos][1], BankPoint[aaa][BankPos][2]))
	{
		new tstr[128];
		format(tstr, sizeof(tstr), ""ORANGE_E"No Rek: "LB_E"%d", pData[playerid][pBankRek]);
		ShowPlayerDialog(playerid, DIALOG_BANK, DIALOG_STYLE_LIST, tstr, "Deposit Money\nWithdraw Money\nCheck Balance\nTransfer Money\nSign Paycheck", "Select", "Cancel");
	}
	return 1;
}
