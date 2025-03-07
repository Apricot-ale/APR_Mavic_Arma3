#include "\a3\ui_f\hpp\defineDIKCodes.inc"

[
	"Mavic_Drop_Setting_dropAllowed",
	"CHECKBOX",
	["STR_Mavic_Drop_Setting_dropAllowed_displayName","STR_Mavic_Drop_Setting_dropAllowed_description"],
	["STR_mavic_setting_MOD", "STR_Mavic_Drop_Setting_Category_Grenades"],
	true,
	1,
	{ publicVariable "Mavic_Drop_Setting_dropAllowed" }
] call CBA_fnc_addSetting;

[
	"Mavic_Drop_Setting_windCoef",
	"SLIDER",
	["STR_Mavic_Drop_Setting_windCoef_displayName","STR_Mavic_Drop_Setting_windCoef_description"],
	["STR_mavic_setting_MOD", "STR_Mavic_Drop_Setting_Category_Grenades"],
	[0, 0.4, 0.11, 2],
	1,
	{ publicVariable "Mavic_Drop_Setting_windCoef" },
	true
] call CBA_fnc_addSetting;

[
	"Mavic_Drop_Setting_allowedGrenades",
	"EDITBOX",
	["STR_Mavic_Drop_Setting_allowedGrenades_displayName", "STR_Mavic_Drop_Setting_allowedGrenades_description"],
	["STR_mavic_setting_MOD", "STR_Mavic_Drop_Setting_Category_Grenades"],
	"['Mavic_M67', 'Mavic_V40', 'Mavic_F1', 'Mavic_VOG25', 'Mavic_TBG', 'Mavic_M433']",
	1,
	{ publicVariable "Mavic_Drop_Setting_allowedGrenades" }
] call CBA_fnc_addSetting;
