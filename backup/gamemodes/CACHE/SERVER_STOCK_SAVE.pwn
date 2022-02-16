new ServerMoney, //2255.92, -1747.33, 1014.77
	Material,
	MaterialPrice,
	LumberPrice,
	Component,
	ComponentPrice,
	MetalPrice,
	GasOil,
	GasOilPrice,
	CoalPrice,
	Product,
	ProductPrice,
	Apotek,
	MedicinePrice,
	MedkitPrice,
	Food,
	FoodPrice,
	SeedPrice,
	PotatoPrice,
	WheatPrice,
	OrangePrice,
	Marijuana,
	MarijuanaPrice,
	FishPrice,
	GStationPrice,
	CrateFish,
	FishStock,
	CrateComponent,
	CrateMaterial;
	
new MoneyPickup,
	Text3D:MoneyText,
	MatPickup,
	Text3D:MatText,
	CompPickup,
	Text3D:CompText,
	GasOilPickup,
	Text3D:GasOilText,
	OrePickup,
	Text3D:OreText,
	ProductPickup,
	Text3D:ProductText,
	ApotekPickup,
	Text3D:ApotekText,
	FoodPickup,
	Text3D:FoodText,
	DrugPickup,
	Text3D:DrugText,
	CrateFishPickup,
	Text3D:CrateFishText,
	SellFishPickup,
	Text3D:SellFishText,
	CrateCompPickup,
	Text3D:CrateCompText,
	CrateComponentStockPickup,
	Text3D:CrateComponentStockText,
	CrateMaterialPickup,
	Text3D:CrateMaterialText;

CreateServerPoint()
{
	if(IsValidDynamic3DTextLabel(MoneyText))
            DestroyDynamic3DTextLabel(MoneyText);

	if(IsValidDynamicPickup(MoneyPickup))
		DestroyDynamicPickup(MoneyPickup);

	//Server Money
	new strings[3998];
	MoneyPickup = CreateDynamicPickup(1239, 23, 2255.92, -1747.33, 1014.77, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Server Money]\n"WHITE_E"Goverment Money: "LG_E"%s", FormatMoney(ServerMoney));
	MoneyText = CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 2255.92, -1747.33, 1014.77, 5.0);
	
	if(IsValidDynamic3DTextLabel(MatText))
            DestroyDynamic3DTextLabel(MatText);

	if(IsValidDynamicPickup(MatPickup))
		DestroyDynamicPickup(MatPickup);
	
	if(IsValidDynamic3DTextLabel(CompText))
            DestroyDynamic3DTextLabel(CompText);

	if(IsValidDynamicPickup(CompPickup))
		DestroyDynamicPickup(CompPickup);
	
	if(IsValidDynamic3DTextLabel(GasOilText))
            DestroyDynamic3DTextLabel(GasOilText);

	if(IsValidDynamicPickup(GasOilPickup))
		DestroyDynamicPickup(GasOilPickup);
		
	if(IsValidDynamic3DTextLabel(OreText))
            DestroyDynamic3DTextLabel(OreText);

	if(IsValidDynamicPickup(OrePickup))
		DestroyDynamicPickup(OrePickup);
		
	if(IsValidDynamic3DTextLabel(ProductText))
            DestroyDynamic3DTextLabel(ProductText);
		
	if(IsValidDynamicPickup(ProductPickup))
		DestroyDynamicPickup(ProductPickup);

	if(IsValidDynamic3DTextLabel(ApotekText))
            DestroyDynamic3DTextLabel(ApotekText);
		
	if(IsValidDynamicPickup(ApotekPickup))
		DestroyDynamicPickup(ApotekPickup);
	
	if(IsValidDynamic3DTextLabel(FoodText))
            DestroyDynamic3DTextLabel(FoodText);
		
	if(IsValidDynamicPickup(FoodPickup))
		DestroyDynamicPickup(FoodPickup);
		
	if(IsValidDynamic3DTextLabel(DrugText))
            DestroyDynamic3DTextLabel(DrugText);
		
	if(IsValidDynamicPickup(DrugPickup))
		DestroyDynamicPickup(DrugPickup);

		// Moved Sell fish In Here
	if(IsValidDynamic3DTextLabel(SellFishText))
            DestroyDynamic3DTextLabel(SellFishText);

	if(IsValidDynamicPickup(SellFishPickup))
		DestroyDynamicPickup(SellFishPickup);

		// Crates Fish Compo Mats
	if(IsValidDynamic3DTextLabel(CrateFishText))
            DestroyDynamic3DTextLabel(CrateFishText);

	if(IsValidDynamicPickup(CrateFishPickup))
		DestroyDynamicPickup(CrateFishPickup);

	if(IsValidDynamic3DTextLabel(CrateCompText))
            DestroyDynamic3DTextLabel(CrateCompText);

	if(IsValidDynamicPickup(CrateCompPickup))
		DestroyDynamicPickup(CrateCompPickup);

	if(IsValidDynamic3DTextLabel(CrateComponentStockText))
            DestroyDynamic3DTextLabel(CrateComponentStockText);

	if(IsValidDynamicPickup(CrateComponentStockPickup))
		DestroyDynamicPickup(CrateComponentStockPickup);

	if(IsValidDynamic3DTextLabel(CrateMaterialText))
            DestroyDynamic3DTextLabel(CrateMaterialText);

	if(IsValidDynamicPickup(CrateMaterialPickup))
		DestroyDynamicPickup(CrateMaterialPickup);

	//JOBS
	MatPickup = CreateDynamicPickup(1239, 23, -258.54, -2189.92, 28.97, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Material]\n"WHITE_E"Material Stock: "LG_E"%d\n\n"WHITE_E"Material Price: "LG_E"%s /item\n"WHITE_E"use command '"YELLOW_E"/buy"WHITE_E"' to buy material\n"WHITE_E"use command '"YELLOW_E"/sellcrate"WHITE_E"' to sealed material crates", Material, FormatMoney(MaterialPrice));
	MatText = CreateDynamic3DTextLabel(strings, ARWIN, -258.54, -2189.92, 28.97, 5.0); // Producrion
	
	CompPickup = CreateDynamicPickup(1239, 23, 854.55, -604.72, 18.42, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Component Storage]\n"WHITE_E"Component Stock: "LG_E"%d\n\n"WHITE_E"Component Price: "LG_E"%s /item\n"LB_E"/buy", Component, FormatMoney(ComponentPrice));
	CompText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 854.55, -604.72, 18.42, 5.0); // comp
	
	GasOilPickup = CreateDynamicPickup(1239, 23, 336.70, 895.54, 20.40, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Miner]\n"WHITE_E"GasOil Stock: "LG_E"%d liters\n\n"WHITE_E"GasOil Price: "LG_E"%s /liters\n"LB_E"/buy", GasOil, FormatMoney(GasOilPrice));
	GasOilText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 336.70, 895.54, 20.40, 5.0); // gasoil
	
	OrePickup = CreateDynamicPickup(1239, 23, 293.73, 913.17, 20.40, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Miner]\n"WHITE_E"Ore Metal Price: "LG_E"%s / item\n\n"WHITE_E"Ore Coal Price: "LG_E"%s /item\n"LB_E"/ore sell", FormatMoney(MetalPrice), FormatMoney(CoalPrice));
	OreText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 293.73, 913.17, 20.40, 5.0); // sell ore
	
	ProductPickup = CreateDynamicPickup(1239, 23, -279.67, -2148.42, 28.54, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[PRODUCT]\n"WHITE_E"Product Stock: "LG_E"%d\n\n"WHITE_E"Product Price: "LG_E"%s /item\n"LB_E"/buy /sellproduct", Product, FormatMoney(ProductPrice));
	ProductText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -279.67, -2148.42, 28.54, 5.0); // product
	
	ApotekPickup = CreateDynamicPickup(1239, 23, 1435.34, -23.91, 1000.92, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Hospital]\n"WHITE_E"Apotek Stock: "LG_E"%d\n"LB_E"/buy", Apotek);
	ApotekText = CreateDynamic3DTextLabel(strings, COLOR_PINK, 1435.34, -23.91, 1000.92, 5.0); // Apotek hospital
	
	FoodPickup = CreateDynamicPickup(1239, 23, -381.44, -1426.13, 25.93, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Food]\n"WHITE_E"Food Stock: "LG_E"%d\n"WHITE_E"Food Price: "LG_E"%s /item\n\n"WHITE_E"Seed Price: "LG_E"%s /item\n"WHITE_E"Potato Price: "LG_E"%s /kg\n"WHITE_E"Wheat Price: "LG_E"%s /kg\n"WHITE_E"Orange Price: "LG_E"%s /kg\n\n"WHITE_E"use command '"LB_E"/buy"WHITE_E"' to purchased",
	Food, FormatMoney(FoodPrice), FormatMoney(SeedPrice), FormatMoney(PotatoPrice), FormatMoney(WheatPrice), FormatMoney(OrangePrice), FormatMoney(FishPrice));
	FoodText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -381.44, -1426.13 , 25.93+1, 5.0); // food
	
	DrugPickup = CreateDynamicPickup(1239, 23, -3811.65, 1313.72, 71.42, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Black Market]\n"WHITE_E"Marijuana Stock: "LG_E"%d\n\n"WHITE_E"Marijuana Price: "LG_E"%s /item\n"LB_E"/buy /sellmarijuana", Marijuana, FormatMoney(MarijuanaPrice));
	DrugText = CreateDynamic3DTextLabel(strings, COLOR_GREY, -3811.65, 1313.72, 71.42, 5.0); // product

	SellFishPickup = CreateDynamicPickup(1599, 23, 2844.03, -1516.75, 11.29, -1, -1, -1, 12.0);
	format(strings, sizeof(strings), "=Fish Storage=\n"WHITE_E"Fish Price: "LG_E"%s\n"YELLOW_E"Storage Fish: "LG_E"%d\n"WHITE_E"'"YELLOW_E"/sellfish"WHITE_E"' to sell your fish", FormatMoney(FishPrice), FishStock);
	SellFishText = CreateDynamic3DTextLabel(strings, COLOR_GREY, 2844.03, -1516.75, 11.29, 5.0); // product

	CrateFishPickup = CreateDynamicPickup(2912, 23, 2836.23, -1540.68, 11.09, -1, -1, -1, 12.0);
	format(strings, sizeof(strings), "[Crate Fish]\n"WHITE_E"Stock Crates: "LG_E"%d\n"WHITE_E"use '"YELLOW_E"/getcrate"WHITE_E"' to pickup crate", CrateFish);
	CrateFishText = CreateDynamic3DTextLabel(strings, ARWIN, 2836.23, -1540.68, 11.09, 5.0); // product

	CrateCompPickup = CreateDynamicPickup(2912, 23, 315.07, 926.53, 20.46, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Crates Component]\n"WHITE_E"Available Stock: "LG_E"%d\n"WHITE_E"use command '"YELLOW_E"/getcrate"WHITE_E"' to pickup crates", CrateComponent);
	CrateCompText = CreateDynamic3DTextLabel(strings, ARWIN, 315.07, 926.53, 20.46, 5.0); // comp

	CrateComponentStockPickup = CreateDynamicPickup(2912, 23, 797.60, -617.48, 16.00, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Component Restock]\n"WHITE_E"use command '"YELLOW_E"/sellcrate"WHITE_E"' to store crates component");
	CrateComponentStockText = CreateDynamic3DTextLabel(strings, ARWIN, 797.60, -617.48, 16.00, 5.0); // comp

	CrateMaterialPickup = CreateDynamicPickup(2912, 23, -1425.71, -1528.95, 102.13, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "[Material Crates]\n"WHITE_E"Available Stock: "LG_E"%d\n"WHITE_E"use command '"YELLOW_E"/getcrate"WHITE_E"' to pickup crate\n"WHITE_E"use command '"YELLOW_E"/lum sell"WHITE_E"' to sealed lumber", CrateMaterial);
	CrateMaterialText = CreateDynamic3DTextLabel(strings, ARWIN, -1425.71, -1528.95, 102.13, 5.0); // lumber

}

Server_Percent(price)
{
    return floatround((float(price) / 100) * 85);
}

Server_AddPercent(price)
{
    new money = (price - Server_Percent(price));
    ServerMoney = ServerMoney + money;
    Server_Save();
}

Server_AddMoney(amount)
{
    ServerMoney = ServerMoney + amount;
    Server_Save();
}

Server_MinMoney(amount)
{
    ServerMoney -= amount;
    Server_Save();
}

Server_Save()
{
    new str[3998];

	CreateServerPoint();
    format(str, sizeof(str), "UPDATE server SET servermoney='%d', material='%d', materialprice='%d', lumberprice='%d', component='%d', componentprice='%d', metalprice='%d', gasoil='%d', gasoilprice='%d', coalprice='%d', product='%d', productprice='%d', medicineprice='%d', medkitprice='%d', food='%d', foodprice='%d', seedprice='%d', potatoprice='%d', wheatprice='%d', orangeprice='%d', marijuana='%d', marijuanaprice='%d', fishprice='%d', gstationprice='%d', crate_fish='%d', fish_stock='%d', crate_compo='%d', crate_material='%d' WHERE id=0",
	ServerMoney, Material, MaterialPrice, LumberPrice, Component, ComponentPrice, MetalPrice, GasOil, GasOilPrice, CoalPrice, Product, ProductPrice, MedicinePrice, MedkitPrice, 
	Food, FoodPrice, SeedPrice, PotatoPrice, WheatPrice, OrangePrice, Marijuana, MarijuanaPrice, FishPrice, GStationPrice, CrateFish, FishStock, CrateComponent, CrateMaterial);
    return mysql_tquery(g_SQL, str);
}

function LoadServer()
{
	cache_get_value_name_int(0, "servermoney", ServerMoney);
	cache_get_value_name_int(0, "material", Material);
	cache_get_value_name_int(0, "materialprice", MaterialPrice);
	cache_get_value_name_int(0, "lumberprice", LumberPrice);
	cache_get_value_name_int(0, "component", Component);
	cache_get_value_name_int(0, "componentprice", ComponentPrice);
	cache_get_value_name_int(0, "metalprice", MetalPrice);
	cache_get_value_name_int(0, "gasoil", GasOil);
	cache_get_value_name_int(0, "gasoilprice", GasOilPrice);
	cache_get_value_name_int(0, "coalprice", CoalPrice);
	cache_get_value_name_int(0, "product", Product);
	cache_get_value_name_int(0, "productprice", ProductPrice);
	cache_get_value_name_int(0, "apotek", Apotek);
	cache_get_value_name_int(0, "medicineprice", MedicinePrice);
	cache_get_value_name_int(0, "medkitprice", MedkitPrice);
	cache_get_value_name_int(0, "food", Food);
	cache_get_value_name_int(0, "foodprice", FoodPrice);
	cache_get_value_name_int(0, "seedprice", SeedPrice);
	cache_get_value_name_int(0, "potatoprice", PotatoPrice);
	cache_get_value_name_int(0, "wheatprice", WheatPrice);
	cache_get_value_name_int(0, "orangeprice", OrangePrice);
	cache_get_value_name_int(0, "marijuana", Marijuana);
	cache_get_value_name_int(0, "marijuanaprice", MarijuanaPrice);
	cache_get_value_name_int(0, "fishprice", FishPrice);
	cache_get_value_name_int(0, "gstationprice", GStationPrice);
	cache_get_value_name_int(0, "crate_fish", CrateFish);
	cache_get_value_name_int(0, "fish_stock", FishStock);
	cache_get_value_name_int(0, "crate_compo", CrateComponent);
	cache_get_value_name_int(0, "crate_material", CrateMaterial);
	printf("[SERVER] Number of Loaded Data Server...");
	printf("[SERVER] ServerMoney: %d", ServerMoney);
	//printf("[Server] Material: %d", Material);
	//printf("[Server] MaterialPrice: %d", MaterialPrice);
	//printf("[Server] LumberPrice: %d", LumberPrice);
	
	CreateServerPoint();
}
