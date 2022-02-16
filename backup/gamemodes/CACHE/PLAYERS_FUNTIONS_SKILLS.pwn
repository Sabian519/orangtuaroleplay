// Jobs Level
//*********************************
forward SavePlayerSkill(playerid);
public SavePlayerSkill(playerid)
{
	format(File, sizeof(File), "BaseDini/JobsSkill/%s.ini", pData[playerid][pName]);
	if( dini_Exists( File ) )
	{
		// Crates Saved Dini Sistem
        dini_IntSet(File, "Trucker_Level", pData[playerid][pTruckerLevel]);
        dini_IntSet(File, "Trucker_Level_Up", pData[playerid][pTruckerLevelUp]);
	}
}
forward LoadPlayerSkill(playerid);
public LoadPlayerSkill(playerid)
{
	format( File, sizeof( File ), "BaseDini/JobsSkill/%s.ini", pData[playerid][pName]);
    if(dini_Exists(File))//Buat load data user(dikarenakan sudah ada datanya)
    {
		// Load Dini Sistem
		pData[playerid][pTruckerLevel] = dini_Int( File,"Trucker_Level");
		pData[playerid][pTruckerLevelUp] = dini_Int( File,"Trucker_Level_Up");
    }
    else //Buat user baru(Bikin file buat pemain baru dafar)
    {
    	dini_Create( File );
    	dini_IntSet(File, "Trucker_Level", 1);
    	dini_IntSet(File, "Trucker_Level_Up", 5);
		pData[playerid][pTruckerLevel] = dini_Int( File,"Trucker_Level");
		pData[playerid][pTruckerLevelUp] = dini_Int( File,"Trucker_Level_Up");
	 }
}

CMD:skills(playerid, params[])
{
	new String[10000], GaraSkill[10000];
	format(String, sizeof(String), "{F22585}==== Player Skills ====\n");
	strcat(GaraSkill, String);
	format(String, sizeof(String), ""WHITE_E"Trucker Skills: ["YELLOW_E"%d/%d"WHITE_E"]\n", pData[playerid][pTruckerLevel], pData[playerid][pTruckerLevelUp]);
	strcat(GaraSkill, String);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Job Skill Player", GaraSkill, "Close", "");
	return 1;
}

