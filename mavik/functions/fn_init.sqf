params ["_drone"];

[_drone] spawn mavic_drop_fnc_makeGrenadeDrone;
[_drone] spawn mavic_fnc_landingProtection;
[_drone] call mavic_fnc_createLight;

_drone addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	private _lightStatus = _unit getVariable ["mavic_var_lightStatus", [objNull, false]];
	private _lightObj = _lightStatus #0;
	if !(isNull _lightObj) then {deleteVehicle _lightObj;};
}];