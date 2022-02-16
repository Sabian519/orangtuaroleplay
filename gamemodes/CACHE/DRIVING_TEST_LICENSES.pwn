/* Speedcamera */
#include <YSI\y_hooks>

//new tmpobjid;
new DMVSteps[MAX_PLAYERS][1];
CreateDMVPoint()
{
	new strings[1280];
	CreateDynamicPickup(1239, 23, 1491.1300, 1305.9599, 1093.2890, -1);
	format(strings, sizeof(strings), "[DMV-Licenses]\n'/taketest' you can take a driving test");
	CreateDynamic3DTextLabel(strings, COLOR_WHITE, 1491.1300, 1305.9599, 1093.2890, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Driving Lic
}

CMD:taketest(playerid, params[])
{
	new price = 500;
    if(IsPlayerInRangeOfPoint(playerid, 1.5, 1491.1300, 1305.9599, 1093.2890))
    {
		if(pData[playerid][pDMVProof] == 1) return Error(playerid, "Kamu sudah pernah tes mmengemudi");

		if(GetPlayerMoney(playerid) < price) return Error(playerid, "Anda butuh $5,00 untuk membuat Driving License.");

		GivePlayerMoneyEx(playerid, -price);
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s take the test Driving licenses to right hand", pData[playerid][pName]);
		Info(playerid, "kamu telah mengambil test teori dengan harga "LG_E2"%s", FormatMoney(price));
		ShowPlayerDialog(playerid,
		DIALOG_DMV_TEST,
		DIALOG_STYLE_MSGBOX,
		"DRIVING TEST",
		"{FE2C2C}BACALAH DENGAN SEKSAMA\n{FFFFFF}Anda akan mengikuti tes SIM.\nDi jalan utama, batas kecepatannya adalah {FE2C2C}50 Mph{FFFFFF} dan di jalan raya/jalan bebas hambatan batas kecepatannya adalah {FE2C2C}100 Mph{FFFFFF}.\nJika Anda melebihi batas kecepatan, Anda akan gagal dalam tes namun Anda dapat mengambilnya lagi.\nJika Anda keluar dari kendaraan selama lebih dari satu menit, Anda akan gagal.", "Agree", "Disagree");
	}
    else return Error(playerid, "You must in nearest DMV point to takes test");
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_DMV_TEST)
	{
		if(response)
		{
			//1138.3353,1375.6553,10.4057
			ShowPlayerDialog(playerid,
			DIALOG_DSVEH_RULES,
			DIALOG_STYLE_MSGBOX,
			"Peraturan Mengemudi",
			"Peraturan jalan adalah sebagai berikut..\n1. Anda harus mengemudi di sisi kanan jalan.\n2. Anda harus mengikuti batas kecepatan setiap saat.\n3. Sabuk pengaman Anda harus selalu terpasang.\n4. Lampu kendaraan Anda harus menyala di malam hari.\n5. Jika Anda mengalami kecelakaan, Anda harus melaporkannya.\n6. Anda harus parkir dengan benar setiap saat.",
			"Next",
			"Close");
		}
		else return SendClientMessageEx(playerid, COLOR_YELLOW, "DMV: "X1_BLUE"Anda telah membatalkan DMV tes teori.");
	}
	if(dialogid == DIALOG_DSVEH_RULES)
	{
		if(response)
		{
	   		new String[10000], DMVTest[10000];
			format(String, sizeof(String), ""YELLOW_E"Question One: "LB_E"Jika Anda menabrak kendaraan orang lain "LB_E"Apa yang anda harus lakukan...\n\n\n");
			strcat(DMVTest, String);
			format(String, sizeof(String), "A.) Melarikan diri\n");
			strcat(DMVTest, String);
			format(String, sizeof(String), "B.) Membunuh korban\n");
			strcat(DMVTest, String);
			format(String, sizeof(String), "C.) Diam di tempat dan bertanggung jawab.\n");
			strcat(DMVTest, String);
			ShowPlayerDialog(playerid, DIALOG_DSVEH_TESTBASE, DIALOG_STYLE_TABLIST_HEADERS, "DMV-Questions", DMVTest, "Select", "Cancel");
		}
	}
	if(dialogid == DIALOG_DSVEH_TESTBASE)
	{
		if(response)
		{
			if(listitem == 2)
			{
		   		new String[10000], DMVTest[10000];
				format(String, sizeof(String), ""YELLOW_E"Question Two: "LB_E"Apakah benar anda harus mengemudi di jalur kiri?..\n\n\n");
				strcat(DMVTest, String);
				format(String, sizeof(String), "A.) Benar kita harus di jalur kiri\n");
				strcat(DMVTest, String);
				format(String, sizeof(String), "B.) Salah, Kita harus di jalur kanan\n");
				strcat(DMVTest, String);
				format(String, sizeof(String), "C.) Bebas di jalur manapun\n");
				strcat(DMVTest, String);
				ShowPlayerDialog(playerid, DIALOG_DSVEH_TESTBASE1, DIALOG_STYLE_TABLIST_HEADERS, "DMV-Questions", DMVTest, "Select", "Cancel");
			}
			else
			{
				return SendClientMessageEx(playerid, COLOR_GREY, "DMV: You have failed the test. Incorrect answer.");
			}
		}
	}
	if(dialogid == DIALOG_DSVEH_TESTBASE1)
	{
		if(response)
		{
			if(listitem == 1)
			{
		   		new String[10000], DMVTest[10000];
				format(String, sizeof(String), ""YELLOW_E"Question Three: "LB_E"Jika batas kecepatan adalah 50mph, "LB_E"maka anda harus mengemudi dengan kecepatan?.\n\n\n");
				strcat(DMVTest, String);
				format(String, sizeof(String), "A.) 650 Meter/Jam\n");
				strcat(DMVTest, String);
				format(String, sizeof(String), "B.) 120 Meter/Jam\n");
				strcat(DMVTest, String);
				format(String, sizeof(String), "C.) 100 Meter/Jam\n");
				strcat(DMVTest, String);
				format(String, sizeof(String), "D.) 50 Meter/Jam\n");
				strcat(DMVTest, String);
				format(String, sizeof(String), "E.) 300 Meter/Jam\n");
				strcat(DMVTest, String);
				format(String, sizeof(String), "C.) 430 Meter/Jam\n");
				strcat(DMVTest, String);
				ShowPlayerDialog(playerid, DIALOG_DSVEH_TESTBASE2, DIALOG_STYLE_TABLIST_HEADERS, "DMV-Questions", DMVTest, "Select", "Cancel");
			}
			else
			{
				return SendClientMessageEx(playerid, COLOR_GREY, "You have failed the test. Incorrect answer.");
			}
		}
	}
	if(dialogid == DIALOG_DSVEH_TESTBASE2)
	{
		if(response)
		{
			if(listitem == 3)
			{
		   		new String[10000], DMVTest[10000];
				format(String, sizeof(String), ""YELLOW_E"Question Four: "LB_E"Apakah benar Sabuk pengaman Anda harus selalu terpasang di saat berkendara\n\n\n");
				strcat(DMVTest, String);
				format(String, sizeof(String), "A.) Hanya saat mengendarai roda 4\n");
				strcat(DMVTest, String);
				format(String, sizeof(String), "B.) Ya kita harus selalu mengenakannya\n");
				strcat(DMVTest, String);
				format(String, sizeof(String), "C.) Tidak perlu\n");
				strcat(DMVTest, String);
				ShowPlayerDialog(playerid, DIALOG_DSVEH_TESTBASE3, DIALOG_STYLE_TABLIST_HEADERS, "DMV-Questions", DMVTest, "Select", "Cancel");
			}
			else
			{
				return SendClientMessageEx(playerid, COLOR_GREY, "You have failed the test. Incorrect answer.");
			}
		}
	}
	if(dialogid == DIALOG_DSVEH_TESTBASE3)
	{
		if(response)
		{
			if(listitem == 0)
			{
				/*SetPlayerVirtualWorld(playerid, 0);
				SetPlayerInterior(playerid, 0);
				SetPVarInt(playerid, "PTestVeh", */
				new DMVCar[2];
				SetPVarInt(playerid, "PTestVeh", DMVCar[0] = CreateVehicle(426,-2041.8889,-98.5730,34.9070,359.5032,0,1, 1)); // Car1

				tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
			    SetDynamicObjectMaterialText(tmpobjid, 0, ""YELLOW_E"DMV", 120, "Ariel", 50, 1, 0, 0, 1);
			    AttachDynamicObjectToVehicle(tmpobjid, DMVCar[0], 0.002, -1.732, 0.553, 0.000, -59.499, -88.300);
    
				//new pTestVeh = GetPVarInt(playerid, "PTestVeh");
				/*PutPlayerInVehicle(playerid, pTestVeh, 0);*/
				pData[playerid][pBerhasilTest]++;
				SendClientMessageEx(playerid, ARWIN, "DMV: "YELLOW_E"Anda telah berhasil melewati teori tes DMV, keluar dan naik ke mobil untuk mulai tes mengemudi.");
				SendClientMessageEx(playerid, ARWIN, "DMV: "RED_E"Jangan mengambil Cek Point START Sebelom naik Ke Kendaraan.");


				/*SetPVarInt(playerid, "PDTest", 1);
				DisablePlayerCheckpoint(playerid);*/
				DMVSteps[playerid][0] = 1;
		        SetPlayerRaceCheckpoint(playerid, 1, -2042.1339,-90.4514,35.1641,1962.7469,-1759.2129,13.3828, 3);
				//SetPVarInt(playerid, "pTestMarker", 0);
			}
			else
			{
				return SendClientMessageEx(playerid, COLOR_YELLOW, "DMV: "GREY_E"You have failed the test. Incorrect answer.");
			}
		}
	}
	return 0;
}
