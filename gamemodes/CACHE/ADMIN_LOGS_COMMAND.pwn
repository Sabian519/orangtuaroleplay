// ADMIN ABUSE COMMAND //
forward SaveAdminAbuse(playerid);
public SaveAdminAbuse(playerid)
{
	format(File, sizeof(File), "BaseDini/AdminLogs/%s.ini", pData[playerid][pName]);
	if( dini_Exists( File ) )
	{
		// Saved Dini Sistem
        dini_IntSet(File, "Abuse_Money", pData[playerid][aAbuseMoney]);
    }
}

forward LoadAdminAbuse(playerid);
public LoadAdminAbuse(playerid)
{
	format( File, sizeof( File ), "BaseDini/AdminLogs/%s.ini", pData[playerid][pName]);
    if(dini_Exists(File))//Buat load data user(dikarenakan sudah ada datanya)
    {
		// Load Dini Sistem
		pData[playerid][aAbuseMoney] = dini_Int( File,"Abuse_Money");
	}
    else //Buat user baru(Bikin file buat pemain baru dafar)
    {
    	dini_Create( File );
    	dini_IntSet(File, "Abuse_Money", 0);
		pData[playerid][aAbuseMoney] = dini_Int( File,"Abuse_Money");
	}
}
