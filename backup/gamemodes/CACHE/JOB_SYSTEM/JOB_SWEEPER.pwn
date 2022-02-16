new bool:DialogSweeper[3];
new KerjaSweeper[MAX_PLAYERS];
new SweeperSteps[MAX_PLAYERS][4];
new SWEEPER[3], SWEEPERPlate[3];

IsSWEEPERCar(carid)
{
	for(new v = 0; v < sizeof(SWEEPER); v++)
	{
		if(carid == SWEEPER[v]) return 1;
	}
	return 0;
}

