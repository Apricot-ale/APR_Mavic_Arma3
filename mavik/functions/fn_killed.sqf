/*
 * fn_killed.sqf
 * Run mavic terminate scripts.
 *
 * Arguments:
 * 0: UAV <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call mavic_fnc_killed;
 *
 * Public: No
 */
params ["_uav"];

private _lightStatus = _uav getVariable ["mavic_var_lightStatus", [objNull, false]];
private _lightObj = _lightStatus select 0;
if !(isNull _lightObj) then {deleteVehicle _lightObj;};

{_x setDamage 1;} forEach (crew _uav);

[_uav] remoteExec ["mavic_fnc_wreck", 2];
