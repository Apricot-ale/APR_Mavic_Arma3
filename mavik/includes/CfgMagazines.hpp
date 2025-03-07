class CfgMagazines
{
	class CA_Magazine;
	class Item_Mavic: CA_Magazine
	{
		scope = 1;
		author = "$STR_Mavic_Author";
		descriptionShort = "$STR_Mavic_Item_Mavic3_description";
		displayName = "$STR_Mavic_Item_Mavic3_Magazine_displayName";
		model = "\mavik\mavik3.p3d";
		icon = "\mavik\interface\game\Mavick_map.paa";
		picture = "\mavik\interface\game\Mavick_map.paa";
		mass = 20;
		count = 100;
		ammo = "FakeAmmo";
        ACE_asItem = 1;
	};
	class Item_Mavic3: Item_Mavic
	{
		scope = 2;
		descriptionShort = "$STR_Mavic_Item_Mavic3_description";
		displayName = "$STR_Mavic_Item_Mavic3_Magazine_displayName";
	};
	class Item_Mavic3T: Item_Mavic
	{
		scope = 2;
		descriptionShort = "$STR_Mavic_Item_Mavic3T_description";
		displayName = "$STR_Mavic_Item_Mavic3T_Magazine_displayName";
	};
};
