/*
	Copyright © 2021 SouthLuxury Gamemode RP v1.0.13.

			* SOUTH LUXURY ROLEPLAY SAMP *
			  BASED OF GAMEMODE: LRP v5


	[================== THANKS TO ==================]
	[ + God   + Parents   + Dandy for Base script   ]
	[ + Garaaaaa ( SouthLuxury Developer )          ]
	[ + SouthLuxury RP Staff's                      ]
	[===============================================]

		• GAMEMODE v5.0.1. FIXED. •


	 - Remake It By ( Gara Anggara )

*Changelogs mode v1.0.10.
=============================
+ [ADD] Job Crates Material
+ [CHANGES] Lumberjack Jobs Moved join location
+ [CHANGES] Fixed Dialog Find Vehicles and Fixed
+ [CHANGES] Trunk system fixed use /trunk 2x to crate slot trunk

*Changelogs mode v1.0.11.
============================
+ [ADD] Businees Private Farm/Field
+ [ADD] Business Employe
+ [FIXED] Vehicles track Bug Location And change with ID

*Changelogs Mode v1.0.12.
============================
+ [ADD] Vehicle Modshop system
+ [FIXED] Vehicle object
+ [FIXED] Vehicle unstucked ( Testing )
*/

/* ========= INCLUDE ======== */
#include <a_samp>
#undef MAX_PLAYERS
#define MAX_PLAYERS	100
#include <crashdetect.inc>
#include <gvar.inc>
#include <a_mysql.inc>
#include <a_actor.inc>
#include <a_zones.inc>
#include <a_objects.inc>
#include <CTime>
#include <progress2.inc>
#include <Pawn.CMD.inc>
#include <discord-connector.inc>
#include <mSelection.inc>
#include <TimestampToDate.inc>
#define ENABLE_3D_TRYG_YSI_SUPPORT
#include <3DTryg>
#include <ColAndreas>
#include <foreach>
#include <streamer.inc>
#include <EVF2.inc>
#include <YSI\y_timers>
#include <sscanf2.inc>
#include <yom_buttons.inc>
#include <geoiplite.inc>
#include <garageblock.inc>
#include <timerfix.inc>
#include <dini.inc>
#include <anti-cheat>
#include <discord-cmd>
#include "../include/gl_common.inc"
//****************************//
#include "CACHE\1_SERVER_DEFINES.pwn"
#include "CACHE\1_SERVER_COLOR.pwn"
#include "CACHE\1_SERVER_TEXTDRAW.pwn"
//****************************//
new MySQL: g_SQL;
new DCC_Channel:ucp;
new DCC_Channel:login;
new DCC_Channel:logout;
//****************************//
// Player data
enum E_PLAYERS
{
	pID,
	pName[MAX_PLAYER_NAME],
	pAdminname[MAX_PLAYER_NAME],
	pIP[16],
	pPassword[65],
	pSalt[17],
	pEmail[40],
	pAdmin,
	pHelper,
	pLevel,
	pLevelUp,
	pVip,
	pVipTime,
	pGold,
	pRegDate[50],
	pLastLogin[50],
	pMoney,
	pBankMoney,
	pBankRek,
	pStarterpack,
	// Charactee Story
	pCharacterStory,
	//phone
	pContact,
	pPhone,
	pPhoneOff,
	pPhoneCredit,
	pPhoneBook,
	pSMS,
	pCall,
	pCallTime,
	//--
	pWT,
	pHours,
	pMinutes,
	pSeconds,
	pPaycheck,
	pSkin,
	pFacSkin,
	pGender,
	pAge[50],
	pInDoor,
	pInHouse,
	pInBiz,
	pTransferBiz,
	Float: pPosX,
	Float: pPosY,
	Float: pPosZ,
	Float: pPosA,
	pInt,
	pWorld,
	Float:pHealth,
    Float:pArmour,
	pHunger,
	pBladder,
	pEnergy,
	pHungerTime,
	pEnergyTime,
	pBladderTime,
	pSick,
	pSickTime,
	pHospital,
	pHospitalTime,
	pInjured,
	pOnDuty,
	pOnDutyTime,
	pFaction,
	pFactionRank,
	pFactionLead,
	pTazer,
	pBroadcast,
	pNewsGuest,
	pFamily,
	pFamilyRank,
	pJail,
	pJailTime,
	pArrest,
	pArrestTime,
	pWarn,
	pJob,
	pJob2,
	// New Delays Jobs System
	pJobTime, // Ini Untuk Miner
	pLumberTime,
	pTruckerTime,
	pProductionTime,
	pDepositorTime,
	// Job Ilegal
	pSmugglerTime,
	//
	pExitJob,
	pMedicine,
	pMedkit,
	pMask,
	pHelmet,
	pSnack,
	pSprunk,
	pGas,
	pBandage,
	pGPS,
	pMaterial,
	pComponent,
	pFood,
	pSeed,
	pPotato,
	pWheat,
	pOrange,
	pPrice1,
	pPrice2,
	pPrice3,
	pPrice4,
	pMarijuana,
	pPlant,
	pPlantTime,
	pFishTool,
	pWorm,
	pFish,
	pInFish,
	pIDCard,
	pIDCardTime,
	pDriveLic,
	pDriveLicTime,
	pBoatLic,
	pBoatLicTime,
	pFlyLic,
	pFlyLicTime,
	pGuns[13],
    pAmmo[13],
	pWeapon,
	pBoombox,
	//Not Save
	Cache:Cache_ID,
	bool: IsLoggedIn,
	LoginAttempts,
	LoginTimer,
	pSpawned,
	pAdminDuty,
	pFreezeTimer,
	pFreeze,
	pMaskID,
	pMaskOn,
	pSPY,
	pTogPM,
	pTogLog,
	pTogAds,
	pTogWT,
	Text3D:pAdoTag,
	bool:pAdoActive,
	pFlare,
	bool:pFlareActive,
	pTrackCar,
	pBuyPvModel,
	pTrackHouse,
	pTrackBisnis,
	pFacInvite,
	pFacOffer,
	pFamInvite,
	pFamOffer,
	pFindEms,
	pCuffed,
	toySelected,
	TEditStatus,
	bool:PurchasedToy,
	pEditingItem,
	pProductModify,
	pCurrSeconds,
	pCurrMinutes,
	pCurrHours,
	pSpec,
	playerSpectated,
	pFriskOffer,
	pDragged,
	pDraggedBy,
	pDragTimer,
	pHBEMode,
	pHelmetOn,
	pSeatBelt,
	pReportTime,
	pAskTime,
	//Player Progress Bar
	PlayerBar:fuelbar,
	PlayerBar:damagebar,
	PlayerBar:hungrybar,
	PlayerBar:energybar,
	PlayerBar:bladdybar,
	//PlayerBar:spfuelbar,
	//PlayerBar:spdamagebar,
	/*PlayerBar:sphungrybar,
	PlayerBar:spenergybar,*/
	PlayerBar:activitybar,
	// New Player Proggres Bar
    PlayerBar:BarDarah,
    PlayerBar:BarArmour,
	PlayerBar:BarLapar,
	PlayerBar:BarHaus,
	PlayerBar:BarKencing,
	PlayerBar:BarFuel,
	PlayerBar:BarDamage,
	//
	pProducting,
	pCooking,
	pArmsDealer,
	pMechanic,
	pActivity,
	pActivityTime,
	//Jobs
	pSideJob,
	pSideJobTime, // Sweeper Delay
	pBusTime,
	pForTime,
	pPizzaTime,
	//
	pGetJob,
	pGetJob2,
	pTaxiDuty,
	pTaxiTime,
	pFare,
	pFareTimer,
	pTotalFare,
	Float:pFareOldX,
	Float:pFareOldY,
	Float:pFareOldZ,
	Float:pFareNewX,
	Float:pFareNewY,
	Float:pFareNewZ,
	//
	pMechDuty,
	pMechVeh,
	pMechColor1,
	pMechColor2,
	//ATM
	EditingATMID,
	//lumber job
	EditingTreeID,
	CuttingTreeID,
	bool:CarryingLumber,
	//Miner job
	EditingOreID,
	MiningOreID,
	CarryingLog,
	LoadingPoint,
	//production
	CarryProduct,
	//trucker
	pMission,
	pDealerMission,
	pHauling,
	pTrailer,
	//Farmer
	pHarvest,
	pHarvestID,
	pOffer,
	//Bank
	pTransfer,
	pTransferRek,
	pTransferName[128],
	//Gas Station
	pFill,
	pFillTime,
	pFillPrice,
	//Gate
	gEditID,
	gEdit,
	// Lokasi
	pCP,
	// Public Garage
	pPark,
	pLoc,
	// Dealeeship
	pInDealer,
	// Rentveh
	pInRent,
	// Workshop
	pMenuType,
	pInWs,
	pTransferWS,
	// Private Farm
	pInFarm,
	pTransferFarm,
	//Smuggler
	pSmugglerTimer,
	pPacket,
	// Tweeter
	pTname[MAX_PLAYER_NAME],
	pTweet,
	pTogTweet,
	pUsingWT,
	// Crates Job
	pGetcrateFish[MAX_PLAYERS],
	pvSpawnSapd,
	// Vehicle Object
	EditStatus,
	VehicleID,
	EditingVtoys,
	// Streamer
	pEditingMyOv,
	// Robbery
	pAlatRob,
	pRobInvite,
	pRobOffer,
	// DMV System Test
	pDMVProof,
	pBerhasilTest,
	// Speed cameras
	pSpeedTime,

};
new pData[MAX_PLAYERS][E_PLAYERS];
new g_MysqlRaceCheck[MAX_PLAYERS];
//----------[ New Variable ]-----
enum
{
	//---[ DIALOG PUBLIC ]---
	DIALOG_UNUSED,
    DIALOG_LOGIN,
    DIALOG_REGISTER,
    DIALOG_AGE,
	DIALOG_GENDER,
	DIALOG_EMAIL,
	DIALOG_PASSWORD,
	DIALOG_STATS,
	DIALOG_SETTINGS,
	DIALOG_HBEMODE,
	DIALOG_CHANGEAGE,
	//---[ DIALOG GOLD ]---
	DIALOG_GOLDSHOP,
	DIALOG_GOLDNAME,
	//---[ DIALOG BISNIS ]---
	DIALOG_SELL_BISNISS,
	DIALOG_SELL_BISNIS,
	DIALOG_MY_BISNIS,
	BISNIS_MENU,
	BISNIS_INFO,
	BISNIS_NAME,
	BISNIS_VAULT,
	BISNIS_WITHDRAW,
	BISNIS_DEPOSIT,
	BISNIS_BUYPROD,
	BISNIS_EDITPROD,
	BISNIS_PRICESET,
	BISNIS_SONG,
	BISNIS_PH,
	DIALOG_FIND_BISNIS,
	BISNIS_SETEMPLOYE,
	BISNIS_SETEMPLOYEE,
	BISNIS_SETOWNERCONFIRM,
	// BUSINESS CASHIER
	BISNIS_CASHIER,
	//---[ DIALOG HOUSE ]---
	DIALOG_SELL_HOUSES,
	DIALOG_SELL_HOUSE,
	DIALOG_MY_HOUSES,
	HOUSE_INFO,
	HOUSE_STORAGE,
	HOUSE_WEAPONS,
	HOUSE_MONEY,
	HOUSES_INT,
	HOUSES_INT2,
 	DIALOG_HOUSES_INT,
 	DIALOG_INTERIOR_MENU,
	HOUSE_WITHDRAWMONEY,
	HOUSE_DEPOSITMONEY,
	//---[ DIALOG PRIVATE VEHICLE ]---
	DIALOG_FINDVEH,
	DIALOG_TRACKVEH,
	DIALOG_MY_VEHICLE,
	DIALOG_GOTOVEH,
	DIALOG_GETVEH,
	DIALOG_DELETEVEH,
	DIALOG_BUYPV,
	DIALOG_BUYVIPPV,
	DIALOG_BUYPLATE,
	DIALOG_BUYPVCP,
	DIALOG_BUYPVCP_BIKES,
	DIALOG_BUYPVCP_CARS,
	DIALOG_BUYPVCP_UCARS,
	DIALOG_BUYPVCP_JOBCARS,
	DIALOG_BUYPVCP_VIPCARS,
	DIALOG_BUYPVCP_CONFIRM,
	DIALOG_BUYPVCP_VIPCONFIRM,
	DIALOG_RENT_JOBCARS,
	DIALOG_RENT_JOBCARSCONFIRM,
	DIALOG_VEHICLE_STATISTIC,
	//---[ DIALOG TOYS ]---
	DIALOG_TOY,
	DIALOG_TOYEDIT,
	DIALOG_TOYPOSISI,
	DIALOG_TOYPOSISIBUY,
	DIALOG_TOYBUY,
	DIALOG_TOYVIP,
	DIALOG_TOYPOSX,
	DIALOG_TOYPOSY,
	DIALOG_TOYPOSZ,
	DIALOG_TOYPOSRX,
	DIALOG_TOYPOSRY,
	DIALOG_TOYPOSRZ,
	DIALOG_TOYPOSSX,
	DIALOG_TOYPOSSY,
	DIALOG_TOYPOSSZ,
  	TSELECT_POS,
  	TOYSET_VALUE,
  	VSELECT_POS,
  	//---[ VEHICLE OBJECT ]---
	DIALOG_VTOY,
	DIALOG_VTOYBUY,
	DIALOG_VTOYEDIT,
	DIALOG_VTOYPOSX,
	DIALOG_VTOYPOSY,
	DIALOG_VTOYPOSZ,
	DIALOG_VTOYPOSRX,
	DIALOG_VTOYPOSRY,
	DIALOG_VTOYPOSRZ,
	VTOYSET_COLOUR,
	VTOY_ACCEPT,
	VTOYSET_VALUE,
	//---[ DIALOG PLAYER ]---
	DIALOG_HELP,
	DIALOG_HELP_NEXT,
	DIALOG_GPS,
	DIALOG_GPS_JOB,
	DIALOG_PAY,
	DIALOG_GPS_PUBLISH,
	//---[ DIALOG WEAPONS ]---
	DIALOG_EDITBONE,
	//---[ DIALOG FAMILY ]---
	FAMILY_SAFE,
	FAMILY_STORAGE,
	FAMILY_WEAPONS,
	FAMILY_MARIJUANA,
	FAMILY_WITHDRAWMARIJUANA,
	FAMILY_DEPOSITMARIJUANA,
	FAMILY_COMPONENT,
	FAMILY_WITHDRAWCOMPONENT,
	FAMILY_DEPOSITCOMPONENT,
	FAMILY_MATERIAL,
	FAMILY_WITHDRAWMATERIAL,
	FAMILY_DEPOSITMATERIAL,
	FAMILY_MONEY,
	FAMILY_WITHDRAWMONEY,
	FAMILY_DEPOSITMONEY,
	FAMILY_INFO,
	//---[ DIALOG FACTION ]---
	DIALOG_LOCKERSAPD,
	DIALOG_WEAPONSAPD,
	DIALOG_LOCKERSAGS,
	DIALOG_WEAPONSAGS,
	DIALOG_LOCKERSAMD,
	DIALOG_WEAPONSAMD,
	DIALOG_LOCKERSANEW,
	DIALOG_WEAPONSANEW,
	DIALOG_LOCKERVIP,
	//---[ DIALOG JOB ]---
	DIALOG_SERVICE,
	DIALOG_SERVICE_COLOR,
	DIALOG_SERVICE_COLOR2,
	DIALOG_SERVICE_PAINTJOB,
	DIALOG_SERVICE_WHEELS,
	DIALOG_SERVICE_SPOILER,
	DIALOG_SERVICE_HOODS,
	DIALOG_SERVICE_VENTS,
	DIALOG_SERVICE_LIGHTS,
	DIALOG_SERVICE_EXHAUSTS,
	DIALOG_SERVICE_FRONT_BUMPERS,
	DIALOG_SERVICE_REAR_BUMPERS,
	DIALOG_SERVICE_ROOFS,
	DIALOG_SERVICE_SIDE_SKIRTS,
	DIALOG_SERVICE_BULLBARS,
	DIALOG_SERVICE_NEON,
	//---[ DIALOG TRUCKER ]---
	DIALOG_HAULING,
	DIALOG_RESTOCK,
	DIALOG_CONTAINER,
	DIALOG_LIST_HAULING,
	DIALOG_CRATES,
	DIALOG_CRATE_EXPORT,
	//---[ ARMS DEALER ]---
	DIALOG_ARMS_GUN,
	//---[ FARM PUBLIC ]---
	DIALOG_PLANT,
	DIALOG_EDIT_PRICE,
	DIALOG_EDIT_PRICE1,
	DIALOG_EDIT_PRICE2,
	DIALOG_EDIT_PRICE3,
	DIALOG_EDIT_PRICE4,
	DIALOG_OFFER,
	//----[ ITEMS ]-----
	DIALOG_MATERIAL,
	DIALOG_COMPONENT,
	DIALOG_DRUGS,
	DIALOG_FOOD,
	DIALOG_FOOD_BUY,
	DIALOG_SEED_BUY,
	DIALOG_PRODUCT,
	DIALOG_GASOIL,
	DIALOG_APOTEK,
	//---[ ATM BANK ]---
	DIALOG_ATM,
	DIALOG_FIND_ATM,
	DIALOG_ATMWITHDRAW,
	DIALOG_BANK,
	DIALOG_BANKDEPOSIT,
	DIALOG_BANKWITHDRAW,
	DIALOG_BANKREKENING,
	DIALOG_BANKTRANSFER,
	DIALOG_BANKCONFIRM,
	DIALOG_BANKSUKSES,
	//---[ REPORT PUBLIC ]---
	DIALOG_ASKS,
	DIALOG_REPORTS,
	DIALOG_SALARY,
	DIALOG_PAYCHECK,
	//---[ APARTEMENT ]---
	DIALOG_ID,
	//---[ GARAGE PUBLIC ]---
	DIALOG_PICKUPVEH,
	DIALOG_TRACKPARK,
	// Faction Garages
	DIALOG_SAPD_GARAGE,
	//---[ DIALOG TRUNK ]---
	TRUNK_STORAGE,
	TRUNK_WEAPONS,
	TRUNK_MONEY,
	TRUNK_COMP,
	TRUNK_MATS,
	TRUNK_WITHDRAWMONEY,
	TRUNK_DEPOSITMONEY,
	TRUNK_WITHDRAWCOMP,
	TRUNK_DEPOSITCOMP,
	TRUNK_WITHDRAWMATS,
	TRUNK_DEPOSITMATS,
	TRUNK_MARIJUANA,
	TRUNK_WITHDRAW_MARIJUANA,
	TRUNK_DEPOSIT_MARIJUANA,
	TRUNK_FISH,
	TRUNK_WITHDRAW_FISH,
	TRUNK_DEPOSIT_FISH,
	TRUNK_CRATES,
	//---[ DIALOG DEALERSHIP ]---
	DIALOG_GPS_DEALERSHIP,
	DIALOG_FIND_DEALER,
	DIALOG_BUYJOBCARSVEHICLE,
	DIALOG_BUYDEALERCARS_CONFIRM,
	DIALOG_BUYTRUCKVEHICLE,
	DIALOG_BUYMOTORCYCLEVEHICLE,
	DIALOG_BUYUCARSVEHICLE,
	DIALOG_BUYCARSVEHICLE,
	DIALOG_DEALER_MANAGE,
	DIALOG_DEALER_VAULT,
	DIALOG_DEALER_WITHDRAW,
	DIALOG_DEALER_DEPOSIT,
	DIALOG_DEALER_NAME,
	DIALOG_DEALER_RESTOCK,
	//---[ DIALOG RENT VEHICLE ]---
	DIALOG_RENTAL_BIKE,
	DIALOG_RENTAL_BIKECONFIRM,
	DIALOG_RENTAL_TRUCKER,
	DIALOG_RENTAL_TRUCKCONFIRM,
	//---[ DIALOG WORKSHOP ]---
	DIALOG_MY_WS,
	DIALOG_TRACKWS,
	WS_MENU,
	WS_SETNAME,
	WS_SETOWNER,
	WS_SETEMPLOYE,
	WS_SETEMPLOYEE,
	WS_SETOWNERCONFIRM,
	WS_SETMEMBER,
	WS_SETMEMBERE,
	WS_MONEY,
	WS_WITHDRAWMONEY,
	WS_DEPOSITMONEY,
	WS_COMPONENT,
	WS_COMPONENT2,
	WS_MATERIAL,
	WS_MATERIAL2,
	//---[ DIALOG FARM PRIVATE ]---
	FARM_MENU,
	FARM_SETNAME,
	DIALOG_MY_FARM,
	FARM_SETEMPLOYE,
	DIALOG_TRACK_FARM,
	FARM_SETOWNERCONFIRM,
	FARM_MONEY,
	FARM_MONEY2,
	FARM_SEEDS,
	FARM_SEEDS2,
	FARM_POTATO,
	FARM_POTATO2,
	FARM_WHEAT,
	FARM_WHEAT2,
	FARM_ORANGE,
	FARM_ORANGE2,
	//---[ PHONE SYSTEM ]---
	DIALOG_ENTERNUM,
	NEW_CONTACT,
	CONTACT_INFO,
	CONTACT,
	DIAL_NUMBER,
	TEXT_MESSAGE,
	SEND_TEXT,
	SHARE_LOC,
	MY_PHONE,
	TWEET_APP,
	WHATSAPP_APP,
	TWEET_SIGNUP,
	TWEET_CHANGENAME,
	TWEET_ACCEPT_CHANGENAME,
	DIALOG_TWEETMODE,
	PHONE_NOTIF,
	PHONE_APP,
	//---[ BOOMBOX ]---
	DIALOG_BOOMBOX,
	DIALOG_BOOMBOX1,
	//---[ Dialog DMV ]---
	DIALOG_DMV_TEST,
	DIALOG_DSVEH_CAUTION,
	DIALOG_DSVEH_RULES,
	DIALOG_DSVEH_TESTBASE,
	DIALOG_DSVEH_TESTBASE1,
	DIALOG_DSVEH_TESTBASE2,
	DIALOG_DSVEH_TESTBASE3,
	//---[ DIALOG MDC ]---
	DIALOG_TRACK,
	DIALOG_TRACK_PH,
	DIALOG_INFO_BIS,
	DIALOG_INFO_HOUSE,
	//---[ DIALOG SIDEJOB ]---
	DIALOG_SWEEPER,
	DIALOG_BUS,
	DIALOG_FORKLIFT,
}
//****************************//
new pvEdit[MAX_PLAYERS];
new pvEditID[MAX_PLAYERS];
new pvehEditID[MAX_PLAYERS];
new Float:pvPos[MAX_PLAYERS][3];
new Float:pvRot[MAX_PLAYERS][3];
//****************************//
new bool:DialogSaya[MAX_PLAYERS][10];
//****************************//
new Tflint[2], TollLv[2], pTollArea[4];
//****************************//
new bool:cbug[MAX_PLAYERS], // true or false
    Freeze[MAX_PLAYERS], // timer
    LastFired[MAX_PLAYERS]; // last weapon
//****************************//
new online;
// Countdown
new Count = -1;
new countTimer;
new showCD[MAX_PLAYERS];
//****************************//
new CountText[5][5] =
{
	"~r~1",
	"~g~2",
	"~y~3",
	"~g~4",
	"~b~5"
};
//****************************//
// Server Uptime
new up_days,
	up_hours,
	up_minutes,
	up_seconds,
	WorldTime = 10,
	WorldWeather = 24;
//****************************//
new SpawnMale = mS_INVALID_LISTID,
	SpawnFemale = mS_INVALID_LISTID,
	MaleSkins = mS_INVALID_LISTID,
	FemaleSkins = mS_INVALID_LISTID,
	VIPMaleSkins = mS_INVALID_LISTID,
	VIPFemaleSkins = mS_INVALID_LISTID,
	SAPDMale = mS_INVALID_LISTID,
	SAPDFemale = mS_INVALID_LISTID,
	SAPDWar = mS_INVALID_LISTID,
	SAGSMale = mS_INVALID_LISTID,
	SAGSFemale = mS_INVALID_LISTID,
	SAMDMale = mS_INVALID_LISTID,
	SAMDFemale = mS_INVALID_LISTID,
	SANEWMale = mS_INVALID_LISTID,
	SANEWFemale = mS_INVALID_LISTID,
	toyslist = mS_INVALID_LISTID,
	viptoyslist = mS_INVALID_LISTID,
	vtoylist = mS_INVALID_LISTID;
//****************************//
// Strobe &. Faction Vehicle
#define flashtime 110 // (Strobe) Default FlashTime 115
new Flash[MAX_VEHICLES];
new FlashTime[MAX_VEHICLES];
//****************************//
#define VEHICLE_RESPAWN 7200
new SAPDVehicles[30],
	SAGSVehicles[30],
	SAMDVehicles[30],
	SANAVehicles[30];
	
// Vehicle Garage SAPD
new SAPD_Garages[MAX_PLAYERS];
//****************************//
// Faction Vehicle
IsSAPDCar(carid)
{
	for(new v = 0; v < sizeof(SAPDVehicles); v++)
	{
	    if(carid == SAPDVehicles[v]) return 1;
	}
	return 0;
}

IsGovCar(carid)
{
	for(new v = 0; v < sizeof(SAGSVehicles); v++)
	{
	    if(carid == SAGSVehicles[v]) return 1;
	}
	return 0;
}

IsSAMDCar(carid)
{
	for(new v = 0; v < sizeof(SAMDVehicles); v++)
	{
	    if(carid == SAMDVehicles[v]) return 1;
	}
	return 0;
}

IsSANACar(carid)
{
	for(new v = 0; v < sizeof(SANAVehicles); v++)
	{
	    if(carid == SANAVehicles[v]) return 1;
	}
	return 0;
}

//Showroom Checkpoint
new ShowRoomCP,
	ShowRoomCPRent;

// Showroom Vehicles
//new SRV[35],
//	VSRV[20];
	
/*// Button and Doors
new SAGSLobbyBtn[2],
	SAGSLobbyDoor;
new gMyButtons[2],
	gMyDoor;*/
	
/*//Keypad Txd
new SAGSLobbyKey[2],
	SAGSLobbyDoor;
*/

// Yom Button
new SAGSLobbyBtn[2],
	SAGSLobbyDoor,
	SAPDLobbyBtn[4],
	SAPDLobbyDoor[4],
	LLFLobbyBtn[2],
	LLFLobbyDoor;
//****************************//
new TogOOC = 1;
//****************************//
//----------[ Lumber Object Vehicle Job ]------------
#define MAX_LUMBERS 50
#define LUMBER_LIFETIME 100
#define LUMBER_LIMIT 10
//****************************//
enum    E_LUMBER
{
	// temp
	lumberDroppedBy[MAX_PLAYER_NAME],
	lumberSeconds,
	lumberObjID,
	lumberTimer,
	Text3D: lumberLabel
}
new LumberData[MAX_LUMBERS][E_LUMBER],
	Iterator:Lumbers<MAX_LUMBERS>;
//****************************//
new
	LumberObjects[MAX_VEHICLES][LUMBER_LIMIT];
	
new
	Float: LumberAttachOffsets[LUMBER_LIMIT][4] = {
	    {-0.223, -1.089, -0.230, -90.399},
		{-0.056, -1.091, -0.230, 90.399},
		{0.116, -1.092, -0.230, -90.399},
		{0.293, -1.088, -0.230, 90.399},
		{-0.123, -1.089, -0.099, -90.399},
		{0.043, -1.090, -0.099, 90.399},
		{0.216, -1.092, -0.099, -90.399},
		{-0.033, -1.090, 0.029, -90.399},
		{0.153, -1.089, 0.029, 90.399},
		{0.066, -1.091, 0.150, -90.399}
	};

//---------[ Ores miner Job Log ]-------	
#define LOG_LIFETIME 100
#define LOG_LIMIT 10
#define MAX_LOG 100

enum    E_LOG
{
	// temp
	bool:logExist,
	logType,
	logDroppedBy[MAX_PLAYER_NAME],
	logSeconds,
	logObjID,
	logTimer,
	Text3D:logLabel
}
new LogData[MAX_LOG][E_LOG];

new
	LogStorage[MAX_VEHICLES][2];
	
//------[ Trucker ]--------
new VehProduct[MAX_VEHICLES];
new VehGasOil[MAX_VEHICLES];
//-----[ Modular ]-----
main()
{
	SetTimer("onlineTimer", 1000, true);
	SetTimer("TDUpdates", 9000, true);
	SetTimer_("OnMinuteTimer", 60000,0,-1);
	SetTimer_("OnSecondTimer", 1000, 0, -1);
	SetTimer("antiCheat", 300, true);
	//SetTimer("AutoGmx", 28800000, true);
	//SetTimer("reloadpacket", 10000, true);
}
// ******* STOCK ******* //
#include "CACHE\DINI_SYSTEM_SAVE.pwn"
#include "CACHE\ANIMATIONLIST.pwn"
#include "CACHE\APARTEMENT.pwn"
#include "CACHE\DYNAMIC_GARAGE.pwn"
#include "CACHE\PRIVATE_VEHICLE.pwn"
#include "CACHE\VEHICLE_TRUNK_SYSTEM.pwn"
#include "CACHE\SERVER_REPORT_SYSTEM.pwn"
#include "CACHE\SERVER_ASK_SYSTEM.pwn"
#include "CACHE\WEAPON_ATTACHMENT.pwn"
#include "CACHE\DYNAMIC_PLAYER_TOYS.pwn"
#include "CACHE\HELMET_SYSTEM.pwn"
#include "CACHE\SERVER_STOCK_SAVE.pwn"
//****************************//
#include "CACHE\DYNAMIC_MODSHOP.pwn"
#include "CACHE\MY_OBJECT_VEHICLE.pwn"
//****************************//
#include "CACHE\DYNAMIC_ACTOR.pwn"
#include "CACHE\DYNAMIC_ATM_MACHINES.pwn"
#include "CACHE\DYNAMIC_BANK_POINT.pwn"
#include "CACHE\DYNAMIC_DOORS.pwn"
#include "CACHE\DYNAMIC_FAMILY.pwn"
#include "CACHE\DYNAMIC_HOUSE.pwn"
#include "CACHE\DYNAMIC_BUSINES.pwn"
#include "CACHE\DYNAMIC_GAS_STATION.pwn"
#include "CACHE\DYNAMIC_DEALERSHIP.pwn"
#include "CACHE\DYNAMIC_RENTAL.pwn"
#include "CACHE\DYNAMIC_WORKSHOP.pwn"
#include "CACHE\DYNAMIC_PRIVATE_FARM.pwn"
#include "CACHE\DYNAMIC_LOCKER.pwn"
#include "CACHE\DYNAMIC_GATE.pwn"
#include "CACHE\DYNAMIC_MAPPING.pwn"
#include "CACHE\DYNAMIC_MAPICON.pwn"
#include "CACHE\DYNAMIC_SPEEDCAMERAS.pwn"
//****************************//
#include "CACHE\SERVER_NATIVE.pwn"
#include "CACHE\CELLPHONE_SYSTEM.pwn"
#include "CACHE\ADMINISTRATOR_QUIZ.pwn"
#include "CACHE\SERVER_PLAYERS_TASK.pwn"
//****************************//
#include "CACHE\JOB_SYSTEM\JOB_SWEEPER.pwn"
#include "CACHE\JOB_SYSTEM\JOB_BUS.pwn"
#include "CACHE\JOB_SYSTEM\JOB_FORKLIFT.pwn"
#include "CACHE\JOB_SYSTEM\JOB_PIZZA.pwn"
//****************************//
#include "CACHE\JOB_SYSTEM\JOB_TAXI.pwn"
#include "CACHE\JOB_SYSTEM\JOB_MECH.pwn"
#include "CACHE\JOB_SYSTEM\JOB_LUMBER.pwn"
#include "CACHE\JOB_SYSTEM\JOB_MINER.pwn"
#include "CACHE\JOB_SYSTEM\JOB_PRODUCTION.pwn"
#include "CACHE\JOB_SYSTEM\JOB_TRUCKER.pwn"
#include "CACHE\JOB_SYSTEM\JOB_FISH.pwn"
#include "CACHE\JOB_SYSTEM\JOB_FARMER.pwn"
#include "CACHE\JOB_SYSTEM\JOB_CRATE.pwn"
#include "CACHE\JOB_SYSTEM\JOB_SMUGGLER.pwn"
#include "CACHE\JOB_SYSTEM\JOB_DEPOSITOR.pwn"
//****************************//
#include "CACHE\SERVER_FUNTION_MODULAR.pwn"
#include "CACHE\VVIP_VOUCHER_SYSTEM.pwn"
#include "CACHE\PLAYERS_SALARY.pwn"
#include "CACHE\ARMS_DEALER_SYSTEM.pwn"
#include "CACHE\ROBBERY_SYSTEM.pwn"
#include "CACHE\DRIVING_TEST_LICENSES.pwn"
//****************************//
#include "CACHE\COMMANDO\ADMINISTRATOR.pwn"
#include "CACHE\COMMANDO\FACTIONCMD.pwn"
#include "CACHE\COMMANDO\PLAYERCMD.pwn"
//****************************//
#include "CACHE\POLICE_TASERGUN.pwn"
#include "CACHE\POLICE_TRACK_MDC.pwn"
#include "CACHE\POLICE_DYNAMIC_SPIKE.pwn"
//****************************//
#include "CACHE\FUNCTION_CALLBACK.pwn"
#include "CACHE\DISCORD_BOT_CONNECTED.pwn"
#include "CACHE\ONDIALOGRESPONSES.pwn"
//****************************//
#include "CACHE\COMMANDO\ALIAS\ALIAS_ADMIN.pwn"
#include "CACHE\COMMANDO\ALIAS\ALIAS_PLAYER.pwn"
#include "CACHE\COMMANDO\ALIAS\ALIAS_BISNIS.pwn"
#include "CACHE\COMMANDO\ALIAS\ALIAS_HOUSE.pwn"
#include "CACHE\COMMANDO\ALIAS\ALIAS_PRIVATE_VEHICLE.pwn"
//****************************//
#include "CACHE\SA_INT\INTERIORS_DIALOG.pwn"
//****************************//
#include "CACHE\STATIC_VEHICLE\STATIC_SAPD_VEHICLE.pwn"
// New Create Anti Cheat
#include "CACHE\AntiCheat\DETECTED_PLAYER_CHEAT.pwn"

/// STROBE ///
forward OnLightFlash(vehicleid);
public OnLightFlash(vehicleid)
{
    new panels, doors, lights, tires;
	GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);

	switch(Flash[vehicleid])
	{
        case 0: UpdateVehicleDamageStatus(vehicleid, panels, doors, 2, tires);

	    case 1: UpdateVehicleDamageStatus(vehicleid, panels, doors, 5, tires);

	    case 2: UpdateVehicleDamageStatus(vehicleid, panels, doors, 2, tires);

	    case 3: UpdateVehicleDamageStatus(vehicleid, panels, doors, 4, tires);

	    case 4: UpdateVehicleDamageStatus(vehicleid, panels, doors, 5, tires);

	    case 5: UpdateVehicleDamageStatus(vehicleid, panels, doors, 4, tires);
	}
	if(Flash[vehicleid] >=5) Flash[vehicleid] = 0;
	else Flash[vehicleid] ++;
	return 1;
}
/// ********* ///
forward F1CloseToll(playerid);
forward F2CloseToll(playerid);
forward LV1CloseToll(playerid);
forward LV2CloseToll(playerid);
forward ClearPlayerAnim(playerid);
//Close Toll
public F1CloseToll(playerid)
{
	SetDynamicObjectRot(Tflint[0], 0.000000, -90.000000, 270.67565917969);
	return 1;
}
public F2CloseToll(playerid)
{
	SetDynamicObjectRot(Tflint[1], 0.000000, -90.000000, 87.337799072266);
	return 1;
}
public LV1CloseToll(playerid)
{
	SetDynamicObjectRot(TollLv[0], 0.000000, -90.000000, 348.10229492188);
	return 1;
}
public LV2CloseToll(playerid)
{
	SetDynamicObjectRot(TollLv[1], 0.000000, -90.000000, 169.43664550781);
	return 1;
}
public ClearPlayerAnim(playerid)
{
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
}

// For Loader Dini Files
stock GetName(playerid)
{
	new name[MAX_PLAYER_NAME];
 	GetPlayerName(playerid,name,sizeof(name));
	return name;
}
stock CheckFiles()
{
	if(!dini_Exists("mapicons.cfg")) dini_Create("mapicons.cfg");
	return 1;
}

stock GetCS(playerid)
{
 	new astring[48];
 	if(pData[playerid][pCharacterStory] == 0)format(astring, sizeof(astring), ""RED_E"None");
	else if(pData[playerid][pCharacterStory] == 1)format(astring, sizeof(astring), ""LG_E"Approved");
	return astring;
}

/// ***************************************************************** ///
public OnGameModeInit()
{
	//mysql_log(ALL);
	new MySQLOpt: option_id = mysql_init_options();

	mysql_set_option(option_id, AUTO_RECONNECT, true);

	g_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE, option_id);
	if (g_SQL == MYSQL_INVALID_HANDLE || mysql_errno(g_SQL) != 0)
	{
		print("MySQL connection failed. Server is shutting down.");
		SendRconCommand("exit");
		return 1;
	}
	print("MySQL connection is successful.");

	mysql_tquery(g_SQL, "SELECT * FROM `server`", "LoadServer");
	mysql_tquery(g_SQL, "SELECT * FROM `doors`", "LoadDoors");
	mysql_tquery(g_SQL, "SELECT * FROM `familys`", "LoadFamilys");
	mysql_tquery(g_SQL, "SELECT * FROM `houses`", "LoadHouses");
	mysql_tquery(g_SQL, "SELECT * FROM `bisnis`", "LoadBisnis");
	mysql_tquery(g_SQL, "SELECT * FROM `lockers`", "LoadLockers");
	mysql_tquery(g_SQL, "SELECT * FROM `gstations`", "LoadGStations");
	mysql_tquery(g_SQL, "SELECT * FROM `atms`", "LoadATM");
	mysql_tquery(g_SQL, "SELECT * FROM `gates`", "LoadGates");
	mysql_tquery(g_SQL, "SELECT * FROM `vouchers`", "LoadVouchers");
	mysql_tquery(g_SQL, "SELECT * FROM `trees`", "LoadTrees");
	mysql_tquery(g_SQL, "SELECT * FROM `ores`", "LoadOres");
	mysql_tquery(g_SQL, "SELECT * FROM `plants`", "LoadPlants");
	mysql_tquery(g_SQL, "SELECT * FROM `parks`", "LoadPark");
	mysql_tquery(g_SQL, "SELECT * FROM `dealership`", "LoadDealership");
	mysql_tquery(g_SQL, "SELECT * FROM `workshop`", "LoadWorkshop");
	mysql_tquery(g_SQL, "SELECT * FROM `rent`", "LoadRentship");
	mysql_tquery(g_SQL, "SELECT * FROM `farm`", "LoadFarm");
	mysql_tquery(g_SQL, "SELECT * FROM `actor`", "LoadActor");
	mysql_tquery(g_SQL, "SELECT * FROM `speedcameras`", "Speed_Load");
	//****************************//
	print("=======================================================");
 	print("                      			             	     ");
 	print("        	   Ranum Roleplay Gamemode v1.0.12.           ");
 	print("            • Scripters Gamemode Garaaaa •		  	   ");
 	print("                                  				     ");
 	print("=======================================================");
	//****************************//
	CreateTextDraw();
	CreateServerPoint();
	CreateJoinLumberPoint();
	CreateJoinTaxiPoint();
	CreateJoinMechPoint();
	CreateJoinMinerPoint();
	CreateJoinProductionPoint();
	CreateJoinTruckPoint();
	CreateArmsPoint();
	CreateJoinFarmerPoint();
	CreateJoinSmugglerPoint();
	CreateJoinPizzaPoint();
	CreateDepositorJobPoint();
	CreateLoadMoneyJobPoint();
	CreateWreanchRobPoint();
 	CreateDMVPoint();
	//****************************//
	LoadTazerSAPD();
	// Mapping
	ObjectMapping();
	ServerVehicle();
	// Loaded Dini Files
	LoadObjects();
	LoadMapIcons();
	LoadModsPoint();
	LoadBankPoint();
	//SetupPlayerTable();
	//****************************//
	new gm[32];
	format(gm, sizeof(gm), "%s", TEXT_GAMEMODE);
	SetGameModeText(gm);
	format(gm, sizeof(gm), "weburl %s", TEXT_WEBURL);
	SendRconCommand(gm);
	format(gm, sizeof(gm), "language %s", TEXT_LANGUAGE);
	SendRconCommand(gm);
	//SendRconCommand("hostname Xero Gaming Roleplay");
	SendRconCommand("mapname San Andreas");
	ManualVehicleEngineAndLights();
	EnableStuntBonusForAll(0);
	AllowInteriorWeapons(1);
	DisableInteriorEnterExits();
	LimitPlayerMarkerRadius(15.0);
	SetNameTagDrawDistance(20.0);
	//DisableNameTagLOS();
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
	SetWorldTime(WorldTime);
	SetWeather(WorldWeather);
	BlockGarages(.text="NO ENTER");
	//Audio_SetPack("default_pack");
	
	SpawnMale = LoadModelSelectionMenu("spawnmale.txt");
	SpawnFemale = LoadModelSelectionMenu("spawnfemale.txt");
	MaleSkins = LoadModelSelectionMenu("maleskin.txt");
	FemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	VIPMaleSkins = LoadModelSelectionMenu("maleskin.txt");
	VIPFemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	SAPDMale = LoadModelSelectionMenu("sapdmale.txt");
	SAPDFemale = LoadModelSelectionMenu("sapdfemale.txt");
	SAPDWar = LoadModelSelectionMenu("sapdwar.txt");
	SAGSMale = LoadModelSelectionMenu("sagsmale.txt");
	SAGSFemale = LoadModelSelectionMenu("sagsfemale.txt");
	SAMDMale = LoadModelSelectionMenu("samdmale.txt");
	SAMDFemale = LoadModelSelectionMenu("samdfemale.txt");
	SANEWMale = LoadModelSelectionMenu("sanewmale.txt");
	SANEWFemale = LoadModelSelectionMenu("sanewfemale.txt");
	toyslist = LoadModelSelectionMenu("toys.txt");
	viptoyslist = LoadModelSelectionMenu("viptoys.txt");
	vtoylist = LoadModelSelectionMenu("vtoylist.txt");
	
	
	new strings[10000];
	// ID CARD
	CreateDynamicPickup(1239, 23, 361.8575, 173.5981, 1008.3828, -1);
	format(strings, sizeof(strings), ""X1_BLUE"[City Hall]\n/createidcard - create new ID Card\n/newage - Change Birthday");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 361.8575, 173.5981, 1008.3828, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // ID Card

	// CITY HALL PROPERTY SECTION
	CreateDynamicPickup(1239, 23, 358.6365,181.6947,1008.3828, -1);
	format(strings, sizeof(strings), ""X1_BLUE"[Property]\n/sellhouse - sell your house\n/sellbisnis - sell your bisnis");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 358.6365,181.6947,1008.3828, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // ID Card

	// CITY HALL VEHICLE SECTION
	CreateDynamicPickup(1239, 23, 358.6334,164.8016,1008.3828, -1);
	format(strings, sizeof(strings), ""X1_BLUE"[Veh Insurance]\n/buyinsu - buy insurance\n/claimpv - claim insurance\n/sellpv - sell vehicle");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 358.6334,164.8016,1008.3828, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Veh insurance
	
	CreateDynamicPickup(1239, 23, 240.80, 112.95, 1003.21, -1);
	format(strings, sizeof(strings), ""X1_BLUE"[Plate]\n/buyplate - create new plate");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 240.80, 112.95, 1003.21, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Plate
	
	CreateDynamicPickup(1239, 23, 246.45, 118.53, 1003.21, -1);
	format(strings, sizeof(strings), ""X1_BLUE"[Ticket]\n/payticket - to pay ticket");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 246.45, 118.53, 1003.21, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Ticket
	
	CreateDynamicPickup(1239, 23, 224.11, 118.50, 999.10, -1);
	format(strings, sizeof(strings), ""X1_BLUE"[ARREST POINT]\n/arrest - arrest wanted player");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 224.11, 118.50, 999.10, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // arrest
	
	CreateDynamicPickup(1239, 23, 1142.38, -1330.74, 13.62, -1);
	format(strings, sizeof(strings), ""PINK_E"[Hospital]\n/dropinjured");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 1142.38, -1330.74, 13.62, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // hospital
	
	CreateDynamicPickup(1239, 23, 2246.46, -1757.03, 1014.77, -1);
	format(strings, sizeof(strings), ""X1_BLUE"[REKENING BANK]\n/newrek - create new rekening");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 2246.46, -1757.03, 1014.77, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank
	
	CreateDynamicPickup(1239, 23, 1428.882324, -986.068542, 996.105041, -1);
	format(strings, sizeof(strings), ""X1_BLUE"[REKENING BANK]\n/newrek - create new rekening");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 1428.882324, -986.068542, 996.105041, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank

	CreateDynamicPickup(1239, 23, 2461.21, 2270.42, 91.67, -1);
	format(strings, sizeof(strings), ""ORANGE_E"[ADVERTISEMENT]\n/ads - public Advertisement");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 2461.21, 2270.42, 91.67, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // iklan

	// SAPD GARAGE
	CreateDynamicPickup(1239, 23, 1568.40, -1695.66, 5.89, -1);
	format(strings, sizeof(strings), ""LB_E"Statistic Vehicles\n"WHITE_E"use '"YELLOW_E"/spawn"WHITE_E"' to spawn vehicles\n"WHITE_E"use '"YELLOW_E"/despawn"WHITE_E"' to despawn vehicles");
	CreateDynamic3DTextLabel(strings, ARWIN, 1568.40, -1695.66, 5.89, 5.0); // Vehicles Stats Sapd

	// SAPD DESPAWN HELICOPTER
	CreateDynamicPickup(1239, 23, 1569.1587,-1641.0361,28.5788, -1);
	format(strings, sizeof(strings), ""LB_E"Statistic Vehicles\n"WHITE_E"use '"YELLOW_E"/despawn"WHITE_E"' to despawn helicopter police");
	CreateDynamic3DTextLabel(strings, ARWIN, 1569.1587,-1641.0361,28.5788, 5.0);

	// STARTERPACK
	CreateDynamicPickup(1239, 23, 1635.64, -2334.27, 13.43, -1);
	format(strings, sizeof(strings), "Startpack Point\n"WHITE_E"use '"YELLOW_E"/ranumrp"WHITE_E"' to claimed starterpack");
	CreateDynamic3DTextLabel(strings, ARWIN, 1635.64, -2334.27, 13.43, 5.0); //  Starterpack

	//Dynamic CP
	ShowRoomCP = CreateDynamicCP(1307.48, -1436.33, 13.59, 1.0, -1, -1, -1, 5.0);
	CreateDynamic3DTextLabel("[Buy Vehicle's Point]", ARWIN, 1307.48, -1436.33, 13.59, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, -1);
	
	ShowRoomCPRent = CreateDynamicCP(1299.74, -1435.26, 13.59, 1.0, -1, -1, -1, 5.0);
	CreateDynamic3DTextLabel("[Rental Vehicle's Point]\n"YELLOW_E"/unrentpv", ARWIN, 1299.74, -1435.26, 13.59, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, -1);
	
	SAGSLobbyBtn[0] = CreateButton(1388.987670, -25.291969, 1001.358520, 180.000000);
	SAGSLobbyBtn[1] = CreateButton(1391.275756, -25.481920, 1001.358520, 0.000000);
	SAGSLobbyDoor = CreateDynamicObject(1569, 1389.375000, -25.387500, 999.978210, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	
	SAPDLobbyBtn[0] = CreateButton(252.95264, 107.67332, 1004.00909, 264.79898);
	SAPDLobbyBtn[1] = CreateButton(253.43437, 110.62970, 1003.92737, 91.00000);
	SAPDLobbyDoor[0] = CreateDynamicObject(1569, 253.10965, 107.61060, 1002.21368,   0.00000, 0.00000, 91.00000);
	SAPDLobbyDoor[1] = CreateDynamicObject(1569, 253.12556, 110.49657, 1002.21460,   0.00000, 0.00000, -91.00000);

	SAPDLobbyBtn[2] = CreateButton(239.82739, 116.12640, 1004.00238, 91.00000);
	SAPDLobbyBtn[3] = CreateButton(238.75888, 116.12949, 1003.94086, 185.00000);
	SAPDLobbyDoor[2] = CreateDynamicObject(1569, 239.69435, 116.15908, 1002.21411,   0.00000, 0.00000, 91.00000);
	SAPDLobbyDoor[3] = CreateDynamicObject(1569, 239.64050, 119.08750, 1002.21332,   0.00000, 0.00000, 270.00000);
	
	//Family Button
	LLFLobbyBtn[0] = CreateButton(-2119.90039, 655.96808, 1062.39954, 184.67528);
	LLFLobbyBtn[1] = CreateButton(-2119.18481, 657.88519, 1062.39954, 90.00000);
	LLFLobbyDoor = CreateDynamicObject(1569, -2119.21509, 657.54187, 1060.73560,   0.00000, 0.00000, -90.00000);

	// Create the LS Apartments 1 Building object
    LSApartments1Object = CreateObject(19595, 1160.96, -1180.58, 70.4141, 0, 0, 0);

    // Create the LS Apartments 1 Car Park object
    LSApartments1CPObject = CreateObject(19798, 1160.96, -1180.58, 20.4141, 0, 0, 0);

    // Reset the elevator queue
	ResetElevatorQueue();

	// Create the elevator object, the elevator doors and the floor doors
	Elevator_Initialize();

    // Loop
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
        // Check if the player is connected and not a NPC
        if (IsPlayerConnected(i) && !IsPlayerNPC(i))
        {
            // Remove default GTASA building map object, LOD and awning shadows
            // (so any player currently ingame does not have to rejoin for them
			//  to be removed when this filterscript is loaded)
			RemoveBuildingForPlayer(i, 5766, 1160.96, -1180.58, 70.4141, 250.0); // Awning shadows
			RemoveBuildingForPlayer(i, 5767, 1160.96, -1180.58, 70.4141, 250.0); // Building
			RemoveBuildingForPlayer(i, 5964, 1160.96, -1180.58, 70.4141, 250.0); // LOD
        }
    }
	objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
	// Discord Server
	ucp = DCC_FindChannelById("902659436244512808");
	login = DCC_FindChannelById("maintance");
	logout = DCC_FindChannelById("maintance");
	//login = DCC_FindChannelById("902890835480293446");
	//logout = DCC_FindChannelById("902890871140266054");

	//Toll - Flint
	CreateObject(8168, 61.25604, -1533.39465, 6.10425,   0.00000, 0.00000, 9.92526);
	CreateObject(8168, 40.96660, -1529.57251, 6.10425,   0.00000, 0.00000, 188.57129);
	CreateObject(966, 35.88975, -1526.00964, 4.24106,   0.00000, 0.00000, 270.67566);
	CreateObject(966, 67.09373, -1536.82751, 3.99106,   0.00000, 0.00000, 87.33780);
	CreateObject(973, 52.97949, -1531.92529, 5.09049,   0.00000, 0.00000, 352.06006);
	CreateObject(973, 49.04207, -1531.50659, 5.17587,   0.00000, 0.00000, 352.05688);

	//Toll - LV
	CreateObject(8168, 1789.83203, 703.18945, 15.84637,   0.00000, 3.00000, 99.24951);
	CreateObject(8168, 1784.83350, 703.94800, 16.07064,   0.00000, 357.00000, 278.61096);
	CreateObject(966, 1781.41223, 697.32532, 14.63691,   0.00000, 0.00000, 348.09009);
	CreateObject(966, 1793.42896, 709.87982, 13.63691,   0.00000, 0.00000, 169.43665);
	CreateObject(973, 1771.58691, 702.35260, 15.03000,   0.00000, 0.00000, 131.87990);
	CreateObject(973, 1804.35840, 710.90863, 13.90900,   0.00000, 0.00000, 206.40012);
	CreateObject(970, 1781.71448, 699.19360, 14.93310,   0.00000, 0.00000, 79.26010);
	CreateObject(970, 1792.94360, 707.78748, 14.22510,   0.00000, 0.00000, 79.80003);

	Tflint[0] = CreateDynamicObject(968, 35.838928222656, -1525.9034423828, 5.0012145042419, 0.000000, -90.000000, 270.67565917969, -1);
	Tflint[1] = CreateDynamicObject(968, 67.116600036621, -1536.8218994141, 4.7504549026489, 0.000000, -90.000000, 87.337799072266, -1);
	TollLv[0] = CreateDynamicObject(968, 1781.4133300781, 697.31750488281, 15.420023918152, 0.000000, -90.000000, 348.10229492188, -1);
	TollLv[1] = CreateDynamicObject(968, 1793.6700439453, 709.84631347656, 14.405718803406, 0.000000, -90.000000, 169.43664550781, -1);
    pTollArea[0] = CreateDynamicSphere(40.3993, -1522.9064, 5.1910, 4.0, -1, -1);
	pTollArea[1] = CreateDynamicSphere(62.3336, -1540.1075, 5.0645, 4.0, -1, -1);
	pTollArea[2] = CreateDynamicSphere(1795.9447, 704.2550, 15.0006, 4.0, -1, -1);
	pTollArea[3] = CreateDynamicSphere(1778.9886, 702.6728, 15.2574, 4.0, -1, -1);

	printf("[Object] Number of Dynamic objects loaded: %d", CountDynamicObjects());
	return 1;
}

public OnVehicleSirenStateChange(playerid, vehicleid, newstate)
{
	if(newstate)
	{
	    FlashTime[vehicleid] = SetTimerEx("OnLightFlash", flashtime, true, "d", vehicleid);
	}

	if(!newstate)
	{
		new panels, doors, lights, tires;

		KillTimer(FlashTime[vehicleid]);

		GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
	    UpdateVehicleDamageStatus(vehicleid, panels, doors, 0, tires);
	}
	return 1;
}

public OnGameModeExit()
{
	new count = 0, count1 = 0;
	foreach(new gsid : GStation)
	{
		if(Iter_Contains(GStation, gsid))
		{
			count++;
			GStation_Save(gsid);
		}
	}
	printf("[Gas Station] Number of Saved: %d", count);
	
	foreach(new pid : Plants)
	{
		if(Iter_Contains(Plants, pid))
		{
			count1++;
			Plant_Save(pid);
		}
	}
	printf("[Farmer Plant] Number of Saved: %d", count1);
	for (new i = 0, j = GetPlayerPoolSize(); i <= j; i++) 
	{
		if (IsPlayerConnected(i))
		{
			OnPlayerDisconnect(i, 1);
		}
	}
	UnloadTazerSAPD();
	// Dini System Save Files
	SaveMapIcons();
	SaveBankPoint();
    // Check for valid object
	if (IsValidObject(LSApartments1Object))
	{
		// Destroy the LS Apartments 1 Building object
		DestroyObject(LSApartments1Object);
	}

    // Check for valid object
	if (IsValidObject(LSApartments1CPObject))
	{
		// Destroy the LS Apartments 1 Car Park object
		DestroyObject(LSApartments1CPObject);
	}

    // Destroy the elevator, the elevator doors and the elevator floor doors
	Elevator_Destroy();
	DestroyVehicle(pizzabikes[0]);
	DestroyVehicle(pizzabikes[1]);
	DestroyVehicle(pizzabikes[2]);
	DestroyVehicle(pizzabikes[3]);
	DestroyVehicle(pizzabikes[4]);
	// Strobe //
    new panels, doors, lights, tires;

	for(new i=0; i<GetVehiclePoolSize(); i++)
	{
	    KillTimer(FlashTime[i]);

	    GetVehicleDamageStatus(i, panels, doors, lights, tires);
	    UpdateVehicleDamageStatus(i, panels, doors, 0, tires);
	}
	//Audio_DestroyTCPServer();
	mysql_close(g_SQL);
	return 1;
}

function SAGSLobbyDoorClose()
{
	MoveDynamicObject(SAGSLobbyDoor, 1389.375000, -25.387500, 999.978210, 3);
	return 1;
}

function SAPDLobbyDoorClose()
{
	MoveDynamicObject(SAPDLobbyDoor[0], 253.10965, 107.61060, 1002.21368, 3);
	MoveDynamicObject(SAPDLobbyDoor[1], 253.12556, 110.49657, 1002.21460, 3);
	MoveDynamicObject(SAPDLobbyDoor[2], 239.69435, 116.15908, 1002.21411, 3);
	MoveDynamicObject(SAPDLobbyDoor[3], 239.64050, 119.08750, 1002.21332, 3);
	return 1;
}

function LLFLobbyDoorClose()
{
	MoveDynamicObject(LLFLobbyDoor, -2119.21509, 657.54187, 1060.73560, 3);
	return 1;
}

public OnPlayerPressButton(playerid, buttonid)
{
	if(buttonid == SAGSLobbyBtn[0] || buttonid == SAGSLobbyBtn[1])
	{
	    if(pData[playerid][pFaction] == 2)
	    {
	        MoveDynamicObject(SAGSLobbyDoor, 1387.9232, -25.3887, 999.9782, 3);
			SetTimer("SAGSLobbyDoorClose", 5000, 0);
	    }
		else
	    {
	        Error(playerid, "Access denied.");
			return 1;
		}
	}
	if(buttonid == SAPDLobbyBtn[0] || buttonid == SAPDLobbyBtn[1])
	{
		if(pData[playerid][pFaction] == 1)
		{
			MoveDynamicObject(SAPDLobbyDoor[0], 253.14204, 106.60210, 1002.21368, 3);
			MoveDynamicObject(SAPDLobbyDoor[1], 253.24377, 111.94370, 1002.21460, 3);
			SetTimer("SAPDLobbyDoorClose", 5000, 0);
		}
		else
	    {
	        Error(playerid, "Access denied.");
			return 1;
		}
	}
	if(buttonid == SAPDLobbyBtn[2] || buttonid == SAPDLobbyBtn[3])
	{
		if(pData[playerid][pFaction] == 1)
		{
			MoveDynamicObject(SAPDLobbyDoor[2], 239.52385, 114.75534, 1002.21411, 3);
			MoveDynamicObject(SAPDLobbyDoor[3], 239.71977, 120.21591, 1002.21332, 3);
			SetTimer("SAPDLobbyDoorClose", 5000, 0);
		}
		else
	    {
	        Error(playerid, "Access denied.");
			return 1;
		}
	}
	if(buttonid == LLFLobbyBtn[0] || buttonid == LLFLobbyBtn[1])
	{
		if(pData[playerid][pFamily] == 0)
		{
			MoveDynamicObject(LLFLobbyDoor, -2119.27148, 656.04028, 1060.73560, 3);
			SetTimer("LLFLobbyDoorClose", 5000, 0);
		}
		else
		{
			Error(playerid, "Access denied.");
			return 1;
		}
	}
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger)
	{
		if(IsSAPDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 1)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "You are not SAPD!");
			}
		}
		if(IsGovCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 2)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "You are not SAGS!");
			}
		}
		if(IsSAMDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 3)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "You are not SAMD!");
			}
		}
		if(IsSANACar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 4)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "You are not SANEW!");
			}
		}
		/*if(GetVehicleModel(vehicleid) == 548 || GetVehicleModel(vehicleid) == 417 || GetVehicleModel(vehicleid) == 487 || GetVehicleModel(vehicleid) == 488 ||
		GetVehicleModel(vehicleid) == 497 || GetVehicleModel(vehicleid) == 563 || GetVehicleModel(vehicleid) == 469)
		{
			if(pData[playerid][pLevel] < 5)
			{
				RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
				Error(playerid, "Anda tidak memiliki izin!");
			}
		}*/
		/*foreach(new pv : PVehicles)
		{
			if(vehicleid == pvData[pv][cVeh])
			{
				if(IsABike(vehicleid) && pvData[pv][cLocked] == 1)
				{
					RemovePlayerFromVehicle(playerid);
					new Float:slx, Float:sly, Float:slz;
					GetPlayerPos(playerid, slx, sly, slz);
					SetPlayerPos(playerid, slx, sly, slz);
					Error(playerid, "This bike is locked by owner.");
				}
			}
		}*/
	}
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    if(pData[playerid][pBerhasilTest] == 1)
	{
		//new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 405)
		{
		    DisablePlayerCheckpoint(playerid);
		    Servers(playerid, "Anda telah keluar dari kendaraan DMV, Test mengemudi telah berakhir. Anda gagal.");

			new pTestVeh = GetPVarInt(playerid, "PTestVeh");
			RemovePlayerFromVehicle(playerid);
			DestroyVehicle(pTestVeh);
		    pData[playerid][pBerhasilTest]--;
		    pData[playerid][pDMVProof]--;
		    DMVSteps[playerid][0] = 0;
		}
	}
	return 1;
}

/*public OnVehicleStreamIn(vehicleid, forplayerid)
{
	foreach(new pv : PVehicles)
	{
		if(vehicleid == pvData[pv][cVeh])
		{
			if(IsABike(vehicleid) || GetVehicleModel(vehicleid) == 424)
			{
				if(pvData[pv][cLocked] == 1)
				{
					SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
				}
			}
		}
	}
	return 1;
}*/

/*
public OnPlayerEnterKeypadArea(playerid, keypadid)
{
    ShowPlayerKeypad(playerid, keypadid);
    return 1;
}

public OnKeypadResponse(playerid, keypadid, bool:response, bool:success, code[])
{
    if(keypadid == SAGSLobbyKey[0])
    {
        if(!response)
        {
            HidePlayerKeypad(playerid, keypadid);
            return 1;
        }
		if(response)
        {
            if(!success)
            {
                Error(playerid, "Wrong Code.");
            }
			if(success)
			{
				Info(playerid, "Welcome.");
				MoveDynamicObject(SAGSLobbyDoor, 1387.9232, -25.3887, 999.9782, 3);
				SetTimer("SAGSLobbyDoorClose", 5000, 0);
			}
		}
	}
    if(keypadid == SAGSLobbyKey[1])
    {
        if(!response)
        {
            HidePlayerKeypad(playerid, keypadid);
            return 1;
        }
        if(response)
        {
            if(!success)
            {
                Error(playerid, "Wrong Code.");
            }
            if(success)
            {
                Info(playerid, "Welcome.");
				MoveDynamicObject(SAGSLobbyDoor, 1387.9232, -25.3887, 999.9782, 3);
				SetTimer("SAGSLobbyDoorClose", 5000, 0);
            }
        }
    }
    return 1;
} */

/*public OnPlayerActivateDoor(playerid, doorid)
{
	if(doorid == SAGSLobbyDoor)
	{
		if(pData[playerid][pFaction] != 2)
		{
			Error(playerid, "You dont have access!");
			return 1; // Cancels the door from being opened
		}
	}
	if(doorid == gMyDoor)
	{
		new bool:gIsDoorLocked = false;
		if(gIsDoorLocked == true)
		{
			SendClientMessage(playerid, -1, "Door is locked, can't open!");
			return 1; // Cancels the door from being opened
		}
	}
	return 1;
}

public OnButtonPress(playerid, buttonid)
{
	if(buttonid == SAGSLobbyBtn[0])
	{
		Info(playerid, "Well done!");
	}
	if(buttonid == SAGSLobbyBtn[1])
	{
		Info(playerid, "Well done!");
	}
}*/

public OnPlayerText(playerid, text[])
{
	if(isnull(text)) return 0;
	printf("[CHAT] %s(%d) : %s", pData[playerid][pName], playerid, text);
	
	if(pData[playerid][pSpawned] == 0 && pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be spawned or logged in to use chat.");
	    return 0;
	}
	if(!strcmp(text, "rpgun", true) || !strcmp(text, "gunrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s take the weapon off the belt and ready to shoot anytime.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcrash", true) || !strcmp(text, "crashrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s shocked after crash.", ReturnName(playerid));
		return 0;
	}
	if(text[0] == '!')
	{
		new tmp[512];
		if(text[1] == ' ')
		{
			format(tmp, sizeof(tmp), "%s", text[2]);
		}
		else
		{
			format(tmp, sizeof(tmp), "%s", text[1]);
		}
		if(pData[playerid][pAdminDuty] == 1)
		{
			if(strlen(tmp) > 64)
			{
				SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %.64s ..", ReturnName(playerid), tmp);
				SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", tmp[64]);
				return 0;
			}
			else
			{
				SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %s ))", ReturnName(playerid), tmp);
				return 0;
			}
		}
		else
		{
			if(strlen(tmp) > 64)
			{
				SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "%s: (( %.64s ..", ReturnName(playerid), tmp);
				SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", tmp[64]);
				return 0;
			}
			else
			{
				SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "%s: (( %s ))", ReturnName(playerid), tmp);
				return 0;
			}
		}
	}
	if(text[0] == '@')
	{
		if(pData[playerid][pSMS] != 0)
		{
			if(pData[playerid][pPhoneCredit] < 1)
			{
				Error(playerid, "You dont have phone credits!");
				return 0;
			}
			if(pData[playerid][pInjured] != 0)
			{
				Error(playerid, "You cant do at this time.");
				return 0;
			}
			new tmp[512];
			foreach(new ii : Player)
			{
				if(text[1] == ' ')
				{
			 		format(tmp, sizeof(tmp), "%s", text[2]);
				}
				else
				{
				    format(tmp, sizeof(tmp), "%s", text[1]);
				}
				if(pData[ii][pPhone] == pData[playerid][pSMS])
				{
					if(ii == INVALID_PLAYER_ID || !IsPlayerConnected(ii))
					{
						Error(playerid, "This number is not actived!");
						return 0;
					}
					SendClientMessageEx(playerid, COLOR_YELLOW, "[SMS to %d]"WHITE_E" %s", pData[playerid][pSMS], tmp);
					SendClientMessageEx(ii, COLOR_YELLOW, "[SMS from %d]"WHITE_E" %s", pData[playerid][pPhone], tmp);
					PlayerPlaySound(ii, 6003, 0,0,0);
					pData[ii][pSMS] = pData[playerid][pPhone];
					
					pData[playerid][pPhoneCredit] -= 1;
					return 0;
				}
			}
		}
	}
	if(pData[playerid][pCall] != INVALID_PLAYER_ID)
	{
		// Anti-Caps
		if(GetPVarType(playerid, "Caps"))
			UpperToLower(text);
		new lstr[1024];
		format(lstr, sizeof(lstr), "(cellphone) %s says: %s", ReturnName(playerid), text);
		ProxDetector(10, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
		SetPlayerChatBubble(playerid, text, COLOR_WHITE, 10.0, 3000);
		
		SendClientMessageEx(pData[playerid][pCall], COLOR_YELLOW, "[CELLPHONE] "WHITE_E"%s.", text);
		return 0;
	}
	else
	{
		// Anti-Caps
		if(GetPVarType(playerid, "Caps"))
			UpperToLower(text);
		new lstr[1024];
		format(lstr, sizeof(lstr), "%s says: %s", ReturnName(playerid), text);
		ProxDetector(10, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
		SetPlayerChatBubble(playerid, text, COLOR_WHITE, 10.0, 3000);
		return 0;
	}
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    if (result == -1)
    {
        Error(playerid, "Command doest not exist! "YELLOW_E"'/%s' "GREY_E"i see "X1_BLUE"'/help'"GREY_E" for more info.", cmd);
        return 0;
    }
	printf("[CMD]: %s(%d) has used the command '%s' (%s)", pData[playerid][pName], playerid, cmd, params);
    return 1;
}

public OnPlayerCommandText(playerid,cmdtext[])
{
	new str[256];
	new cmd[256],idx;
	cmd = strtok(cmdtext,idx);
	new Float:Pos[MAX_PLAYERS][4];
	new PosSelected[MAX_PLAYERS];
	if(!strcmp(cmdtext,"/co",true,4))
	{
		GetPlayerPos(playerid,Pos[playerid][0],Pos[playerid][1],Pos[playerid][2]);
		GetPlayerFacingAngle(playerid,Pos[playerid][3]);
		PosSelected[playerid] = 1;
		format(str,256,"%.4f,%.4f,%.4f || ",Pos[playerid][0],Pos[playerid][1],Pos[playerid][2],Pos[playerid][3]);
		SendClientMessage(playerid, ARWIN,str);
  		new File:fhandle;
    	fhandle = fopen("coordinates.txt",io_append);
		fwrite(fhandle,str);
  		fclose(fhandle);
  		Info(playerid,"Your coordinates has been saved in the file 'coordinates.txt' in your scriptfiles");
  		PosSelected[playerid] = 0;
	    return 1;
	}
	return 0;
}

public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
	return 1;
}

// Elevator Apartement Systen floor names for the 3D text labels
static FloorNames[11][] =
{
	"Car Park",
	"Ground Floor",
	"First Floor",
	"Second Floor",
	"Third Floor",
	"Fourth Floor",
	"Fifth Floor",
	"Sixth Floor",
	"Seventh Floor",
	"Eighth Floor",
	"Ninth Floor"
};

new const RandomMessage[5][144] = {
	""X1_BLUE"MOTD: "WHITE_E"Dear Warga baru. Jangan lupa membeli "AQUA"GPS "WHITE_E"Agar mudah mencari tempat-tempat penting!.",
    ""X1_BLUE"MOTD: "WHITE_E"Bila tidak tau command Server, Kalian bisa gunakan '"YELLOW_E"/help"WHITE_E"' untuk melihat list command",
    ""X1_BLUE"MOTD: "WHITE_E"Bila melihat player melanggar"RED_E" Rules "WHITE_E"kalian gunakan "RED_E"/report "YELLOW_E"untuk melaporkan",
    ""X1_BLUE"MOTD: "WHITE_E"Bila Kalian punya pertanyaan, silahkan gunakan command '"RED_E"/ask"WHITE_E"'.",
    ""X1_BLUE"MOTD: "WHITE_E"If you want to get complete server information, come join our discord: "AQUA"discord.gg/RanumRP"
};

ptask RandoMessages[180000](playerid) {
  new rand = random(5);
  SendClientMessageEx(playerid, -1, "%s", RandomMessage[rand], online);
}

stock SendMessageInChat(playerid, text[])
{
	new Float: x, Float: y, Float: z;
	new lstr[1024];

	GetPlayerPos(playerid, x, y, z);

	//UpperToLower(text);
	format(lstr, sizeof(lstr), "%s says: %s", ReturnName(playerid), text);
	ProxDetector(10, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
	SetPlayerChatBubble(playerid, text, COLOR_WHITE, 10.0, 3000);
	text[0] = toupper(text[0]);

	// if(!IsPlayerInAnyVehicle(playerid))
	// {
	// 	ApplyAnimation(playerid, "PED", "IDLE_chat", 4.100, 0, 1, 1, 1, 1, 1);
	// 	SetTimerEx("ClearPlayerAnim", strlen(text) * 400, false, "i", playerid);
	// }
	return 1;
}

public OnPlayerConnect(playerid)
{
	new hour, minute;
	gettime(hour, minute);
	online++;
	// Discord Register
	new query[256];
	format(query, sizeof(query), "**[LOGS] ``%s Has joined this Server``**", GetName(playerid));
	DCC_SendChannelMessage(login, query);
	new PlayerIP[16], country[MAX_COUNTRY_LENGTH], city[MAX_CITY_LENGTH];
	g_MysqlRaceCheck[playerid]++;
	ResetVariables(playerid);
	LoadPlayerAccount(playerid);
	CreatePlayerTextDraws(playerid);
	TextDrawShowForPlayer(playerid, TextDate);
	TextDrawShowForPlayer(playerid, td_waktu);

	GetPlayerName(playerid, pData[playerid][pName], MAX_PLAYER_NAME);
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	pData[playerid][pIP] = PlayerIP;

	GetPlayerCountry(playerid, country, MAX_COUNTRY_LENGTH);
	GetPlayerCity(playerid, city, MAX_CITY_LENGTH);

	SetTimerEx("SafeLogin", 1000, 0, "i", playerid);

	mysql_format(g_SQL, query, sizeof query, "SELECT * FROM `players` WHERE `username` = '%e' LIMIT 1", pData[playerid][pName]);
	mysql_pquery(g_SQL, query, "OnPlayerDataLoaded", "dd", playerid, g_MysqlRaceCheck[playerid]);
	SetPlayerColor(playerid, COLOR_WHITE);

	foreach(new ii : Player)
	{
		if(pData[ii][pTogLog] == 0)
		{
			SendClientMessageEx(ii, COLOR_RED, ""YELLOW_E"*"X1_BLUE" %s(%d) "YELLOW_E"has joined to the server.(%s, %s)", pData[playerid][pName], playerid, city, country);
		}
	}
	// SIDEJOB
    KerjaBus[playerid] = 0;
    KerjaSweeper[playerid] = 0;
    KerjaForklift[playerid] = 0;
	for(new i = 0; i < 3; i++)
	{
		BusSteps[playerid][i] = 0;
	}
	for(new i = 0; i < 3; i++)
	{
		SweeperSteps[playerid][i] = 0;
	}
	for(new i = 0; i < 1; i++)
	{
		ForkliftSteps[playerid][i] = 0;
	}
	// Dmv Test Drive
	for(new i = 0; i < 1; i++)
	{
		DMVSteps[playerid][i] = 0;
	}

	pData[playerid][activitybar] = CreatePlayerProgressBar(playerid, 273.500000, 157.333541, 88.000000, 19.000000, -1061109611, 100, 0);

	//HBE textdraw Modern
	pData[playerid][damagebar] = CreatePlayerProgressBar(playerid, 459.000000, 415.749938, 61.000000, 9.000000, 16711935, 1000.0, 0);
	pData[playerid][fuelbar] = CreatePlayerProgressBar(playerid, 459.500000, 432.083221, 61.000000, 9.000000, 16711935, 1000.0, 0);
                
	pData[playerid][hungrybar] = CreatePlayerProgressBar(playerid, 565.500000, 405.833404, 68.000000, 8.000000, 16711935, 100.0, 0);
	pData[playerid][energybar] = CreatePlayerProgressBar(playerid, 565.500000, 420.416717, 68.000000, 8.000000, 16711935, 100.0, 0);
	pData[playerid][bladdybar] = CreatePlayerProgressBar(playerid, 565.500000, 435.000091, 68.000000, 8.000000, 16711935, 100.0, 0);

	//HBE textdraw Simple
	pData[playerid][BarFuel] = CreatePlayerProgressBar(playerid, 323.000000, 395.000000, 62.000000, 4.000000, 16711935, 1000.0, 0);
	pData[playerid][BarDamage] = CreatePlayerProgressBar(playerid, 322.000000, 421.000000, 62.000000, 4.000000, 16711935, 1000.0, 0);
	
	pData[playerid][BarLapar] = CreatePlayerProgressBar(playerid, 558.000000, 398.000000, 78.000000, 2.500000, 16711935, 100.0, 0); // 0 Warna
	pData[playerid][BarHaus] = CreatePlayerProgressBar(playerid, 558.000000, 417.000000, 78.000000, 2.500000, 16711935, 100.0, 0);
	//pData[playerid][spbladdybar] = CreatePlayerProgressBar(playerid, 595.500000, 433.250061, 41.000000, 8.000000, 16711935, 100.0, 0);

	/* Remove Mapping */
	RemoveMapping(playerid);
	// RESET VARIABLE Anti Cbug
	KillTimer(Freeze[playerid]);
	LastFired[playerid] = -1;
	cbug[playerid] = false;
	// Pizzaboy
    IsInJob[playerid]=0;TipTime[playerid]=0;
    KillTimer(InfoTimer[playerid]);
	PlayerTutorialTime[playerid]=0;
	PlayerCheckpoint[playerid]=CHECKPOINT_NONE;
	PlayerTips[playerid]=0;
	PlayerEarnings[playerid]=0;
    if(IsValidActor(PlayerCustomer[playerid])) { DestroyActor(PlayerCustomer[playerid]); }
    PlayerSkin[playerid]=0;
	// Crates
	CarryCrate[playerid] = 0;
	CarryCrateFish[playerid] = 0;
	CarryCrateCompo[playerid] = 0;
	// Vehicle Toys
	pvehEditID[playerid] = 0;
	pvEditID[playerid] = 0;
	//PlayAudioStreamForPlayer(playerid, "http://www.soi-rp.com/music/songs/LP-A_Light.mp3");
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    online--;
    // Discord Server
	new query[256];
	format(query, sizeof(query), "**[LOGS] ``%s Has leave from this Server``**", GetName(playerid));
	DCC_SendChannelMessage(logout, query);
	/*if(IsPlayerInAnyVehicle(playerid))
	{
        RemovePlayerFromVehicle(playerid);
    }*/
	//UpdateWeapons(playerid);
	g_MysqlRaceCheck[playerid]++;

	// Smuggler
    if(pData[playerid][pPacket] == 1)
    {
        taked = 0;
        pData[playerid][pPacket]--;
        pCPPacket = INVALID_PLAYER_ID;
        new Float:X, Float:Y, Float:Z;
        new rand = random(sizeof(RandomPacketPos));
        GetPlayerPos(playerid, X, Y, Z);
        objectpacket = CreateDynamicObject(11745, RandomPacketPos[rand][0], RandomPacketPos[rand][1], RandomPacketPos[rand][2], 0.00000, 0.00000, 0.00000);
        taked = 0;
    }
    // New Dialog
	for(new i; i <= 9; i++) // 9 = Total Dialog , Jadi kita mau tau kalau Player Ini Apakah Ambil Dialog dari 3 tersebut apa ga !
	{
		if(DialogSaya[playerid][i] == true) // Cari apakah dia punya salah satu diantara 10 dialog tersebut
		{
		    DialogSaya[playerid][i] = false; // Ubah Jadi Dia ga punya dialog lagi Kalau Udah Disconnect (Bukan dia lagi pemilik)
		    DialogSweeper[i] = false; // Jadi ga ada yang punya nih dialog
		    DialogBus[i] = false; // Jadi ga ada yang punya nih dialog
		    //DestroyVehicle(TrailerHauling[playerid]);
		}
	}

	if(GetPVarType(playerid, "PlacedBB"))
    {
        DestroyDynamicObject(GetPVarInt(playerid, "PlacedBB"));
        DestroyDynamic3DTextLabel(Text3D:GetPVarInt(playerid, "BBLabel"));
        if(GetPVarType(playerid, "BBArea"))
        {
            foreach(new i : Player)
            {
                if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "BBArea")))
                {
                    StopAudioStreamForPlayer(i);
                    SendClientMessage(i, COLOR_PURPLE, " The boombox creator has disconnected from the server.");
                }
            }
        }
    }
	UpdatePlayerData(playerid);
	RemovePlayerVehicle(playerid);
	Report_Clear(playerid);
	Ask_Clear(playerid);
	Player_ResetMining(playerid);
	Player_ResetCutting(playerid);
	Player_RemoveLumber(playerid);
	Player_ResetHarvest(playerid);
	KillTazerTimer(playerid);
	SavePlayerAccount(playerid);
	
    // Vehicle Object
	for(new v; v < MAX_PLAYER_VEHICLE; ++v)
	{
  		for(new vt = 0; vt < 4; vt++)
		{
		 	DestroyDynamicObject(vtData[v][vt][vtoy_model]);
		}
	}
	// Hauling Trailer Gas Stasion
	if(IsValidVehicle(pData[playerid][pTrailer]))
		DestroyVehicle(pData[playerid][pTrailer]);

	pData[playerid][pTrailer] = INVALID_VEHICLE_ID;
	/////////////////////////////////////////////////////
	if(IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pAdoTag]);
			
	if(IsValidDynamicObject(pData[playerid][pFlare]))
            DestroyDynamicObject(pData[playerid][pFlare]);

    pData[playerid][pAdoActive] = false;
	
	/*if(cache_is_valid(pData[playerid][Cache_ID]) && pData[playerid][IsLoggedIn] == false)
	{
		cache_delete(pData[playerid][Cache_ID]);
		pData[playerid][Cache_ID] = MYSQL_INVALID_CACHE;
	}*/

	if (pData[playerid][LoginTimer])
	{
		KillTimer(pData[playerid][LoginTimer]);
		pData[playerid][LoginTimer] = 0;
	}

	pData[playerid][IsLoggedIn] = false;
	
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	
	foreach(new ii : Player)
	{
		if(IsPlayerInRangeOfPoint(ii, 40.0, x, y, z))
		{
			switch(reason)
			{
				case 0:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]"YELLOW_E" %s(%d) has leave from the server.(timeout/crash)", pData[playerid][pName], playerid);
				}
				case 1:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]"YELLOW_E" %s(%d) has leave from the server.(leaving)", pData[playerid][pName], playerid);
				}
				case 2:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]"YELLOW_E" %s(%d) has leave from the server.(kicked/banned)", pData[playerid][pName], playerid);
				}
			}
		}
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	//SetSpawnInfo(playerid, 0, pData[playerid][pSkin], pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ], pData[playerid][pPosA], 0, 0, 0, 0, 0, 0);
	//SpawnPlayer(playerid);
	StopAudioStreamForPlayer(playerid);
	SetPlayerInterior(playerid, pData[playerid][pInt]);
	SetPlayerVirtualWorld(playerid, pData[playerid][pWorld]);
	SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
	SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, 0);
	SetPlayerSpawn(playerid);
	LoadAnims(playerid);
	
	SetPlayerSkillLevel(playerid, WEAPON_COLT45, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SILENCED, 1);
	SetPlayerSkillLevel(playerid, WEAPON_DEAGLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SAWEDOFF, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGSPA, 1);
	SetPlayerSkillLevel(playerid, WEAPON_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPON_MP5, 1);
	SetPlayerSkillLevel(playerid, WEAPON_AK47, 1);
	SetPlayerSkillLevel(playerid, WEAPON_M4, 1);
	SetPlayerSkillLevel(playerid, WEAPON_TEC9, 1);
	SetPlayerSkillLevel(playerid, WEAPON_RIFLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SNIPER, 1);
	return 1;
}

SetPlayerSpawn(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(pData[playerid][pGender] == 0)
		{
			TogglePlayerControllable(playerid,0);
			SetPlayerHealth(playerid, 100.0);
			SetPlayerArmour(playerid, 0.0);
			SetPlayerPos(playerid, 1716.1129, -1880.0715, -10.0);
			SetPlayerCameraPos(playerid,1755.0413,-1824.8710,20.2100);
			SetPlayerCameraLookAt(playerid,1716.1129,-1880.0715,22.0264);
			SetPlayerVirtualWorld(playerid, 0);
			ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun): 15/04/1998", "Enter", "Batal");
		}
		else
		{
			SetPlayerColor(playerid, COLOR_WHITE);
			if(pData[playerid][pHBEMode] == 1) //simple
			{
				ShowPlayerProgressBar(playerid, pData[playerid][BarLapar]);
				ShowPlayerProgressBar(playerid, pData[playerid][BarHaus]);
				//ShowPlayerProgressBar(playerid, pData[playerid][spbladdybar]);
				for(new txd; txd < 6; txd++)
				{
					TextDrawShowForPlayer(playerid, HBE_TD[txd]);
				}
			}
			if(pData[playerid][pHBEMode] == 2) //modern
			{
				ShowPlayerProgressBar(playerid, pData[playerid][hungrybar]);
				ShowPlayerProgressBar(playerid, pData[playerid][energybar]);
				ShowPlayerProgressBar(playerid, pData[playerid][bladdybar]);
				for(new txd; txd < 5; txd++)
				{
					TextDrawShowForPlayer(playerid, TDEditor_TD[txd]);
				}
			}
			else
			{
				
			}
			TextDrawShowForPlayer(playerid, SOIRP_TXD);
			TextDrawShowForPlayer(playerid, td_waktu);

			SetPlayerSkin(playerid, pData[playerid][pSkin]);
			if(pData[playerid][pOnDuty] >= 1)
			{
				SetPlayerSkin(playerid, pData[playerid][pFacSkin]);
				SetFactionColor(playerid);
			}
			if(pData[playerid][pAdminDuty] > 0)
			{
				SetPlayerColor(playerid, COLOR_RED);
			}
			SetTimerEx("SpawnTimer", 6000, false, "i", playerid);
		}
	}
}

function SpawnTimer(playerid)
{
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, pData[playerid][pMoney]);
	SetPlayerScore(playerid, pData[playerid][pLevel]);
	SetPlayerHealth(playerid, pData[playerid][pHealth]);
	SetPlayerArmour(playerid, pData[playerid][pArmour]);
	pData[playerid][pSpawned] = 1;
	TogglePlayerControllable(playerid, 1);
	SetCameraBehindPlayer(playerid);
	AttachPlayerToys(playerid);
	SetWeapons(playerid);
	if(pData[playerid][pJail] > 0)
	{
		JailPlayer(playerid); 
	}
	if(pData[playerid][pArrestTime] > 0)
	{
		SetPlayerArrest(playerid, pData[playerid][pArrest]);
	}
	LoadPlayerAccount(playerid);
	return 1;
}

public OnPlayerModelSelection(playerid, response, listid, modelid)
{
	if(listid == SpawnMale)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1744.3411, -1862.8655, 13.3983, 270.0000, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
		}
    }
	if(listid == SpawnFemale)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1744.3411, -1862.8655, 13.3983, 270.0000, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
		}
    }
	//Locker Faction Skin
	if(listid == SAPDMale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAPDFemale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAPDWar)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAGSMale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAGSFemale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAMDMale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAMDFemale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SANEWMale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SANEWFemale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	///Bisnis buy skin clothes
	if(listid == MaleSkins)
    {
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerMoneyEx(playerid, -price);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
            Bisnis_Save(bizid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
	if(listid == FemaleSkins)
    {
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerMoneyEx(playerid, -price);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
            Bisnis_Save(bizid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
	if(listid == VIPMaleSkins)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengganti skin ID %d.", ReturnName(playerid), modelid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
	if(listid == VIPFemaleSkins)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d.", ReturnName(playerid), modelid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
	if(listid == toyslist)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][1];
			
			GivePlayerMoneyEx(playerid, -price);
			if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");
			
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli object ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
            Bisnis_Save(bizid);
		}
		else return Servers(playerid, "Canceled buy toys");
	}
	if(listid == viptoyslist)
	{
		if(response)
		{
			if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");
			
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengambil object ID %d dilocker.", ReturnName(playerid), modelid);
		}
		else return Servers(playerid, "Canceled toys");
	}
    if(listid == vtoylist)
	{
		if(response)
		{
			new x = GetPlayerVehicleID(playerid);
			foreach(new i: PVehicles)
			if(x == pvData[i][cVeh])
			{
				new vehid = pvData[i][cVeh];
				vtData[vehid][pvData[vehid][vtoySelected]][vtoy_modelid] = modelid;
				if(pvData[vehid][PurchasedvToy] == false)
				{
					MySQL_CreateVehicleToy(i);
				}
				/*vtData[vehid][pvData[vehid][vtoySelected]][vtoy_model] = CreateDynamicObject(vtData[vehid][pvData[vehid][vtoySelected]][vtoy_modelid], 0.0, 0.0, -14.0, 0.0, 0.0, 0.0);
				AttachDynamicObjectToVehicle(vtData[vehid][pvData[vehid][vtoySelected]][vtoy_model], vehid, vtData[vehid][pvData[vehid][vtoySelected]][vtoy_x], vtData[vehid][pvData[vehid][vtoySelected]][vtoy_y], vtData[vehid][pvData[vehid][vtoySelected]][vtoy_z], vtData[vehid][pvData[vehid][vtoySelected]][pvtoy_rx], vtData[vehid][pvData[vehid][vtoySelected]][pvtoy_ry], vtData[vehid][pvData[vehid][vtoySelected]][pvtoy_rz]);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memasang toys untuk vehicleid(%d) object ID %d", ReturnName(playerid), vehid, modelid);*/
				Info(playerid, "Anda akan membeli Object Kendaraan, Jika anda yakin Confirmasi klik 'YES' jika tidak 'Cancel'");
				ShowPlayerDialog(playerid, VTOY_ACCEPT, DIALOG_STYLE_MSGBOX, "Vehicle Toys", "Do You Want To Save it?", "Yes", "Cancel");
			}
		}
		else return Servers(playerid, "Canceled buy toys");
	}
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{

//		SetPlayerCameraPos(playerid, 2044.095458, -1404.125488, 68.685363);
//		SetPlayerCameraLookAt(playerid, 2043.982421, -1399.126953, 68.729545);


	//	SetPlayerPosEx(playerid, 2043.7744,-1399.0029,68.3237);
		//SetPlayerFacingAngle(playerid, 181.2955);

	SetPlayerPos(playerid, 1799.8578, -1867.5543, 13.5997);
	SetPlayerFacingAngle(playerid, 3.8434);
	InterpolateCameraPos(playerid, 1673.583862, -1820.771728, 41.857559, 1824.760742, -1841.912841, 28.685043, 6700);
	InterpolateCameraLookAt(playerid, 1676.457885, -1824.473022, 40.113750, 1821.608886, -1845.146606, 26.538398, 6700);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(IsInJob[playerid] == 1)
	{
	    IsInJob[playerid]=0;TipTime[playerid]=0;
	    KillTimer(InfoTimer[playerid]);
		PlayerTutorialTime[playerid]=0;
		PlayerCheckpoint[playerid]=CHECKPOINT_NONE;
		PlayerTips[playerid]=0;
		PlayerEarnings[playerid]=0;
	    if(IsValidActor(PlayerCustomer[playerid])) { DestroyActor(PlayerCustomer[playerid]); }
	    PlayerSkin[playerid]=0;
		SendClientMessage(playerid,-1," You have died and the part-time job has been canceled!");
	}
	DeletePVar(playerid, "UsingSprunk");
	SetPVarInt(playerid, "GiveUptime", -1);
	pData[playerid][pSpawned] = 1;
	Player_ResetCutting(playerid);
	Player_RemoveLumber(playerid);
	Player_ResetMining(playerid);
	Player_ResetHarvest(playerid);
	
	pData[playerid][CarryProduct] = 0;
	
	KillTimer(pData[playerid][pActivity]);
	KillTimer(pData[playerid][pMechanic]);
	KillTimer(pData[playerid][pProducting]);
	KillTimer(pData[playerid][pCooking]);
	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
	PlayerTextDrawHide(playerid, ActiveTD[playerid]);
	pData[playerid][pMechVeh] = INVALID_VEHICLE_ID;
	pData[playerid][pActivityTime] = 0;
	
	pData[playerid][pMechDuty] = 0;
	pData[playerid][pTaxiDuty] = 0;
	pData[playerid][pMission] = -1;
	
	pData[playerid][pSideJob] = 0;
	DisablePlayerCheckpoint(playerid);
	DisablePlayerRaceCheckpoint(playerid);
	SetPlayerColor(playerid, COLOR_WHITE);
	RemovePlayerAttachedObject(playerid, 9);
	GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	foreach(new ii : Player)
    {
        if(pData[ii][pAdmin] > 0)
        {
            SendDeathMessageToPlayer(ii, killerid, playerid, reason);
        }
    }
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ,Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	new weaponid = EditingWeapon[playerid];
    if(weaponid)
    {
        if(response == 1)
        {
            new enum_index = weaponid - 22, weaponname[18], string[340];
 
            GetWeaponName(weaponid, weaponname, sizeof(weaponname));
           
            WeaponSettings[playerid][enum_index][Position][0] = fOffsetX;
            WeaponSettings[playerid][enum_index][Position][1] = fOffsetY;
            WeaponSettings[playerid][enum_index][Position][2] = fOffsetZ;
            WeaponSettings[playerid][enum_index][Position][3] = fRotX;
            WeaponSettings[playerid][enum_index][Position][4] = fRotY;
            WeaponSettings[playerid][enum_index][Position][5] = fRotZ;
 
            RemovePlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid));
            SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);
 
            Servers(playerid, "You have successfully adjusted the position of your %s.", weaponname);
           
            mysql_format(g_SQL, string, sizeof(string), "INSERT INTO weaponsettings (Owner, WeaponID, PosX, PosY, PosZ, RotX, RotY, RotZ) VALUES ('%d', %d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f) ON DUPLICATE KEY UPDATE PosX = VALUES(PosX), PosY = VALUES(PosY), PosZ = VALUES(PosZ), RotX = VALUES(RotX), RotY = VALUES(RotY), RotZ = VALUES(RotZ)", pData[playerid][pID], weaponid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ);
            mysql_tquery(g_SQL, string);
        }
		else if(response == 0)
		{
			new enum_index = weaponid - 22;
			SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);
		}
        EditingWeapon[playerid] = 0;
		return 1;
    }
	else
	{
		if(response == 1)
		{
			GameTextForPlayer(playerid, "~g~~h~Toy Position Updated~y~!", 4000, 5);

			pToys[playerid][index][toy_x] = fOffsetX;
			pToys[playerid][index][toy_y] = fOffsetY;
			pToys[playerid][index][toy_z] = fOffsetZ;
			pToys[playerid][index][toy_rx] = fRotX;
			pToys[playerid][index][toy_ry] = fRotY;
			pToys[playerid][index][toy_rz] = fRotZ;
			pToys[playerid][index][toy_sx] = fScaleX;
			pToys[playerid][index][toy_sy] = fScaleY;
			pToys[playerid][index][toy_sz] = fScaleZ;
			
			MySQL_SavePlayerToys(playerid);
		}
		else if(response == 0)
		{
			GameTextForPlayer(playerid, "~r~~h~Selection Cancelled~y~!", 4000, 5);

			SetPlayerAttachedObject(playerid,
				index,
				modelid,
				boneid,
				pToys[playerid][index][toy_x],
				pToys[playerid][index][toy_y],
				pToys[playerid][index][toy_z],
				pToys[playerid][index][toy_rx],
				pToys[playerid][index][toy_ry],
				pToys[playerid][index][toy_rz],
				pToys[playerid][index][toy_sx],
				pToys[playerid][index][toy_sy],
				pToys[playerid][index][toy_sz]);
		}
		SetPVarInt(playerid, "UpdatedToy", 1);
		TogglePlayerControllable(playerid, true);
	}
	return 1;
}

public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT: objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(pData[playerid][EditingTreeID] != -1 && Iter_Contains(Trees, pData[playerid][EditingTreeID]))
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingTreeID];
	        TreeData[etid][treeX] = x;
	        TreeData[etid][treeY] = y;
	        TreeData[etid][treeZ] = z;
	        TreeData[etid][treeRX] = rx;
	        TreeData[etid][treeRY] = ry;
	        TreeData[etid][treeRZ] = rz;

	        SetDynamicObjectPos(objectid, TreeData[etid][treeX], TreeData[etid][treeY], TreeData[etid][treeZ]);
	        SetDynamicObjectRot(objectid, TreeData[etid][treeRX], TreeData[etid][treeRY], TreeData[etid][treeRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_X, TreeData[etid][treeX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_Y, TreeData[etid][treeY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_Z, TreeData[etid][treeZ] + 1.5);

		    Tree_Save(etid);
	        pData[playerid][EditingTreeID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingTreeID];
	        SetDynamicObjectPos(objectid, TreeData[etid][treeX], TreeData[etid][treeY], TreeData[etid][treeZ]);
	        SetDynamicObjectRot(objectid, TreeData[etid][treeRX], TreeData[etid][treeRY], TreeData[etid][treeRZ]);
	        pData[playerid][EditingTreeID] = -1;
	    }
	}
	if(pData[playerid][EditingOreID] != -1 && Iter_Contains(Ores, pData[playerid][EditingOreID]))
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingOreID];
	        OreData[etid][oreX] = x;
	        OreData[etid][oreY] = y;
	        OreData[etid][oreZ] = z;
	        OreData[etid][oreRX] = rx;
	        OreData[etid][oreRY] = ry;
	        OreData[etid][oreRZ] = rz;

	        SetDynamicObjectPos(objectid, OreData[etid][oreX], OreData[etid][oreY], OreData[etid][oreZ]);
	        SetDynamicObjectRot(objectid, OreData[etid][oreRX], OreData[etid][oreRY], OreData[etid][oreRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_X, OreData[etid][oreX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_Y, OreData[etid][oreY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_Z, OreData[etid][oreZ] + 1.5);

		    Ore_Save(etid);
	        pData[playerid][EditingOreID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingOreID];
	        SetDynamicObjectPos(objectid, OreData[etid][oreX], OreData[etid][oreY], OreData[etid][oreZ]);
	        SetDynamicObjectRot(objectid, OreData[etid][oreRX], OreData[etid][oreRY], OreData[etid][oreRZ]);
	        pData[playerid][EditingOreID] = -1;
	    }
	}
	if(pData[playerid][EditingATMID] != -1 && Iter_Contains(ATMS, pData[playerid][EditingATMID]))
	{
		if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        AtmData[etid][atmX] = x;
	        AtmData[etid][atmY] = y;
	        AtmData[etid][atmZ] = z;
	        AtmData[etid][atmRX] = rx;
	        AtmData[etid][atmRY] = ry;
	        AtmData[etid][atmRZ] = rz;

	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_X, AtmData[etid][atmX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Y, AtmData[etid][atmY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Z, AtmData[etid][atmZ] + 0.3);

		    Atm_Save(etid);
	        pData[playerid][EditingATMID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);
	        pData[playerid][EditingATMID] = -1;
	    }
	}
	if(pData[playerid][gEditID] != -1 && Iter_Contains(Gates, pData[playerid][gEditID]))
	{
		new id = pData[playerid][gEditID];
		if(response == EDIT_RESPONSE_UPDATE)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
		}
		else if(response == EDIT_RESPONSE_CANCEL)
		{
			SetDynamicObjectPos(objectid, gPosX[playerid], gPosY[playerid], gPosZ[playerid]);
			SetDynamicObjectRot(objectid, gRotX[playerid], gRotY[playerid], gRotZ[playerid]);
			gPosX[playerid] = 0; gPosY[playerid] = 0; gPosZ[playerid] = 0;
			gRotX[playerid] = 0; gRotY[playerid] = 0; gRotZ[playerid] = 0;
			Servers(playerid, " You have canceled editing gate ID %d.", id);
			Gate_Save(id);
		}
		else if(response == EDIT_RESPONSE_FINAL)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
			if(pData[playerid][gEdit] == 1)
			{
				gData[id][gCX] = x;
				gData[id][gCY] = y;
				gData[id][gCZ] = z;
				gData[id][gCRX] = rx;
				gData[id][gCRY] = ry;
				gData[id][gCRZ] = rz;
				if(IsValidDynamic3DTextLabel(gData[id][gText])) DestroyDynamic3DTextLabel(gData[id][gText]);
				new str[64];
				format(str, sizeof(str), "Gate ID: %d", id);
				gData[id][gText] = CreateDynamic3DTextLabel(str, COLOR_WHITE, gData[id][gCX], gData[id][gCY], gData[id][gCZ], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 10.0);
				
				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's closing position.", id);
				gData[id][gStatus] = 0;
				Gate_Save(id);
			}
			else if(pData[playerid][gEdit] == 2)
			{
				gData[id][gOX] = x;
				gData[id][gOY] = y;
				gData[id][gOZ] = z;
				gData[id][gORX] = rx;
				gData[id][gORY] = ry;
				gData[id][gORZ] = rz;
				
				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's opening position.", id);

				gData[id][gStatus] = 1;
				Gate_Save(id);
			}
		}
	}
	// IN GAME MAPPING //
    new idx = oEditID[playerid], String[1280];
	if(response == EDIT_RESPONSE_UPDATE)
	{
	    SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
	}
	else if(response == EDIT_RESPONSE_CANCEL)
	{
	    if(oEditID[playerid] != 0)
	    {
		    SetDynamicObjectPos(objectid, oPos[playerid][0], oPos[playerid][1], oPos[playerid][2]);
			SetDynamicObjectRot(objectid, oRot[playerid][0], oRot[playerid][1], oRot[playerid][2]);
			oPos[playerid][0] = 0; oPos[playerid][1] = 0; oPos[playerid][2] = 0;
			oRot[playerid][0] = 0; oRot[playerid][1] = 0; oRot[playerid][2] = 0;
			format(String, sizeof(String), " Anda membatalkan Edit Object ID %d.", idx);
			SendClientMessage(playerid, COLOR_WHITE, String);
			oEdit[playerid] = 0;
			oEditID[playerid] = 0;
		}
	}
	else if(response == EDIT_RESPONSE_FINAL)
	{
		SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
		if(oEdit[playerid] == 1)
		{
		    ObjectInfo[idx][oX] = x;
			ObjectInfo[idx][oY] = y;
			ObjectInfo[idx][oZ] = z;
			ObjectInfo[idx][oRX] = rx;
			ObjectInfo[idx][oRY] = ry;
			ObjectInfo[idx][oRZ] = rz;
			//ObjectInfo[idx][oText] = CreateDynamic3DTextLabel(String, COLOR_WHITE, ObjectInfo[idx][oX], ObjectInfo[idx][oY], ObjectInfo[idx][oZ], 10);
		    oEdit[playerid] = 0;
		    oEditID[playerid] = 0;
		    format(String, sizeof(String), " Anda telah menyelesaikan Edit Posisi Object ID %d.", idx);
		    SendClientMessage(playerid, COLOR_WHITE, String);
			SaveObj();
		}
	}
	new idxvs = pvEditID[playerid];
	new idxs = pvehEditID[playerid];
	new vehid = pData[playerid][VehicleID];
	GetDynamicObjectPos(vtData[vehid][idxs][vtoy_model], pvPos[playerid][0], pvPos[playerid][1], pvPos[playerid][2]);
	GetDynamicObjectRot(vtData[vehid][idxs][vtoy_model], pvRot[playerid][0], pvRot[playerid][1], pvRot[playerid][2]);
	if(response == EDIT_RESPONSE_UPDATE)
	{
	    SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
		Info(playerid, "Anda memulai mengedit object");
	}
	else if(response == EDIT_RESPONSE_CANCEL)
	{
	    if(pvEditID[playerid] != 0)
	    {
		    SetDynamicObjectPos(objectid, pvPos[playerid][0], pvPos[playerid][1], pvPos[playerid][2]);
			SetDynamicObjectRot(objectid, pvRot[playerid][0], pvRot[playerid][1], pvRot[playerid][2]);
			DestroyDynamicObject(vtData[vehid][idxs][vtoy_model]);
			format(String, sizeof(String), " Anda membatalkan Edit Posisi Vehicle Object ID %d.", idxvs);
			SendClientMessage(playerid, COLOR_WHITE, String);
			pvEdit[playerid] = 0;
			pvEditID[playerid] = 0;
			pvehEditID[playerid] = 0;
		}
	}
	else if(response == EDIT_RESPONSE_FINAL)
	{
	    SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
		if(pvEdit[playerid] == 1)
		{
		    new Float:vx, Float:vy, Float:vz, Float:va, Float:ofaz;
		    new Float:ofx, Float:ofy, Float:ofz, Float: finalx;
		    new Float:finaly;
		    GetVehiclePos(vtData[vehid][idxs][vtoy_model], vx, vy, vz);
		    GetVehicleZAngle(vtData[vehid][idxs][vtoy_model], va);
			ofx = x-vx;
			ofy = y-vy;
			ofz = z-vz;
			ofaz = rz-va;
			finalx = ofx*floatcos(va, degrees)+ofy*floatsin(va, degrees);
			finaly = -ofx*floatsin(va, degrees)+ofy*floatcos(va, degrees);
		    vtData[vehid][idxs][vtoy_x] = finalx;
			vtData[vehid][idxs][vtoy_y] = finaly;
			vtData[vehid][idxs][vtoy_z] = ofz;
			vtData[vehid][idxs][vtoy_rx] = rx;
			vtData[vehid][idxs][vtoy_ry] = ry;
			vtData[vehid][idxs][vtoy_rz] = ofaz;
			AttachDynamicObjectToVehicle(vtData[vehid][idxs][vtoy_model], vtData[vehid][pvData[vehid][vtoySelected]][vtoy_model], finalx, finaly, ofz, rx, ry, rz);
			format(String, sizeof(String), "Anda telah mengedit Vehicle Object ID: %d", idxvs);
			SendClientMessage(playerid, COLOR_WHITE, String);
		    pvEdit[playerid] = 0;
		    pvEditID[playerid] = 0;
		    pvehEditID[playerid] = 0;
		    format(String, sizeof(String), " Anda telah menyelesaikan Edit Posisi Vehicle Object ID %d.", idxvs);
		    SendClientMessage(playerid, COLOR_WHITE, String);
		}
	}
	return 1;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	if(checkpointid == pData[playerid][LoadingPoint])
	{
	    if(GetPVarInt(playerid, "LoadingCooldown") > gettime()) return 1;
		new vehicleid = GetPVarInt(playerid, "LastVehicleID"), type[64], carid = -1;
		if(pData[playerid][CarryingLog] == 0)
		{
			type = "Metal";
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			type = "Coal";
		}
		else
		{
			type = "Unknown";
		}
		if(Vehicle_LogCount(vehicleid) >= LOG_LIMIT) return Error(playerid, "You can't load any more ores to this vehicle.");
		if((carid = Vehicle_Nearest2(playerid)) != -1)
		{
			if(pData[playerid][CarryingLog] == 0)
			{
				pvData[carid][cMetal] += 1;
			}
			else if(pData[playerid][CarryingLog] == 1)
			{
				pvData[carid][cCoal] += 1;
			}
		}
		LogStorage[vehicleid][ pData[playerid][CarryingLog] ]++;
		Info(playerid, "MINING: Loaded %s.", type);
		ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);
		Player_RemoveLog(playerid);
		return 1;
	}
	if(checkpointid == ShowRoomCP)
	{
		ShowPlayerDialog(playerid, DIALOG_BUYPVCP, DIALOG_STYLE_LIST, "Vehicle Showroom List", "Motorcycle\nCar's Vehicle\nCar's Sport Unique\nJobs Car's Vehicle\n"YELLOW_E"VVIP Import Vehicles", "Select", "Cancel");
	}
	if(checkpointid == ShowRoomCPRent)
	{
 		new String[10000], S3MP4K[10000];
	   	strcat(S3MP4K, "Model\tPrice\tDuration\n");
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(414));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(455));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(456));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(498));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(499));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(609));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(478));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(422));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(543));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(554));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(525));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(428));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(438));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(420));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(423));
		strcat(S3MP4K, String);
		format(String, sizeof(String), ""YELLOW_E"%s\t"LG_E"$500,00\t"RED_E"24 Hours'e\n", GetVehicleModelName(578));
		strcat(S3MP4K, String);
		ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARS, DIALOG_STYLE_TABLIST_HEADERS, "Rental Jobs Cars List", S3MP4K, "Rental", "Cancel");
	}
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	// SWEEPER //
	if(pData[playerid][pSideJob] == 1)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 574)
		{
			for(new i; i <= 3; i++) // 3 = Total Dialog , Jadi kita mau tau kalau Player Ini Apakah Ambil Dialog dari 3 tersebut apa ga !
			{
				if(SweeperSteps[playerid][i] > 0)
				{
				 	if(IsPlayerInAnyVehicle(playerid))
					{
						if(SweeperSteps[playerid][0] == 1)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 144);
					        AddPlayerSalary(playerid, "Street Cleanner(bonus)", 134);
					        SweeperSteps[playerid][0] = 2;
					        SetPlayerRaceCheckpoint(playerid, 0, 1619.4293,-1881.6036,13.4845, 1816.1698,-1834.6884,13.4141, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][0] == 2)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 15);
					        SweeperSteps[playerid][0] = 3;
					        SetPlayerRaceCheckpoint(playerid, 0, 1816.1698,-1834.6884,13.4141, 1820.7505,-1929.6912,13.3750, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][0] == 3)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 20);
					        AddPlayerSalary(playerid, "Street Cleanner(bonus)", 90);
					        SweeperSteps[playerid][0] = 4;
					        SetPlayerRaceCheckpoint(playerid, 0, 1820.7505,-1929.6912,13.3750,1955.9108,-1934.7244,13.3828, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][0] == 4)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        SweeperSteps[playerid][0] = 5;
					        SetPlayerRaceCheckpoint(playerid, 0, 1955.9108,-1934.7244,13.3828,1962.7469,-1759.2129,13.3828, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][0] == 5)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 70);
					        AddPlayerSalary(playerid, "Street Cleanner(bonus)", 115);
					        SweeperSteps[playerid][0] = 6;
					        SetPlayerRaceCheckpoint(playerid, 0, 1962.7469,-1759.2129,13.3828,1830.1188,-1750.1913,13.3828, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][0] == 6)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 5);
					        SweeperSteps[playerid][0] = 7;
					        SetPlayerRaceCheckpoint(playerid, 0, 1830.1188,-1750.1913,13.3828,1700.3102,-1729.7719,13.3828, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][0] == 7)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 300);
					        AddPlayerSalary(playerid, "Street Cleanner(bonus)", 5);
					        SweeperSteps[playerid][0] = 8;
					        SetPlayerRaceCheckpoint(playerid, 0, 1700.3102,-1729.7719,13.3828,1575.3949,-1729.9983,13.3828, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][0] == 8)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 129);
					        SweeperSteps[playerid][0] = 9;
					        SetPlayerRaceCheckpoint(playerid, 0, 1575.3949,-1729.9983,13.3828,1567.2383,-1862.6960,13.3828, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][0] == 9)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 90);
					        SweeperSteps[playerid][0] = 10;
					        SetPlayerRaceCheckpoint(playerid, 0, 1567.2383,-1862.6960,13.3828,1619.1874,-1877.3141,13.3828, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][0] == 10)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 250);
					        SweeperSteps[playerid][0] = 11;
					        SetPlayerRaceCheckpoint(playerid, 1, 1619.1874,-1877.3141,13.3828,1619.1874,-1877.3141,13.3828, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][0] == 11)
					    {
					        SweeperSteps[playerid][0] = 0;
					     	pData[playerid][pSideJob] = 0;
					        DialogSweeper[0] = false; // Dialog 0 telah di pilih
				    		DialogSaya[playerid][0] = false;
							SCM(playerid, ARWIN, "SIDEJOBINFO: {FFFFFF}You have "LG_E"succesfully "WHITE_E"complete street cleanner route, and your payment in '"YELLOW_E"/mysalary"WHITE_E"'.");
							AddPlayerSalary(playerid, "Street Cleanner(Idlewood)", 1500);
		     				pData[playerid][pSideJobTime] = 1700;
			        		DisablePlayerRaceCheckpoint(playerid);
							RemovePlayerFromVehicle(playerid);
							SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
		     				return 1;
				   		}
					    else if(SweeperSteps[playerid][1] == 1)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 200);
					        AddPlayerSalary(playerid, "Street Cleanner(bonus)", 134);
					        SweeperSteps[playerid][1] = 2;
					        SetPlayerRaceCheckpoint(playerid, 0, 1574.9003,-1871.1334,12.9483, 1572.1841,-1746.2827,12.9516, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][1] == 2)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 20);
					        SweeperSteps[playerid][1] = 3;
					        SetPlayerRaceCheckpoint(playerid, 0, 1572.1841,-1746.2827,12.9516,1533.9382,-1729.6626,12.9601, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][1] == 3)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        SweeperSteps[playerid][1] = 4;
					        SetPlayerRaceCheckpoint(playerid, 0, 1533.9382,-1729.6626,12.9601,1532.7323,-1606.6068,12.9475, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][1] == 4)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 70);
					        SweeperSteps[playerid][1] = 5;
					        SetPlayerRaceCheckpoint(playerid, 0, 1532.7323,-1606.6068,12.9475,1443.0881,-1593.6465,12.9596, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][1] == 5)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 5);
					        AddPlayerSalary(playerid, "Street Cleanner(bonus)", 20);
					        SweeperSteps[playerid][1] = 6;
					        SetPlayerRaceCheckpoint(playerid, 0, 1443.0881,-1593.6465,12.9596,1456.4535,-1453.5516,12.9308, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][1] == 6)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 129);
					        SweeperSteps[playerid][1] = 7;
					        SetPlayerRaceCheckpoint(playerid, 0, 1456.4535,-1453.5516,12.9308,1424.1686,-1432.9954,12.9524, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][1] == 7)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 90);
					        SweeperSteps[playerid][1] = 8;
					        SetPlayerRaceCheckpoint(playerid, 0, 1424.1686,-1432.9954,12.9524,1369.5051,-1392.7247,13.0346, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][1] == 8)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 250);
					        SweeperSteps[playerid][1] = 9;
					        SetPlayerRaceCheckpoint(playerid, 0, 1369.5051,-1392.7247,13.0346,1294.5410,-1565.4962,12.9621, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][1] == 9)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 250);
					        AddPlayerSalary(playerid, "Street Cleanner(bonus)", 150);
					        SweeperSteps[playerid][1] = 10;
					        SetPlayerRaceCheckpoint(playerid, 0, 1294.5410,-1565.4962,12.9621,1293.6605,-1837.6873,12.9545, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][1] == 10)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 250);
					        SweeperSteps[playerid][1] = 11;
					        SetPlayerRaceCheckpoint(playerid, 0, 1293.6605,-1837.6873,12.9545,1524.6145,-1875.7056,12.9340, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][1] == 11)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 144);
					        SweeperSteps[playerid][1] = 12;
					        SetPlayerRaceCheckpoint(playerid, 1, 1619.4293,-1881.6036,13.4845, 1619.4293, -1881.6036, 13.4845, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][1] == 12)
					    {
					        SweeperSteps[playerid][1] = 0;
					     	pData[playerid][pSideJob] = 0;
					        DialogSweeper[1] = false; // Dialog 0 telah di pilih
				    		DialogSaya[playerid][1] = false;
							SCM(playerid, ARWIN, "SIDEJOBINFO: {FFFFFF}You have "LG_E"succesfully "WHITE_E"complete street cleanner route, and your payment in '"YELLOW_E"/mysalary"WHITE_E"'.");
							AddPlayerSalary(playerid, "Street Cleanner(Pershing Square)", 2500);
		     				pData[playerid][pSideJobTime] = 1700;
			        		DisablePlayerRaceCheckpoint(playerid);
							RemovePlayerFromVehicle(playerid);
							SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
		     				return 1;
				   		}
				   		else if(SweeperSteps[playerid][2] == 1)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 144);
					        SweeperSteps[playerid][2] = 2;
					        SetPlayerRaceCheckpoint(playerid, 0, 1539.4319,-1869.4375,13.1080, 1323.6667,-1851.4268,13.1080, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 2)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 15);
					        SweeperSteps[playerid][2] = 3;
					        SetPlayerRaceCheckpoint(playerid, 0, 1323.6667,-1851.4268,13.1080, 1184.0767,-1849.0615,13.1313, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 3)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 15);
					        AddPlayerSalary(playerid, "Street Cleanner(bonus)", 134);
					        SweeperSteps[playerid][2] = 17;
					        SetPlayerRaceCheckpoint(playerid, 0, 1184.0767,-1849.0615,13.1313, 1181.9901,-1711.4929,13.2177, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 17)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 20);
					        SweeperSteps[playerid][2] = 4;
					        SetPlayerRaceCheckpoint(playerid, 0, 1181.9901,-1711.4929,13.2177,1045.3878,-1709.5790,13.1080, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 4)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        SweeperSteps[playerid][2] = 5;
					        SetPlayerRaceCheckpoint(playerid, 0, 1045.3878,-1709.5790,13.1080,1039.8157,-1583.4841,13.1078, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 5)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 70);
					        SweeperSteps[playerid][2] = 6;
					        SetPlayerRaceCheckpoint(playerid, 0, 1039.8157,-1583.4841,13.1078,927.9300,-1568.9344,13.1080, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 6)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 5);
					        SweeperSteps[playerid][2] = 7;
					        SetPlayerRaceCheckpoint(playerid, 0, 927.9300,-1568.9344,13.1080,916.0417,-1583.1429,13.1079, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 7)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 300);
					        AddPlayerSalary(playerid, "Street Cleanner(bonus)", 134);
					        SweeperSteps[playerid][2] = 8;
					        SetPlayerRaceCheckpoint(playerid, 0, 916.0417,-1583.1429,13.1079,916.0583,-1760.4836,13.1076, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 8)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 129);
					        SweeperSteps[playerid][2] = 9;
					        SetPlayerRaceCheckpoint(playerid, 0, 916.0583,-1760.4836,13.1076,819.3672,-1766.9518,13.1248, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 9)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 90);
					        SweeperSteps[playerid][2] = 10;
					        SetPlayerRaceCheckpoint(playerid, 0, 819.3672,-1766.9518,13.1248,832.2370,-1623.7051,13.1080, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 10)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 250);
					        SweeperSteps[playerid][2] = 11;
					        SetPlayerRaceCheckpoint(playerid, 0, 832.2370,-1623.7051,13.1080,905.0103,-1576.2756,13.1081, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 11)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 200);
					        SweeperSteps[playerid][2] = 12;
					        SetPlayerRaceCheckpoint(playerid, 0, 905.0103,-1576.2756,13.1081, 1286.4901,-1574.9495,13.1080, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 12)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 20);
					        SweeperSteps[playerid][2] = 13;
					        SetPlayerRaceCheckpoint(playerid, 0, 1286.4901,-1574.9495,13.1080,1294.6498,-1852.5858,13.1080, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 13)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        AddPlayerSalary(playerid, "Street Cleanner(bonus)", 115);
					        SweeperSteps[playerid][2] = 14;
					        SetPlayerRaceCheckpoint(playerid, 0, 1294.6498,-1852.5858,13.1080,1524.0383,-1875.6007,13.1080, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 14)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        SweeperSteps[playerid][2] = 15;
					        SetPlayerRaceCheckpoint(playerid, 0, 1524.0383,-1875.6007,13.1080,1619.1874, -1877.3141, 13.3828, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 15)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        AddPlayerSalary(playerid, "Street Cleanner(bonus)", 10);
					        SweeperSteps[playerid][2] = 16;
					        SetPlayerRaceCheckpoint(playerid, 1, 1619.1874, -1877.3141, 13.3828,1619.1874, -1877.3141, 13.3828, 5);
					        return 1;
					    }
					    else if(SweeperSteps[playerid][2] == 16)
					    {
					        SweeperSteps[playerid][2] = 0;
					     	pData[playerid][pSideJob] = 0;
					        DialogSweeper[2] = false; // Dialog 0 telah di pilih
				    		DialogSaya[playerid][2] = false;
							SCM(playerid, ARWIN, "SIDEJOBINFO: {FFFFFF}You have "LG_E"succesfully "WHITE_E"complete street cleanner route, and your payment in '"YELLOW_E"/mysalary"WHITE_E"'.");
							AddPlayerSalary(playerid, "Street Cleanner(Marina Beach)", 3500);
		     				pData[playerid][pSideJobTime] = 1700;
			        		DisablePlayerRaceCheckpoint(playerid);
							RemovePlayerFromVehicle(playerid);
							SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
		     				return 1;
					   	}
					}
			   	}
		    }
		}
	}
    // SIDEJOB BUS //
	if(pData[playerid][pSideJob] == 2)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 431)
		{
			for(new i; i <= 3; i++) // 3 = Total Dialog , Jadi kita mau tau kalau Player Ini Apakah Ambil Dialog dari 3 tersebut apa ga !
			{
				if(BusSteps[playerid][i] > 0)
				{
				 	if(IsPlayerInAnyVehicle(playerid))
					{
					    if(BusSteps[playerid][0] == 2)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 15);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 150);
					        BusSteps[playerid][0] = 3;
					        SetPlayerRaceCheckpoint(playerid, 0, 1655.8779,-1580.8289,13.4839, 1325.0560,-1569.7898,13.4628, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 3)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 20);
					        BusSteps[playerid][0] = 4;
					        SetPlayerRaceCheckpoint(playerid, 0, 1325.0560,-1569.7898,13.4628,1359.4424,-1422.9174,13.4767, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 4)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][0] = 5;
					        SetPlayerRaceCheckpoint(playerid, 0, 1359.4424,-1422.9174,13.4767,1338.3066,-1394.7805,13.4779, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 5)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 70);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 150);
					        BusSteps[playerid][0] = 6;
					        SetPlayerRaceCheckpoint(playerid, 0, 1338.3066,-1394.7805,13.4779,651.5914,-1393.6437,13.5422, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 6)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 5);
					        BusSteps[playerid][0] = 7;
					        SetPlayerRaceCheckpoint(playerid, 0, 651.5914,-1393.6437,13.5422,539.4284,-1405.4429,15.7669, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 7)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 300);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 150);
					        BusSteps[playerid][0] = 8;
					        SetPlayerRaceCheckpoint(playerid, 0, 539.4284,-1405.4429,15.7669,492.0627,-1309.9187,15.7158, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 8)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 129);
					        BusSteps[playerid][0] = 9;
					        SetPlayerRaceCheckpoint(playerid, 0, 492.0627,-1309.9187,15.7158,153.1991,-1545.3175,10.5614, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 9)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 90);
					        BusSteps[playerid][0] = 10;
					        SetPlayerRaceCheckpoint(playerid, 0, 153.1991,-1545.3175,10.5614,373.0657,-1720.0210,7.2636, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 10)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 250);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 150);
					        BusSteps[playerid][0] = 11;
					        SetPlayerRaceCheckpoint(playerid, 0, 373.0657,-1720.0210,7.2636,1001.7006,-1809.3325,14.1462, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 11)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 200);
					        BusSteps[playerid][0] = 12;
					        SetPlayerRaceCheckpoint(playerid, 0, 1001.7006,-1809.3325,14.1462, 1017.2707,-2218.5603,13.0459, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 12)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 20);
					        BusSteps[playerid][0] = 13;
					        SetPlayerRaceCheckpoint(playerid, 0, 1017.2707,-2218.5603,13.0459,1312.3700,-2467.7739,7.7606, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 13)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 150);
					        BusSteps[playerid][0] = 14;
					        SetPlayerRaceCheckpoint(playerid, 0, 1312.3700,-2467.7739,7.7606,1443.5225,-2683.4890,13.4660, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 14)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][0] = 15;
					        SetPlayerRaceCheckpoint(playerid, 0, 1443.5225,-2683.4890,13.4660,2167.0093,-2614.6147,13.4766, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 15)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 150);
					        BusSteps[playerid][0] = 16;
					        SetPlayerRaceCheckpoint(playerid, 0, 2167.0093,-2614.6147,13.4766,2297.5007,-2281.6836,13.4911, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 16)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][0] = 17;
					        SetPlayerRaceCheckpoint(playerid, 0, 2297.5007,-2281.6836,13.4911,2245.5674,-2207.3191,13.4066, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 17)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][0] = 18;
					        SetPlayerRaceCheckpoint(playerid, 0, 2245.5674,-2207.3191,13.4066,1978.5647,-2107.1409,13.4477, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 18)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][0] = 19;
					        SetPlayerRaceCheckpoint(playerid, 0, 1978.5647,-2107.1409,13.4477,1964.9993,-1764.2311,13.4818, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 19)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][0] = 20;
					        SetPlayerRaceCheckpoint(playerid, 0, 1964.9993,-1764.2311,13.4818,1835.2019,-1750.1224,13.4855, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 20)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][0] = 21;
					        SetPlayerRaceCheckpoint(playerid, 0, 1835.2019,-1750.1224,13.4855,1824.7201,-1625.2925,13.4876, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 21)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][0] = 22;
					        SetPlayerRaceCheckpoint(playerid, 0, 1824.7201,-1625.2925,13.4876,1668.9048,-1590.1837,13.4715, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 22)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][0] = 23;
					        SetPlayerRaceCheckpoint(playerid, 0, 1668.9048,-1590.1837,13.4715,1662.6278,-1552.6962,13.4833, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 23)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][0] = 24;
					        SetPlayerRaceCheckpoint(playerid, 0, 1662.6278,-1552.6962,13.4833,1686.7153,-1551.0281,13.4776, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 24)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 2000);
					        BusSteps[playerid][0] = 25;
					        SetPlayerRaceCheckpoint(playerid, 0, 1686.7153,-1551.0281,13.4776,1673.5162,-1477.9034,13.4807, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][0] == 25)
					    {
					        BusSteps[playerid][0] = 0;
					     	pData[playerid][pSideJob] = 0;
					        DialogBus[0] = false; // Dialog 0 telah di pilih
				    		DialogSaya[playerid][0] = false;
							SCM(playerid, ARWIN, "SIDEJOBINFO: {FFFFFF}You have "LG_E"succesfully "WHITE_E"complete bus route lap, and your payment in '"YELLOW_E"/mysalary"WHITE_E"'.");
							AddPlayerSalary(playerid, "Bus Drivers(Ocean Docks)", 7500);
					        pData[playerid][pBusTime] = 1800;
					        DisablePlayerRaceCheckpoint(playerid);
							RemovePlayerFromVehicle(playerid);
							SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
					        return 1;
				   		}
					    else if(BusSteps[playerid][1] == 6)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 5);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 1500);
					        BusSteps[playerid][1] = 7;
					        SetPlayerRaceCheckpoint(playerid, 0, 1655.4309,-1578.8663,13.4876,1675.6584,-1594.5546,13.4830, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 7)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 300);
					        BusSteps[playerid][1] = 8;
					        SetPlayerRaceCheckpoint(playerid, 0, 1675.6584,-1594.5546,13.4830,1808.3151,-1614.4534,13.4606, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 8)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 129);
					        BusSteps[playerid][1] = 9;
					        SetPlayerRaceCheckpoint(playerid, 0, 1808.3151,-1614.4534,13.4606,1822.1866,-1602.4225,13.4650, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 9)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 90);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 150);
					        BusSteps[playerid][1] = 10;
					        SetPlayerRaceCheckpoint(playerid, 0, 1822.1866,-1602.4225,13.4650,1852.0515,-1477.0760,13.4892, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 10)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 250);
					        BusSteps[playerid][1] = 11;
					        SetPlayerRaceCheckpoint(playerid, 0, 1852.0515,-1477.0760,13.4892,1976.1843,-1468.7709,13.4898, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 11)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 200);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 150);
					        BusSteps[playerid][1] = 12;
					        SetPlayerRaceCheckpoint(playerid, 0, 1976.1843,-1468.7709,13.4898, 1988.9058,-1453.9619,13.4881, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 12)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 20);
					        BusSteps[playerid][1] = 13;
					        SetPlayerRaceCheckpoint(playerid, 0, 1988.9058,-1453.9619,13.4881,1989.5841,-1354.7592,23.8970, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 13)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 14;
					        SetPlayerRaceCheckpoint(playerid, 0, 1989.5841,-1354.7592,23.8970,2055.3843,-1343.6346,23.9209, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 14)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 150);
					        BusSteps[playerid][1] = 15;
					        SetPlayerRaceCheckpoint(playerid, 0, 2055.3843,-1343.6346,23.9209,2073.3601,-1237.0232,23.9111, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 15)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 16;
					        SetPlayerRaceCheckpoint(playerid, 0, 2073.3601,-1237.0232,23.9111,2074.4985,-1106.5936,24.7291, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 16)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 17;
					        SetPlayerRaceCheckpoint(playerid, 0, 2074.4985,-1106.5936,24.7291,1995.6899,-1054.9963,24.5139, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 17)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 18;
					        SetPlayerRaceCheckpoint(playerid, 0, 1995.6899,-1054.9963,24.5139,1867.9518,-1058.5884,23.7857, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 18)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 19;
					        SetPlayerRaceCheckpoint(playerid, 0, 1867.9518,-1058.5884,23.7857,1863.6049,-1169.5271,23.7625, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 19)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 20;
					        SetPlayerRaceCheckpoint(playerid, 0, 1863.6049,-1169.5271,23.7625,1657.9583,-1157.8536,23.8513, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 20)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 21;
					        SetPlayerRaceCheckpoint(playerid, 0, 1657.9583,-1157.8536,23.8513,1592.6194,-1159.1958,24.0051, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 21)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 22;
					        SetPlayerRaceCheckpoint(playerid, 0, 1592.6194,-1159.1958,24.0051,1549.6796,-1055.4402,23.7095, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 22)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 150);
					        BusSteps[playerid][1] = 23;
					        SetPlayerRaceCheckpoint(playerid, 0, 1549.6796,-1055.4402,23.7095,1458.6635,-1030.3673,23.7568, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 23)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 24;
					        SetPlayerRaceCheckpoint(playerid, 0, 1458.6635,-1030.3673,23.7568,1383.3145,-1032.3024,26.1900, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 24)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 25;
					        SetPlayerRaceCheckpoint(playerid, 0, 1383.3145,-1032.3024,26.1900,1355.6470,-1045.0482,26.4642, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 25)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 26;
					        SetPlayerRaceCheckpoint(playerid, 0, 1355.6470,-1045.0482,26.4642,1340.4150,-1127.6436,23.7744, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 26)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 27;
					        SetPlayerRaceCheckpoint(playerid, 0, 1340.4150,-1127.6436,23.7744,1340.1676,-1379.0829,13.5948, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 27)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 28;
					        SetPlayerRaceCheckpoint(playerid, 0, 1340.1676,-1379.0829,13.5948,1363.4252,-1405.9730,13.4503, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 28)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 29;
					        SetPlayerRaceCheckpoint(playerid, 0, 1363.4252,-1405.9730,13.4503,1393.6683,-1430.9860,13.5163, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 29)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 30;
					        SetPlayerRaceCheckpoint(playerid, 0, 1393.6683,-1430.9860,13.5163,1640.2510,-1443.0830,13.4826, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 30)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        BusSteps[playerid][1] = 31;
					        SetPlayerRaceCheckpoint(playerid, 0, 1640.2510,-1443.0830,13.4826,1654.4456,-1539.0234,13.4815, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 31)
					    {
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid 100);
				        	AddPlayerSalary(playerid, "Bus Driver(bonus)", 150);
					        BusSteps[playerid][1] = 32;
					        SetPlayerRaceCheckpoint(playerid, 1, 1654.4456,-1539.0234,13.4815,1685.5889,-1550.3016,13.4852, 5);
					        return 1;
					    }
					    else if(BusSteps[playerid][1] == 32)
					    {
					        BusSteps[playerid][1] = 0;
					     	pData[playerid][pSideJob] = 0;
					        DialogBus[1] = false; // Dialog 0 telah di pilih
				    		DialogSaya[playerid][1] = false;
							SCM(playerid, ARWIN, "SIDEJOBINFO: {FFFFFF}You have "LG_E"succesfully "WHITE_E"complete bus route lap, and your payment in '"YELLOW_E"/mysalary"WHITE_E"'.");
							AddPlayerSalary(playerid, "Bus Drivers(Los Santos Bank)", 5500);
					        pData[playerid][pBusTime] = 1800;
					        DisablePlayerRaceCheckpoint(playerid);
							RemovePlayerFromVehicle(playerid);
							SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
					        return 1;
				   		}
					}
				}
			}
		}
	}
	// SIDEJOB FORKLIFT
	if(pData[playerid][pSideJob] == 3)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 530)
		{
			for(new i; i <= 3; i++) // 3 = Total Dialog , Jadi kita mau tau kalau Player Ini Apakah Ambil Dialog dari 3 tersebut apa ga !
			{
				if(ForkliftSteps[playerid][i] > 0)
				{
				 	if(IsPlayerInAnyVehicle(playerid))
					{
						if(ForkliftSteps[playerid][0] == 1)
					    {
							TogglePlayerControllable(playerid, 0);
							pData[playerid][pActivity] = SetTimerEx("ForkliftLoad", 800, true, "id", playerid, 1);
							PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loading Crate..");
							PlayerTextDrawShow(playerid, ActiveTD[playerid]);
							ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
						    DisablePlayerRaceCheckpoint(playerid);
						    //GivePlayerCash(playerid, 144);
						    ForkliftSteps[playerid][0] = 2;
		    				SetPlayerRaceCheckpoint(playerid, 1, 2787.55, -2411.66, 13.40, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 2)
					    {
							DestroyDynamicObject(GetPVarInt(playerid, "box"));
							GameTextForPlayer(playerid, "~w~Delivered ~y~1 Crates", 3500, 3);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 15);
					        ForkliftSteps[playerid][0] = 3;
					        SetPlayerRaceCheckpoint(playerid, 1, 2539.31, -2471.31, 13.40, 1820.7505,-1929.6912,13.3750, 5);
					        return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 3)
					    {
							TogglePlayerControllable(playerid, 0);
							pData[playerid][pActivity] = SetTimerEx("ForkliftLoad", 800, true, "id", playerid, 1);
							PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loading Crate...");
							PlayerTextDrawShow(playerid, ActiveTD[playerid]);
							ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 20);
					        AddPlayerSalary(playerid, "Forklift Driver(bonus)", 900);
					        ForkliftSteps[playerid][0] = 4;
					        SetPlayerRaceCheckpoint(playerid, 1, 2788.26, -2425.79, 13.40,1955.9108,-1934.7244,13.3828, 5);
					        return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 4)
					    {
							DestroyDynamicObject(GetPVarInt(playerid, "box"));
							GameTextForPlayer(playerid, "~w~Delivered ~y~2 Crates", 3500, 3);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        ForkliftSteps[playerid][0] = 5;
					        SetPlayerRaceCheckpoint(playerid, 1, 2400.04,-2565.49,13.21,1962.7469,-1759.2129,13.3828, 5);
					        return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 5)
					    {
							TogglePlayerControllable(playerid, 0);
							pData[playerid][pActivity] = SetTimerEx("ForkliftLoad", 800, true, "id", playerid, 1);
							PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loading Crate...");
							PlayerTextDrawShow(playerid, ActiveTD[playerid]);
							ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 20);
					        ForkliftSteps[playerid][0] = 6;
					        AddPlayerSalary(playerid, "Forklift Driver(bonus)", 1000);
					        SetPlayerRaceCheckpoint(playerid, 1, 2794.77, -2410.35, 13.40,1955.9108,-1934.7244,13.3828, 5);
					        return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 6)
					    {
							DestroyDynamicObject(GetPVarInt(playerid, "box"));
							GameTextForPlayer(playerid, "~w~Delivered ~y~3 Crates", 3500, 3);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        ForkliftSteps[playerid][0] = 7;
					        SetPlayerRaceCheckpoint(playerid, 1, 2425.93, -2486.24, 13.40,1962.7469,-1759.2129,13.3828, 5);
					        return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 7)
					    {
							TogglePlayerControllable(playerid, 0);
							pData[playerid][pActivity] = SetTimerEx("ForkliftLoad", 800, true, "id", playerid, 1);
							PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loading Crate...");
							PlayerTextDrawShow(playerid, ActiveTD[playerid]);
							ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        ForkliftSteps[playerid][0] = 8;
					        AddPlayerSalary(playerid, "Forklift Driver(bonus)", 300);
					        SetPlayerRaceCheckpoint(playerid, 1, 2788.26, -2425.79, 13.40,1962.7469,-1759.2129,13.3828, 5);
					        return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 8)
					    {
							DestroyDynamicObject(GetPVarInt(playerid, "box"));
							GameTextForPlayer(playerid, "~w~Delivered ~y~4 Crates", 3500, 3);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        ForkliftSteps[playerid][0] = 9;
					        AddPlayerSalary(playerid, "Forklift Driver(bonus)", 100);
					        SetPlayerRaceCheckpoint(playerid, 1, 2425.93, -2486.24, 13.40,1962.7469,-1759.2129,13.3828, 5);
					        return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 9)
					    {
							TogglePlayerControllable(playerid, 0);
							pData[playerid][pActivity] = SetTimerEx("ForkliftLoad", 800, true, "id", playerid, 1);
							PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loading Crate...");
							PlayerTextDrawShow(playerid, ActiveTD[playerid]);
							ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        ForkliftSteps[playerid][0] = 10;
					        SetPlayerRaceCheckpoint(playerid, 1, 2788.26, -2425.79, 13.40,1962.7469,-1759.2129,13.3828, 5);
					        return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 10)
					    {
							DestroyDynamicObject(GetPVarInt(playerid, "box"));
							GameTextForPlayer(playerid, "~w~Delivered ~y~5 Crates", 3500, 3);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        ForkliftSteps[playerid][0] = 11;
					        SetPlayerRaceCheckpoint(playerid, 1, 2401.40, -2566.41, 13.41, 1962.7469,-1759.2129,13.3828, 5);
					        return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 11)
					    {
							TogglePlayerControllable(playerid, 0);
							pData[playerid][pActivity] = SetTimerEx("ForkliftLoad", 800, true, "id", playerid, 1);
							PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loading Crate...");
							PlayerTextDrawShow(playerid, ActiveTD[playerid]);
							ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        ForkliftSteps[playerid][0] = 12;
					        SetPlayerRaceCheckpoint(playerid, 1, 2794.77, -2410.35, 13.40,1962.7469,-1759.2129,13.3828, 5);
					        return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 12)
					    {
							DestroyDynamicObject(GetPVarInt(playerid, "box"));
							GameTextForPlayer(playerid, "~w~Delivered ~y~6 Crates", 3500, 3);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        ForkliftSteps[playerid][0] = 13;
					        SetPlayerRaceCheckpoint(playerid, 1, 2401.40, -2566.41, 13.41, 1962.7469,-1759.2129,13.3828, 5);
					        return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 13)
					    {
							TogglePlayerControllable(playerid, 0);
							pData[playerid][pActivity] = SetTimerEx("ForkliftLoad", 800, true, "id", playerid, 1);
							PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loading Crate...");
							PlayerTextDrawShow(playerid, ActiveTD[playerid]);
							ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        ForkliftSteps[playerid][0] = 14;
					        SetPlayerRaceCheckpoint(playerid, 1, 2758.67, -2388.04, 13.40,1962.7469,-1759.2129,13.3828, 5);
					        return 1;
					    }
					    // Forklift Done
					    else if(ForkliftSteps[playerid][0] == 14)
					    {
							DestroyDynamicObject(GetPVarInt(playerid, "box"));
							GameTextForPlayer(playerid, "~w~Delivered ~y~7 Crates", 3500, 3);
					        DisablePlayerRaceCheckpoint(playerid);
					        //GivePlayerCash(playerid, 100);
					        ForkliftSteps[playerid][0] = 15;
					        SCM(playerid, ARWIN, "SIDEJOB: "WHITE_E"Pekerjaan telah selesai. silahkan ke checkpoint merah untuk kembalikan kendaraan");
					        SetPlayerRaceCheckpoint(playerid, 1, 2758.67, -2388.04, 13.40,1962.7469,-1759.2129,13.3828, 5);
					        return 1;
					    }
					    else if(ForkliftSteps[playerid][0] == 15)
					    {
					        ForkliftSteps[playerid][0] = 0;
					        pData[playerid][pSideJob] = 0;
					        SCM(playerid, ARWIN, "SIDEJOBINFO: {FFFFFF}You have "LG_E"succesfully "WHITE_E"complete street cleanner route, and your payment in '"YELLOW_E"/mysalary"WHITE_E"'.");
							AddPlayerSalary(playerid, "Forklift Drivers", 12500);
		     				pData[playerid][pForTime] = 2000;
			        		DisablePlayerRaceCheckpoint(playerid);
							RemovePlayerFromVehicle(playerid);
							SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
		     				return 1;
					   	}
					}
			   	}
		    }
	    }
	 }
	if(pData[playerid][pBerhasilTest] == 1)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 405)
		{
			for(new i; i <= 3; i++) // 3 = Total Dialog , Jadi kita mau tau kalau Player Ini Apakah Ambil Dialog dari 3 tersebut apa ga !
			{
				if(DMVSteps[playerid][i] > 0)
				{
				 	if(IsPlayerInAnyVehicle(playerid))
					{
						if(DMVSteps[playerid][0] == 1)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 2;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1823.7297, -1925.6096, 13.2533, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
					    else if(DMVSteps[playerid][0] == 2)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 3;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1843.2019,-1524.2132,13.2557, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 3)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 4;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1781.3222,-1448.2966,13.2564, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 4)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 5;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1499.9793,-1438.6181,13.2578, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 5)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 6;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1422.6995,-1428.7148,13.2576, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 6)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 7;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1369.9011,-1392.2183,13.3569, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 7)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 8;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1065.7545,-1392.8974,13.4036, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 8)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 9;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1035.4527,-1615.0257,13.2578, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 9)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 10;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1078.5073,-1714.9125,13.2578, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 10)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 11;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1166.6119,-1714.8895,13.5983, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 11)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 12;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1173.0518,-1834.5819,13.2745, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 12)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 13;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1358.2958,-1868.8308,13.2578, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 13)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 14;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1529.6424,-1874.8200,13.2577, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 14)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 15;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1691.1840,-1828.2435,13.2577, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 15)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 16;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1812.6293,-1834.2253,13.2734, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 16)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 17;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1824.4472,-1759.3045,13.2578, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 17)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 18;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1953.4006,-1754.3984,13.2578, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 18)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 19;
		    				SetPlayerRaceCheckpoint(playerid, 0, 1958.7235,-1814.5289,13.2577, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 19)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 20;
		    				SetPlayerRaceCheckpoint(playerid, 0, 2073.6210,-1814.8839,13.2578, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 20)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 21;
		    				SetPlayerRaceCheckpoint(playerid, 0, 2079.2873,-1910.0417,13.2283, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
						else if(DMVSteps[playerid][0] == 21)
					    {
							DisablePlayerRaceCheckpoint(playerid);
						    DMVSteps[playerid][0] = 22;
		    				SetPlayerRaceCheckpoint(playerid, 1, 2056.2556,-1913.5266,13.4217, 1816.1698,-1834.6884,13.4141, 5);
							return 1;
					    }
					    else if(DMVSteps[playerid][0] == 22)
					    {
					        DMVSteps[playerid][0] = 0;
					        pData[playerid][pBerhasilTest]++;
					        SCM(playerid, COLOR_YELLOW, "DMV: "WHITE_E"Kamu berhasil Tes mengemudi, Silahkan ke kantor SAPD untuk memberikan DMV Proof kamu, Gunakan '"YELLOW_E"/dmvproof"WHITE_E"'.");
							DisablePlayerRaceCheckpoint(playerid);
							pData[playerid][pDMVProof]++;
							new pTestVeh = GetPVarInt(playerid, "PTestVeh");
							RemovePlayerFromVehicle(playerid);
							DestroyVehicle(pTestVeh);
							
							new sext[40], mstr[10000];
							if(pData[playerid][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
							format(mstr, sizeof(mstr), ""YELLOW_E"Name: "LG_E"%s\n"YELLOW_E"Gender: "LG_E"%s\n"YELLOW_E"Brithday: "LG_E"%s\n"YELLOW_E"Drive Test: "LG_E"Lulus\n"YELLOW_E"Test Teori: "LG_E"Lulus\n\n"YELLOW_E"TTD: "LB_E"DMV-Los Santos\n", pData[playerid][pName], pData[playerid][pAge], sext);
							ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "DMV-Proof Licenses", mstr, "Close", "");
							return 1;
					   	}
					}
			   	}
		    }
	    }
	 }
	// Smuggle
	if(CheckpointLast[playerid] == 1)
	{
	    if(pData[playerid][pPacket] == 1)
	    {
		    DisablePlayerRaceCheckpoint(playerid);
		    pData[playerid][pPacket] = 0;
		    pCPPacket = INVALID_PLAYER_ID;
		    CheckpointLast[playerid] = 0;
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 0, 0, 0, 0, 1);
		    taked = 0;
		    packet = 0;
		    new packet_price = Random(40000, 42000);

		    GivePlayerMoneyEx(playerid, packet_price);
		    pData[playerid][pSmugglerTime] = 43200;
		    new String[1280];
			RemovePlayerAttachedObject(playerid, 3);
		    format(String, sizeof String, "SMUGGLER: {FFFFFF}You get money "LG_E"$%s "WHITE_E"from delivering smuggler package", FormatMoney(packet_price));
		 	SendClientMessage(playerid, COLOR_LOGS, String);
		 	return 1;
		}
	}
	if(pData[playerid][pTrackCar] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan kendaraan anda!");
		pData[playerid][pTrackCar] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackHouse] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan rumah anda!");
		pData[playerid][pTrackHouse] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackBisnis] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan bisnis anda!");
		pData[playerid][pTrackBisnis] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pMission] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/buy , /gps(My Mission) , /storeproduct.");
	}
	if(pData[playerid][pHauling] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		printf("[HAULING] %s's attached vehicle trailer", pData[playerid][pName]);
		pData[playerid][pTrailer] = CreateVehicle(584, 322.5988,856.0931,20.4063,290.4297, 1, 1, -1);
		AttachTrailerToVehicle(pData[playerid][pTrailer], GetPlayerVehicleID(playerid));
		SetPlayerCheckpoint(playerid, 336.70, 895.54, 20.40, 5.5);
	}
    if(pData[playerid][pDealerMission] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
	}
	// Smuggle
	if(CheckpointPacket[playerid] == 1)
	{
		CheckpointPacket[playerid] = 0;
    	new Float:X, Float:Y, Float:Z;
    	GetDynamicObjectPos(objectpacket, X, Y, Z);
		DisablePlayerRaceCheckpoint(playerid);
		SetPlayerCheckpoint(playerid, X, Y, Z, 5.5);
		SCM(playerid, ARWIN, ""COLOR_SMUG"GPSINFO: You have arrived");
		//InfoTD_MSG(playerid, 8000, "tacking packet ~y~/takepacket!");
	}
	//DisablePlayerRaceCheckpoint(playerid);
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(pData[playerid][pDealerMission] > -1)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5.5, -477.9302,-484.1866,25.5178))
		{
			SCM(playerid, ARWIN, "JOBINFO "YELLOW_E"WARNING!. "WHITE_E"Berhati-hati dalam membawa trailer, bila terlepas kamu tidak bisa menyetornya");
			TrailerHauling[playerid] = CreateVehicle(591, -477.9302,-484.1866,25.5178,166.3754, 1, 1, -1);
			AttachTrailerToVehicle(pData[playerid][pTrailer], GetPlayerVehicleID(playerid));
			SCM(playerid, ARWIN, "JOBINFO "YELLOW_E"/gps(My Dealer Mission) , /storeveh.");
			DisablePlayerCheckpoint(playerid);
		}
	}
	if(pData[playerid][pHauling] > -1)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5.5, 336.70, 895.54, 20.40))
		{
			DisablePlayerCheckpoint(playerid);
			SCM(playerid, COLOR_YELLOW, "WARNING: "WHITE_E"Jaga baik-baik trailer dan berhati-hatilah");
			SendClientMessageEx(playerid, ARWIN, "JOB: "WHITE_E"silahkan kaitkan Trailer yang ada di Gudang miner, Dan isi Gas Oil untuk restock Gas Stasion");
			SCM(playerid, ARWIN, "JOBINFO "YELLOW_E"/buy , /gps(My Hauling) , /storegas.");
		}
	}
    if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 578)
		{
			if (IsPlayerInRangeOfPoint(playerid, 4.0,containerpoint1))
			{
				SetPlayerCheckpoint(playerid, 2869.1934,917.6111,10.7500, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ContainerTake", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loaded Container...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,containerpoint2))
			{
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ContainerDown", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Unloaded Container...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				pData[playerid][pSideJob] = 0;
				pData[playerid][pTruckerTime] = 3800;
				DisablePlayerCheckpoint(playerid);
				SCM(playerid, ARWIN, "JOB: "WHITE_E"Tunggu sebentar kamu sedang menurunkan Container");
				return 1;
			}
		}
	}
	if(PlayerCheckpoint[playerid] == PIZZA_CHECKPOINT)
	{
	    if(IsPlayerAttachedObjectSlotUsed(playerid,PIZZA_INDEX))
	    {
	        new string[128];
			format(string,sizeof(string),"SIDEJOB: "YELLOW_E"Anda telah berhasil mengantar pizza, kamu akan mendapat bayaran setelah menyelesaikan pekerjaan");
			SendClientMessage(playerid,ARWIN,string);
			RemovePlayerAttachedObject(playerid,PIZZA_INDEX);
			PlayerCheckpoint[playerid]=CHECKPOINT_NONE;
			DisablePlayerCheckpoint(playerid);
			DestroyActor(PlayerCustomer[playerid]);
			ClearAnimations(playerid);
			if(TipTime[playerid] > 0)
	        {
	            TipTime[playerid]=0;
	            new tip=random(MAX_TIP)+50;
	            PlayerTips[playerid]+=tip;
   				GivePlayerMoneyEx(playerid, tip);
	            format(string,sizeof(string),"BONUS: "X1_BLUE"Anda juga mendapatkan {7FFF00}%d$ {FFFFFF}tip untuk pengiriman cepat!",FormatMoney(tip));
	            SendClientMessage(playerid,COLOR_YELLOW,string);
	            PlayerPlaySound(playerid,1139,0.0,0.0,0.0);
	            HideTipTimeText(playerid);
			}
	    }
	    else return SendClientMessage(playerid,-1," Anda harus membawa pizza untuk mengirim ke {FF0000}pembeli{FFFFFF}!");
	}
	if(pData[playerid][CarryingLog] != -1)
	{
		if(GetPVarInt(playerid, "LoadingCooldown") > gettime()) return 1;
		new vehicleid = GetPVarInt(playerid, "LastVehicleID"), type[64], carid = -1;
		if(pData[playerid][CarryingLog] == 0)
		{
			type = "Metal";
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			type = "Coal";
		}
		else
		{
			type = "Unknown";
		}
		if(Vehicle_LogCount(vehicleid) >= LOG_LIMIT) return Error(playerid, "You can't load any more ores to this vehicle.");
		if((carid = Vehicle_Nearest2(playerid)) != -1)
		{
			if(pData[playerid][CarryingLog] == 0)
			{
				pvData[carid][cMetal] += 1;
			}
			else if(pData[playerid][CarryingLog] == 1)
			{
				pvData[carid][cCoal] += 1;
			}
		}
		LogStorage[vehicleid][ pData[playerid][CarryingLog] ]++;
		Info(playerid, "MINING: Loaded %s.", type);
		ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);
		Player_RemoveLog(playerid);
		DisablePlayerCheckpoint(playerid);
		return 1;
	}
	if(pData[playerid][pFindEms] != INVALID_PLAYER_ID)
	{
		pData[playerid][pFindEms] = INVALID_PLAYER_ID;
		DisablePlayerCheckpoint(playerid);
	}
	//DisablePlayerCheckpoint(playerid);
	return 1;
}

public EVF_OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == KEY_CROUCH)
   	{
      	if(IsPlayerInAnyVehicle(playerid))
      	{
        	return callcmd::paytoll(playerid);
      	}
   	}
    if(PRESSED(KEY_FIRE))
	{
	    if(IsPlayerAttachedObjectSlotUsed(playerid,PIZZA_INDEX))
		{
		    SetPlayerArmedWeapon(playerid,0);
		 	ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,1,1,1,1,1);
		}
	}
	// Anti Cbug
	if(PRESSED(KEY_FIRE)) // Fire/Shoot key
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && cbug[playerid] == false)
		{
			switch(GetPlayerWeapon(playerid))
			{
				case WEAPON_SHOTGUN, WEAPON_SILENCED, WEAPON_SNIPER, WEAPON_COLT45, WEAPON_AK47, WEAPON_M4, WEAPON_DEAGLE: // Weapon List
				{
					LastFired[playerid] = gettime(); // gettime 1 detik
				}
			}
		}
	}
	if(PRESSED(KEY_CROUCH) && !IsPlayerInAnyVehicle(playerid)) // KeyCrouch jika tidak berada di dalam kendaraan
    //Jika KeyCrouch aktif pada saat player didalam kendaraan maka keycrouch itu menjadi key klakson atau H.
	{
		if(cbug[playerid] == false && LastFired[playerid] > gettime())
		{
			TogglePlayerControllable(playerid, 0);
			cbug[playerid] = true;
			Freeze[playerid] = SetTimerEx("UnFreeze", 2000, 0, "i", playerid);
			// Anda dapat memberikan notifikasi dengan GameText, SCM atau semacam nya disini
		}
	}
    // Check if the player is not in a vehicle and pressed the conversation yes key (Y by default)
	if (!IsPlayerInAnyVehicle(playerid) && (newkeys & KEY_YES))
	{
	    // Create variables and get the players current position
	    new Float:pos[3];
	    GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

	    // For debug
	    //printf("X = %0.2f | Y = %0.2f | Z = %0.2f", pos[0], pos[1], pos[2]);

        // Check if the player is using the button inside the elevator
	    if (pos[1] > (Y_ELEVATOR_POS - 1.8) && pos[1] < (Y_ELEVATOR_POS + 1.8) && pos[0] < (X_ELEVATOR_POS + 1.8) && pos[0] > (X_ELEVATOR_POS - 1.8))
	    {
	        // The player is using the button inside the elevator
	        // --------------------------------------------------

	        // Show the elevator dialog to the player
	        ShowElevatorDialog(playerid);
	    }
		else
		{
		    // Check if the player is using the button on one of the floors
		    if(pos[1] < (Y_ELEVATOR_POS - 1.81) && pos[1] > (Y_ELEVATOR_POS - 3.8) && pos[0] > (X_ELEVATOR_POS - 3.8) && pos[0] < (X_ELEVATOR_POS - 1.81))
		    {
		        // The player is most likely using an elevator floor button... check which floor
		        // -----------------------------------------------------------------------------

		        // Create variable with the number of floors to check (total floors minus 1)
				new i = 10;

				// Loop
				while(pos[2] < GetDoorsZCoordForFloor(i) + 3.5 && i > 0)
				    i --;

				if(i == 0 && pos[2] < GetDoorsZCoordForFloor(0) + 2.0)
				    i = -1;

				if (i <= 9)
				{
				    // Check if the elevator is not moving (idle or waiting)
				    if (ElevatorState != ELEVATOR_STATE_MOVING)
				    {
				        // Check if the elevator is already on the floor it was called from
				        if (ElevatorFloor == i + 1)
				        {
				            // Display gametext message to the player
							GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~y~~h~LS Apartments 1 Elevator Is~n~~y~~h~Already On This Floor...~n~~w~Walk Inside It~n~~w~And Press '~k~~CONVERSATION_YES~'", 3500, 3);

							// Display chat text message to the player
	                        SendClientMessage(playerid, COLOR_MESSAGE_YELLOW, "* The LS Apartments 1 elevator is already on this floor... walk inside it and press '{FFFFFF}~k~~CONVERSATION_YES~{CCCCCC}'");

                            // Exit here (return 1 so this callback is processed in other scripts)
	                        return 1;
				        }
				    }

				    // Call function to call the elevator to the floor
					CallElevator(playerid, i + 1);

					// Display gametext message to the player
					GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~g~~h~LS Apartments 1 Elevator~n~~g~~h~Has Been Called...~n~~w~Please Wait", 3000, 3);

					// Create variable for formatted message
					new strTempString[100];

					// Check if the elevator is moving
					if (ElevatorState == ELEVATOR_STATE_MOVING)
					{
					    // Format chat text message
						format(strTempString, sizeof(strTempString), "* The LS Apartments 1 elevator has been called... it is currently moving towards the %s.", FloorNames[ElevatorFloor]);
					}
					else
					{
					    // Check if the floor is the car park
					    if (ElevatorFloor == 0)
					    {
					    	// Format chat text message
							format(strTempString, sizeof(strTempString), "* The LS Apartments 1 elevator has been called... it is currently at the %s.", FloorNames[ElevatorFloor]);
						}
						else
						{
					    	// Format chat text message
							format(strTempString, sizeof(strTempString), "* The LS Apartments 1 elevator has been called... it is currently on the %s.", FloorNames[ElevatorFloor]);
						}
					}

					// Display formatted chat text message to the player
					SendClientMessage(playerid, COLOR_MESSAGE_YELLOW, strTempString);

					// Exit here (return 1 so this callback is processed in other scripts)
					return 1;
				}
		    }
		}
	}

	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && (newkeys & KEY_NO))
	{
	    if(pData[playerid][CarryingLumber])
		{
			Player_DropLumber(playerid);
		}
		else if(pData[playerid][CarryingLog] == 0)
		{
			Player_DropLog(playerid, pData[playerid][CarryingLog]);
			Info(playerid, "You dropping metal ore.");
			DisablePlayerCheckpoint(playerid);
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			Player_DropLog(playerid, pData[playerid][CarryingLog]);
			Info(playerid, "You dropping coal ore.");
			DisablePlayerCheckpoint(playerid);
		}
	}
	if((newkeys & KEY_SECONDARY_ATTACK))
    {
		foreach(new did : Doors)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
			{
				if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
					return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

				if(dData[did][dLocked])
					return Error(playerid, "This entrance is locked at the moment.");

				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}
				if(dData[did][dFamily] > 0)
				{
					if(dData[did][dFamily] != pData[playerid][pFamily])
						return Error(playerid, "This door only for family.");
				}

				if(dData[did][dVip] > pData[playerid][pVip])
					return Error(playerid, "Your VIP level not enough to enter this door.");

				if(dData[did][dAdmin] > pData[playerid][pAdmin])
					return Error(playerid, "Your admin level not enough to enter this door.");

				if(strlen(dData[did][dPass]))
				{
					new params[256];
					if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
					if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");

					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					pData[playerid][pInDoor] = did;
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
				else
				{
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					pData[playerid][pInDoor] = did;
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
			{
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}

				if(dData[did][dCustom])
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				else
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				pData[playerid][pInDoor] = -1;
				SetPlayerInterior(playerid, dData[did][dExtint]);
				SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
        }
		//Bisnis
		foreach(new bid : Bisnis)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
			{
				if(bData[bid][bIntposX] == 0.0 && bData[bid][bIntposY] == 0.0 && bData[bid][bIntposZ] == 0.0)
					return Error(playerid, "Interior bisnis masih kosong, atau tidak memiliki interior.");

				if(bData[bid][bLocked])
					return Error(playerid, "This bisnis is locked!");

				pData[playerid][pInBiz] = bid;
				SetPlayerPositionEx(playerid, bData[bid][bIntposX], bData[bid][bIntposY], bData[bid][bIntposZ], bData[bid][bIntposA]);

				SetPlayerInterior(playerid, bData[bid][bInt]);
				SetPlayerVirtualWorld(playerid, bid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inbisnisid = pData[playerid][pInBiz];
		if(pData[playerid][pInBiz] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, bData[inbisnisid][bIntposX], bData[inbisnisid][bIntposY], bData[inbisnisid][bIntposZ]))
		{
			pData[playerid][pInBiz] = -1;
			SetPlayerPositionEx(playerid, bData[inbisnisid][bExtposX], bData[inbisnisid][bExtposY], bData[inbisnisid][bExtposZ], bData[inbisnisid][bExtposA]);

			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Houses
		foreach(new hid : Houses)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
			{
				if(hData[hid][hIntposX] == 0.0 && hData[hid][hIntposY] == 0.0 && hData[hid][hIntposZ] == 0.0)
					return Error(playerid, "Interior house masih kosong, atau tidak memiliki interior.");

				if(hData[hid][hLocked])
					return Error(playerid, "This house is locked!");

				pData[playerid][pInHouse] = hid;
				SetPlayerPositionEx(playerid, hData[hid][hIntposX], hData[hid][hIntposY], hData[hid][hIntposZ], hData[hid][hIntposA]);

				SetPlayerInterior(playerid, hData[hid][hInt]);
				SetPlayerVirtualWorld(playerid, hid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inhouseid = pData[playerid][pInHouse];
		if(pData[playerid][pInHouse] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, hData[inhouseid][hIntposX], hData[inhouseid][hIntposY], hData[inhouseid][hIntposZ]))
		{
			pData[playerid][pInHouse] = -1;
			SetPlayerPositionEx(playerid, hData[inhouseid][hExtposX], hData[inhouseid][hExtposY], hData[inhouseid][hExtposZ], hData[inhouseid][hExtposA]);

			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Family
		foreach(new fid : FAMILYS)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ]))
			{
				if(fData[fid][fIntposX] == 0.0 && fData[fid][fIntposY] == 0.0 && fData[fid][fIntposZ] == 0.0)
					return Error(playerid, "Interior masih kosong, atau tidak memiliki interior.");

				if(pData[playerid][pFaction] == 0)
					if(pData[playerid][pFamily] == -1)
						return Error(playerid, "You dont have registered for this door!");

				SetPlayerPositionEx(playerid, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ], fData[fid][fIntposA]);

				SetPlayerInterior(playerid, fData[fid][fInt]);
				SetPlayerVirtualWorld(playerid, fid);
				SetCameraBehindPlayer(playerid);
				//pData[playerid][pInBiz] = fid;
				SetPlayerWeather(playerid, 0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ]))
			{
				SetPlayerPositionEx(playerid, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ], fData[fid][fExtposA]);

				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
				//pData[playerid][pInBiz] = -1;
			}
        }
	}
	//SAPD Taser/Tazer
	if(newkeys & KEY_FIRE && TaserData[playerid][TaserEnabled] && GetPlayerWeapon(playerid) == 0 && !IsPlayerInAnyVehicle(playerid) && TaserData[playerid][TaserCharged])
	{
  		TaserData[playerid][TaserCharged] = false;

	    new Float: x, Float: y, Float: z, Float: health;
     	GetPlayerPos(playerid, x, y, z);
	    PlayerPlaySound(playerid, 6003, 0.0, 0.0, 0.0);
	    ApplyAnimation(playerid, "KNIFE", "KNIFE_3", 4.1, 0, 1, 1, 0, 0, 1);
		pData[playerid][pActivityTime] = 0;
	    TaserData[playerid][ChargeTimer] = SetTimerEx("ChargeUp", 1000, true, "i", playerid);
		PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Recharge...");
		PlayerTextDrawShow(playerid, ActiveTD[playerid]);
		ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);

	    for(new i, maxp = GetPlayerPoolSize(); i <= maxp; ++i)
		{
	        if(!IsPlayerConnected(i)) continue;
          	if(playerid == i) continue;
          	if(TaserData[i][TaserCountdown] != 0) continue;
          	if(IsPlayerInAnyVehicle(i)) continue;
			if(GetPlayerDistanceFromPoint(i, x, y, z) > 2.0) continue;
			ClearAnimations(i, 1);
			TogglePlayerControllable(i, false);
   			ApplyAnimation(i, "CRACK", "crckdeth2", 4.1, 0, 0, 0, 1, 0, 1);
			PlayerPlaySound(i, 6003, 0.0, 0.0, 0.0);

			GetPlayerHealth(i, health);
			TaserData[i][TaserCountdown] = TASER_BASETIME + floatround((100 - health) / 12);
   			Info(i, "You got tased for %d secounds!", TaserData[i][TaserCountdown]);
			TaserData[i][GetupTimer] = SetTimerEx("TaserGetUp", 1000, true, "i", i);
			break;
	    }
	}
	//Vehicle
	if((newkeys & KEY_YES ))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			return callcmd::v(playerid, "en");
		}
	}
	if((newkeys & KEY_NO ))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			return callcmd::v(playerid, "lights");
		}
	}
	if(GetPVarInt(playerid, "UsingSprunk"))
	{
		if(pData[playerid][pEnergy] >= 100 )
		{
  			Info(playerid, " Kamu terlalu banyak minum.");
	   	}
	   	else
	   	{
	   		pData[playerid][pBladder] -= 1;
		    pData[playerid][pEnergy] += 5;
		}
	}
	if(PRESSED( KEY_FIRE ))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
		{
			foreach(new did : Doors)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
				{
					if(dData[did][dGarage] == 1)
					{
						if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
							return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

						if(dData[did][dLocked])
							return Error(playerid, "This entrance is locked at the moment.");

						if(dData[did][dFaction] > 0)
						{
							if(dData[did][dFaction] != pData[playerid][pFaction])
								return Error(playerid, "This door only for faction.");
						}
						if(dData[did][dFamily] > 0)
						{
							if(dData[did][dFamily] != pData[playerid][pFamily])
								return Error(playerid, "This door only for family.");
						}

						if(dData[did][dVip] > pData[playerid][pVip])
							return Error(playerid, "Your VIP level not enough to enter this door.");

						if(dData[did][dAdmin] > pData[playerid][pAdmin])
							return Error(playerid, "Your admin level not enough to enter this door.");

						if(strlen(dData[did][dPass]))
						{
							new params[256];
							if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
							if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");

							if(dData[did][dCustom])
							{
								SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							else
							{
								SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							pData[playerid][pInDoor] = did;
							SetPlayerInterior(playerid, dData[did][dIntint]);
							SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
							SetCameraBehindPlayer(playerid);
							SetPlayerWeather(playerid, 0);
						}
						else
						{
							if(dData[did][dCustom])
							{
								SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							else
							{
								SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							pData[playerid][pInDoor] = did;
							SetPlayerInterior(playerid, dData[did][dIntint]);
							SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
							SetCameraBehindPlayer(playerid);
							SetPlayerWeather(playerid, 0);
						}
					}
				}
				if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
				{
					if(dData[did][dGarage] == 1)
					{
						if(dData[did][dFaction] > 0)
						{
							if(dData[did][dFaction] != pData[playerid][pFaction])
								return Error(playerid, "This door only for faction.");
						}

						if(dData[did][dCustom])
						{
							SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
						}
						else
						{
							SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
						}
						pData[playerid][pInDoor] = -1;
						SetPlayerInterior(playerid, dData[did][dExtint]);
						SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, WorldWeather);
					}
				}
			}
		}
	}
	//if(IsKeyJustDown(KEY_CTRL_BACK,newkeys,oldkeys))
	if(PRESSED( KEY_CTRL_BACK ))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && pData[playerid][pCuffed] == 0)
		{
			ClearAnimations(playerid);
			StopLoopingAnim(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
    }
	if(IsKeyJustDown(KEY_SECONDARY_ATTACK, newkeys, oldkeys))
	{
		if(GetPVarInt(playerid, "UsingSprunk"))
		{
			DeletePVar(playerid, "UsingSprunk");
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
	}
	return 1;
}

public EVF_OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
	{
		new vehid = GetPlayerVehicleID(playerid);
		if(vehid == pizzabikes[0] || vehid == pizzabikes[1] || vehid == pizzabikes[2] || vehid == pizzabikes[3] || vehid == pizzabikes[4])
		{
		    if(IsInJob[playerid] == 1)
			{
		    	ShowPlayerPizzaBikeTexts(playerid);
		    	if(PlayerCheckpoint[playerid] == CHECKPOINT_NONE)
	    		{
					new rand = random(sizeof(Houses));
					new skin = random(311)+1;
					if(skin == 74) return skin=75;
					SetPlayerCheckpoint(playerid,Houses[rand][0],Houses[rand][1],Houses[rand][2],2.0);
					PlayerCustomer[playerid] = CreateActor(skin,Houses[rand][0],Houses[rand][1],Houses[rand][2]+0.5,Houses[rand][3]-180.0);
					ApplyActorAnimation(PlayerCustomer[playerid],"DEALER","DEALER_IDLE",4.1,1,0,0,0,0);
					PlayerCheckpoint[playerid]=PIZZA_CHECKPOINT;
					TipTime[playerid]=30;
					ShowTipTimeText(playerid);
			    }
			}
			else
			{
				SendClientMessage(playerid,-1," Anda harus memulai pekerjaan terlebih dahulu sebelum naik sepeda!");
				RemovePlayerFromVehicle(playerid);
			}
		}
	}
	else if(newstate == PLAYER_STATE_ONFOOT && oldstate == PLAYER_STATE_DRIVER) { HidePlayerPizzaBikeTexts(playerid); }

	if(newstate == PLAYER_STATE_WASTED && pData[playerid][pJail] < 1)
    {	
		if(pData[playerid][pInjured] == 0)
        {
            pData[playerid][pInjured] = 1;
            SetPlayerHealthEx(playerid, 99999);

            pData[playerid][pInt] = GetPlayerInterior(playerid);
            pData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

            GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
            GetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
        }
        else
        {
            pData[playerid][pHospital] = 1;
        }
	}
	//Spec Player
	new vehicleid = GetPlayerVehicleID(playerid);
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		if(pData[playerid][playerSpectated] != 0)
		{
			foreach(new ii : Player)
			{
				if(pData[ii][pSpec] == playerid)
				{
					PlayerSpectatePlayer(ii, playerid);
					Servers(ii, ,"%s(%i) is now on foot.", pData[playerid][pName], playerid);
				}
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
		if(pData[playerid][pInjured] == 1)
        {
            //RemoveFromVehicle(playerid);
			RemovePlayerFromVehicle(playerid);
            SetPlayerHealthEx(playerid, 99999);
        }
		foreach (new ii : Player) if(pData[ii][pSpec] == playerid) 
		{
            PlayerSpectateVehicle(ii, GetPlayerVehicleID(playerid));
        }
	}
	if(oldstate == PLAYER_STATE_PASSENGER)
	{
		TextDrawHideForPlayer(playerid, TDEditor_TD[11]);
		TextDrawHideForPlayer(playerid, DPvehfare[playerid]);
	}
	if(oldstate == PLAYER_STATE_DRIVER)
    {	
		if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CARRY || GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED)
            return RemovePlayerFromVehicle(playerid);/*RemoveFromVehicle(playerid);*/
			
		PlayerTextDrawHide(playerid, DPvehname[playerid]);
        PlayerTextDrawHide(playerid, DPvehengine[playerid]);
        PlayerTextDrawHide(playerid, DPvehspeed[playerid]);
		
        TextDrawHideForPlayer(playerid, TDEditor_TD[5]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[6]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[7]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[8]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[9]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[10]);
		
		TextDrawHideForPlayer(playerid, TDEditor_TD[11]);
		TextDrawHideForPlayer(playerid, DPvehfare[playerid]);
		
		//HBE textdraw Simple New
		for(new num; num < 3; num++)
		{
		    PlayerTextDrawHide(playerid, PlayerSpeedoTD[playerid][num]);
		}
		for(new num; num < 9; num++)
		{
		    TextDrawHideForPlayer(playerid, SpeedoTD[num]);
		}
        //
		if(pData[playerid][pTaxiDuty] == 1)
		{
			pData[playerid][pTaxiDuty] = 0;
			SetPlayerColor(playerid, COLOR_WHITE);
			Servers(playerid, "You are no longer on taxi duty!");
		}
		if(pData[playerid][pFare] == 1)
		{
			KillTimer(pData[playerid][pFareTimer]);
			Info(playerid, "Anda telah menonaktifkan taxi fare pada total: {00FF00}%s", FormatMoney(pData[playerid][pTotalFare]));
			pData[playerid][pFare] = 0;
			pData[playerid][pTotalFare] = 0;
		}
        
		HidePlayerProgressBar(playerid, pData[playerid][BarFuel]);
        HidePlayerProgressBar(playerid, pData[playerid][BarDamage]);
		
        HidePlayerProgressBar(playerid, pData[playerid][fuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][damagebar]);
	}
	else if(newstate == PLAYER_STATE_DRIVER)
    {
		/*if(IsSRV(vehicleid))
		{
			new tstr[128], price = GetVehicleCost(GetVehicleModel(vehicleid));
			format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleName(vehicleid), FormatMoney(price));
			ShowPlayerDialog(playerid, DIALOG_BUYPV, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
		}
		else if(IsVSRV(vehicleid))
		{
			new tstr[128], price = GetVipVehicleCost(GetVehicleModel(vehicleid));
			if(pData[playerid][pVip] == 0)
			{
				Error(playerid, "Kendaraan Khusus VIP Player.");
				RemovePlayerFromVehicle(playerid);
				//SetVehicleToRespawn(GetPlayerVehicleID(playerid));
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
			else
			{
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d Coin", GetVehicleName(vehicleid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYVIPPV, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
		}*/
		
		foreach(new pv : PVehicles)
		{
			if(vehicleid == pvData[pv][cVeh])
			{
				if(IsABike(vehicleid) || GetVehicleModel(vehicleid) == 424)
				{
					if(pvData[pv][cLocked] == 1)
					{
						RemovePlayerFromVehicle(playerid);
						//new Float:slx, Float:sly, Float:slz;
						//GetPlayerPos(playerid, slx, sly, slz);
						//SetPlayerPos(playerid, slx, sly, slz);
						Error(playerid, "This bike is locked by owner.");
						return 1;
					}
				}
			}
		}
		if(IsFORKLIFTCar(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_FORKLIFT, DIALOG_STYLE_MSGBOX, "Side Job: Forklift Driver", ""YELLOW_E"Start working as a Forklift driver?\n"WHITE_E"Task: move 6 crates around Ocean docks\nPayment: "LG_E"$125.00", "Start", "Close");
		}
	    else if(IsSWEEPERCar(vehicleid))
		{
		    new String[10000], S3MP4K[10000];
		    if(pData[playerid][pSideJobTime] == 0)
			{
		    	strcat(S3MP4K, "Route\tPrice\n");
				format(String, sizeof(String), "Route A: Idlewood - Commerce\t%s\n", (DialogSweeper[0] == true) ? ("{FF0000}Cleaning") : ("{33AA33}$15,00"));
				strcat(S3MP4K, String);
				format(String, sizeof(String), "Route B: Pershing Square - Commerce\t%s\n", (DialogSweeper[1] == true) ? ("{FF0000}Cleaning") : ("{33AA33}$25,00"));
				strcat(S3MP4K, String);
				format(String, sizeof(String), "Route C: Commerce - Marina\t%s\n", (DialogSweeper[2] == true) ? ("{FF0000}Cleaning") : ("{33AA33}$35.00"));
				strcat(S3MP4K, String);
				ShowPlayerDialog(playerid, DIALOG_SWEEPER, DIALOG_STYLE_TABLIST_HEADERS, "Street Cleanner: Select Route", S3MP4K, "Select", "Cancel");
			}
			else
			{
			    format(String, sizeof(String),"ERROR: "GREY_E"You must be waiting "YELLOW_E"%d"GREY_E" second again", pData[playerid][pSideJobTime]);
			    SCM(playerid, COLOR_RED, String);
				RemovePlayerFromVehicle(playerid);
		 	}
		}
		else if(IsBUSCAR(vehicleid))
		{
		    new String[10000], S3MP4K[10000];
		    if(pData[playerid][pBusTime] == 0)
			{
		    	strcat(S3MP4K, "Route\tPrice\n");
				format(String, sizeof(String), "Route A: Commerce - Ocean Dock\t%s\n", (DialogBus[0] == true) ? ("{FF0000}Taken") : ("{33AA33}$75,00"));
				strcat(S3MP4K, String);
				format(String, sizeof(String), "Route B: Commerce - Los Santos Bank\t%s\n", (DialogBus[1] == true) ? ("{FF0000}Taken") : ("{33AA33}$55,00"));
				strcat(S3MP4K, String);
				format(String, sizeof(String), "Route C: Commerce - East Los Santos\t{FF0000}Maintenance");
				strcat(S3MP4K, String);
				ShowPlayerDialog(playerid, DIALOG_BUS, DIALOG_STYLE_TABLIST_HEADERS, "Bus Driver: Select Route", S3MP4K, "Select", "Cancel");
			}
			else
			{
			    format(String, sizeof(String),"ERROR: "GREY_E"You must be waiting "YELLOW_E"%d"GREY_E" second again", pData[playerid][pBusTime]);
			    SCM(playerid, COLOR_RED, String);
				RemovePlayerFromVehicle(playerid);
		 	}
		}

		if(!IsEngineVehicle(vehicleid))
        {
            SwitchVehicleEngine(vehicleid, true);
        }
		if(IsEngineVehicle(vehicleid) && pData[playerid][pDriveLic] <= 0)
        {
            Info(playerid, "You dont have a "YELLOW_E"driver's license"WHITE_E", Be carefull");
        }
		if(pData[playerid][pHBEMode] == 1)
		{
	        for(new num; num < 3; num++)
			{
			    PlayerTextDrawShow(playerid, PlayerSpeedoTD[playerid][num]);
			}
			for(new num; num < 9; num++)
			{
			    TextDrawShowForPlayer(playerid, SpeedoTD[num]);
			}
			ShowPlayerProgressBar(playerid, pData[playerid][BarFuel]);
			ShowPlayerProgressBar(playerid, pData[playerid][BarDamage]);
		}
		else if(pData[playerid][pHBEMode] == 2)
		{
			TextDrawShowForPlayer(playerid, TDEditor_TD[5]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[6]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[7]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[8]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[9]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[10]);
			
			PlayerTextDrawShow(playerid, DPvehname[playerid]);
			PlayerTextDrawShow(playerid, DPvehengine[playerid]);
			PlayerTextDrawShow(playerid, DPvehspeed[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][fuelbar]);
			ShowPlayerProgressBar(playerid, pData[playerid][damagebar]);
		}
		else
		{
		
		}
		new Float:health;
        GetVehicleHealth(GetPlayerVehicleID(playerid), health);
        VehicleHealthSecurityData[GetPlayerVehicleID(playerid)] = health;
        VehicleHealthSecurity[GetPlayerVehicleID(playerid)] = true;
		
		if(pData[playerid][playerSpectated] != 0)
  		{
			foreach(new ii : Player)
			{
    			if(pData[ii][pSpec] == playerid)
			    {
        			PlayerSpectateVehicle(ii, vehicleid);
				    Servers(ii, "%s(%i) is now driving a %s(%d).", pData[playerid][pName], playerid, GetVehicleModelName(GetVehicleModel(vehicleid)), vehicleid);
				}
			}
		}
		SetPVarInt(playerid, "LastVehicleID", vehicleid);
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	switch(weaponid){ case 0..18, 39..54: return 1;} //invalid weapons
	if(1 <= weaponid <= 46 && pData[playerid][pGuns][g_aWeaponSlots[weaponid]] == weaponid)
	{
		pData[playerid][pAmmo][g_aWeaponSlots[weaponid]]--;
		if(pData[playerid][pGuns][g_aWeaponSlots[weaponid]] != 0 && !pData[playerid][pAmmo][g_aWeaponSlots[weaponid]])
		{
			pData[playerid][pGuns][g_aWeaponSlots[weaponid]] = 0;
		}
	}
	return 1;
}

stock GivePlayerHealth(playerid,Float:Health)
{
	new Float:health; GetPlayerHealth(playerid,health);
	SetPlayerHealth(playerid,health-Health);
}

// Fungsi Bila bertabrakan darah berkurang
public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	new
        Float: vehicleHealth,
        playerVehicleId = GetPlayerVehicleID(playerid);

    new Float:health = GetPlayerHealth(playerid, health);
    GetVehicleHealth(playerVehicleId, vehicleHealth);
    new panels, doors, lights, tires;
    GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
    UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
    if(pData[playerid][pSeatBelt] == 0 || pData[playerid][pHelmetOn] == 0)
    {
    	if(GetVehicleSpeed(vehicleid) <= 20)
    	{
    		vehicleHealth -= 2;
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 50)
    	{
    		pData[playerid][pHealth] -= 5;
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 90)
    	{
    		pData[playerid][pHealth] -= 9;
    		return 1;
    	}
    	return 1;
    }
    if(pData[playerid][pSeatBelt] == 1 || pData[playerid][pHelmetOn] == 1)
    {
    	if(GetVehicleSpeed(vehicleid) <= 20)
    	{
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 50)
    	{
    		GivePlayerHealth(playerid, -3);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 90)
    	{
    		GivePlayerHealth(playerid, -5);
    		return 1;
    	}
    }
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{

	return 1;
}

public OnPlayerUpdate(playerid)
{
	//SAPD Tazer/Taser
	UpdateTazer(playerid);
	
	//SAPD Road Spike
	CheckPlayerInSpike(playerid);
	//SpeedCameras
	SpeedingCheck(playerid);
	return 1;
}

task VehicleUpdate[40000]()
{
	for (new i = 1; i != MAX_VEHICLES; i ++) if(IsEngineVehicle(i) && GetEngineStatus(i))
    {
        if(GetVehicleFuel(i) > 0)
        {
			new fuel = GetVehicleFuel(i);
            SetVehicleFuel(i, fuel - 15);

            if(GetVehicleFuel(i) >= 1 && GetVehicleFuel(i) <= 200)
            {
               Info(GetVehicleDriver(i), "Kendaraan ingin habis bensin, Harap pergi ke SPBU ( Gas Station )");
            }
        }
        if(GetVehicleFuel(i) <= 0)
        {
            SetVehicleFuel(i, 0);
            SwitchVehicleEngine(i, false);
        }
    }
	foreach(new ii : PVehicles)
	{
		if(IsValidVehicle(pvData[ii][cVeh]))
		{
			if(pvData[ii][cPlateTime] != 0 && pvData[ii][cPlateTime] <= gettime())
			{
				format(pvData[ii][cPlate], 32, "NoHave");
				SetVehicleNumberPlate(pvData[ii][cVeh], pvData[ii][cPlate]);
				pvData[ii][cPlateTime] = 0;
			}
			if(pvData[ii][cRent] != 0 && pvData[ii][cRent] <= gettime())
			{
				pvData[ii][cRent] = 0;
				new query[128];
				mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[ii][cID]);
				mysql_tquery(g_SQL, query);
				if(IsValidVehicle(pvData[ii][cVeh])) DestroyVehicle(pvData[ii][cVeh]);
				pvData[ii][cVeh] = INVALID_VEHICLE_ID;
				Iter_SafeRemove(PVehicles, ii, ii);
			}
		}
		if(pvData[ii][cClaimTime] != 0 && pvData[ii][cClaimTime] <= gettime())
		{
			pvData[ii][cClaimTime] = 0;
		}
	}
}

public OnVehicleDeath(vehicleid, killerid)
{
	foreach(new i : PVehicles)
	{
		if(pvData[i][cVeh] == vehicleid)
		{
			pvData[i][cDeath] = gettime() + 15;
		}
	}
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	foreach(new ii : PVehicles)
	{
		if(vehicleid == pvData[ii][cVeh] && pvData[ii][cRent] == 0 && pvData[ii][cDeath] > gettime())
		{
			if(pvData[ii][cInsu] > 0)
    		{
				pvData[ii][cDeath] = 0;
				pvData[ii][cInsu]--;
				pvData[ii][cClaim] = 1;
				//pvData[ii][cClaimTime] = gettime() + (1 * 86400);
				foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
        		{
            		Info(pid, "Kendaraan anda hancur dan anda masih memiliki insuransi, silahkan ambil di kantor sags setelah 24 jam.");
				}
				if(IsValidVehicle(pvData[ii][cVeh]))
					DestroyVehicle(pvData[ii][cVeh]);

				pvData[ii][cVeh] = INVALID_VEHICLE_ID;
			}
			else
			{
				foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
        		{
					new query[128];
					mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[pid][cID]);
					mysql_tquery(g_SQL, query);
					if(IsValidVehicle(pvData[ii][cVeh]))
						DestroyVehicle(pvData[ii][cVeh]);

					pvData[ii][cVeh] = INVALID_VEHICLE_ID;
            		Info(pid, "Kendaraan anda hancur dan tidak memiliki insuransi.");
					Iter_SafeRemove(PVehicles, ii, ii);
				}
				pvData[ii][cDeath] = 0;
			}
			return 1;
		}
	}
	return 1;
}

ptask PlayerVehicleUpdate[200](playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsValidVehicle(vehicleid))
	{
		if(!GetEngineStatus(vehicleid) && IsEngineVehicle(vehicleid))
		{
			SwitchVehicleEngine(vehicleid, false);
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new Float:fHealth;
			GetVehicleHealth(vehicleid, fHealth);
			if(IsValidVehicle(vehicleid) && fHealth <= 350.0)
			{
				SetValidVehicleHealth(vehicleid, 300.0);
				SwitchVehicleEngine(vehicleid, false);
				GameTextForPlayer(playerid, "~r~Totalled!", 2500, 3);
			}
		}
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if(pData[playerid][pHBEMode] == 1)
			{
				new Float:fDamage, fFuel, color1, color2;
				new tstr[64];

				GetVehicleColor(vehicleid, color1, color2);

				GetVehicleHealth(vehicleid, fDamage);

				//OnVehicleDamageStatusUpdate(vehicleid, playerid);

				//fDamage = floatdiv(1000 - fDamage, 10) * 1.42999;

				if(fDamage <= 350.0) fDamage = 0.0;
				else if(fDamage > 1000.0) fDamage = 1000.0;

				fFuel = GetVehicleFuel(vehicleid);

				if(fFuel < 0) fFuel = 0;
				else if(fFuel > 1000) fFuel = 1000;

				if(!GetEngineStatus(vehicleid))
				{
					PlayerTextDrawSetString(playerid, PlayerSpeedoTD[playerid][2], "Engine:_~R~OFF");
				}
				else
				{
					PlayerTextDrawSetString(playerid, PlayerSpeedoTD[playerid][2], "Engine:_~G~ON");
				}

				SetPlayerProgressBarValue(playerid, pData[playerid][BarFuel], fFuel);
				SetPlayerProgressBarValue(playerid, pData[playerid][BarDamage], fDamage);

				/*format(tstr, sizeof(tstr), "%s", GetVehicleName(vehicleid));
				PlayerTextDrawSetString(playerid, SPvehname[playerid], tstr);

				format(tstr, sizeof(tstr), "%.0f Mph", GetVehicleSpeed(vehicleid));
				PlayerTextDrawSetString(playerid, SPvehspeed[playerid], tstr);*/

				//new modelid = GetVehicleModel(vehicleid) - 400;
				format(tstr, sizeof(tstr), "%s", GetVehicleName(vehicleid));
				PlayerTextDrawSetString(playerid, PlayerSpeedoTD[playerid][0], tstr);

				format(tstr, sizeof(tstr), "%.0f Mph", GetVehicleSpeed(vehicleid));
				PlayerTextDrawSetString(playerid, PlayerSpeedoTD[playerid][1], tstr);
			}

			else if(pData[playerid][pHBEMode] == 2)
			{
				new Float:fDamage, fFuel, color1, color2;
				new tstr[64];

				GetVehicleColor(vehicleid, color1, color2);

				GetVehicleHealth(vehicleid, fDamage);
				
				//OnVehicleDamageStatusUpdate(vehicleid, playerid);

				//fDamage = floatdiv(1000 - fDamage, 10) * 1.42999;

				if(fDamage <= 350.0) fDamage = 0.0;
				else if(fDamage > 1000.0) fDamage = 1000.0;

				fFuel = GetVehicleFuel(vehicleid);

				if(fFuel < 0) fFuel = 0;
				else if(fFuel > 1000) fFuel = 1000;

				if(!GetEngineStatus(vehicleid))
				{
					PlayerTextDrawSetString(playerid, DPvehengine[playerid], "~r~OFF");
				}
				else
				{
					PlayerTextDrawSetString(playerid, DPvehengine[playerid], "~g~ON");
				}

				SetPlayerProgressBarValue(playerid, pData[playerid][fuelbar], fFuel);
				SetPlayerProgressBarValue(playerid, pData[playerid][damagebar], fDamage);

				format(tstr, sizeof(tstr), "%s", GetVehicleName(vehicleid));
				PlayerTextDrawSetString(playerid, DPvehname[playerid], tstr);

				format(tstr, sizeof(tstr), "%.0f Mph", GetVehicleSpeed(vehicleid));
				PlayerTextDrawSetString(playerid, DPvehspeed[playerid], tstr);

				/*if(GetVehicleModel(vehicleid) != GetPVarInt(playerid, "veh_model"))
				{
					PlayerTextDrawSetPreviewModel(playerid, DPvehmodel[playerid], GetVehicleModel(vehicleid));
					PlayerTextDrawSetPreviewVehCol(playerid, DPvehmodel[playerid], color1, color2);
					PlayerTextDrawShow(playerid, DPvehmodel[playerid]);
					SetPVarInt(playerid, "veh_model", GetVehicleModel(vehicleid));
				}*/
			}
			else
			{

			}
		}
	}
}

ptask PlayerUpdate[999](playerid)
{
	//Anti-Cheat Vehicle health hack
	for(new v, j = GetVehiclePoolSize(); v <= j; v++) if(GetVehicleModel(v))
    {
        new Float:health;
        GetVehicleHealth(v, health);
        if( (health > VehicleHealthSecurityData[v]) && VehicleHealthSecurity[v] == false)
        {
			if(GetPlayerVehicleID(playerid) == v)
			{
				new playerState = GetPlayerState(playerid);
				if(playerState == PLAYER_STATE_DRIVER)
				{
					SetValidVehicleHealth(v, VehicleHealthSecurityData[v]);
					SendClientMessageToAllEx(COLOR_RED, "Anti-Cheat: "GREY2_E"%s have been cheating for vehicle health hack!", pData[playerid][pName]);
					//KickEx(playerid);
				}
			}
        }
        if(VehicleHealthSecurity[v] == true)
        {
            VehicleHealthSecurity[v] = false;
        }
        VehicleHealthSecurityData[v] = health;
    }
	//Anti-Money Hack
	if(GetPlayerMoney(playerid) > pData[playerid][pMoney])
	{
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, pData[playerid][pMoney]);
		SendAdminMessage(COLOR_RED, "Possible money hacks detected on %s(%i). Check on this player. "LG_E"($%d).", pData[playerid][pName], playerid, GetPlayerMoney(playerid) - pData[playerid][pMoney]);
	}
	//Anti Armour Hacks
	new Float:A;
	GetPlayerArmour(playerid, A);
	if(A > 100)
	{
		SetPlayerArmourEx(playerid, 0);
		SendClientMessageToAllEx(COLOR_RED, "Anti-Cheat: "GREY2_E"%s(%i) has been cheating for armour hacks!", pData[playerid][pName], playerid);
		//KickEx(playerid);
	}
	//Weapon AC
	if(pData[playerid][pSpawned] == 1)
    {
        if(GetPlayerWeapon(playerid) != pData[playerid][pWeapon])
        {
            pData[playerid][pWeapon] = GetPlayerWeapon(playerid);

            if(pData[playerid][pWeapon] >= 1 && pData[playerid][pWeapon] <= 45 && pData[playerid][pWeapon] != 40 && pData[playerid][pWeapon] != 2 && pData[playerid][pGuns][g_aWeaponSlots[pData[playerid][pWeapon]]] != GetPlayerWeapon(playerid))
            {
                SendAdminMessage(COLOR_RED, "%s(%d) has possibly used weapon hacks (%s), Please to check /spec this player first!", pData[playerid][pName], playerid, ReturnWeaponName(pData[playerid][pWeapon]));
                //SendClientMessageToAllEx(COLOR_RED, "BotCmd: %s was kicked by BOT. Reason: used weapon hacks (%s).", pData[playerid][pName], ReturnWeaponName(pData[playerid][pWeapon]));
                SetWeapons(playerid); //Reload old weapons
				//KickEx(playerid);
                //Log_Write("logs/cheat_log.txt", "[%s] %s has possibly used weapon hacks (%s).", ReturnDate(), pData[playerid][pName], ReturnWeaponName(pData[playerid][pWeapon]));
                //return 1;
            }
        }
    }
	//Weapon Atth
	if(NetStats_GetConnectedTime(playerid) - WeaponTick[playerid] >= 250)
	{
		static weaponid, ammo, objectslot, count, index;
 
		for (new i = 2; i <= 7; i++) //Loop only through the slots that may contain the wearable weapons
		{
			GetPlayerWeaponData(playerid, i, weaponid, ammo);
			index = weaponid - 22;
		   
			if (weaponid && ammo && !WeaponSettings[playerid][index][Hidden] && IsWeaponWearable(weaponid) && EditingWeapon[playerid] != weaponid)
			{
				objectslot = GetWeaponObjectSlot(weaponid);
 
				if (GetPlayerWeapon(playerid) != weaponid)
					SetPlayerAttachedObject(playerid, objectslot, GetWeaponModel(weaponid), WeaponSettings[playerid][index][Bone], WeaponSettings[playerid][index][Position][0], WeaponSettings[playerid][index][Position][1], WeaponSettings[playerid][index][Position][2], WeaponSettings[playerid][index][Position][3], WeaponSettings[playerid][index][Position][4], WeaponSettings[playerid][index][Position][5], 1.0, 1.0, 1.0);
 
				else if (IsPlayerAttachedObjectSlotUsed(playerid, objectslot)) RemovePlayerAttachedObject(playerid, objectslot);
			}
		}
		for (new i = 4; i <= 8; i++) if (IsPlayerAttachedObjectSlotUsed(playerid, i))
		{
			count = 0;
 
			for (new j = 22; j <= 38; j++) if (PlayerHasWeapon(playerid, j) && GetWeaponObjectSlot(j) == i)
				count++;
 
			if(!count) RemovePlayerAttachedObject(playerid, i);
		}
		WeaponTick[playerid] = NetStats_GetConnectedTime(playerid);
	}
	
	//Player Update Online Data
	//GetPlayerHealth(playerid, pData[playerid][pHealth]);
    //GetPlayerArmour(playerid, pData[playerid][pArmour]);
	
	if(pData[playerid][pJail] <= 0)
	{
		if(pData[playerid][pHunger] > 100)
		{
			pData[playerid][pHunger] = 100;
		}
		if(pData[playerid][pHunger] < 0)
		{
			pData[playerid][pHunger] = 0;
		}
		if(pData[playerid][pEnergy] > 100)
		{
			pData[playerid][pEnergy] = 100;
		}
		if(pData[playerid][pEnergy] < 0)
		{
			pData[playerid][pEnergy] = 0;
		}
		if(pData[playerid][pBladder] > 100)
		{
			pData[playerid][pBladder] = 100;
		}
		if(pData[playerid][pBladder] < 0)
		{
			pData[playerid][pBladder] = 0;
		}
		/*if(pData[playerid][pHealth] > 100)
		{
			SetPlayerHealthEx(playerid, 100);
		}*/
	}
	// Disini
	if(pData[playerid][pHBEMode] == 1 && pData[playerid][IsLoggedIn] == true)
	{
		/*SetPlayerProgressBarValue(playerid, pData[playerid][BarLapar], pData[playerid][pHunger]);
		SetPlayerProgressBarColour(playerid, pData[playerid][BarLapar], ConvertHBEColor(pData[playerid][pHunger]));
		SetPlayerProgressBarValue(playerid, pData[playerid][BarHaus], pData[playerid][pEnergy]);
		SetPlayerProgressBarColour(playerid, pData[playerid][BarHaus], ConvertHBEColor(pData[playerid][pEnergy]));
		*///SetPlayerProgressBarValue(playerid, pData[playerid][spbladdybar], pData[playerid][pBladder]);
		//SetPlayerProgressBarColour(playerid, pData[playerid][spbladdybar], ConvertHBEColor(pData[playerid][pBladder]));

		SetPlayerProgressBarValue(playerid, pData[playerid][BarLapar], pData[playerid][pHunger]);
		SetPlayerProgressBarColour(playerid, pData[playerid][BarLapar], ConvertHBEColor(pData[playerid][pHunger]));
		SetPlayerProgressBarValue(playerid, pData[playerid][BarHaus], pData[playerid][pEnergy]);
		SetPlayerProgressBarColour(playerid, pData[playerid][BarHaus], ConvertHBEColor(pData[playerid][pEnergy]));
		//SetPlayerProgressBarColour(playerid, pData[playerid][BarKencing], ConvertHBEColor(GetPlayerData(playerid, P_KENCING)));

	    new fmt_money[520];
	   	format(fmt_money, sizeof fmt_money, "$%s", FormatMoney(pData[playerid][pMoney]));
	   	PlayerTextDrawSetString(playerid, SDmoney[playerid], fmt_money);
	   	new fmt_text[520];
	   	format(fmt_text, sizeof fmt_text, "%s", ReturnName(playerid));
	   	PlayerTextDrawSetString(playerid, SDname[playerid], fmt_text);
	    PlayerTextDrawShow(playerid, SDname[playerid]);
	    PlayerTextDrawShow(playerid, SDmoney[playerid]);
	}
	else if(pData[playerid][pHBEMode] == 2 && pData[playerid][IsLoggedIn] == true)
	{
		SetPlayerProgressBarValue(playerid, pData[playerid][hungrybar], pData[playerid][pHunger]);
		SetPlayerProgressBarColour(playerid, pData[playerid][hungrybar], ConvertHBEColor(pData[playerid][pHunger]));
		SetPlayerProgressBarValue(playerid, pData[playerid][energybar], pData[playerid][pEnergy]);
		SetPlayerProgressBarColour(playerid, pData[playerid][energybar], ConvertHBEColor(pData[playerid][pEnergy]));
		SetPlayerProgressBarValue(playerid, pData[playerid][bladdybar], pData[playerid][pBladder]);
		SetPlayerProgressBarColour(playerid, pData[playerid][bladdybar], ConvertHBEColor(pData[playerid][pBladder]));
		new strings[64], tstr[64];
		format(strings, sizeof(strings), "%s", pData[playerid][pName]);
		PlayerTextDrawSetString(playerid, DPname[playerid], strings);
		PlayerTextDrawShow(playerid, DPname[playerid]);
		format(tstr, sizeof(tstr), "Gold: %d", pData[playerid][pGold]);
		PlayerTextDrawSetString(playerid, DPcoin[playerid], tstr);
		PlayerTextDrawShow(playerid, DPcoin[playerid]);
		PlayerTextDrawSetString(playerid, DPmoney[playerid], FormatMoney(GetPlayerMoney(playerid)));
		PlayerTextDrawShow(playerid, DPmoney[playerid]);
		/*if(GetPlayerSkin(playerid) != GetPVarInt(playerid, "hbe_skin"))
		{
			PlayerTextDrawSetPreviewModel(playerid, DPskin[playerid], GetPlayerSkin(playerid));
			PlayerTextDrawShow(playerid, DPskin[playerid]);
			SetPVarInt(playerid, "hbe_skin", GetPlayerSkin(playerid));
		}*/
	}
	else
	{
	
	}
	
	if(pData[playerid][pHospital] == 1)
    {
		if(pData[playerid][pInjured] == 1)
		{
			SetPlayerPosition(playerid, -2028.32, -92.87, 1067.43, 275.78, 1);
		
			SetPlayerInterior(playerid, 1);
			SetPlayerVirtualWorld(playerid, playerid + 100);

			SetPlayerCameraPos(playerid, -2024.67, -93.13, 1066.78);
			SetPlayerCameraLookAt(playerid, -2028.32, -92.87, 1067.43);
			ResetPlayerWeaponsEx(playerid);
			TogglePlayerControllable(playerid, 0);
			pData[playerid][pInjured] = 0;
		}
		pData[playerid][pHospitalTime]++;
		new mstr[64];
		format(mstr, sizeof(mstr), "~n~~n~~n~~w~Recovering... %d", 15 - pData[playerid][pHospitalTime]);
		InfoTD_MSG(playerid, 1000, mstr);

		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
        if(pData[playerid][pHospitalTime] >= 15)
        {
            pData[playerid][pHospitalTime] = 0;
            pData[playerid][pHospital] = 0;
			pData[playerid][pHunger] = 50;
			pData[playerid][pEnergy] = 50;
			pData[playerid][pBladder] = 50;
			SetPlayerHealthEx(playerid, 50);
			pData[playerid][pSick] = 0;
			GivePlayerMoneyEx(playerid, -15000);
			SetPlayerHealthEx(playerid, 50);

            for (new i; i < 20; i++)
            {
                SendClientMessage(playerid, -1, "");
            }

			SendClientMessage(playerid, COLOR_GREY, "--------------------------------------------------------------------------------------------------------");
            SendClientMessage(playerid, COLOR_WHITE, "Kamu telah keluar dari rumah sakit, kamu membayar $150 kerumah sakit.");
            SendClientMessage(playerid, COLOR_GREY, "--------------------------------------------------------------------------------------------------------");
			
			SetPlayerPosition(playerid, 1182.8778, -1324.2023, 13.5784, 269.8747);

            TogglePlayerControllable(playerid, 1);
            SetCameraBehindPlayer(playerid);

            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);
			ClearAnimations(playerid);
			pData[playerid][pSpawned] = 1;
			SetPVarInt(playerid, "GiveUptime", -1);
		}
    }
	if(pData[playerid][pInjured] == 1 && pData[playerid][pHospital] != 1)
    {
		new mstr[64];
        format(mstr, sizeof(mstr), "/death for spawn to hospital");
		InfoTD_MSG(playerid, 1000, mstr);
		
		if(GetPVarInt(playerid, "GiveUptime") == -1)
		{
			SetPVarInt(playerid, "GiveUptime", gettime());
		}
		
		if(GetPVarInt(playerid,"GiveUptime"))
        {
            if((gettime()-GetPVarInt(playerid, "GiveUptime")) > 100)
            {
                Info(playerid, "Now you can spawn, type '/death' for spawn to hospital.");
                SetPVarInt(playerid, "GiveUptime", 0);
            }
        }

        ApplyAnimation(playerid, "CRACK", "null", 4.0, 0, 0, 0, 1, 0, 1);
        ApplyAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 0, 1);
        SetPlayerHealthEx(playerid, 99999);
    }
	if(pData[playerid][pInjured] == 0 && pData[playerid][pGender] != 0) //Pengurangan Data
	{
		if(++ pData[playerid][pHungerTime] >= 150)
        {
            if(pData[playerid][pHunger] > 0)
            {
                pData[playerid][pHunger]--;
            }
            else if(pData[playerid][pHunger] <= 0)
            {
                //SetPlayerHealth(playerid, health - 10);
          		//SetPlayerDrunkLevel(playerid, 8000);
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pHungerTime] = 0;
        }
        if(++ pData[playerid][pEnergyTime] >= 120)
        {
            if(pData[playerid][pEnergy] > 0)
            {
                pData[playerid][pEnergy]--;
            }
            else if(pData[playerid][pEnergy] <= 0)
            {
                //SetPlayerHealth(playerid, health - 10);
          		//SetPlayerDrunkLevel(playerid, 8000);
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pEnergyTime] = 0;
        }
        if(++ pData[playerid][pBladderTime] >= 100)
        {
            if(pData[playerid][pBladder] > 0)
            {
                pData[playerid][pBladder]--;
            }
            else if(pData[playerid][pBladder] <= 0)
            {
                //SetPlayerHealth(playerid, health - 10);
          		//SetPlayerDrunkLevel(playerid, 8000);
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pBladderTime] = 0;
        }
		if(pData[playerid][pSick] == 1)
		{
			if(++ pData[playerid][pSickTime] >= 200)
			{
				if(pData[playerid][pSick] >= 1)
				{
					new Float:hp;
					GetPlayerHealth(playerid, hp);
					SetPlayerDrunkLevel(playerid, 8000);
					ApplyAnimation(playerid,"CRACK","crckdeth2",4.1,0,1,1,1,1,1);
					Info(playerid, "Sepertinya anda sakit, segeralah pergi ke dokter.");
					SetPlayerHealth(playerid, hp - 3);
					pData[playerid][pSickTime] = 0;
				}
			}
		}
	}
	
	//Jail Player
	if(pData[playerid][pJail] > 0)
	{
		if(pData[playerid][pJailTime] > 0)
		{
			pData[playerid][pJailTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~You will be unjail in ~w~%d ~b~~h~seconds.", pData[playerid][pJailTime]);
			InfoTD_MSG(playerid, 1000, mstr);
		}
		else
		{
			pData[playerid][pJail] = 0;
			pData[playerid][pJailTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1482.0356,-1724.5726,13.5469,750, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E" %s(%d) have been un-jailed by the server. (times up)", pData[playerid][pName], playerid);
		}
	}
	//Arreset Player
	if(pData[playerid][pArrest] > 0)
	{
		if(pData[playerid][pArrestTime] > 0)
		{
			pData[playerid][pArrestTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~You will be released in ~w~%d ~b~~h~seconds.", pData[playerid][pArrestTime]);
			InfoTD_MSG(playerid, 1000, mstr);
		}
		else
		{
			pData[playerid][pArrest] = 0;
			pData[playerid][pArrestTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1526.69, -1678.05, 5.89, 267.76, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			Info(playerid, "You have been auto release. (times up)");
		}
	}
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	for(new i; i < sizeof(pTollArea); i++)
	{
		if(areaid == pTollArea[i] && IsPlayerInAnyVehicle(playerid))
		{
			GameTextForPlayer(playerid, "~w~Pay Toll Area~n~~w~ Type ~r~'/paytoll' ~w~Or Press~r~ H", 1000, 3);
		}
	}
    foreach(new i : Player)
	{
	    if(GetPVarType(i, "BBArea"))
	    {
	        if(areaid == GetPVarInt(i, "BBArea"))
	        {
	            new station[256];
	            GetPVarString(i, "BBStation", station, sizeof(station));
	            if(!isnull(station))
				{
					PlayStream(playerid, station, GetPVarFloat(i, "BBX"), GetPVarFloat(i, "BBY"), GetPVarFloat(i, "BBZ"), 30.0, 1);
				 	SendClientMessage(playerid, -1, "you enter boombox area");
	            }
				return 1;
	        }
	    }
	}
	return 1;
}
public OnPlayerLeaveDynamicArea(playerid, areaid)
{
    foreach(new i : Player)
	{
	    if(GetPVarType(i, "BBArea"))
	    {
	        if(areaid == GetPVarInt(i, "BBArea"))
	        {
	            StopStream(playerid);
	            SendClientMessage(playerid, -1, "you leave boombox area");
				return 1;
	        }
	    }
	}
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == ToysTDsave[playerid])
    {
    	HideEditToysTD(playerid);
    	SetPVarInt(playerid, "UpdatedToy", 1);
    	Info(playerid, "You has saved toys position");
    }
    else if(playertextid == ToysTDup[playerid])
    {
    	AddTObjPos(playerid);
    }
    else if(playertextid == ToysTDdown[playerid])
    {
    	SubTObjPos(playerid);
    }
    else if(playertextid == ToysTDedit[playerid])
    {
    	ShowPlayerDialog(playerid, TOYSET_VALUE, DIALOG_STYLE_INPUT, "Vehicle Toy PosX", "Set current float value\nNormal Value = 0.05\n\nEnter Float NudgeValue in here:", "Edit", "Cancel");
    }
	// Vehicle object textdraw
    if(playertextid == EditVObjTD[playerid][4])
    {
    	if(IsPlayerInAnyVehicle(playerid))
    	{
    		HideEditVehicleTD(playerid);
    		new x = GetPlayerVehicleID(playerid);
    		foreach(new i: PVehicles)
			{
				if(x == pvData[i][cVeh])
				{
    				MySQL_SaveVehicleToys(i);
    			}
    		}
    	}
    }
    else if(playertextid == EditVObjTD[playerid][6])
    {
    	HideEditVehicleTD(playerid);
    	Info(playerid, "You has canceled edit vehicle toys position");
    }
    else if(playertextid == EditVObjTD[playerid][2])
    {
    	AddVObjPos(playerid);
    }
    else if(playertextid == EditVObjTD[playerid][3])
    {
    	SubVObjPos(playerid);
    }
    else if(playertextid == EditVObjTD[playerid][7])
    {
    	ShowPlayerDialog(playerid, VTOYSET_VALUE, DIALOG_STYLE_INPUT, "Vehicle Toy Position Edit", ""LB_E"Info penggunaan\n"YELLOW_E"Fungsi ini untuk mengatur posisi object dengan textdraw\n\n"PINK_E"[+] Masukan beberapa Jumlah untuk mengatur Object Kordinat\n"PINK_E"[+] Paling biasa di gunakan = 0.05\n"PINK_E"[+] Bila belum sesuai Posisi, coba masukan Angka lain\n\nSilahkan tulis Jumlah di bawah ini sesuai perkiraan posisi object:", "Select", "Cancel");
   	}
    return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	if(pData[playerid][pAdminDuty])
	{
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vehicleid > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
            SetVehiclePos(vehicleid, fX, fY, fZ+10);
        }
        else
        {
           	SetPlayerPosFindZ(playerid, fX, fY, 999.0);
            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);
        }
        SendClientMessage(playerid, ARWIN, "TELEPORT: "WHITE_E"You have "LG_E"succesfully "WHITE_E" teleport to marker map");
	}
	for(new i = 0; i < MAX_PLAYERS; i++)
    {
		if(taxi[i]==1 && GetPlayerState(playerid) == PLAYER_STATE_PASSENGER && i != playerid)
        {
            SetPlayerMapIcon(i, 0, fX, fY, fZ, 0, 0xFF0000FF, MAPICON_GLOBAL);
			SetPlayerCheckpoint(i, fX, fY, fZ, 5.5);
			SCM(i, COLOR_YELLOW, "TAXI: "WHITE_E"The passenger has marked the location on the map");
			if(IsPlayerInRangeOfPoint(i, 50, fX, fY, fZ))
            {
                RemovePlayerMapIcon(i, 0);
                DisablePlayerCheckpoint(i);
                Info(i, "You have reached your destination");
                Info(playerid, "Kamu sudah sampai tujuan");
            }
        }
    }
    return 1;
}

public OnPlayerHackTeleport(playerid, Float:distance)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x,y,z);
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z))
	{
		AutoBan(playerid);
	}
	return 1;
}

forward DelayedKick(playerid);
public DelayedKick(playerid)
{
    if (!IsPlayerConnected(playerid)) return 1;
    Kick(playerid);
    return 1;
}

forward OnSecondTimer();
public OnSecondTimer()
{
	new minute;
	gettime(_, minute);

	foreach(new playerid : Player)
	{
		CallLocalFunction("OnPlayerTimer", "i", playerid);
	}
}
forward OnPlayerTimer(playerid);
public OnPlayerTimer(playerid)
{
	if(pData[playerid][IsLoggedIn] == true)
	{
		if(pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8)
		{
			if(packet == 1)
			{
				pData[playerid][pSmugglerTimer]++;

				if(pData[playerid][pSmugglerTimer] == 500)
					SendClientMessage(playerid, COLOR_LOGS, "JOB: {FFFFFF}Smuggling job is currently active!, use "YELLOW_E"'/findpacket'"WHITE_E" to trace the package"),
					pData[playerid][pSmugglerTimer] = 0;
			}
		}
		if(pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8)
		{
			if(packet == 2)
			{
				pData[playerid][pSmugglerTimer]++;

				if(pData[playerid][pSmugglerTimer] == 500)
					SendClientMessage(playerid, COLOR_LOGS, "JOB: {FFFFFF}Smuggling job is currently active!, use "YELLOW_E"'/findpacket'"WHITE_E" to trace the package"),
					pData[playerid][pSmugglerTimer] = 0;
			}
		}
	}
 	if(GetPlayerPing(playerid) > 800) // Ping Player
  	{
   		new fmt_msg[128];
     	format(fmt_msg, sizeof fmt_msg, "BotCmd: %s has been kicked by BOT.", ReturnName(playerid));
      	SendClientMessageToAll(0xFF5533FF, fmt_msg);
       	format(fmt_msg, sizeof fmt_msg, "Reason: High Ping [%d/500]", GetPlayerPing(playerid));
       	SendClientMessageToAll(0xFF5533FF, fmt_msg);
        return SetTimerEx("DelayKick", 500, 0, "i", playerid);
    }
    return 1;
}

forward OnMinuteTimer();
public OnMinuteTimer()
{
	new hour, minute, second;
	gettime(hour, minute, second);

//	UpdateBet();

	switch(minute)
	{
		case 0:
		{
			if(hour == 0 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 2;
		        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }

			if(hour == 1 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }

		    if(hour == 2 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }

		    if(hour == 7 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 2;
		        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }

		    if(hour == 8 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }

		    if(hour == 10 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }

            if(hour == 11 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 2;
		        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }

		    if(hour == 13 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 2;
		        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }

		    if(hour == 15 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 2;
		        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }

		    if(hour == 17 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }

		    if(hour == 20 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		}
	 	case 30:
		{
		    if(hour == 4 && taked == 0)
		    {
				DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		}
		case 20:
		{
		    if(hour == 12 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 2;
		        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		}
		case 22:
		{
      		if(hour == 21 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		}
	}

	return 1;
}

forward Packet(packetid);
public Packet(packetid)
{
	switch(packetid)
	{
		case 1:
		{
		    DestroyDynamicObject(objectpacket);
		    packet = 1;
		    objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		    taked = 0;
		}
		case 2:
		{
		    DestroyDynamicObject(objectpacket);
	        packet = 2;
	        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
	        taked = 0;
		}
	}
}

forward UnFreeze(playerid);
public UnFreeze(playerid)
{
	KillTimer(Freeze[playerid]);
	TogglePlayerControllable(playerid, 1);
	cbug[playerid] = false;
}

stock SendTweetMessage(color, String[])
{
	foreach(new i : Player)
	{
		if(pData[i][pTogTweet] == 0)
		{
			SendClientMessageEx(i, color, String);
		}
	}
	return 1;
}
stock split(const strsrc[], strdest[][], delimiter)
{
    new i, li;
    new aNum;
    new len;
    while(i <= strlen(strsrc))
    {
        if(strsrc[i] == delimiter || i == strlen(strsrc))
        {
            len = strmid(strdest[aNum], strsrc, li, i, 128);
            strdest[aNum][len] = 0;
            li = i+1;
            aNum++;
        }
        i++;
    }
    return 1;
}
forward splits(const strsrc[], strdest[][], delimiter);
public splits(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc))
	{
		if(strsrc[i]==delimiter || i==strlen(strsrc))
		{
			len = strmid(strdest[aNum], strsrc, li, i, 128);
			strdest[aNum][len] = 0;
			li = i+1;
			aNum++;
		}
		i++;
	}
	return 1;
}

//***************************************************************************/} */
