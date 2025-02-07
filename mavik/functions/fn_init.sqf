params ["_uav"];

[_uav] call mavic_drop_fnc_makeGrenadeDrone;
[_uav] call mavic_fnc_takeoffProtection;
[_uav] call mavic_fnc_createLight;

_uav addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	private _lightStatus = _unit getVariable ["mavic_var_lightStatus", [objNull, false]];
	private _lightObj = _lightStatus #0;
	if !(isNull _lightObj) then {deleteVehicle _lightObj;};
	
	{_x setDamage 1} forEach (crew _unit);
}];