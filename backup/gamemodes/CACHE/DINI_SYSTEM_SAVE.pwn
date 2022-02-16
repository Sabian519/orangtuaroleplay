//=============== DATABASE SAVE ACCOUNT DINI SYSTEM ==============

//**************
new File[99899]; // VARIABLES
//**************

//*********************************
// CRATES TRUCKER JOBS DINI SYSTEM
//*********************************
enum C_PLAYERS
{
	vCrateFish,
	vCrateCompo,
	vCrateMats,
	// Depositor
	vBankMoney,
	vDepositorAlat,
};
new vCrateData[MAX_PLAYERS][C_PLAYERS];
//*********************************
forward SavePlayerAccount(playerid);
public SavePlayerAccount(playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	format(File, sizeof(File), "BaseDini/Account/%s.ini", pData[playerid][pName]);
	if( dini_Exists( File ) )
	{
		// Saved Dini Sistem
		dini_IntSet(File, "DMV_Proof", pData[playerid][pDMVProof]);
		dini_IntSet(File, "Alat_Robbery", pData[playerid][pAlatRob]);
        dini_IntSet(File, "character_story", pData[playerid][pCharacterStory]);
        dini_IntSet(File, "starterpack", pData[playerid][pStarterpack]);
        dini_IntSet(File, "boombox", pData[playerid][pBoombox]);
        dini_IntSet(File, "delays_smuggler", pData[playerid][pSmugglerTime]);
        dini_IntSet(File, "delays_lumber", pData[playerid][pLumberTime]);
        dini_IntSet(File, "delays_production", pData[playerid][pProductionTime]);
        dini_IntSet(File, "delays_trucker", pData[playerid][pTruckerTime]);
        dini_IntSet(File, "delays_depositor", pData[playerid][pDepositorTime]);
        // Vehicle Stock Save
        dini_IntSet(File, "dapat_cratefish", vCrateData[vehicleid][vCrateFish]);
        dini_IntSet(File, "dapat_cratecompo", vCrateData[vehicleid][vCrateCompo]);
        dini_IntSet(File, "dapat_cratematerial", vCrateData[vehicleid][vCrateMats]);
        dini_IntSet(File, "depositor_loadmoney", vCrateData[playerid][vBankMoney]);
        dini_IntSet(File, "depositor_alat", vCrateData[playerid][vDepositorAlat]);
	}
}
forward LoadPlayerAccount(playerid);
public LoadPlayerAccount(playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	format( File, sizeof( File ), "BaseDini/Account/%s.ini", pData[playerid][pName]);
    if(dini_Exists(File))//Buat load data user(dikarenakan sudah ada datanya)
    {
		// Load Dini Sistem
		pData[playerid][pDMVProof] = dini_Int( File,"DMV_Proof");
		pData[playerid][pAlatRob] = dini_Int( File,"Alat_Robbery");
		pData[playerid][pCharacterStory] = dini_Int( File,"character_story");
		pData[playerid][pStarterpack] = dini_Int( File,"starterpack");
		pData[playerid][pBoombox] = dini_Int( File,"boombox");
		pData[playerid][pSmugglerTime] = dini_Int( File,"delays_smuggler");
		pData[playerid][pLumberTime] = dini_Int( File,"delays_lumber");
		pData[playerid][pProductionTime] = dini_Int( File,"delays_production");
		pData[playerid][pTruckerTime] = dini_Int( File,"delays_trucker");
		pData[playerid][pDepositorTime] = dini_Int( File,"delays_depositor");
		// Vehicle Stock Save
        vCrateData[vehicleid][vCrateFish] = dini_Int( File,"dapat_cratefish");
        vCrateData[vehicleid][vCrateCompo] = dini_Int( File,"dapat_cratecompo");
        vCrateData[vehicleid][vCrateMats] = dini_Int( File,"dapat_cratematerial");
        vCrateData[vehicleid][vBankMoney] = dini_Int( File,"depositor_loadmoney");
        vCrateData[vehicleid][vDepositorAlat] = dini_Int( File,"depositor_alat");
    }
    else //Buat user baru(Bikin file buat pemain baru dafar)
    {
    	dini_Create( File );
    	dini_IntSet(File, "DMV_Proof", 0);
    	dini_IntSet(File, "Alat_Robbery", 0);
    	dini_IntSet(File, "character_story", 0);
    	dini_IntSet(File, "starterpack", 0);
    	dini_IntSet(File, "boombox", 0);
    	dini_IntSet(File, "delays_smuggler", 0);
    	dini_IntSet(File, "delays_lumber", 0);
    	dini_IntSet(File, "delays_production", 0);
    	dini_IntSet(File, "delays_trucker", 0);
    	dini_IntSet(File, "delays_depositor", 0);
    	// Vehicle Stock Save
        dini_IntSet(File, "dapat_cratefish", 0);
        dini_IntSet(File, "dapat_cratecompo", 0);
        dini_IntSet(File, "dapat_cratematerial", 0);
        dini_IntSet(File, "depositor_loadmoney", 0);
        dini_IntSet(File, "depositor_alat", 0);
        
		pData[playerid][pDMVProof] = dini_Int( File,"DMV_Proof");
		pData[playerid][pAlatRob] = dini_Int( File,"Alat_Robbery");
		pData[playerid][pCharacterStory] = dini_Int( File,"character_story");
		pData[playerid][pStarterpack] = dini_Int( File,"starterpack");
		pData[playerid][pBoombox] = dini_Int( File,"boombox");
		pData[playerid][pSmugglerTime] = dini_Int( File,"delays_smuggler");
		pData[playerid][pLumberTime] = dini_Int( File,"delays_lumber");
		pData[playerid][pProductionTime] = dini_Int( File,"delays_production");
		pData[playerid][pTruckerTime] = dini_Int( File,"delays_trucker");
		pData[playerid][pDepositorTime] = dini_Int( File,"delays_depositor");
		//
        vCrateData[vehicleid][vCrateFish] = dini_Int( File,"dapat_cratefish");
        vCrateData[vehicleid][vCrateCompo] = dini_Int( File,"dapat_cratecompo");
        vCrateData[vehicleid][vCrateMats] = dini_Int( File,"dapat_cratematerial");
        vCrateData[vehicleid][vBankMoney] = dini_Int( File,"depositor_loadmoney");
        vCrateData[vehicleid][vDepositorAlat] = dini_Int( File,"depositor_alat");
	 }
}
