#include "\a3\ui_f\hpp\defineDIKCodes.inc"

[
	"mavic_setting_showInterface",
	"CHECKBOX",
	["STR_mavic_setting_showInterface_displayName","STR_mavic_setting_showInterface_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Interface"],
	true,
	0,
	{}
] call CBA_fnc_addSetting;

[
	"mavic_setting_vanillaInterface",
	"CHECKBOX",
	["STR_mavic_setting_vanillaInterface_displayName","STR_mavic_setting_vanillaInterface_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Interface"],
	false,
	0,
	{}
] call CBA_fnc_addSetting;

[
	"mavic_setting_hudCrosshair",
	"LIST",
	["STR_mavic_setting_hudCrosshair_displayName","STR_mavic_setting_hudCrosshair_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Interface"],
	[[0, 1, 2, 3], ["STR_mavic_setting_hudCrosshair_0", "STR_mavic_setting_hudCrosshair_1", "STR_mavic_setting_hudCrosshair_2", "STR_mavic_setting_hudCrosshair_3"], 1],
	0,
	{ publicVariable "mavic_setting_hudCrosshair" }
] call CBA_fnc_addSetting;

[
	"mavic_setting_hudVSpeedUnit",
	"LIST",
	["STR_mavic_setting_hudVSpeedUnit_displayName","STR_mavic_setting_hudVSpeedUnit_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Interface"],
	[[0, 1, 2, 3, 4], ["STR_Mavic_HUD_Speed", "STR_Mavic_HUD_Speed_KMH", "STR_Mavic_HUD_Speed_MPH", "STR_Mavic_HUD_Speed_KPH", "STR_Mavic_HUD_Speed_FPS"], 0],
	0,
	{ publicVariable "mavic_setting_hudVSpeedUnit" }
] call CBA_fnc_addSetting;

[
	"mavic_setting_hudHSpeedUnit",
	"LIST",
	["STR_mavic_setting_hudHSpeedUnit_displayName","STR_mavic_setting_hudHSpeedUnit_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Interface"],
	[[0, 1, 2, 3, 4], ["STR_Mavic_HUD_Speed", "STR_Mavic_HUD_Speed_KMH", "STR_Mavic_HUD_Speed_MPH", "STR_Mavic_HUD_Speed_KPH", "STR_Mavic_HUD_Speed_FPS"], 0],
	0,
	{ publicVariable "mavic_setting_hudHSpeedUnit" }
] call CBA_fnc_addSetting;

[
	"mavic_setting_hudHeading",
	"CHECKBOX",
	["STR_mavic_setting_hudHeading_displayName","STR_mavic_setting_hudHeading_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Interface"],
	false,
	0,
	{ publicVariable "mavic_setting_hudHeading" }
] call CBA_fnc_addSetting;


[
	"mavic_setting_hudHeightUnit",
	"LIST",
	["STR_mavic_setting_hudHeightUnit_displayName","STR_mavic_setting_hudHeightUnit_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Interface"],
	[[0, 1], ["STR_Mavic_HUD_Meters", "STR_Mavic_HUD_Feet"], 0],
	0,
	{ publicVariable "mavic_setting_hudHeightUnit" }
] call CBA_fnc_addSetting;

[
	"mavic_setting_hudDistanceUnit",
	"LIST",
	["STR_mavic_setting_hudDistanceUnit_displayName","STR_mavic_setting_hudDistanceUnit_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Interface"],
	[[0, 1, 2, 3], ["STR_Mavic_HUD_Meters", "STR_Mavic_HUD_Feet", "STR_Mavic_HUD_Yard", "STR_Mavic_HUD_Mile"], 0],
	0,
	{ publicVariable "mavic_setting_hudDistanceUnit" }
] call CBA_fnc_addSetting;

[
	"mavic_setting_enableConnectionDistance",
	"CHECKBOX",
	["STR_mavic_setting_enableConnectionDistance_displayName","STR_mavic_setting_enableConnectionDistance_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Options"],
	true,
	1,
	{ publicVariable "mavic_setting_enableConnectionDistance" },
	true
] call CBA_fnc_addSetting;

[
	"mavic_setting_maxConnectionDistance",
	"SLIDER",
	["STR_mavic_setting_maxConnectionDistance_displayName","STR_mavic_setting_maxConnectionDistance_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Options"],
	[1000,24000,6000,0],
	1,
	{ publicVariable "mavic_setting_maxConnectionDistance" },
	true
] call CBA_fnc_addSetting;

[
	"mavic_setting_landingProtection",
	"CHECKBOX",
	["STR_mavic_setting_landingProtection_displayName","STR_mavic_setting_landingProtection_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Options"],
	true,
	1,
	{ publicVariable "mavic_setting_landingProtection" },
	true
] call CBA_fnc_addSetting;

[
	"mavic_setting_lightAllowed",
	"CHECKBOX",
	["STR_mavic_setting_lightAllowed_displayName","STR_mavic_setting_lightAllowed_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Options"],
	false,
	0,
	{ publicVariable "mavic_setting_lightAllowed" },
	true
] call CBA_fnc_addSetting;

[
	"mavic_drop_setting_dropAllowed",
	"CHECKBOX",
	["STR_mavic_setting_dropAllowed_displayName","STR_mavic_setting_dropAllowed_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Grenades"],
	true,
	1,
	{ publicVariable "mavic_drop_setting_dropAllowed" }
] call CBA_fnc_addSetting;

[
	"mavic_drop_setting_windCoef",
	"SLIDER",
	["STR_mavic_setting_windCoef_displayName","STR_mavic_setting_windCoef_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Grenades"],
	[0, 0.4, 0.11, 2],
	1,
	{ publicVariable "mavic_drop_setting_windCoef" },
	true
] call CBA_fnc_addSetting;

[
	"mavic_drop_setting_allowedGrenades",
	"EDITBOX",
	["STR_mavic_setting_allowedGrenades_displayName", "STR_mavic_setting_allowedGrenades_description"],
	["STR_mavic_setting_MOD", "STR_mavic_setting_Category_Grenades"],
	"['Mavic_M67', 'Mavic_V40', 'Mavic_F1', 'Mavic_VOG25', 'Mavic_TBG', 'Mavic_M433']",
	1,
	{ publicVariable "mavic_drop_setting_allowedGrenades" }
] call CBA_fnc_addSetting;

[
	"STR_mavic_setting_MOD",
	"mavic_key_dropKey",
	["STR_Mavic_Key_dropKey_displayName","STR_Mavic_Key_dropKey_description"],
	{[player] call Mavic_fnc_checkUAVGrenadeDrop},
	{},
	[DIK_G, [false, false, false]]
] call CBA_fnc_addKeybind;
