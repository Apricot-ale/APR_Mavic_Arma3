/*
 * fn_moduleAttachGrenade.sqf
 * Zeus module function to attach grenades to Mavic drones
 * Place this module on a Mavic drone to attach a grenade
 *
 * Author: tfl_icy
 * 
 * Arguments:
 * 0: Module <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_module"];

if (!(local _module)) exitWith {};

// Resolve target drone in priority order:
// 1. Zeus mouse-over object (if valid)
// 2. attachedTo _module
// 3. first object in synchronizedObjects _module

private _mavic = objNull;

// Priority 1: Check mouse-over
private _mouseOver = missionNamespace getVariable ["bis_fnc_curatorObjectPlaced_mouseOver", []];
if (count _mouseOver >= 2) then {
	_mouseOver params ["_mouseOverType", "_mouseOverUnit"];
	if (_mouseOverType == "OBJECT" && !isNull _mouseOverUnit && {_mouseOverUnit isKindOf "Mavic_drone_base_F"}) then {
		_mavic = _mouseOverUnit;
	};
};

// Priority 2: Check attachedTo
if (isNull _mavic) then {
	private _attached = attachedTo _module;
	if (!isNull _attached && {_attached isKindOf "Mavic_drone_base_F"}) then {
		_mavic = _attached;
	};
};

// Priority 3: Check synchronized objects
if (isNull _mavic) then {
	private _synced = synchronizedObjects _module;
	{
		if (!isNull _x && {_x isKindOf "Mavic_drone_base_F"}) exitWith {
			_mavic = _x;
		};
	} forEach _synced;
};

// Validate target
private _isMavic = (!isNull _mavic) && {alive _mavic} && {_mavic isKindOf "Mavic_drone_base_F"};

if (!_isMavic) exitWith {
	["ERROR!", "No Mavic drone found. Place this module on a Mavic drone."] call BIS_fnc_curatorHint;
	deleteVehicle _module;
};

// Open the UI selector for grenade selection
// This shows the same UI as the manual attachment, but without requiring player inventory
[_mavic] call mavic_drop_fnc_uiGrenadeSelectorZeus;

// Delete the module
deleteVehicle _module;

