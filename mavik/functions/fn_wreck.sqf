/*
 * fn_wreck.sqf
 * Create Mavic wreck.
 *
 * Arguments:
 * 0: UAV <OBJECT>
 *
 * Return Value:
 * Object (_dummy wreck object)
 *
 * Example:
 * [this] call mavic_fnc_wreck;
 *
 * Public: No
 */
params ["_uav"];

_dummy = createVehicle ["Mavic3_drone_wreck_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_dummy disableCollisionWith _uav;
_dummy attachTo [_uav,[0,0,0]];
deleteVehicle _uav;
detach _dummy;
_dummy setPhysicsCollisionFlag true;
_dummy setDamage 1;

_dummy;