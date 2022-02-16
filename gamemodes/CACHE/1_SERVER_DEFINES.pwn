// Server Define
#define TEXT_GAMEMODE	"OTRP v3.0.5"
#define TEXT_WEBURL		"https/discord.gg/cumingsuun"
#define TEXT_LANGUAGE	"Indonesia/English"

// MySQL configuration
#define		MYSQL_HOST 			"127.0.0.1"
#define		MYSQL_USER 			"root"
#define		MYSQL_PASSWORD 		""
#define		MYSQL_DATABASE 		"base"

// how many seconds until it kicks the player for taking too long to login
#define		SECONDS_TO_LOGIN 	200

// default spawn point: PESAWAT OTRP 1745.2369,-1861.5828,13.5798,267.7489
#define 	DEFAULT_POS_X 		1745.2369
#define 	DEFAULT_POS_Y 		-1861.5828
#define 	DEFAULT_POS_Z 		13.5798
#define 	DEFAULT_POS_A 		267.7489

//Android Client Check
//#define IsPlayerAndroid(%0)                 GetPVarInt(%0, "NotAndroid") == 0

#define Loop(%0,%1,%2) for(new %0 = %2; %0 < %1; %0++)

#define CamsLoop(%1) for(new %1 = 0; %1 < MAX_SPEED_CAMERAS; %1++)

#define PlayerLoops(%1) for(new %1 = 0, pMax = MAX_PLAYERS; %1 < pMax; %1++) if(IsPlayerConnected(%1) && !IsPlayerNPC(%1))
 					// SEM = Send Error Message by 	Myself
#define IsNull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))    // IsNull macro 			by 	Y_Less

// Message
#define SCM SendClientMessage
#define function%0(%1) forward %0(%1); public %0(%1)
#define Servers(%1,%2) SendClientMessageEx(%1, ARWIN, "SERVER: "YELLOW_E""%2)
#define Info(%1,%2) SendClientMessageEx(%1, ARWIN, "INFO: "WHITE_E""%2)
#define Vehicle(%1,%2) SendClientMessageEx(%1, ARWIN, "VEHICLE: "WHITE_E""%2)
#define Usage(%1,%2) SendClientMessage(%1, COLOR_YELLOW , ">KEGUNAAN: "GREY_E""%2)
#define Error(%1,%2) SendClientMessageEx(%1, COLOR_GREY3, ""RED_E"ERROR: "GREY_E""%2)
#define PermissionError(%0) SendClientMessage(%0, COLOR_RED, "ERROR: "GREY_E"Kamu tidak memiliki akses untuk melakukan command ini!")
#define SendMessage(%0,%1) \
	SendClientMessageEx(%0, ARWIN, "OTRP:"WHITE_E" "%1)

#define PRESSED(%0) \
    (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

//Converter
#define minplus(%1) \
        (((%1) < 0) ? (-(%1)) : ((%1)))

// AntiCaps
#define UpperToLower(%1) for( new ToLowerChar; ToLowerChar < strlen( %1 ); ToLowerChar ++ ) if ( %1[ ToLowerChar ]> 64 && %1[ ToLowerChar ] < 91 ) %1[ ToLowerChar ] += 32

// Banneds
const BAN_MASK = (-1 << (32 - (/*this is the CIDR ip detection range [def: 26]*/26)));

//---------[ Define Faction ]-----
#define SAPD	1		//locker 1573.26, -1652.93, -40.59
#define	SAGS	2		// 1464.10, -1790.31, 2349.68
#define SAMD	3		// -1100.25, 1980.02, -58.91
#define SANEW	4		// 256.14, 1776.99, 701.08
//---------[ Define Untuk Crate ] ------------
#define CRATES 9
