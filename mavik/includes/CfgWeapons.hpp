class CfgWeapons
{
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;
	class ItemMavic: CBA_MiscItem
	{
		author = "$STR_Mavic_Author";
		scope = 1;
		displayName = "$STR_Mavic_Item_Mavic3_displayName";
		picture = "\mavik\interface\game\Mavick_map.paa";
		model = "\mavik\mavik3.p3d";
		descriptionShort = "$STR_Mavic_Item_Mavic3_description";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass = 20;
		};
	};
	class ItemMavic3: ItemMavic
	{
		scope = 2;
		displayName = "$STR_Mavic_Item_Mavic3_displayName";
		descriptionShort = "$STR_Mavic_Item_Mavic3_description";
	};
	class ItemMavic3T: ItemMavic
	{
		scope = 2;
		displayName = "$STR_Mavic_Item_Mavic3T_displayName";
		descriptionShort = "$STR_Mavic_Item_Mavic3T_description";
	};
};
