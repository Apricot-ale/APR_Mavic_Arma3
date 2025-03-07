class Extended_PreInit_EventHandlers
{
	class Mavic_preInit
	{
		init = "call compile preProcessFileLineNumbers '\mavik\XEH_preInit.sqf'";
	};
};

class Extended_PostInit_EventHandlers
{
	class Mavic_postInit
	{
		init = "call compile preProcessFileLineNumbers '\mavik\XEH_clientInit.sqf'";
	};
};
