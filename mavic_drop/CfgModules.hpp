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
		isGlobal = 0;
		isTriggerActivated = 0;
		isDisposable = 1;
		is3DEN = 0;
		scope = 2;
		scopeCurator = 2;
		curatorCanAttach = 1;
		
		class Arguments
		{
			class GrenadeType
			{
				displayName = "$STR_Mavic_Module_AttachGrenade_GrenadeType_displayName";
				description = "$STR_Mavic_Module_AttachGrenade_GrenadeType_description";
				typeName = "STRING";
				class values
				{
					class Mavic_M433
					{
						name = "$STR_Mavic_Drop_Grenade_M433_displayName";
						value = "Mavic_M433";
						default = 1;
					};
					class Mavic_M67
					{
						name = "$STR_Mavic_Drop_Grenade_M67_displayName";
						value = "Mavic_M67";
					};
					class Mavic_V40
					{
						name = "$STR_Mavic_Drop_Grenade_V40_displayName";
						value = "Mavic_V40";
					};
					class Mavic_F1
					{
						name = "$STR_Mavic_Drop_Grenade_F1_displayName";
						value = "Mavic_F1";
					};
					class Mavic_TBG
					{
						name = "$STR_Mavic_Drop_Grenade_TBG_displayName";
						value = "Mavic_TBG";
					};
					class Mavic_VOG25
					{
						name = "$STR_Mavic_Drop_Grenade_VOG25_displayName";
						value = "Mavic_VOG25";
					};
				};
				defaultValue = "Mavic_M433";
			};
			class Quantity
			{
				displayName = "$STR_Mavic_Module_AttachGrenade_Quantity_displayName";
				description = "$STR_Mavic_Module_AttachGrenade_Quantity_description";
				typeName = "NUMBER";
				class values
				{
					class One
					{
						name = "$STR_Mavic_Module_AttachGrenade_Quantity_1";
						value = 1;
						default = 1;
					};
					class Two
					{
						name = "$STR_Mavic_Module_AttachGrenade_Quantity_2";
						value = 2;
					};
				};
				defaultValue = 1;
			};
		};
		
		class ModuleDescription
		{
			description = "$STR_Mavic_Module_AttachGrenade_description";
		};
	};
};

