params ["_uav", "_player"];

_player removeItem "Laserbatteries";

if (local _uav) then {
    _uav setFuel 1;
} else {
    [_uav, 1] remoteExec ["setFuel", 2];
};