class CfgPatches
{
	class Mavic_Drop
	{
		name = "Mavic 3 (Improved) - Grenade Drop";
		author = "$STR_Mavic_Author";
		url = "https://steamcommunity.com/sharedfiles/filedetails/?id=3401580668";
		requiredVersion = 2.18;
		requiredAddons[] = {"A3_Data_F_Decade_Loadorder","Mavic_Core"};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
	class mavic_drop //mavic_drop_fnc_scriptsClass
	{
		file = "mavic_drop\functions";
		class functions
		{
			class initDrone{};
			class makeGrenadeDrone{};
			class dropGrenade{};
			class dynamicBlurToggle{};
			class uiGrenadeSelector{};
			class detach_uiGrenadeSelector{};
		};
	};
};

class CfgAmmo
{
	class Grenade;
	class GrenadeHand: Grenade {};
	class mini_Grenade: GrenadeHand {};
	class Mavic_Impact_M67: GrenadeHand
	{
		explosionTime = -1;
		timeToLive = 1e+10;
		Mavic_weight = 400;
	};
	class Mavic_Impact_V40: mini_Grenade
	{
		explosionTime = -1;
		timeToLive = 1e+10;
		Mavic_weight = 140;
	};
	class Mavic_Impact_F1: GrenadeHand
	{
		model = "\mavic_drop\f1.p3d";
		hit = 10;
		indirectHit = 6;
		indirectHitRange = 10;
		typicalspeed = 16;
		explosionEffectsRadius = 7.5;
		explosionTime = -1;
		timeToLive = 1e+10;
		Mavic_weight = 600;
	};
	class Mavic_Impact_VOG25: GrenadeHand
	{
		model = "\mavic_drop\vog25.p3d";
		hit = 80;
		typicalspeed = 76;
		deflecting = 5;
		explosionTime = -1;
		timeToLive = 1e+10;
		Mavic_weight = 275;
	};
	class Mavic_Impact_TBG: GrenadeHand
	{
		model = "\mavic_drop\tbg.p3d";
		hit = 40;
		indirectHit = 25;
		indirectHitRange = 4;
		typicalspeed = 70;
		deflecting = 5;
		explosionTime = -1;
		timeToLive = 1e+10;
		fuseDistance = 0;
		Mavic_weight = 300;
	};
	class Mavic_Impact_M433: GrenadeHand
	{
		model = "\mavic_drop\m433.p3d";
		hit = 100;
		indirectHit = 6;
		indirectHitRange = 4;
		caliber = 3;
		
		warheadName = "HEAT";
		submunitionAmmo = "Mavic_Impact_M433_Penetrator";
		submunitionDirectionType = "SubmunitionModelDirection";
		submunitionInitialOffset[] = {0,0,-0.1};
		submunitionParentSpeedCoef = 0;
		submunitionInitSpeed = 1053;
		triggerOnImpact = 1;
		deleteParentWhenTriggered = 0;
		
		typicalSpeed = 185;
		
		deflecting = 5;
		explosionTime = -1;
		timeToLive = 1e+10;
		fuseDistance = 2;
		Mavic_weight = 230;
	};
	class ammo_Penetrator_Base;
	class Mavic_Impact_M433_Penetrator: ammo_Penetrator_Base
	{
		caliber = 3.3333;
		hit = 90;
	};
};
class CfgMagazines
{
	class HandGrenade;
	class Mavic_base: HandGrenade
	{
		author = "$STR_Mavic_Author";
		scope = 1;
		mass = 10;
	};
	class Mavic_M67: Mavic_base
	{
		scope = 2;
		displayName = "$STR_Mavic_Drop_Grenade_M67_displayName";
		displayNameShort = "$STR_Mavic_Drop_Grenade_M67_displayShort";
		descriptionShort = "$STR_Mavic_Drop_Grenade_M67_description";
		picture = "\A3\Weapons_F\Data\UI\gear_M67_CA.paa";
		model = "\A3\Weapons_f\ammo\Handgrenade";
		ammo = "Mavic_Impact_M67";
	};
	class Mavic_V40: Mavic_base
	{
		scope = 2;
		displayName = "$STR_Mavic_Drop_Grenade_V40_displayName";
		displayNameShort = "$STR_Mavic_Drop_Grenade_V40_displayShort";
		descriptionShort = "$STR_Mavic_Drop_Grenade_V40_description";
		picture = "\A3\Weapons_F\Data\UI\gear_M67_CA.paa";
		model = "\A3\Weapons_f\ammo\mini_frag";
		ammo = "Mavic_Impact_V40";
		initSpeed = 26;
		mass = 6;
	};
	class Mavic_F1: Mavic_base
	{
		scope = 2;
		displayName = "$STR_Mavic_Drop_Grenade_F1_displayName";
		displayNameShort = "$STR_Mavic_Drop_Grenade_F1_displayShort";
		descriptionShort = "$STR_Mavic_Drop_Grenade_F1_description";
		picture = "\mavic_drop\pictures\f1.paa";
		model = "\mavic_drop\f1.p3d";
		ammo = "Mavic_Impact_F1";
	};
	class Mavic_VOG25: Mavic_base
	{
		scope = 2;
		displayName = "$STR_Mavic_Drop_Grenade_VOG25_displayName";
		displayNameShort = "$STR_Mavic_Drop_Grenade_VOG25_displayShort";
		descriptionShort = "$STR_Mavic_Drop_Grenade_VOG25_description";
		picture = "\mavic_drop\pictures\vog25.paa";
		model = "\mavic_drop\vog25.p3d";
		ammo = "Mavic_Impact_VOG25";
		initSpeed = 26;
		mass = 4;
	};
	class Mavic_TBG: Mavic_base
	{
		scope = 2;
		displayName = "$STR_Mavic_Drop_Grenade_TBG_displayName";
		displayNameShort = "$STR_Mavic_Drop_Grenade_TBG_displayShort";
		descriptionShort = "$STR_Mavic_Drop_Grenade_TBG_description";
		picture = "\mavic_drop\pictures\tbg.paa";
		model = "\mavic_drop\tbg.p3d";
		ammo = "Mavic_Impact_TBG";
		initSpeed = 26;
		mass = 4;
	};
	class Mavic_M433: Mavic_base
	{
		scope = 2;
		displayName = "$STR_Mavic_Drop_Grenade_M433_displayName";
		displayNameShort = "$STR_Mavic_Drop_Grenade_M433_displayShort";
		descriptionShort = "$STR_Mavic_Drop_Grenade_M433_description";
		picture = "\mavic_drop\pictures\m433.paa";
		model = "\mavic_drop\m433.p3d";
		ammo = "Mavic_Impact_M433";
		initSpeed = 26;
		mass = 4;
	};
};

class CfgWeapons
{
	class Default;
	class GrenadeLauncher: Default{};
	class Throw: GrenadeLauncher
	{
		Muzzles[] += {"Mavic_M67_Muzzle","Mavic_V40_Muzzle","Mavic_F1_Muzzle","Mavic_VOG25_Muzzle","Mavic_TBG_Muzzle","Mavic_M433_Muzzle"};
		class ThrowMuzzle: GrenadeLauncher {};
		class Mavic_M67_Muzzle: ThrowMuzzle
		{
			magazines[] = {"Mavic_M67"};
		};
		class Mavic_V40_Muzzle: ThrowMuzzle
		{
			magazines[] = {"Mavic_V40"};
		};
		class Mavic_F1_Muzzle: ThrowMuzzle
		{
			magazines[] = {"Mavic_F1"};
		};
		class Mavic_VOG25_Muzzle: ThrowMuzzle
		{
			magazines[] = {"Mavic_VOG25"};
		};
		class Mavic_TBG_Muzzle: ThrowMuzzle
		{
			magazines[] = {"Mavic_TBG"};
		};
		class Mavic_M433_Muzzle: ThrowMuzzle
		{
			magazines[] = {"Mavic_M433"};
		};
	};
};
