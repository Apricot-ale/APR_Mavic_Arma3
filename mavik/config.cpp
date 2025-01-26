class CfgPatches
{
	class Mavic_Core
	{
		name = "Mavic 3 (Improved) - Core";
		author = "$STR_Mavic_Author";
		url = "https://steamcommunity.com/sharedfiles/filedetails/?id=3401580668";
		requiredVersion = 2.18;
		requiredAddons[] = {"A3_Data_F_Decade_Loadorder","cba_settings"};
		units[] = {"Mavic_3_OPF","Mavic_3_BLU","Mavic_3_IND","Mavic_3_CIV","Mavic_3T_OPF","Mavic_3T_BLU","Mavic_3T_IND","Mavic_3T_CIV"};
		weapons[] = {"ItemMavic3","ItemMavic3T"};
	};
};

#include "includes\EventHandlers.hpp"
#include "includes\CfgFunctions.hpp"
#include "includes\CfgVehicles.hpp"
#include "includes\CfgMagazines.hpp"
#include "includes\CfgWeapons.hpp"
#include "includes\CfgSounds.hpp"
#include "includes\RscTitles.hpp"
