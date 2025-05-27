class CfgVehicles
{
	class Box_NATO_Equip_F;
	class Mavic_Box_AIO_Mavic3A_Items_F: Box_NATO_Equip_F
	{
		author = "$STR_Mavic_Author";
		editorPreview = "\A3\EditorPreviews_F_Exp\Data\CfgVehicles\Box_AAF_Equip_F.jpg";
		displayName = "$STR_Mavic_Box_AIO_Mavic3A_Items_F_displayName";
		hiddenSelectionsTextures[] = {"\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_indep_co.paa","\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_indep_ca.paa"};
		class TransportMagazines
		{
			class _xx_Mavic_M67
			{
				magazine = "Mavic_M67";
				count = 10;
			};
			class _xx_Mavic_V40
			{
				magazine = "Mavic_V40";
				count = 10;
			};
			class _xx_Mavic_F1
			{
				magazine = "Mavic_F1";
				count = 10;
			};
			class _xx_Mavic_VOG25
			{
				magazine = "Mavic_VOG25";
				count = 10;
			};
			class _xx_Mavic_Mavic_TBG
			{
				magazine = "Mavic_TBG";
				count = 10;
			};
			class _xx_Mavic_M433
			{
				magazine = "Mavic_M433";
				count = 10;
			};
		};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 10;
			};
			class _xx_ItemMavic3
			{
				name = "ItemMavic3";
				count = 10;
			};
			class _xx_ItemMavic3T
			{
				name = "ItemMavic3T";
				count = 10;
			};
			class _xx_ItemMavic3N
			{
				name = "ItemMavic3N";
				count = 10;
			};
			class _xx_ItemMavic3X
			{
				name = "ItemMavic3X";
				count = 10;
			};
			class _xx_O_UavTerminal
			{
				name = "O_UavTerminal";
				count = 5;
			};
			class _xx_B_UavTerminal
			{
				name = "B_UavTerminal";
				count = 5;
			};
			class _xx_I_UavTerminal
			{
				name = "I_UavTerminal";
				count = 5;
			};
			class _xx_C_UavTerminal
			{
				name = "C_UavTerminal";
				count = 5;
			};
		};
	};
	class Mavic_Box_NATO_Mavic3E_Items_F: Mavic_Box_AIO_Mavic3A_Items_F
	{
		editorPreview = "\A3\EditorPreviews_F_Exp\Data\CfgVehicles\Box_NATO_Equip_F.jpg";
		displayName = "$STR_Mavic_Box_NATO_Mavic3E_Items_F_displayName";
		hiddenSelectionsTextures[] = {"\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_blufor_co.paa","\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_blufor_ca.paa"};
		class TransportMagazines{};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 5;
			};
			class _xx_ItemMavic3
			{
				name = "ItemMavic3";
				count = 2;
			};
			class _xx_B_UavTerminal
			{
				name = "B_UavTerminal";
				count = 2;
			};
		};
	};
	class Mavic_Box_NATO_Mavic3T_Items_F: Mavic_Box_NATO_Mavic3E_Items_F
	{
		displayName = "$STR_Mavic_Box_NATO_Mavic3T_Items_F_displayName";
		class TransportMagazines{};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 5;
			};
			class _xx_ItemMavic3T
			{
				name = "ItemMavic3T";
				count = 2;
			};
			class _xx_B_UavTerminal
			{
				name = "B_UavTerminal";
				count = 2;
			};
		};
	};
	class Mavic_Box_NATO_Mavic3N_Items_F: Mavic_Box_NATO_Mavic3E_Items_F
	{
		displayName = "$STR_Mavic_Box_NATO_Mavic3N_Items_F_displayName";
		class TransportMagazines{};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 5;
			};
			class _xx_ItemMavic3N
			{
				name = "ItemMavic3N";
				count = 2;
			};
			class _xx_B_UavTerminal
			{
				name = "B_UavTerminal";
				count = 2;
			};
		};
	};
	class Mavic_Box_NATO_Mavic3X_Items_F: Mavic_Box_NATO_Mavic3E_Items_F
	{
		displayName = "$STR_Mavic_Box_NATO_Mavic3X_Items_F_displayName";
		class TransportMagazines{};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 5;
			};
			class _xx_ItemMavic3X
			{
				name = "ItemMavic3X";
				count = 2;
			};
			class _xx_B_UavTerminal
			{
				name = "B_UavTerminal";
				count = 2;
			};
		};
	};
	class Mavic_Box_GEN_Mavic3E_Items_F: Mavic_Box_NATO_Mavic3E_Items_F
	{
		editorPreview = "\A3\EditorPreviews_F_Exp\Data\CfgVehicles\Box_GEN_Equip_F.jpg";
		displayName = "$STR_Mavic_Box_GEN_Mavic3E_Items_F_displayName";
		hiddenSelectionsTextures[] = {"\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_gen_co.paa","\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_gen_ca.paa"};
	};
	class Mavic_Box_GEN_Mavic3T_Items_F: Mavic_Box_NATO_Mavic3T_Items_F
	{
		editorPreview = "\A3\EditorPreviews_F_Exp\Data\CfgVehicles\Box_GEN_Equip_F.jpg";
		displayName = "$STR_Mavic_Box_GEN_Mavic3T_Items_F_displayName";
		hiddenSelectionsTextures[] = {"\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_gen_co.paa","\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_gen_ca.paa"};
	};
	class Mavic_Box_CSAT_Mavic3E_Items_F: Mavic_Box_AIO_Mavic3A_Items_F
	{
		editorPreview = "\A3\EditorPreviews_F_Exp\Data\CfgVehicles\Box_CSAT_Equip_F.jpg";
		displayName = "$STR_Mavic_Box_CSAT_Mavic3E_Items_F_displayName";
		hiddenSelectionsTextures[] = {"\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_opfor_co.paa","\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_opfor_ca.paa"};
		class TransportMagazines{};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 5;
			};
			class _xx_ItemMavic3
			{
				name = "ItemMavic3";
				count = 2;
			};
			class _xx_O_UavTerminal
			{
				name = "O_UavTerminal";
				count = 2;
			};
		};
	};
	class Mavic_Box_CSAT_Mavic3T_Items_F: Mavic_Box_CSAT_Mavic3E_Items_F
	{
		displayName = "$STR_Mavic_Box_CSAT_Mavic3T_Items_F_displayName";
		class TransportMagazines{};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 5;
			};
			class _xx_ItemMavic3T
			{
				name = "ItemMavic3T";
				count = 2;
			};
			class _xx_O_UavTerminal
			{
				name = "O_UavTerminal";
				count = 2;
			};
		};
	};
	class Mavic_Box_AAF_Mavic3E_Items_F: Mavic_Box_AIO_Mavic3A_Items_F
	{
		editorPreview = "\A3\EditorPreviews_F_Exp\Data\CfgVehicles\Box_AAF_Equip_F.jpg";
		displayName = "$STR_Mavic_Box_AAF_Mavic3E_Items_F_displayName";
		hiddenSelectionsTextures[] = {"\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_indep_co.paa","\A3\Supplies_F_Exp\Ammoboxes\Data\equipment_box_indep_ca.paa"};
		class TransportMagazines{};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 5;
			};
			class _xx_ItemMavic3
			{
				name = "ItemMavic3";
				count = 2;
			};
			class _xx_I_UavTerminal
			{
				name = "I_UavTerminal";
				count = 2;
			};
		};
	};
	class Mavic_Box_AAF_Mavic3T_Items_F: Mavic_Box_AAF_Mavic3E_Items_F
	{
		displayName = "$STR_Mavic_Box_AAF_Mavic3T_Items_F_displayName";
		class TransportMagazines{};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 5;
			};
			class _xx_ItemMavic3T
			{
				name = "ItemMavic3T";
				count = 2;
			};
			class _xx_I_UavTerminal
			{
				name = "I_UavTerminal";
				count = 2;
			};
		};
	};
	class Mavic_Box_EAF_Mavic3E_Items_F: Mavic_Box_AIO_Mavic3A_Items_F
	{
		editorPreview = "\A3\EditorPreviews_F_Enoch\Data\CfgVehicles\Box_EAF_Equip_F.jpg";
		displayName = "$STR_Mavic_Box_EAF_Mavic3E_Items_F_displayName";
		hiddenSelectionsTextures[] = {"\a3\Supplies_F_Enoch\Ammoboxes\Data\equipment_box_EAF_co.paa","\a3\Supplies_F_Enoch\Ammoboxes\Data\equipment_box_EAF_ca.paa"};
		class TransportMagazines{};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 5;
			};
			class _xx_ItemMavic3
			{
				name = "ItemMavic3";
				count = 2;
			};
			class _xx_I_E_UavTerminal
			{
				name = "I_E_UavTerminal";
				count = 2;
			};
		};
	};
	class Mavic_Box_EAF_Mavic3T_Items_F: Mavic_Box_EAF_Mavic3E_Items_F
	{
		displayName = "$STR_Mavic_Box_EAF_Mavic3T_Items_F_displayName";
		class TransportMagazines{};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 5;
			};
			class _xx_ItemMavic3T
			{
				name = "ItemMavic3T";
				count = 2;
			};
			class _xx_I_E_UavTerminal
			{
				name = "I_E_UavTerminal";
				count = 2;
			};
		};

	};
	class Mavic_Box_IDAP_Mavic3E_Items_F: Mavic_Box_AIO_Mavic3A_Items_F
	{
		editorPreview = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Box_IDAP_Equip_F.jpg";
		displayName = "$STR_Mavic_Box_IDAP_Mavic3E_Items_F_displayName";
		hiddenSelectionsTextures[] = {"\a3\Supplies_F_Orange\Ammoboxes\Data\equipment_box_idap_co.paa","\a3\Supplies_F_Orange\Ammoboxes\Data\equipment_box_idap_ca.paa"};
		class TransportMagazines{};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 5;
			};
			class _xx_ItemMavic3
			{
				name = "ItemMavic3";
				count = 2;
			};
			class _xx_C_UavTerminal
			{
				name = "C_UavTerminal";
				count = 2;
			};
		};
	};
	class Mavic_Box_IDAP_Mavic3T_Items_F: Mavic_Box_IDAP_Mavic3E_Items_F
	{
		displayName = "$STR_Mavic_Box_IDAP_Mavic3T_Items_F_displayName";
		class TransportMagazines{};
		class TransportWeapons {};
		class TransportItems
		{
			class _xx_ACE_UAVBattery
			{
				name = "ACE_UAVBattery";
				count = 5;
			};
			class _xx_ItemMavic3T
			{
				name = "ItemMavic3T";
				count = 2;
			};
			class _xx_C_UavTerminal
			{
				name = "C_UavTerminal";
				count = 2;
			};
		};
	};
};
