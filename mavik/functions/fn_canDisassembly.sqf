/*
 * fn_canDisassembly.sqf
 * Check the UAV is recoverable by that player.
 *
 * Arguments:
 * 0: UAV <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Boolean (can or not)
 *
 * Example:
 * [this, player] call mavic_fnc_canDisassembly;
 *
 * Public: No
 */
params ["_uav", "_player"];

if !(alive _uav) exitWith {false};
if !(alive _player) exitWith {false};
if !(_player canAdd "Item_Mavic") exitWith {false};
if (cameraOn != _player) exitWith {false};
if (isEngineOn _uav) exitWith {false};
if (abs (speed _uav) > 3) exitWith {false};

true;