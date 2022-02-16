//-3807.89, 1312.56, 75.82

CreateArmsPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, -3807.89, 1312.56, 75.82, -1);
	format(strings, sizeof(strings), "[Black Market]\n{FFFFFF}/creategun - to make it weapon\n"WHITE_E"/scrapgun - to dismantle weapons");
	CreateDynamic3DTextLabel(strings, COLOR_GREY, -3807.89, 1312.56, 75.82, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //
}

CMD:creategun(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.5,  -3807.89, 1312.56, 75.82)) return Error(playerid, "You must in Black Market!");
	if(pData[playerid][pLevel] < 3) return Error(playerid, "You dont have skill to creategun.");

	new Dstring[512];
	format(Dstring, sizeof(Dstring), "Weapon\tMats & Comps & Price\n\
	Silenced Pistol(ammo 70)\t500 & 500 / $500,00\n");
	format(Dstring, sizeof(Dstring), "%sColt45 9MM(ammo 70)\t500 & 500 & $300,00\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sDesert Eagle(ammo 70)\t500 & 500 & $700,00\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sShotgun(ammo 50)\t500 & 500 & $1.000,00\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sRifle(ammo 35)\t500 & 500 & $1.200,00\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sAK-47(ammo 100)\t500 & 500 & $1.300,00\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sMicro SMG/Uzi(ammo 200)\t500 & 500 & $1.400,00\n", Dstring);
	ShowPlayerDialog(playerid, DIALOG_ARMS_GUN, DIALOG_STYLE_TABLIST_HEADERS, "Create Gun", Dstring, "Create", "Cancel");
	return 1;
}

function CreateGun(playerid, gunid, ammo)
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(!IsValidTimer(pData[playerid][pArmsDealer])) return 0;
	if(gunid == 0 || ammo == 0) return 0;
	if(pData[playerid][pActivityTime] >= 100)
	{
		GivePlayerWeaponEx(playerid, gunid, ammo);

		Info(playerid, "Anda telah berhasil membuat senjata ilegal.");
		TogglePlayerControllable(playerid, 1);
		InfoTD_MSG(playerid, 8000, "Weapon Created!");
		KillTimer(pData[playerid][pArmsDealer]);
		pData[playerid][pActivityTime] = 0;
		HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
		PlayerTextDrawHide(playerid, ActiveTD[playerid]);
		pData[playerid][pEnergy] -= 3;
		return 1;
	}
	else if(pData[playerid][pActivityTime] < 100)
	{
		pData[playerid][pActivityTime] += 5;
		SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	}
	return 1;
}

// ADDITIONAL COMMAND SCRAP GUN //
CMD:scrapgun(playerid, params[])
{
	new weaponid = GetPlayerWeaponEx(playerid);
	if(!IsPlayerInRangeOfPoint(playerid, 3.5,  -3807.89, 1312.56, 75.82)) return Error(playerid, "You must in Black Market!");
	if(pData[playerid][pLevel] < 3) return Error(playerid, "You dont have skill to creategun.");

	if (!weaponid)
		return Error(playerid, "You are not holding a weapon.");

	pData[playerid][pActivity] = SetTimerEx("ScrapGun", 6000, true, "id", playerid, 1);
	TogglePlayerControllable(playerid, 0);
	Info(playerid, "Anda mencoba membongkar senjata menjadi bahan Material dan Component!");
	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 1, 1, 1, 1, 1, 1);
	PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Scrap Weapon..");
	PlayerTextDrawShow(playerid, ActiveTD[playerid]);
	ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
	TogglePlayerControllable(playerid, 0);
	return 1;
}

function ScrapGun(playerid)
{
	new rand = RandomEx(1,12);
	new weaponid = GetPlayerWeaponEx(playerid);
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
	    if(pData[playerid][pActivityTime] >= 100)
	    {
		    if(rand == 1)
		    {
		    	InfoTD_MSG(playerid, 8000, "Scrap Gun Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Kamu belum berhasil membongkar senjata, silahkan ulangi");
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
		    	InfoTD_MSG(playerid, 8000, "Scrap Gun Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Kamu belum berhasil membongkar senjata, silahkan ulangi");
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
		    	InfoTD_MSG(playerid, 8000, "Scrap Gun Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Kamu belum berhasil membongkar senjata, silahkan ulangi");
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
		    	InfoTD_MSG(playerid, 8000, "Scrap Gun Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Kamu belum berhasil membongkar senjata, silahkan ulangi");
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
		    	InfoTD_MSG(playerid, 8000, "Scrap Gun Failed!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
		    	Info(playerid, "Kamu belum berhasil membongkar senjata, silahkan ulangi");
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
		    	InfoTD_MSG(playerid, 8000, "Crushed Weapon!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
				ResetWeapon(playerid, weaponid);
		    	Info(playerid, "Kamu telah gagal membongkar senjata, senjata kamu telah hancur");
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
		    	InfoTD_MSG(playerid, 8000, "Scrap gun Succes!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
				new scrapgun1 = Random(450, 550); // Material
				new scrapgun2 = Random(450, 550); // Component
				ResetWeapon(playerid, weaponid);
				pData[playerid][pMaterial] += scrapgun1;
				pData[playerid][pComponent] += scrapgun2;
		    	Info(playerid, "Kamu telah berhasil membongkar senjata, kamu mendapat "RED_E"%d Material & %d Component", scrapgun1, scrapgun2);
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
		    	InfoTD_MSG(playerid, 8000, "Scrap gun Succes!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
				new scrapgun1 = Random(450, 550); // Material
				new scrapgun2 = Random(450, 550); // Component
				ResetWeapon(playerid, weaponid);
				pData[playerid][pMaterial] += scrapgun1;
				pData[playerid][pComponent] += scrapgun2;
		    	Info(playerid, "Kamu telah berhasil membongkar senjata, kamu mendapat "RED_E"%d Material & %d Component", scrapgun1, scrapgun2);
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
		    	InfoTD_MSG(playerid, 8000, "Crushed Weapon!");
		    	TogglePlayerControllable(playerid, 1);
		    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				KillTimer(pData[playerid][pActivity]);
				pData[playerid][pEnergy] -= 8;
				pData[playerid][pActivityTime] = 0;
				ResetWeapon(playerid, weaponid);
		    	Info(playerid, "Kamu telah gagal membongkar senjata, senjata kamu telah hancur");
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
	return 1;
}
