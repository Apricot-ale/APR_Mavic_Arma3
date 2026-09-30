/*
 * fn_getControlledMavic.sqf
 * Resolve the Mavic the local player is currently flying —
 * via UAV terminal link OR Zeus remote control (no terminal required).
 *
 * Arguments:
 * 0: Player <OBJECT> (optional, default player)
 *
 * Return Value:
 * UAV <OBJECT> or objNull
 *
 * Example:
 * private _uav = [player] call mavic_fnc_getControlledMavic;
 *
 * Public: No
 */
params [["_player", player]];

if (isNull _player) exitWith { objNull };

// 1) Normal UAV terminal connection
private _linked = getConnectedUAV _player;
if (!isNull _linked && {_linked isKindOf "Mavic_drone_base_F"}) exitWith { _linked };

// 2) Camera is on a Mavic (Zeus RC FPV / external, or terminal view)
private _cam = cameraOn;
if (_cam isKindOf "Mavic_drone_base_F") exitWith { _cam };

// 3) Zeus remote-control unit (AI pilot crew or the vehicle itself)
private _remote = missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", objNull];
if (isNull _remote) exitWith { objNull };

if (_remote isKindOf "Mavic_drone_base_F") exitWith { _remote };

private _veh = objectParent _remote;
if (_veh isKindOf "Mavic_drone_base_F") exitWith { _veh };

_veh = vehicle _remote;
if (_veh isKindOf "Mavic_drone_base_F") exitWith { _veh };

objNull
