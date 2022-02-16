/* DEPOSITOR JOBS */

// STATUS PLAYER JOBS
new MegangUangBank[MAX_PLAYERS];
new MegangAlatBank[MAX_PLAYERS];

// STATUS CHECKING ATM
new AtmRusak[MAX_PLAYERS];
new UangAtmKosong[MAX_PLAYERS];

CreateDepositorJobPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, 1432.51, -967.69, 37.40, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "Depositor Jobs\ngunakan commando '/joinjob' untuk menjadi pegawa depositor");
	CreateDynamic3DTextLabel(strings, COLOR_WHITE, 1432.51, -967.69, 37.40, 5.0);
}

CreateLoadMoneyJobPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, 1426.2611,-961.3810,36.3510, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "Load Point Depositor\n'"YELLOW_E"/loadequipment'{FFFFFF} to takes bankmoney");
	CreateDynamic3DTextLabel(strings, COLOR_WHITE, 1426.2611,-961.3810,36.3510, 5.0);
}

IsADepositor(vehicleid)
{
	switch(GetVehicleModel(vehicleid))
	{
	    case 414, 428, 498, 499: return 1;
	}

	return 0;
}

CMD:loadequipment(playerid, params[])
{
	if(pData[playerid][pDepositorTime] > 0) return Error(playerid, "You must be waiting "YELLOW_E"%d "GREY_E"second again to begin jobs.", pData[playerid][pDepositorTime]);

	new carid = Vehicle_Nearest(playerid);
    if(IsPlayerInRangeOfPoint(playerid, 5.0, 1426.2611,-961.3810,36.3510))
	{
		if(pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8)
		{
		    new vehicleid = GetPlayerVehicleID(playerid);
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return Error(playerid, "You are not driver in depositor truck.");
		    if(!IsADepositor(vehicleid)) return Error(playerid, "Vehicle isn't a depositor vehicle.");

			if(vCrateData[vehicleid][vBankMoney] == 5 || vCrateData[vehicleid][vDepositorAlat] == 5) return Error(playerid, "There is vehicle is filled with equipment and bank money.");

        	pData[playerid][pActivity] = SetTimerEx("Depositor", 600, true, "i", playerid);
        
	        PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Takes Equipment..");
			PlayerTextDrawShow(playerid, ActiveTD[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
			TogglePlayerControllable(playerid, 0);
        	vCrateData[carid][vBankMoney] += 5;
        	vCrateData[carid][vDepositorAlat] += 5;
			SavePlayerAccount(playerid);
		}
		else return Error(playerid, "You are not depositor jobs.");
	}
	else return Error(playerid, "You must be in narest in Loaded Pickup Bank");
	return 1;
}

CMD:takebankmoney(playerid, params[])
{
	if(pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8)
	{
		if(MegangUangBank[playerid] == 1 && MegangAlatBank[playerid] == 1) return Error(playerid, "Pastikan kamu tidak membawa barang apapun untuk mengambil uang");

		new carid = Vehicle_Nearest(playerid);
	 	new Float:Cpos[3];
		new String[2280];
		GetVehiclePos(carid,Cpos[0],Cpos[1],Cpos[2]);
		if(IsPlayerInRangeOfPoint(playerid,7.0,Cpos[0],Cpos[1],Cpos[2]))  return Error(playerid, "You must be a nearest vehicle!");

		if(vCrateData[carid][vBankMoney] == 0) return Error(playerid, "Mobil ini tidak menyimpan uang bank");

        MegangUangBank[playerid] =1;
        vCrateData[carid][vBankMoney] -=1;
		format(String, sizeof(String), "VEHICLE: "WHITE_E"Anda berhasil mengambil uang bank dari kendaraan");
		SendClientMessage(playerid, ARWIN, String);
		SavePlayerAccount(playerid);
	}
	else return Error(playerid, "You are not Depositor jobs");
	return 1;
}

CMD:takewreanch(playerid, params[])
{
	if(pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8)
	{
		if(MegangUangBank[playerid] == 1 && MegangAlatBank[playerid] == 1) return Error(playerid, "Pastikan kamu tidak membawa barang apapun untuk mengambil peralatan");

		new carid = Vehicle_Nearest(playerid);
	 	new Float:Cpos[3];
		new String[2280];
		GetVehiclePos(carid,Cpos[0],Cpos[1],Cpos[2]);
		if(IsPlayerInRangeOfPoint(playerid,7.0,Cpos[0],Cpos[1],Cpos[2]))  return Error(playerid, "You must be a nearest vehicle!");

		if(vCrateData[carid][vDepositorAlat] == 0) return Error(playerid, "Mobil ini tidak menyimpan peralatan depositor");

        MegangAlatBank[playerid] =1;
        vCrateData[carid][vDepositorAlat] -=1;
		format(String, sizeof(String), "VEHICLE: "WHITE_E"Anda berhasil mengambil peralatan depositor dari kendaraan");
		SendClientMessage(playerid, ARWIN, String);
		SavePlayerAccount(playerid);
	}
	else return Error(playerid, "You are not Depositor jobs");
	return 1;
}

CMD:checkatm(playerid, params[])
{
    new id = -1;
	id = GetClosestATM(playerid);
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	if(AtmData[id][atmStatus] == 0) return Error(playerid, "This is ATM status Good");

	if(AtmRusak[playerid] == 1 && UangAtmKosong[playerid] == 1) return Error(playerid, "Pastikan kamu belum mengetahui kerusakan pada ATM tersebut");

	if(pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8)
	{
		if(id > -1)
		{
		    pData[playerid][pActivity] = SetTimerEx("CheckAtm", 600, true, "i", playerid);

			PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Checking ATM..");
			PlayerTextDrawShow(playerid, ActiveTD[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
			TogglePlayerControllable(playerid, 0);
		}
	}
	else return Error(playerid, "You are not Depositor Job");
	return 1;
}

CMD:restockmoneyatm(playerid, params[])
{
    new id = -1;
	id = GetClosestATM(playerid);
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	if(AtmRusak[playerid] == 1 && UangAtmKosong[playerid] == 1) return Error(playerid, "Pastikan kamu belum mengetahui kerusakan pada ATM tersebut");

	if(MegangUangBank[playerid] == 0) return Error(playerid, "Kamu tidak memegang uang bank, silahkan ambil di mobil. gunakan '"YELLOW_E"/takebankmoney");
	if(pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8)
	{
		if(id > -1)
		{
        	MegangUangBank[playerid] =0;
			pData[playerid][pDepositorTime] = 2800;
		    new rand = Random(1984589, 2239315);
			Server_AddMoney(rand);
			pData[playerid][pDepositorTime] = 2800;
			AddPlayerSalary(playerid, "Depositor(Restock)", 4500);
			SCM(playerid, ARWIN, "JOB: "WHITE_E"You have "GREEN_E"succesfully "WHITE_E"restock ATM money, in your payment in '"YELLOW_E"/mysalary"WHITE_E"'");
			Info(playerid, "Kamu berhasil merestock uang ke ATM sejumlah "GREEN_E"$%s", FormatMoney(rand));
		}
	}
	else return Error(playerid, "You are not depositor jobs.");
	return 1;
}

CMD:repairatm(playerid, params[])
{
    new id = -1;
	id = GetClosestATM(playerid);
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

    if(MegangAlatBank[playerid] == 0) return Error(playerid, "Kamu harus memegang kunci peralatan depositor, silahkan ambil di mobil gunakan '"YELLOW_E"/takewreanch"WHITE_E"'");

	if(AtmRusak[playerid] == 0) return Error(playerid, "Kamu tidak bisa melakukan ini, kamu tidak tau masalah pada ATM. Silahkan '"YELLOW_E"/checkatm"WHITE_E"'");

	if(pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8)
	{
		if(id > -1)
		{
		    pData[playerid][pActivity] = SetTimerEx("RepairAtm", 600, true, "i", playerid);

			PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Repairining ATM..");
			PlayerTextDrawShow(playerid, ActiveTD[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
			TogglePlayerControllable(playerid, 0);
		}
	}
	else return Error(playerid, "You are not Depositor Job");
	return 1;
}
		
//---- [ CALLBACK FORWARD DEPOSITOR ] ----

// REPAIRINING ATM STATUS
function RepairAtm(playerid)
{
    new id = -1;
	id = GetClosestATM(playerid);
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
	    if(pData[playerid][pActivityTime] >= 100)
	    {
        	AtmRusak[playerid] =0;
        	AtmData[id][atmStatus] = 0;
     		Atm_Refresh(id);
     		Atm_Save(id);
	    	InfoTD_MSG(playerid, 8000, "Repairining Done!");
	    	TogglePlayerControllable(playerid, 1);
	    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pEnergy] -= 8;
			pData[playerid][pActivityTime] = 0;
			ClearAnimations(playerid);
			pData[playerid][pDepositorTime] = 2600;
			AddPlayerSalary(playerid, "Depositor(Repaired)", 4800);
		}
 		else if(pData[playerid][pActivityTime] < 100)
		{
	    	pData[playerid][pActivityTime] += 5;
	    	ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 1, 1, 1, 1, 1);
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	}
	return 1;
}

// ATM CHECK STATUS
function CheckAtm(playerid)
{
	new rand = RandomEx(1,12);
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 1)
		    {
		    	InfoTD_MSG(playerid, 8000, "Checking Done!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda belum menemukan kerusakan/masalah pada ATM silahkan cek lagi.");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 2)
		    {
		    	InfoTD_MSG(playerid, 8000, "Checking Done!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda belum menemukan kerusakan/masalah pada ATM silahkan cek lagi.");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 3)
		    {
		    	InfoTD_MSG(playerid, 8000, "Checking Done!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda belum menemukan kerusakan/masalah pada ATM silahkan cek lagi.");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 4)
		    {
		    	InfoTD_MSG(playerid, 8000, "Checking Done!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda belum menemukan kerusakan/masalah pada ATM silahkan cek lagi.");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 5)
		    {
		    	InfoTD_MSG(playerid, 8000, "Checking Done!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda belum menemukan kerusakan/masalah pada ATM silahkan cek lagi.");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 6)
		    {
		    	InfoTD_MSG(playerid, 8000, "Checking Done!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda belum menemukan kerusakan/masalah pada ATM silahkan cek lagi.");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 7)
		    {
		    	InfoTD_MSG(playerid, 8000, "Checking Done!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	SetPVarInt(playerid, "CheckAtm", gettime() + 12000);
		        Info(playerid, "Anda telah berhasil menemukan problem pada ATM tersebut, gunakan '"YELLOW_E"/restockmoneyatm"WHITE_E"'");
		        SCM(playerid, ARWIN, "JOB: "WHITE_E"ATM Money Stock: "GREEN_E"$00,00");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 8)
		    {
		    	InfoTD_MSG(playerid, 8000, "Checking Done!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Anda belum menemukan kerusakan/masalah pada ATM silahkan cek lagi.");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 9)
		    {
		    	InfoTD_MSG(playerid, 8000, "Checking Done!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	SetPVarInt(playerid, "CheckAtm", gettime() + 12000);
		        AtmRusak[playerid] = 1;
		        Info(playerid, "Anda telah berhasil menemukan problem pada ATM tersebut, gunakan '"YELLOW_E"/repairatm"WHITE_E"'");
		        SCM(playerid, ARWIN, "JOB: "WHITE_E"This ATM "RED_E"Down "WHITE_E"please repair");
		        TogglePlayerControllable(playerid, 1);
				return 1;
			}
		}
 		else if(pData[playerid][pActivityTime] < 100)
 		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	}
	return 0;
}

	    
// FUNGSI CALLBACK LOADEQUIPMENT
function Depositor(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
	    if(pData[playerid][pActivityTime] >= 100)
	    {
			TogglePlayerControllable(playerid, 1);
	    	InfoTD_MSG(playerid, 8000, "Equipment Loaded!");
	    	TogglePlayerControllable(playerid, 1);
	    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pEnergy] -= 8;
			pData[playerid][pActivityTime] = 0;
		}
 		else if(pData[playerid][pActivityTime] < 100)
		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	}
	return 1;
}

