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
