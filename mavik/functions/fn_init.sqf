/*
 * fn_init.sqf
 * Initialize Mavic and call the required functions.
 *
 * Arguments:
 * 0: UAV <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call mavic_fnc_init;
 *
 * Public: No
 */
params ["_uav"];

[_uav] call mavic_drop_fnc_makeGrenadeDrone;
[_uav] call mavic_fnc_landingProtection;
[_uav] call mavic_fnc_createLight;
