// SIDE JOB BUS
new bool:DialogBus[3];
new KerjaBus[MAX_PLAYERS];
new BusSteps[MAX_PLAYERS][4];
new BUS[3], BusPlate[3];

IsBUSCAR(carid)
{
	for(new v = 0; v < sizeof(BUS); v++)
	{
		if(carid == BUS[v]) return 1;
	}
	return 0;
}

