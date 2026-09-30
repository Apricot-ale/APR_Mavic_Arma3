class CfgVehicles
{
	class Module_F;
	class Mavic_Module_AttachGrenade: Module_F
	{
		author = "$STR_Mavic_Author";
		category = "Mavic_Zeus";
		displayName = "$STR_Mavic_Module_AttachGrenade_displayName";
		function = "mavic_drop_fnc_moduleAttachGrenade";
		functionPriority = 1;
		// Server resolves the target; UI opens on the placing Zeus via remoteExec
		isGlobal = 0;
		isTriggerActivated = 0;
		isDisposable = 1;
		is3DEN = 0;
		scope = 1; // Hidden from Eden; Zeus-only via scopeCurator
		scopeCurator = 2;
		curatorCanAttach = 1;

		class ModuleDescription
		{
			description = "$STR_Mavic_Module_AttachGrenade_description";
		};
	};
};

