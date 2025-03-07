/*
 * fn_killed.sqf
 * Run mavic terminate scripts.
 *
 * Arguments:
 * 0: UAV <OBJECT>
 *
 * Return Value:
 * Object (_dummy wreck object)
 *
 * Example:
 * [this] call mavic_fnc_killed;
 *
 * Public: No
 */
params ["_uav"];

if !(isServer) exitWith {};

private _lightStatus = _uav getVariable ["mavic_var_lightStatus", [objNull, false]];
private _lightObj = _lightStatus #0;
if !(isNull _lightObj) then {deleteVehicle _lightObj;};

{_x setDamage 1;} forEach (crew _uav);

_dummy = "Mavic3_drone_wreck_F" createVehicle [0,0,0];
_dummy attachTo [_uav,[0,0,0]];
[_dummy, _uav] remoteExecCall ["disableCollisionWith", 0, _uav];
deleteVehicle _uav;

_dummy;