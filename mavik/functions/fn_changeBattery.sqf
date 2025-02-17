/*
 * fn_changeBattery.sqf
 * Refuel UAV with Laserbatteries. This not used if ACE is loading.
 *
 * Arguments:
 * 0: UAV <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, player] call mavic_fnc_changeBattery;
 *
 * Public: Yes
 */
params ["_uav", "_player"];

_player removeItem "Laserbatteries";

if (local _uav) then {
    _uav setFuel 1;
} else {
    [_uav, 1] remoteExec ["setFuel", 2];
};