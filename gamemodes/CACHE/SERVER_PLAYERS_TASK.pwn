// FUNGSI INI ADALAH MEMBERI NOTIF BILA DELAYS SIDE/JOB BERAKHIR //
ptask PengurangData[1000](i)
{
	if(pData[i][pBusTime] > 0)
	{
 		if(pData[i][pBusTime] == 1)
   		{
			Info(i, "Now you can sidejob "YELLOW_E"Bus Driver"WHITE_E" again");
			pData[i][pBusTime] --;
		}
		else
		{
		  	pData[i][pBusTime] --;
		}
	}
	if(pData[i][pSideJobTime] > 0)
	{
 		if(pData[i][pSideJobTime] == 1)
		{
			Info(i, "Now you can sidejob "YELLOW_E"Street Cleanner"WHITE_E" again");
			pData[i][pSideJobTime] --;
		}
		else
		{
			pData[i][pSideJobTime] --;
		}
	}
	if(pData[i][pForTime] > 0)
	{
	    if(pData[i][pForTime] == 1)
	    {
			Info(i, "Now you can sidejob "YELLOW_E"Forklift Drivers"WHITE_E" again");
			pData[i][pForTime] --;
		}
		else
		{
			pData[i][pForTime] --;
		}
	}
	if(pData[i][pPizzaTime] > 0)
	{
	    if(pData[i][pPizzaTime] == 1)
	    {
			Info(i, "Now you can sidejob "YELLOW_E"Pizzaboy Delivered"WHITE_E" again");
			pData[i][pPizzaTime] --;
		}
		else
		{
			pData[i][pPizzaTime] --;
		}
	}
	// Jobs Funtion Native Stop Delays
	if(pData[i][pJobTime] > 0)
	{
	    if(pData[i][pJobTime] == 1)
	    {
			Info(i, "Now you can starting job "YELLOW_E"Miner"WHITE_E" again");
			pData[i][pJobTime] --;
		}
		else
		{
			pData[i][pJobTime] --;
		}
	}
	if(pData[i][pLumberTime] > 0)
	{
	    if(pData[i][pLumberTime] == 1)
	    {
			Info(i, "Now you can Jobs "YELLOW_E"Lumberjack"WHITE_E" again");
			pData[i][pLumberTime] --;
		}
		else
		{
			pData[i][pLumberTime] --;
		}
	}
	if(pData[i][pTruckerTime] > 0)
	{
	    if(pData[i][pTruckerTime] == 1)
	    {
			Info(i, "Now you can Jobs "YELLOW_E"Trucker Drivers"WHITE_E" again");
			pData[i][pTruckerTime] --;
		}
		else
		{
			pData[i][pTruckerTime] --;
		}
	}
	if(pData[i][pProductionTime] > 0)
	{
	    if(pData[i][pProductionTime] == 1)
	    {
			Info(i, "Now you can Jobs "YELLOW_E"Production"WHITE_E" again");
			pData[i][pProductionTime] --;
		}
		else
		{
			pData[i][pProductionTime] --;
		}
	}
	if(pData[i][pDepositorTime] > 0)
	{
	    if(pData[i][pDepositorTime] == 1)
	    {
			Info(i, "Now you can Jobs "YELLOW_E"Depositor jobs"WHITE_E" again");
			pData[i][pDepositorTime] --;
		}
		else
		{
			pData[i][pDepositorTime] --;
		}
	}
}



























