class CfgPatches
{
	class Mavic_Drop
	{
		name = "Mavic 3 (Improved) - Grenade Drop";
		author = "$STR_Mavic_Author";
		url = "https://steamcommunity.com/sharedfiles/filedetails/?id=3401580668";
		requiredVersion = 2.18;
		requiredAddons[] = {"A3_Data_F_Decade_Loadorder","Mavic_Core"};
		units[] = {"Mavic_Module_AttachGrenade"};
		weapons[] = {};
	};
};

#include "EventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgModules.hpp"
