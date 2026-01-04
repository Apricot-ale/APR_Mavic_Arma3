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

/*
[_uav] call mavic_fnc_stealth;
[_uav] call mavic_fnc_addActions;


_uav addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	private _lightStatus = _unit getVariable ["mavic_var_lightStatus", [objNull, false]];
	private _lightObj = _lightStatus #0;
	if !(isNull _lightObj) then {deleteVehicle _lightObj;};
	
	{_x setDamage 1} forEach (crew _unit);
}];

*/
