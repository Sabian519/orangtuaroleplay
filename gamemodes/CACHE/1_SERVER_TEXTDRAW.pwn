//------------[ Textdraw ]------------


//Info textdraw
new PlayerText:InfoTD[MAX_PLAYERS];
new Text:TextTime, Text:TextDate;

//Server Name textdraw
new Text:SOIRP_TXD;

new TD_Random_Messages_Intro[ ][ ] =
{
	"~r~OrangTua ~w~ Roleplay"
};

function TDUpdates()
{
	TextDrawSetString(Text:SOIRP_TXD, TD_Random_Messages_Intro[random(sizeof(TD_Random_Messages_Intro))]);
}
//HBE BARU KEK LUNAR
new PlayerText:DRINKBG_0[MAX_PLAYERS];
new PlayerText:DRINKBG_1[MAX_PLAYERS];
new PlayerText:DRINKBG_2[MAX_PLAYERS];
new PlayerText:DRINK[MAX_PLAYERS];
new PlayerText:FOODBG_0[MAX_PLAYERS];
new PlayerText:FOODBG_1[MAX_PLAYERS];
new PlayerText:FOODBG_2[MAX_PLAYERS];
new PlayerText:FOOD[MAX_PLAYERS];
new PlayerText:MONEYBG_0[MAX_PLAYERS];
new PlayerText:MONEYBG_1[MAX_PLAYERS];
new PlayerText:MONEYBG_2[MAX_PLAYERS];
new PlayerText:MONEYHUD[MAX_PLAYERS];
new PlayerText:MONEY[MAX_PLAYERS];
new PlayerText:NAME[MAX_PLAYERS];

//HBE textdraw Modern
new Text:TDEditor_TD[19];

new PlayerText:DPname[MAX_PLAYERS];
new PlayerText:DPmoney[MAX_PLAYERS];
new PlayerText:DPcoin[MAX_PLAYERS];

new PlayerText:DPvehname[MAX_PLAYERS];
new PlayerText:DPvehengine[MAX_PLAYERS];
new PlayerText:DPvehspeed[MAX_PLAYERS];
new Text:DPvehfare[MAX_PLAYERS];

//HBE textdraw Simple
new PlayerText:SPvehname[MAX_PLAYERS];
new PlayerText:SPvehengine[MAX_PLAYERS];
new PlayerText:SPvehspeed[MAX_PLAYERS];

new PlayerText:ActiveTD[MAX_PLAYERS];

//settoyspos
new PlayerText:EditToysTD[MAX_PLAYERS][5];
new PlayerText:ToysTDdown[MAX_PLAYERS];
new PlayerText:ToysTDup[MAX_PLAYERS];
new PlayerText:ToysTDsave[MAX_PLAYERS];
new PlayerText:ToysTDedit[MAX_PLAYERS];
new Text:td_waktu;

// HBE New Simple
new Text:HBE_TD[6];
new PlayerText:PercenHbe[MAX_PLAYERS][2];

// SPEEDO TEXTDRAW SIMPLE NEW
new Text:SpeedoTD[9];
new PlayerText:PlayerSpeedoTD[MAX_PLAYERS][3];

new PlayerText:SDname[MAX_PLAYERS];
new PlayerText:SDmoney[MAX_PLAYERS];

//VEHICLE OBJECT TEXTDRAW EDIT
new PlayerText:EditVObjTD[MAX_PLAYERS][8];

// JOB TEXTDRAW
new PlayerText:PizzasText[MAX_PLAYERS];
new PlayerText:PizzaSymbol[MAX_PLAYERS];
new PlayerText:TipsText[MAX_PLAYERS];
new PlayerText:EarningsText[MAX_PLAYERS];
new PlayerText:TotalEarningsText[MAX_PLAYERS];
new PlayerText:TipTimeText[MAX_PLAYERS];

CreatePlayerTextDraws(playerid)
{
	//Info textdraw
	InfoTD[playerid] = CreatePlayerTextDraw(playerid, 148.888, 361.385, "Welcome!");
 	PlayerTextDrawLetterSize(playerid, InfoTD[playerid], 0.326, 1.654);
	PlayerTextDrawAlignment(playerid, InfoTD[playerid], 1);
	PlayerTextDrawColor(playerid, InfoTD[playerid], -1);
	PlayerTextDrawSetOutline(playerid, InfoTD[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, InfoTD[playerid], 0x000000FF);
	PlayerTextDrawFont(playerid, InfoTD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, InfoTD[playerid], 1);

	ActiveTD[playerid] = CreatePlayerTextDraw(playerid, 274.000000, 176.583435, "Refulling...");
	PlayerTextDrawLetterSize(playerid, ActiveTD[playerid], 0.374000, 1.349166);
	PlayerTextDrawAlignment(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawColor(playerid, ActiveTD[playerid], -1);
	PlayerTextDrawSetShadow(playerid, ActiveTD[playerid], 0);
	PlayerTextDrawSetOutline(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, ActiveTD[playerid], 255);
	PlayerTextDrawFont(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ActiveTD[playerid], 0);

	//HBE Textdraw Modern
	DPname[playerid] = CreatePlayerTextDraw(playerid, 537.000000, 367.333251, "Dandy_Prasetyo");
	PlayerTextDrawLetterSize(playerid, DPname[playerid], 0.328999, 1.179998);
	PlayerTextDrawAlignment(playerid, DPname[playerid], 1);
	PlayerTextDrawColor(playerid, DPname[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DPname[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPname[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPname[playerid], 255);
	PlayerTextDrawFont(playerid, DPname[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DPname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPname[playerid], 0);

	DPmoney[playerid] = CreatePlayerTextDraw(playerid, 535.000000, 381.916473, "$50.000");
	PlayerTextDrawLetterSize(playerid, DPmoney[playerid], 0.231499, 1.034165);
	PlayerTextDrawAlignment(playerid, DPmoney[playerid], 1);
	PlayerTextDrawColor(playerid, DPmoney[playerid], 16711935);
	PlayerTextDrawSetShadow(playerid, DPmoney[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPmoney[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPmoney[playerid], 255);
	PlayerTextDrawFont(playerid, DPmoney[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPmoney[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPmoney[playerid], 0);

	DPcoin[playerid] = CreatePlayerTextDraw(playerid, 535.500000, 392.999877, "5000_Coin");
	PlayerTextDrawLetterSize(playerid, DPcoin[playerid], 0.246000, 0.952498);
	PlayerTextDrawAlignment(playerid, DPcoin[playerid], 1);
	PlayerTextDrawColor(playerid, DPcoin[playerid], -65281);
	PlayerTextDrawSetShadow(playerid, DPcoin[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPcoin[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPcoin[playerid], 255);
	PlayerTextDrawFont(playerid, DPcoin[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPcoin[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPcoin[playerid], 0);

	/*TDEditor_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 565.500000, 405.833404, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][3], 68.000000, 8.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][3], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][3], 0);

	TDEditor_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 565.500000, 420.416717, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][4], 68.000000, 8.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][4], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][4], 0);

	TDEditor_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 565.500000, 435.000091, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][5], 68.000000, 8.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][5], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][5], 0);*/

	DPvehname[playerid] = CreatePlayerTextDraw(playerid, 431.000000, 367.333312, "Turismo");
	PlayerTextDrawLetterSize(playerid, DPvehname[playerid], 0.299499, 1.121665);
	PlayerTextDrawAlignment(playerid, DPvehname[playerid], 1);
	PlayerTextDrawColor(playerid, DPvehname[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DPvehname[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPvehname[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPvehname[playerid], 255);
	PlayerTextDrawFont(playerid, DPvehname[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPvehname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPvehname[playerid], 0);

	DPvehengine[playerid] = CreatePlayerTextDraw(playerid, 462.000000, 381.916778, "ON");
	PlayerTextDrawLetterSize(playerid, DPvehengine[playerid], 0.229000, 0.940832);
	PlayerTextDrawAlignment(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawColor(playerid, DPvehengine[playerid], 16711935);
	PlayerTextDrawSetShadow(playerid, DPvehengine[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPvehengine[playerid], 255);
	PlayerTextDrawFont(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPvehengine[playerid], 0);

	DPvehspeed[playerid] = CreatePlayerTextDraw(playerid, 460.000000, 391.833312, "120_Mph");
	PlayerTextDrawLetterSize(playerid, DPvehspeed[playerid], 0.266999, 0.946666);
	PlayerTextDrawAlignment(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawColor(playerid, DPvehspeed[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DPvehspeed[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPvehspeed[playerid], 255);
	PlayerTextDrawFont(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPvehspeed[playerid], 0);

	DPvehfare[playerid] = TextDrawCreate(462.000000, 401.166687, "$500.000");
	TextDrawLetterSize(DPvehfare[playerid], 0.216000, 0.952498);
	TextDrawAlignment(DPvehfare[playerid], 1);
	TextDrawColor(DPvehfare[playerid], 16711935);
	TextDrawSetShadow(DPvehfare[playerid], 0);
	TextDrawSetOutline(DPvehfare[playerid], 1);
	TextDrawBackgroundColor(DPvehfare[playerid], 255);
	TextDrawFont(DPvehfare[playerid], 1);
	TextDrawSetProportional(DPvehfare[playerid], 1);
	TextDrawSetShadow(DPvehfare[playerid], 0);

	/*TDEditor_PTD[playerid][10] = CreatePlayerTextDraw(playerid, 459.000000, 415.749938, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][10], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][10], 61.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][10], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][10], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][10], 0);

	TDEditor_PTD[playerid][11] = CreatePlayerTextDraw(playerid, 459.500000, 432.083221, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][11], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][11], 61.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][11], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][11], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][11], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][11], 0);*/

	//HBE textdraw Simple
	SPvehname[playerid] = CreatePlayerTextDraw(playerid, 540.000000, 366.749908, "Turismo");
	PlayerTextDrawLetterSize(playerid, SPvehname[playerid], 0.319000, 1.022498);
	PlayerTextDrawAlignment(playerid, SPvehname[playerid], 1);
	PlayerTextDrawColor(playerid, SPvehname[playerid], -1);
	PlayerTextDrawSetShadow(playerid, SPvehname[playerid], 0);
	PlayerTextDrawSetOutline(playerid, SPvehname[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, SPvehname[playerid], 255);
	PlayerTextDrawFont(playerid, SPvehname[playerid], 1);
	PlayerTextDrawSetProportional(playerid, SPvehname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SPvehname[playerid], 0);

	SPvehspeed[playerid] = CreatePlayerTextDraw(playerid, 538.000000, 412.833160, "250_Mph");
	PlayerTextDrawLetterSize(playerid, SPvehspeed[playerid], 0.275498, 1.244166);
	PlayerTextDrawAlignment(playerid, SPvehspeed[playerid], 1);
	PlayerTextDrawColor(playerid, SPvehspeed[playerid], -1);
	PlayerTextDrawSetShadow(playerid, SPvehspeed[playerid], 0);
	PlayerTextDrawSetOutline(playerid, SPvehspeed[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, SPvehspeed[playerid], 255);
	PlayerTextDrawFont(playerid, SPvehspeed[playerid], 1);
	PlayerTextDrawSetProportional(playerid, SPvehspeed[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SPvehspeed[playerid], 0);

	SPvehengine[playerid] = CreatePlayerTextDraw(playerid, 611.500000, 414.000152, "ON");
	PlayerTextDrawLetterSize(playerid, SPvehengine[playerid], 0.280999, 1.104166);
	PlayerTextDrawAlignment(playerid, SPvehengine[playerid], 1);
	PlayerTextDrawColor(playerid, SPvehengine[playerid], 16711935);
	PlayerTextDrawSetShadow(playerid, SPvehengine[playerid], 0);
	PlayerTextDrawSetOutline(playerid, SPvehengine[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, SPvehengine[playerid], 255);
	PlayerTextDrawFont(playerid, SPvehengine[playerid], 1);
	PlayerTextDrawSetProportional(playerid, SPvehengine[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SPvehengine[playerid], 0);

    //HUD LUNAR
	DRINKBG_0[playerid] = CreatePlayerTextDraw(playerid, 550.500000, 424.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, DRINKBG_0[playerid], 5);
	PlayerTextDrawLetterSize(playerid, DRINKBG_0[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, DRINKBG_0[playerid], 35.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, DRINKBG_0[playerid], 0);
	PlayerTextDrawSetShadow(playerid, DRINKBG_0[playerid], 0);
	PlayerTextDrawAlignment(playerid, DRINKBG_0[playerid], 1);
	PlayerTextDrawColor(playerid, DRINKBG_0[playerid], 255);
	PlayerTextDrawBackgroundColor(playerid, DRINKBG_0[playerid], 0);
	PlayerTextDrawBoxColor(playerid, DRINKBG_0[playerid], 255);
	PlayerTextDrawUseBox(playerid, DRINKBG_0[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DRINKBG_0[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DRINKBG_0[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, DRINKBG_0[playerid], 1614);
	PlayerTextDrawSetPreviewRot(playerid, DRINKBG_0[playerid], 0.000000, 0.000000, -90.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, DRINKBG_0[playerid], 1, 1);

	DRINKBG_1[playerid] = CreatePlayerTextDraw(playerid, 567.000000, 430.000000, "ld_dual:black");
	PlayerTextDrawFont(playerid, DRINKBG_1[playerid], 4);
	PlayerTextDrawLetterSize(playerid, DRINKBG_1[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, DRINKBG_1[playerid], 60.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, DRINKBG_1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DRINKBG_1[playerid], 0);
	PlayerTextDrawAlignment(playerid, DRINKBG_1[playerid], 1);
	PlayerTextDrawColor(playerid, DRINKBG_1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, DRINKBG_1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DRINKBG_1[playerid], 50);
	PlayerTextDrawUseBox(playerid, DRINKBG_1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DRINKBG_1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DRINKBG_1[playerid], 0);

	DRINKBG_2[playerid] = CreatePlayerTextDraw(playerid, 610.500000, 418.700012, "Preview_Model");
	PlayerTextDrawFont(playerid, DRINKBG_2[playerid], 5);
	PlayerTextDrawLetterSize(playerid, DRINKBG_2[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, DRINKBG_2[playerid], 35.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, DRINKBG_2[playerid], 0);
	PlayerTextDrawSetShadow(playerid, DRINKBG_2[playerid], 0);
	PlayerTextDrawAlignment(playerid, DRINKBG_2[playerid], 1);
	PlayerTextDrawColor(playerid, DRINKBG_2[playerid], 255);
	PlayerTextDrawBackgroundColor(playerid, DRINKBG_2[playerid], 0);
	PlayerTextDrawBoxColor(playerid, DRINKBG_2[playerid], 255);
	PlayerTextDrawUseBox(playerid, DRINKBG_2[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DRINKBG_2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DRINKBG_2[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, DRINKBG_2[playerid], 1614);
	PlayerTextDrawSetPreviewRot(playerid, DRINKBG_2[playerid], 0.000000, 180.000000, -90.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, DRINKBG_2[playerid], 1, 1);

	DRINK[playerid] = CreatePlayerTextDraw(playerid, 568.000000, 432.000000, "HUD:radar_datedrink");
	PlayerTextDrawFont(playerid, DRINK[playerid], 4);
	PlayerTextDrawLetterSize(playerid, DRINK[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, DRINK[playerid], 10.000000, 10.000000);
	PlayerTextDrawSetOutline(playerid, DRINK[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DRINK[playerid], 0);
	PlayerTextDrawAlignment(playerid, DRINK[playerid], 1);
	PlayerTextDrawColor(playerid, DRINK[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, DRINK[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DRINK[playerid], 50);
	PlayerTextDrawUseBox(playerid, DRINK[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DRINK[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DRINK[playerid], 0);

	FOODBG_0[playerid] = CreatePlayerTextDraw(playerid, 550.000000, 401.700012, "Preview_Model");
	PlayerTextDrawFont(playerid, FOODBG_0[playerid], 5);
	PlayerTextDrawLetterSize(playerid, FOODBG_0[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, FOODBG_0[playerid], 35.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, FOODBG_0[playerid], 0);
	PlayerTextDrawSetShadow(playerid, FOODBG_0[playerid], 0);
	PlayerTextDrawAlignment(playerid, FOODBG_0[playerid], 1);
	PlayerTextDrawColor(playerid, FOODBG_0[playerid], 255);
	PlayerTextDrawBackgroundColor(playerid, FOODBG_0[playerid], 0);
	PlayerTextDrawBoxColor(playerid, FOODBG_0[playerid], 255);
	PlayerTextDrawUseBox(playerid, FOODBG_0[playerid], 0);
	PlayerTextDrawSetProportional(playerid, FOODBG_0[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, FOODBG_0[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, FOODBG_0[playerid], 1614);
	PlayerTextDrawSetPreviewRot(playerid, FOODBG_0[playerid], 0.000000, 180.000000, -90.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, FOODBG_0[playerid], 1, 1);

	FOODBG_1[playerid] = CreatePlayerTextDraw(playerid, 566.500000, 412.700012, "ld_dual:black");
	PlayerTextDrawFont(playerid, FOODBG_1[playerid], 4);
	PlayerTextDrawLetterSize(playerid, FOODBG_1[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, FOODBG_1[playerid], 60.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, FOODBG_1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, FOODBG_1[playerid], 0);
	PlayerTextDrawAlignment(playerid, FOODBG_1[playerid], 1);
	PlayerTextDrawColor(playerid, FOODBG_1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, FOODBG_1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, FOODBG_1[playerid], 50);
	PlayerTextDrawUseBox(playerid, FOODBG_1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, FOODBG_1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, FOODBG_1[playerid], 0);

	FOODBG_2[playerid] = CreatePlayerTextDraw(playerid, 610.500000, 406.899993, "Preview_Model");
	PlayerTextDrawFont(playerid, FOODBG_2[playerid], 5);
	PlayerTextDrawLetterSize(playerid, FOODBG_2[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, FOODBG_2[playerid], 35.000000, 51.000000);
	PlayerTextDrawSetOutline(playerid, FOODBG_2[playerid], 0);
	PlayerTextDrawSetShadow(playerid, FOODBG_2[playerid], 0);
	PlayerTextDrawAlignment(playerid, FOODBG_2[playerid], 1);
	PlayerTextDrawColor(playerid, FOODBG_2[playerid], 255);
	PlayerTextDrawBackgroundColor(playerid, FOODBG_2[playerid], 0);
	PlayerTextDrawBoxColor(playerid, FOODBG_2[playerid], 255);
	PlayerTextDrawUseBox(playerid, FOODBG_2[playerid], 0);
	PlayerTextDrawSetProportional(playerid, FOODBG_2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, FOODBG_2[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, FOODBG_2[playerid], 1614);
	PlayerTextDrawSetPreviewRot(playerid, FOODBG_2[playerid], 0.000000, 0.000000, -90.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, FOODBG_2[playerid], 1, 1);

	FOOD[playerid] = CreatePlayerTextDraw(playerid, 568.000000, 415.000000, "HUD:radar_datefood");
	PlayerTextDrawFont(playerid, FOOD[playerid], 4);
	PlayerTextDrawLetterSize(playerid, FOOD[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, FOOD[playerid], 10.000000, 10.000000);
	PlayerTextDrawSetOutline(playerid, FOOD[playerid], 1);
	PlayerTextDrawSetShadow(playerid, FOOD[playerid], 0);
	PlayerTextDrawAlignment(playerid, FOOD[playerid], 1);
	PlayerTextDrawColor(playerid, FOOD[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, FOOD[playerid], 255);
	PlayerTextDrawBoxColor(playerid, FOOD[playerid], 50);
	PlayerTextDrawUseBox(playerid, FOOD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, FOOD[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, FOOD[playerid], 0);

	MONEYBG_0[playerid] = CreatePlayerTextDraw(playerid, 550.500000, 390.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, MONEYBG_0[playerid], 5);
	PlayerTextDrawLetterSize(playerid, MONEYBG_0[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, MONEYBG_0[playerid], 35.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, MONEYBG_0[playerid], 0);
	PlayerTextDrawSetShadow(playerid, MONEYBG_0[playerid], 0);
	PlayerTextDrawAlignment(playerid, MONEYBG_0[playerid], 1);
	PlayerTextDrawColor(playerid, MONEYBG_0[playerid], 255);
	PlayerTextDrawBackgroundColor(playerid, MONEYBG_0[playerid], 0);
	PlayerTextDrawBoxColor(playerid, MONEYBG_0[playerid], 255);
	PlayerTextDrawUseBox(playerid, MONEYBG_0[playerid], 0);
	PlayerTextDrawSetProportional(playerid, MONEYBG_0[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MONEYBG_0[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, MONEYBG_0[playerid], 1614);
	PlayerTextDrawSetPreviewRot(playerid, MONEYBG_0[playerid], 0.000000, 0.000000, -90.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, MONEYBG_0[playerid], 1, 1);

	MONEYBG_1[playerid] = CreatePlayerTextDraw(playerid, 567.000000, 395.700012, "ld_dual:black");
	PlayerTextDrawFont(playerid, MONEYBG_1[playerid], 4);
	PlayerTextDrawLetterSize(playerid, MONEYBG_1[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, MONEYBG_1[playerid], 60.000000, 15.000000);
	PlayerTextDrawSetOutline(playerid, MONEYBG_1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, MONEYBG_1[playerid], 0);
	PlayerTextDrawAlignment(playerid, MONEYBG_1[playerid], 1);
	PlayerTextDrawColor(playerid, MONEYBG_1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, MONEYBG_1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, MONEYBG_1[playerid], 50);
	PlayerTextDrawUseBox(playerid, MONEYBG_1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, MONEYBG_1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MONEYBG_1[playerid], 0);

	MONEYBG_2[playerid] = CreatePlayerTextDraw(playerid, 610.500000, 384.200012, "Preview_Model");
	PlayerTextDrawFont(playerid, MONEYBG_2[playerid], 5);
	PlayerTextDrawLetterSize(playerid, MONEYBG_2[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, MONEYBG_2[playerid], 35.000000, 50.000000);
	PlayerTextDrawSetOutline(playerid, MONEYBG_2[playerid], 0);
	PlayerTextDrawSetShadow(playerid, MONEYBG_2[playerid], 0);
	PlayerTextDrawAlignment(playerid, MONEYBG_2[playerid], 1);
	PlayerTextDrawColor(playerid, MONEYBG_2[playerid], 255);
	PlayerTextDrawBackgroundColor(playerid, MONEYBG_2[playerid], 0);
	PlayerTextDrawBoxColor(playerid, MONEYBG_2[playerid], 255);
	PlayerTextDrawUseBox(playerid, MONEYBG_2[playerid], 0);
	PlayerTextDrawSetProportional(playerid, MONEYBG_2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MONEYBG_2[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, MONEYBG_2[playerid], 1614);
	PlayerTextDrawSetPreviewRot(playerid, MONEYBG_2[playerid], 0.000000, 180.000000, -90.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, MONEYBG_2[playerid], 1, 1);

	MONEYHUD[playerid] = CreatePlayerTextDraw(playerid, 568.000000, 398.000000, "HUD:radar_cash");
	PlayerTextDrawFont(playerid, MONEYHUD[playerid], 4);
	PlayerTextDrawLetterSize(playerid, MONEYHUD[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, MONEYHUD[playerid], 10.000000, 10.000000);
	PlayerTextDrawSetOutline(playerid, MONEYHUD[playerid], 1);
	PlayerTextDrawSetShadow(playerid, MONEYHUD[playerid], 0);
	PlayerTextDrawAlignment(playerid, MONEYHUD[playerid], 1);
	PlayerTextDrawColor(playerid, MONEYHUD[playerid], -21557249);
	PlayerTextDrawBackgroundColor(playerid, MONEYHUD[playerid], 255);
	PlayerTextDrawBoxColor(playerid, MONEYHUD[playerid], 50);
	PlayerTextDrawUseBox(playerid, MONEYHUD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, MONEYHUD[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MONEYHUD[playerid], 0);

	MONEY[playerid] = CreatePlayerTextDraw(playerid, 625.000000, 396.000000, "$9.999,99");
	PlayerTextDrawFont(playerid, MONEY[playerid], 2);
	PlayerTextDrawLetterSize(playerid, MONEY[playerid], 0.170833, 1.200000);
	PlayerTextDrawTextSize(playerid, MONEY[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, MONEY[playerid], 0);
	PlayerTextDrawSetShadow(playerid, MONEY[playerid], 0);
	PlayerTextDrawAlignment(playerid, MONEY[playerid], 3);
	PlayerTextDrawColor(playerid, MONEY[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, MONEY[playerid], 255);
	PlayerTextDrawBoxColor(playerid, MONEY[playerid], 50);
	PlayerTextDrawUseBox(playerid, MONEY[playerid], 0);
	PlayerTextDrawSetProportional(playerid, MONEY[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MONEY[playerid], 0);

	NAME[playerid] = CreatePlayerTextDraw(playerid, 631.000000, 380.000000, "Georgia Ahasywlz");
	PlayerTextDrawFont(playerid, NAME[playerid], 0);
	PlayerTextDrawLetterSize(playerid, NAME[playerid], 0.266665, 1.349998);
	PlayerTextDrawTextSize(playerid, NAME[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, NAME[playerid], 1);
	PlayerTextDrawSetShadow(playerid, NAME[playerid], 0);
	PlayerTextDrawAlignment(playerid, NAME[playerid], 3);
	PlayerTextDrawColor(playerid, NAME[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, NAME[playerid], 255);
	PlayerTextDrawBoxColor(playerid, NAME[playerid], 50);
	PlayerTextDrawUseBox(playerid, NAME[playerid], 0);
	PlayerTextDrawSetProportional(playerid, NAME[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, NAME[playerid], 0);

	//HBE Textdraw New Simple
	SDname[playerid] = CreatePlayerTextDraw(playerid, 597.000000, 436.000000, "Purz_Walker");
	PlayerTextDrawFont(playerid, SDname[playerid], 1);
	PlayerTextDrawLetterSize(playerid, SDname[playerid], 0.170833, 0.850000);
	PlayerTextDrawTextSize(playerid, SDname[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, SDname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SDname[playerid], 0);
	PlayerTextDrawAlignment(playerid, SDname[playerid], 1);
	PlayerTextDrawColor(playerid, SDname[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, SDname[playerid], 255);
	PlayerTextDrawBoxColor(playerid, SDname[playerid], 50);
	PlayerTextDrawUseBox(playerid, SDname[playerid], 0);
	PlayerTextDrawSetProportional(playerid, SDname[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, SDname[playerid], 0);
	
	SDmoney[playerid] = CreatePlayerTextDraw(playerid, 591.000000, 358.000000, "$100,00");
	PlayerTextDrawFont(playerid, SDmoney[playerid], 3);
	PlayerTextDrawLetterSize(playerid, SDmoney[playerid], 0.229166, 0.949998);
	PlayerTextDrawTextSize(playerid, SDmoney[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, SDmoney[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SDmoney[playerid], 0);
	PlayerTextDrawAlignment(playerid, SDmoney[playerid], 1);
	PlayerTextDrawColor(playerid, SDmoney[playerid], 852308735);
	PlayerTextDrawBackgroundColor(playerid, SDmoney[playerid], 255);
	PlayerTextDrawBoxColor(playerid, SDmoney[playerid], 50);
	PlayerTextDrawUseBox(playerid, SDmoney[playerid], 0);
	PlayerTextDrawSetProportional(playerid, SDmoney[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, SDmoney[playerid], 0);
	
	
	//edit toys td
	EditToysTD[playerid][0] = CreatePlayerTextDraw(playerid, 174.000000, 160.000000, "_");
	PlayerTextDrawFont(playerid, EditToysTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, EditToysTD[playerid][0], 0.266665, 11.750000);
	PlayerTextDrawTextSize(playerid, EditToysTD[playerid][0], 298.500000, 83.500000);
	PlayerTextDrawSetOutline(playerid, EditToysTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, EditToysTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, EditToysTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, EditToysTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, EditToysTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, EditToysTD[playerid][0], -1061109690);
	PlayerTextDrawUseBox(playerid, EditToysTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, EditToysTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, EditToysTD[playerid][0], 0);

	EditToysTD[playerid][1] = CreatePlayerTextDraw(playerid, 84.000000, 160.000000, "_");
	PlayerTextDrawFont(playerid, EditToysTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, EditToysTD[playerid][1], 0.266665, 11.750000);
	PlayerTextDrawTextSize(playerid, EditToysTD[playerid][1], 298.500000, 83.500000);
	PlayerTextDrawSetOutline(playerid, EditToysTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, EditToysTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, EditToysTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, EditToysTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, EditToysTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, EditToysTD[playerid][1], -1061109690);
	PlayerTextDrawUseBox(playerid, EditToysTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, EditToysTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, EditToysTD[playerid][1], 0);

	EditToysTD[playerid][2] = CreatePlayerTextDraw(playerid, 84.000000, 171.000000, "_");
	PlayerTextDrawFont(playerid, EditToysTD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, EditToysTD[playerid][2], 0.600000, 9.200007);
	PlayerTextDrawTextSize(playerid, EditToysTD[playerid][2], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, EditToysTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, EditToysTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, EditToysTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, EditToysTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, EditToysTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, EditToysTD[playerid][2], 135);
	PlayerTextDrawUseBox(playerid, EditToysTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, EditToysTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, EditToysTD[playerid][2], 0);

	ToysTDdown[playerid] = CreatePlayerTextDraw(playerid, 74.000000, 229.000000, "ld_beat:down");
	PlayerTextDrawFont(playerid, ToysTDdown[playerid], 4);
	PlayerTextDrawLetterSize(playerid, ToysTDdown[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ToysTDdown[playerid], 20.000000, 24.000000);
	PlayerTextDrawSetOutline(playerid, ToysTDdown[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ToysTDdown[playerid], 0);
	PlayerTextDrawAlignment(playerid, ToysTDdown[playerid], 1);
	PlayerTextDrawColor(playerid, ToysTDdown[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, ToysTDdown[playerid], 255);
	PlayerTextDrawBoxColor(playerid, ToysTDdown[playerid], 50);
	PlayerTextDrawUseBox(playerid, ToysTDdown[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ToysTDdown[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ToysTDdown[playerid], 1);

	ToysTDup[playerid] = CreatePlayerTextDraw(playerid, 74.000000, 174.000000, "ld_beat:up");
	PlayerTextDrawFont(playerid, ToysTDup[playerid], 4);
	PlayerTextDrawLetterSize(playerid, ToysTDup[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ToysTDup[playerid], 20.000000, 24.000000);
	PlayerTextDrawSetOutline(playerid, ToysTDup[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ToysTDup[playerid], 0);
	PlayerTextDrawAlignment(playerid, ToysTDup[playerid], 1);
	PlayerTextDrawColor(playerid, ToysTDup[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, ToysTDup[playerid], 255);
	PlayerTextDrawBoxColor(playerid, ToysTDup[playerid], 50);
	PlayerTextDrawUseBox(playerid, ToysTDup[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ToysTDup[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ToysTDup[playerid], 1);

	EditToysTD[playerid][3] = CreatePlayerTextDraw(playerid, 174.000000, 171.000000, "_");
	PlayerTextDrawFont(playerid, EditToysTD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, EditToysTD[playerid][3], 0.600000, 9.200007);
	PlayerTextDrawTextSize(playerid, EditToysTD[playerid][3], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, EditToysTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, EditToysTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, EditToysTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, EditToysTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, EditToysTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, EditToysTD[playerid][3], 135);
	PlayerTextDrawUseBox(playerid, EditToysTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, EditToysTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, EditToysTD[playerid][3], 0);

	ToysTDsave[playerid] = CreatePlayerTextDraw(playerid, 174.000000, 270.000000, "SAVE");
	PlayerTextDrawFont(playerid, ToysTDsave[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ToysTDsave[playerid], 0.600000, 1.600000);
	PlayerTextDrawTextSize(playerid, ToysTDsave[playerid], 298.500000, 83.500000);
	PlayerTextDrawSetOutline(playerid, ToysTDsave[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ToysTDsave[playerid], 0);
	PlayerTextDrawAlignment(playerid, ToysTDsave[playerid], 2);
	PlayerTextDrawColor(playerid, ToysTDsave[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, ToysTDsave[playerid], 255);
	PlayerTextDrawBoxColor(playerid, ToysTDsave[playerid], 135);
	PlayerTextDrawUseBox(playerid, ToysTDsave[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ToysTDsave[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ToysTDsave[playerid], 1);

	ToysTDedit[playerid] = CreatePlayerTextDraw(playerid, 84.000000, 270.000000, "EDIT");
	PlayerTextDrawFont(playerid, ToysTDedit[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ToysTDedit[playerid], 0.600000, 1.600000);
	PlayerTextDrawTextSize(playerid, ToysTDedit[playerid], 298.500000, 83.000000);
	PlayerTextDrawSetOutline(playerid, ToysTDedit[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ToysTDedit[playerid], 0);
	PlayerTextDrawAlignment(playerid, ToysTDedit[playerid], 2);
	PlayerTextDrawColor(playerid, ToysTDedit[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, ToysTDedit[playerid], 255);
	PlayerTextDrawBoxColor(playerid, ToysTDedit[playerid], 135);
	PlayerTextDrawUseBox(playerid, ToysTDedit[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ToysTDedit[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ToysTDedit[playerid], 1);

	EditToysTD[playerid][4] = CreatePlayerTextDraw(playerid, 174.000000, 206.000000, "0.00000");
	PlayerTextDrawFont(playerid, EditToysTD[playerid][4], 3);
	PlayerTextDrawLetterSize(playerid, EditToysTD[playerid][4], 0.479166, 1.400007);
	PlayerTextDrawTextSize(playerid, EditToysTD[playerid][4], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, EditToysTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, EditToysTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, EditToysTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, EditToysTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, EditToysTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, EditToysTD[playerid][4], 16777102);
	PlayerTextDrawUseBox(playerid, EditToysTD[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, EditToysTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, EditToysTD[playerid][4], 0);

	//VEHICLE OBJECT EDIT TEXTDRAW
	EditVObjTD[playerid][0] = CreatePlayerTextDraw(playerid, 263.000000, 406.000000, "_");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][0], 0.154164, 2.700001);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][0], 1.000000, 282.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][0], -741092407);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][0], 0);

	EditVObjTD[playerid][1] = CreatePlayerTextDraw(playerid, 263.000000, 362.000000, "_");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][1], 0.154164, 9.150011);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][1], 1.000000, 94.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][1], -741092407);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][1], 0);

	EditVObjTD[playerid][2] = CreatePlayerTextDraw(playerid, 358.000000, 408.000000, "+");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][2], 0.258332, 2.149998);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][2], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][2], 1296911816);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][2], 1);

	EditVObjTD[playerid][3] = CreatePlayerTextDraw(playerid, 169.000000, 408.000000, "-");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][3], 0.258332, 2.149998);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][3], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][3], 1296911816);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][3], 1);

	EditVObjTD[playerid][4] = CreatePlayerTextDraw(playerid, 263.000000, 389.000000, "SAVE");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][4], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][4], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][4], 16711881);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][4], 1);

	EditVObjTD[playerid][5] = CreatePlayerTextDraw(playerid, 264.000000, 409.000000, "Cordinate");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][5], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][5], 16.500000, 92.000000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][5], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][5], 1296911817);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][5], 0);

	EditVObjTD[playerid][6] = CreatePlayerTextDraw(playerid, 263.000000, 429.000000, "BACK");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][6], 0.258332, 1.450000);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][6], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][6], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][6], -16777015);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][6], 1);

	EditVObjTD[playerid][7] = CreatePlayerTextDraw(playerid, 263.000000, 366.000000, "EDITING");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][7], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][7], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][7], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][7], -1378294071);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][7], 1);

// Speedo
	PlayerSpeedoTD[playerid][0] = CreatePlayerTextDraw(playerid, 539.000000, 437.000000, "Sultan_Sultan");
	PlayerTextDrawFont(playerid, PlayerSpeedoTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, PlayerSpeedoTD[playerid][0], 0.162499, 0.699998);
	PlayerTextDrawTextSize(playerid, PlayerSpeedoTD[playerid][0], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PlayerSpeedoTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, PlayerSpeedoTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, PlayerSpeedoTD[playerid][0], 1);
	PlayerTextDrawColor(playerid, PlayerSpeedoTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerSpeedoTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, PlayerSpeedoTD[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, PlayerSpeedoTD[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, PlayerSpeedoTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerSpeedoTD[playerid][0], 0);
	
	PlayerSpeedoTD[playerid][1] = CreatePlayerTextDraw(playerid, 548.000000, 401.000000, "100");
	PlayerTextDrawFont(playerid, PlayerSpeedoTD[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, PlayerSpeedoTD[playerid][1], 0.429164, 2.999999);
	PlayerTextDrawTextSize(playerid, PlayerSpeedoTD[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PlayerSpeedoTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, PlayerSpeedoTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, PlayerSpeedoTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, PlayerSpeedoTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerSpeedoTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, PlayerSpeedoTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, PlayerSpeedoTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, PlayerSpeedoTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerSpeedoTD[playerid][1], 0);


	PlayerSpeedoTD[playerid][2] = CreatePlayerTextDraw(playerid, 539.000000, 399.000000, "On");
	PlayerTextDrawFont(playerid, PlayerSpeedoTD[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, PlayerSpeedoTD[playerid][2], 0.183330, 1.299998);
	PlayerTextDrawTextSize(playerid, PlayerSpeedoTD[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PlayerSpeedoTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, PlayerSpeedoTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, PlayerSpeedoTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, PlayerSpeedoTD[playerid][2], 852308735);
	PlayerTextDrawBackgroundColor(playerid, PlayerSpeedoTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, PlayerSpeedoTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, PlayerSpeedoTD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, PlayerSpeedoTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerSpeedoTD[playerid][2], 0);
}

CreateTextDraw()
{
	//Date and Time
	TextDate = TextDrawCreate(82.000000, 428.000000,"--");
	TextDrawBackgroundColor(TextDate, 255);
	TextDrawFont(TextDate, 1);
	TextDrawTextSize(TextDate, 735.500000, 610.000000);
	TextDrawLetterSize(TextDate, 0.269998, 1.405864);
	TextDrawSetOutline(TextDate, 1);
	TextDrawSetProportional(TextDate, 1);
	TextDrawAlignment(TextDate, 3);
	TextDrawSetShadow(TextDate, 1);
	TextDrawColor(TextDate,0xFFFFFFFF);

	TextTime = TextDrawCreate(547.5, 25.33,"--");
	TextDrawLetterSize(TextTime,0.330000, 1.100000);
	TextDrawFont(TextTime , 2);
	TextDrawSetOutline(TextTime , 1);
    TextDrawSetProportional(TextTime , 1);
	TextDrawBackgroundColor(TextTime, 255);
	TextDrawSetShadow(TextTime, 1);
	TextDrawColor(TextTime,0xFFFFFFFF);

	//TD Waktu
	td_waktu = TextDrawCreate(550.000000, 29.000000, "[00:00:00]");
    TextDrawFont(td_waktu, 1);
    TextDrawLetterSize(td_waktu, 0.270832, 1.600000);
    TextDrawTextSize(td_waktu, 400.000000, 17.000000);
    TextDrawSetOutline(td_waktu, 1);
    TextDrawSetShadow(td_waktu, 0);
    TextDrawAlignment(td_waktu, 1);
    TextDrawColor(td_waktu, -1);
    TextDrawBackgroundColor(td_waktu, 255);
    TextDrawBoxColor(td_waktu, 50);
    TextDrawUseBox(td_waktu, 0);
    TextDrawSetProportional(td_waktu, 1);
    TextDrawSetSelectable(td_waktu, 0);

	//Server Name
	SOIRP_TXD = TextDrawCreate(499.999267, 6.471089, "~r~Society ~y~of ~w~Indonesia");
	TextDrawLetterSize(SOIRP_TXD, 0.269998, 1.405864);
	TextDrawAlignment(SOIRP_TXD, 1);
	TextDrawColor(SOIRP_TXD, -1);
	TextDrawSetShadow(SOIRP_TXD, 0);
	TextDrawSetOutline(SOIRP_TXD, 1);
	TextDrawBackgroundColor(SOIRP_TXD, 0x000000FF);
	TextDrawFont(SOIRP_TXD, 1);
	TextDrawSetProportional(SOIRP_TXD, 1);

	//HBE textdraw Modern
	TDEditor_TD[0] = TextDrawCreate(531.000000, 365.583435, "LD_SPAC:white");
	TextDrawLetterSize(TDEditor_TD[0], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[0], 164.000000, 109.000000);
	TextDrawAlignment(TDEditor_TD[0], 1);
	TextDrawColor(TDEditor_TD[0], 120);
	TextDrawSetShadow(TDEditor_TD[0], 0);
	TextDrawSetOutline(TDEditor_TD[0], 0);
	TextDrawBackgroundColor(TDEditor_TD[0], 255);
	TextDrawFont(TDEditor_TD[0], 4);
	TextDrawSetProportional(TDEditor_TD[0], 0);
	TextDrawSetShadow(TDEditor_TD[0], 0);

	TDEditor_TD[1] = TextDrawCreate(533.000000, 367.916778, "LD_SPAC:white");
	TextDrawLetterSize(TDEditor_TD[1], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[1], 105.000000, 13.000000);
	TextDrawAlignment(TDEditor_TD[1], 1);
	TextDrawColor(TDEditor_TD[1], -16776961);
	TextDrawSetShadow(TDEditor_TD[1], 0);
	TextDrawSetOutline(TDEditor_TD[1], 0);
	TextDrawBackgroundColor(TDEditor_TD[1], 255);
	TextDrawFont(TDEditor_TD[1], 4);
	TextDrawSetProportional(TDEditor_TD[1], 0);
	TextDrawSetShadow(TDEditor_TD[1], 0);

	TDEditor_TD[2] = TextDrawCreate(543.500000, 399.416625, "");
	TextDrawLetterSize(TDEditor_TD[2], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[2], 15.000000, 20.000000);
	TextDrawAlignment(TDEditor_TD[2], 1);
	TextDrawColor(TDEditor_TD[2], -1);
	TextDrawSetShadow(TDEditor_TD[2], 0);
	TextDrawSetOutline(TDEditor_TD[2], 0);
	TextDrawBackgroundColor(TDEditor_TD[2], 0);
	TextDrawFont(TDEditor_TD[2], 5);
	TextDrawSetProportional(TDEditor_TD[2], 0);
	TextDrawSetShadow(TDEditor_TD[2], 0);
	TextDrawSetPreviewModel(TDEditor_TD[2], 2703);
	TextDrawSetPreviewRot(TDEditor_TD[2], 0.000000, 90.000000, 80.000000, 1.000000);

	TDEditor_TD[3] = TextDrawCreate(536.500000, 414.000030, "");
	TextDrawLetterSize(TDEditor_TD[3], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[3], 26.000000, 19.000000);
	TextDrawAlignment(TDEditor_TD[3], 1);
	TextDrawColor(TDEditor_TD[3], -1);
	TextDrawSetShadow(TDEditor_TD[3], 0);
	TextDrawSetOutline(TDEditor_TD[3], 0);
	TextDrawBackgroundColor(TDEditor_TD[3], 0);
	TextDrawFont(TDEditor_TD[3], 5);
	TextDrawSetProportional(TDEditor_TD[3], 0);
	TextDrawSetShadow(TDEditor_TD[3], 0);
	TextDrawSetPreviewModel(TDEditor_TD[3], 1546);
	TextDrawSetPreviewRot(TDEditor_TD[3], 0.000000, 0.000000, 200.000000, 1.000000);

	TDEditor_TD[4] = TextDrawCreate(543.000000, 428.000030, "");
	TextDrawLetterSize(TDEditor_TD[4], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[4], 17.000000, 17.000000);
	TextDrawAlignment(TDEditor_TD[4], 1);
	TextDrawColor(TDEditor_TD[4], -1);
	TextDrawSetShadow(TDEditor_TD[4], 0);
	TextDrawSetOutline(TDEditor_TD[4], 0);
	TextDrawBackgroundColor(TDEditor_TD[4], 0);
	TextDrawFont(TDEditor_TD[4], 5);
	TextDrawSetProportional(TDEditor_TD[4], 0);
	TextDrawSetShadow(TDEditor_TD[4], 0);
	TextDrawSetPreviewModel(TDEditor_TD[4], 2738);
	TextDrawSetPreviewRot(TDEditor_TD[4], 0.000000, 0.000000, 100.000000, 1.000000);

	TDEditor_TD[5] = TextDrawCreate(425.000000, 365.583557, "LD_SPAC:white");
	TextDrawLetterSize(TDEditor_TD[5], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[5], 102.000000, 92.000000);
	TextDrawAlignment(TDEditor_TD[5], 1);
	TextDrawColor(TDEditor_TD[5], 120);
	TextDrawSetShadow(TDEditor_TD[5], 0);
	TextDrawSetOutline(TDEditor_TD[5], 0);
	TextDrawBackgroundColor(TDEditor_TD[5], 255);
	TextDrawFont(TDEditor_TD[5], 4);
	TextDrawSetProportional(TDEditor_TD[5], 0);
	TextDrawSetShadow(TDEditor_TD[5], 0);

	TDEditor_TD[6] = TextDrawCreate(428.000000, 367.916717, "LD_SPAC:white");
	TextDrawLetterSize(TDEditor_TD[6], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[6], 97.000000, 11.000000);
	TextDrawAlignment(TDEditor_TD[6], 1);
	TextDrawColor(TDEditor_TD[6], -16776961);
	TextDrawSetShadow(TDEditor_TD[6], 0);
	TextDrawSetOutline(TDEditor_TD[6], 0);
	TextDrawBackgroundColor(TDEditor_TD[6], 255);
	TextDrawFont(TDEditor_TD[6], 4);
	TextDrawSetProportional(TDEditor_TD[6], 0);
	TextDrawSetShadow(TDEditor_TD[6], 0);

	TDEditor_TD[7] = TextDrawCreate(428.000000, 380.750030, "Engine:");
	TextDrawLetterSize(TDEditor_TD[7], 0.248998, 1.063333);
	TextDrawAlignment(TDEditor_TD[7], 1);
	TextDrawColor(TDEditor_TD[7], -1);
	TextDrawSetShadow(TDEditor_TD[7], 0);
	TextDrawSetOutline(TDEditor_TD[7], 1);
	TextDrawBackgroundColor(TDEditor_TD[7], 255);
	TextDrawFont(TDEditor_TD[7], 1);
	TextDrawSetProportional(TDEditor_TD[7], 1);
	TextDrawSetShadow(TDEditor_TD[7], 0);

	TDEditor_TD[8] = TextDrawCreate(428.000000, 389.499969, "Speed:");
	TextDrawLetterSize(TDEditor_TD[8], 0.266499, 1.191666);
	TextDrawAlignment(TDEditor_TD[8], 1);
	TextDrawColor(TDEditor_TD[8], -1);
	TextDrawSetShadow(TDEditor_TD[8], 0);
	TextDrawSetOutline(TDEditor_TD[8], 1);
	TextDrawBackgroundColor(TDEditor_TD[8], 255);
	TextDrawFont(TDEditor_TD[8], 1);
	TextDrawSetProportional(TDEditor_TD[8], 1);
	TextDrawSetShadow(TDEditor_TD[8], 0);

	TDEditor_TD[9] = TextDrawCreate(437.000000, 411.083343, "");
	TextDrawLetterSize(TDEditor_TD[9], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[9], 13.000000, 18.000000);
	TextDrawAlignment(TDEditor_TD[9], 1);
	TextDrawColor(TDEditor_TD[9], -1);
	TextDrawSetShadow(TDEditor_TD[9], 0);
	TextDrawSetOutline(TDEditor_TD[9], 0);
	TextDrawBackgroundColor(TDEditor_TD[9], 0);
	TextDrawFont(TDEditor_TD[9], 5);
	TextDrawSetProportional(TDEditor_TD[9], 0);
	TextDrawSetShadow(TDEditor_TD[9], 0);
	TextDrawSetPreviewModel(TDEditor_TD[9], 1240);
	TextDrawSetPreviewRot(TDEditor_TD[9], 0.000000, 0.000000, 0.000000, 1.000000);

	TDEditor_TD[10] = TextDrawCreate(434.500000, 425.666595, "");
	TextDrawLetterSize(TDEditor_TD[10], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[10], 20.000000, 21.000000);
	TextDrawAlignment(TDEditor_TD[10], 1);
	TextDrawColor(TDEditor_TD[10], -1);
	TextDrawSetShadow(TDEditor_TD[10], 0);
	TextDrawSetOutline(TDEditor_TD[10], 0);
	TextDrawBackgroundColor(TDEditor_TD[10], 0);
	TextDrawFont(TDEditor_TD[10], 5);
	TextDrawSetProportional(TDEditor_TD[10], 0);
	TextDrawSetShadow(TDEditor_TD[10], 0);
	TextDrawSetPreviewModel(TDEditor_TD[10], 1650);
	TextDrawSetPreviewRot(TDEditor_TD[10], 0.000000, 0.000000, 0.000000, 1.000000);

	TDEditor_TD[11] = TextDrawCreate(427.000000, 400.583374, "Fare:");
	TextDrawLetterSize(TDEditor_TD[11], 0.360498, 1.022500);
	TextDrawAlignment(TDEditor_TD[11], 1);
	TextDrawColor(TDEditor_TD[11], -1);
	TextDrawSetShadow(TDEditor_TD[11], 0);
	TextDrawSetOutline(TDEditor_TD[11], 1);
	TextDrawBackgroundColor(TDEditor_TD[11], 255);
	TextDrawFont(TDEditor_TD[11], 1);
	TextDrawSetProportional(TDEditor_TD[11], 1);
	TextDrawSetShadow(TDEditor_TD[11], 0);

	/*/HBE textdraw Simple
	TDEditor_TD[12] = TextDrawCreate(450.500000, 428.000091, "LD_SPAC:white");
	TextDrawLetterSize(TDEditor_TD[12], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[12], 191.000000, 27.000000);
	TextDrawAlignment(TDEditor_TD[12], 1);
	TextDrawColor(TDEditor_TD[12], 175);
	TextDrawSetShadow(TDEditor_TD[12], 0);
	TextDrawSetOutline(TDEditor_TD[12], 0);
	TextDrawBackgroundColor(TDEditor_TD[12], 255);
	TextDrawFont(TDEditor_TD[12], 4);
	TextDrawSetProportional(TDEditor_TD[12], 0);
	TextDrawSetShadow(TDEditor_TD[12], 0);

	TDEditor_TD[13] = TextDrawCreate(450.000000, 422.166778, "");
	TextDrawLetterSize(TDEditor_TD[13], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[13], 17.000000, 34.000000);
	TextDrawAlignment(TDEditor_TD[13], 1);
	TextDrawColor(TDEditor_TD[13], -1);
	TextDrawSetShadow(TDEditor_TD[13], 0);
	TextDrawSetOutline(TDEditor_TD[13], 0);
	TextDrawBackgroundColor(TDEditor_TD[13], 0);
	TextDrawFont(TDEditor_TD[13], 5);
	TextDrawSetProportional(TDEditor_TD[13], 0);
	TextDrawSetShadow(TDEditor_TD[13], 0);
	TextDrawSetPreviewModel(TDEditor_TD[13], 2703);
	TextDrawSetPreviewRot(TDEditor_TD[13], 100.000000, 0.000000, -10.000000, 1.000000);

	TDEditor_TD[14] = TextDrawCreate(507.500000, 429.166748, "");
	TextDrawLetterSize(TDEditor_TD[14], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[14], 25.000000, 20.000000);
	TextDrawAlignment(TDEditor_TD[14], 1);
	TextDrawColor(TDEditor_TD[14], -1);
	TextDrawSetShadow(TDEditor_TD[14], 0);
	TextDrawSetOutline(TDEditor_TD[14], 0);
	TextDrawBackgroundColor(TDEditor_TD[14], 0);
	TextDrawFont(TDEditor_TD[14], 5);
	TextDrawSetProportional(TDEditor_TD[14], 0);
	TextDrawSetShadow(TDEditor_TD[14], 0);
	TextDrawSetPreviewModel(TDEditor_TD[14], 1546);
	TextDrawSetPreviewRot(TDEditor_TD[14], 0.000000, 0.000000, 100.000000, 1.000000);

	TDEditor_TD[15] = TextDrawCreate(574.500000, 427.999969, "");
	TextDrawLetterSize(TDEditor_TD[15], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[15], 20.000000, 19.000000);
	TextDrawAlignment(TDEditor_TD[15], 1);
	TextDrawColor(TDEditor_TD[15], -1);
	TextDrawSetShadow(TDEditor_TD[15], 0);
	TextDrawSetOutline(TDEditor_TD[15], 0);
	TextDrawBackgroundColor(TDEditor_TD[15], 0);
	TextDrawFont(TDEditor_TD[15], 5);
	TextDrawSetProportional(TDEditor_TD[15], 0);
	TextDrawSetShadow(TDEditor_TD[15], 0);
	TextDrawSetPreviewModel(TDEditor_TD[15], 2738);
	TextDrawSetPreviewRot(TDEditor_TD[15], 0.000000, 0.000000, 100.000000, 1.000000);

	TDEditor_TD[16] = TextDrawCreate(533.000000, 365.000061, "LD_SPAC:white");
	TextDrawLetterSize(TDEditor_TD[16], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[16], 105.000000, 62.000000);
	TextDrawAlignment(TDEditor_TD[16], 1);
	TextDrawColor(TDEditor_TD[16], 175);
	TextDrawSetShadow(TDEditor_TD[16], 0);
	TextDrawSetOutline(TDEditor_TD[16], 0);
	TextDrawBackgroundColor(TDEditor_TD[16], 255);
	TextDrawFont(TDEditor_TD[16], 4);
	TextDrawSetProportional(TDEditor_TD[16], 0);
	TextDrawSetShadow(TDEditor_TD[16], 0);

	TDEditor_TD[17] = TextDrawCreate(550.000000, 378.999938, "");
	TextDrawLetterSize(TDEditor_TD[17], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[17], 11.000000, 14.000000);
	TextDrawAlignment(TDEditor_TD[17], 1);
	TextDrawColor(TDEditor_TD[17], -1);
	TextDrawSetShadow(TDEditor_TD[17], 0);
	TextDrawSetOutline(TDEditor_TD[17], 0);
	TextDrawBackgroundColor(TDEditor_TD[17], 0);
	TextDrawFont(TDEditor_TD[17], 5);
	TextDrawSetProportional(TDEditor_TD[17], 0);
	TextDrawSetShadow(TDEditor_TD[17], 0);
	TextDrawSetPreviewModel(TDEditor_TD[17], 1240);
	TextDrawSetPreviewRot(TDEditor_TD[17], 0.000000, 0.000000, 0.000000, 1.000000);

	TDEditor_TD[18] = TextDrawCreate(546.500000, 391.249938, "");
	TextDrawLetterSize(TDEditor_TD[18], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[18], 18.000000, 19.000000);
	TextDrawAlignment(TDEditor_TD[18], 1);
	TextDrawColor(TDEditor_TD[18], -1);
	TextDrawSetShadow(TDEditor_TD[18], 0);
	TextDrawSetOutline(TDEditor_TD[18], 0);
	TextDrawBackgroundColor(TDEditor_TD[18], 0);
	TextDrawFont(TDEditor_TD[18], 5);
	TextDrawSetProportional(TDEditor_TD[18], 0);
	TextDrawSetShadow(TDEditor_TD[18], 0);
	TextDrawSetPreviewModel(TDEditor_TD[18], 1650);
	TextDrawSetPreviewRot(TDEditor_TD[18], 0.000000, 0.000000, 0.000000, 1.000000);*/

	// HUD hbe
	HBE_TD[0] = TextDrawCreate(622.000000, 358.000000, "_");
	TextDrawFont(HBE_TD[0], 0);
	TextDrawLetterSize(HBE_TD[0], 1.016664, 4.399979);
	TextDrawTextSize(HBE_TD[0], 300.500000, 65.500000);
	TextDrawSetOutline(HBE_TD[0], 1);
	TextDrawSetShadow(HBE_TD[0], 0);
	TextDrawAlignment(HBE_TD[0], 2);
	TextDrawColor(HBE_TD[0], -1);
	TextDrawBackgroundColor(HBE_TD[0], 255);
	TextDrawBoxColor(HBE_TD[0], 135);
	TextDrawUseBox(HBE_TD[0], 1);
	TextDrawSetProportional(HBE_TD[0], 1);
	TextDrawSetSelectable(HBE_TD[0], 0);


	HBE_TD[1] = TextDrawCreate(591.000000, 368.000000, "HUD:radar_pizza");
	TextDrawFont(HBE_TD[1], 4);
	TextDrawLetterSize(HBE_TD[1], 0.600000, 2.000000);
	TextDrawTextSize(HBE_TD[1], 11.500000, 13.500000);
	TextDrawSetOutline(HBE_TD[1], 1);
	TextDrawSetShadow(HBE_TD[1], 0);
	TextDrawAlignment(HBE_TD[1], 1);
	TextDrawColor(HBE_TD[1], -1);
	TextDrawBackgroundColor(HBE_TD[1], 255);
	TextDrawBoxColor(HBE_TD[1], 50);
	TextDrawUseBox(HBE_TD[1], 1);
	TextDrawSetProportional(HBE_TD[1], 1);
	TextDrawSetSelectable(HBE_TD[1], 0);

	HBE_TD[2] = TextDrawCreate(591.000000, 385.000000, "HUD:radar_diner");
	TextDrawFont(HBE_TD[2], 4);
	TextDrawLetterSize(HBE_TD[2], 0.600000, 2.000000);
	TextDrawTextSize(HBE_TD[2], 12.000000, 11.000000);
	TextDrawSetOutline(HBE_TD[2], 1);
	TextDrawSetShadow(HBE_TD[2], 0);
	TextDrawAlignment(HBE_TD[2], 1);
	TextDrawColor(HBE_TD[2], -1);
	TextDrawBackgroundColor(HBE_TD[2], 255);
	TextDrawBoxColor(HBE_TD[2], 50);
	TextDrawUseBox(HBE_TD[2], 1);
	TextDrawSetProportional(HBE_TD[2], 1);
	TextDrawSetSelectable(HBE_TD[2], 0);

// SPEEDO
	SpeedoTD[0] = TextDrawCreate(593.000000, 401.000000, "_");
	TextDrawFont(SpeedoTD[0], 0);
	TextDrawLetterSize(SpeedoTD[0], 1.016664, 3.549978);
	TextDrawTextSize(SpeedoTD[0], 310.000000, 108.000000);
	TextDrawSetOutline(SpeedoTD[0], 1);
	TextDrawSetShadow(SpeedoTD[0], 0);
	TextDrawAlignment(SpeedoTD[0], 2);
	TextDrawColor(SpeedoTD[0], -1);
	TextDrawBackgroundColor(SpeedoTD[0], 255);
	TextDrawBoxColor(SpeedoTD[0], 135);
	TextDrawUseBox(SpeedoTD[0], 1);
	TextDrawSetProportional(SpeedoTD[0], 1);
	TextDrawSetSelectable(SpeedoTD[0], 0);

	SpeedoTD[1] = TextDrawCreate(591.000000, 400.000000, "HUD:radar_impound");
	TextDrawFont(SpeedoTD[1], 4);
	TextDrawLetterSize(SpeedoTD[1], 0.600000, 2.000000);
	TextDrawTextSize(SpeedoTD[1], 11.000000, 11.500000);
	TextDrawSetOutline(SpeedoTD[1], 1);
	TextDrawSetShadow(SpeedoTD[1], 0);
	TextDrawAlignment(SpeedoTD[1], 1);
	TextDrawColor(SpeedoTD[1], -1);
	TextDrawBackgroundColor(SpeedoTD[1], 255);
	TextDrawBoxColor(SpeedoTD[1], 50);
	TextDrawUseBox(SpeedoTD[1], 1);
	TextDrawSetProportional(SpeedoTD[1], 1);
	TextDrawSetSelectable(SpeedoTD[1], 0);

	SpeedoTD[2] = TextDrawCreate(591.000000, 416.000000, "HUD:radar_spray");
	TextDrawFont(SpeedoTD[2], 4);
	TextDrawLetterSize(SpeedoTD[2], 0.600000, 2.000000);
	TextDrawTextSize(SpeedoTD[2], 11.000000, 11.500000);
	TextDrawSetOutline(SpeedoTD[2], 1);
	TextDrawSetShadow(SpeedoTD[2], 0);
	TextDrawAlignment(SpeedoTD[2], 1);
	TextDrawColor(SpeedoTD[2], -1);
	TextDrawBackgroundColor(SpeedoTD[2], 255);
	TextDrawBoxColor(SpeedoTD[2], 50);
	TextDrawUseBox(SpeedoTD[2], 1);
	TextDrawSetProportional(SpeedoTD[2], 1);
	TextDrawSetSelectable(SpeedoTD[2], 0);
	
	SpeedoTD[3] = TextDrawCreate(574.000000, 425.000000, "Km/h");
	TextDrawFont(SpeedoTD[3], 1);
	TextDrawLetterSize(SpeedoTD[3], 0.191667, 0.850000);
	TextDrawTextSize(SpeedoTD[3], 400.000000, 17.000000);
	TextDrawSetOutline(SpeedoTD[3], 1);
	TextDrawSetShadow(SpeedoTD[3], 0);
	TextDrawAlignment(SpeedoTD[3], 1);
	TextDrawColor(SpeedoTD[3], 16711935);
	TextDrawBackgroundColor(SpeedoTD[3], 255);
	TextDrawBoxColor(SpeedoTD[3], 50);
	TextDrawUseBox(SpeedoTD[3], 0);
	TextDrawSetProportional(SpeedoTD[3], 1);
	TextDrawSetSelectable(SpeedoTD[3], 0);

}

