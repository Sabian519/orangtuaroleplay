#define MAX_CONTACTS 10
enum contactData {
	contactID,
	contactExists,
	contactName[32],
	contactNumber
};
new ContactData[MAX_PLAYERS][MAX_CONTACTS][contactData];
new ListedContacts[MAX_PLAYERS][MAX_CONTACTS];
stock ShowContacts(playerid)
{
	new
	    string[32 * MAX_CONTACTS],
		count = 0;

	string = ""YELLOW_E"Add Contact\n";

	for (new i = 0; i != MAX_CONTACTS; i ++) if (ContactData[playerid][i][contactExists])
	{
	    format(string, sizeof(string), "%s%s - #%d\n", string, ContactData[playerid][i][contactName], ContactData[playerid][i][contactNumber]);
		ListedContacts[playerid][count++] = i;
	}
	ShowPlayerDialog(playerid, CONTACT, DIALOG_STYLE_LIST, "My Contacts", string, "Select", "Back");
	return 1;
}
forward OnContactAdd(playerid, id);
public OnContactAdd(playerid, id)
{
	ContactData[playerid][id][contactID] = cache_insert_id();
	return 1;
}
function LoadContact(playerid)
{
    new cname[50];
	new count = cache_num_rows();
	if(count)
  	{
		for (new i = 0; i < count && i < MAX_CONTACTS; i ++)
		{
			cache_get_value_name(i, "contactName", cname);
			format(ContactData[playerid][i][contactName], 50, "%s", cname);
			ContactData[playerid][i][contactExists] = true;
		    cache_get_value_name_int(i, "contactID", ContactData[playerid][i][contactID]);
		    cache_get_value_name_int(i, "contactNumber", ContactData[playerid][i][contactNumber]);
		}
	}
}
CMD:phone(playerid)
{
	if(pData[playerid][pPhone] == 0) return Error(playerid, "You dont have phone!");
	if(pData[playerid][pInjured] != 0) return Error(playerid, "You cant do at this time.");

	if (pData[playerid][pPhoneOff]) {
		ShowPlayerDialog(playerid, MY_PHONE, DIALOG_STYLE_LIST, "My Phone Menu", "Dial Number\nMy Contacts\nSend Text Message\nSharing Location\nApplication\nTurn On Phone", "Select", "Cancel");
	}
	else {
	    ShowPlayerDialog(playerid, MY_PHONE, DIALOG_STYLE_LIST, "My Phone Menu", "Dial Number\nMy Contacts\nSend Text Message\nSharing Location\nApplication\nTurn Off Phone", "Select", "Cancel");
	}
	return 1;
}
