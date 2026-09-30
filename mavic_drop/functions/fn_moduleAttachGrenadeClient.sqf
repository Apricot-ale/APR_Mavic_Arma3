/*
 * fn_moduleAttachGrenadeClient.sqf
 * Client half of the Zeus attach module. Only the placing Zeus (mouseOver
 * matches the target drone) opens the grenade UI.
 */

params ["_mavic", "_module"];

if (!hasInterface) exitWith {};
if (isNull _mavic || {!alive _mavic}) exitWith {};
if (isNull findDisplay 312) exitWith {};

private _mouseOver = missionNamespace getVariable ["bis_fnc_curatorObjectPlaced_mouseOver", []];
if !(_mouseOver isEqualType [] && {count _mouseOver >= 2}) exitWith {};

_mouseOver params ["_mouseOverType", "_mouseOverUnit"];
if !(_mouseOverType isEqualTo "OBJECT" && {_mouseOverUnit isEqualTo _mavic}) exitWith {};

[_mavic] call mavic_drop_fnc_uiGrenadeSelectorZeus;

if (!isNull _module) then {
	[_module] remoteExecCall ["deleteVehicle", 2];
};
