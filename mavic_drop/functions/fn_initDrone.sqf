/*
 * fn_initDrone.sqf
 * Spawns a grenade holder and attaches it under the drone.
 * Runs on the server (CBA serverEvent from clients).
 *
 * Arguments:
 * 0: UAV <OBJECT>
 * 1: Magazine <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "Mavic_M433"] call mavic_drop_fnc_initDrone;
 *
 * Public: No
 */
params ["_uav", "_grenade"];
if (is3DEN) exitWith {};
if (isNull _uav || {_grenade isEqualTo ""}) exitWith {};

if (!isServer) exitWith {
	["mavic_drop_server_initDrone", _this] call CBA_fnc_serverEvent;
};

private _grenadeAmmo = getText (configFile >> "CfgMagazines" >> _grenade >> "ammo");
if (_grenadeAmmo isEqualTo "") exitWith {};

private _grenadeLive = getNumber (configFile >> "CfgAmmo" >> _grenadeAmmo >> "timeToLive");
private _attachedGrenades = +(_uav getVariable ["mavic_drop_var_grenadeList", []]);
private _slot = (count _attachedGrenades) min 1;

// Original belly offsets; slight extra Z clearance so munitions aren't inside the airframe.
// Applied to all Mavic variants (3 / 3T / 3N / 3X).
private _selectionAmmo = [[-0.02, 0, -0.06], [0.02, 0, -0.06]] select _slot;
private _selectionMagazine = [[-0.14, 0, 0.55], [-0.07, 0, 0.55]] select _slot;

private _holder = objNull;
if (_grenadeLive isEqualTo 1e+10) then {
	_holder = _grenadeAmmo createVehicle [0, 0, 1000];
	_holder allowDamage false;
	_holder enableSimulationGlobal false;
	[_holder, _uav] remoteExecCall ["disableCollisionWith", 0, _uav];
	_holder attachTo [_uav, _selectionAmmo];
	_holder setVectorDirAndUp [[0, 0, -1], [0.1, 0.1, 1]];
} else {
	_holder = "GroundWeaponHolder_Scripted" createVehicle [0, 0, 1000];
	_holder addMagazineCargoGlobal [_grenade, 1];
	_holder lockInventory true;
	[_holder, _uav] remoteExecCall ["disableCollisionWith", 0, _uav];
	_holder attachTo [_uav, _selectionMagazine];

	[_holder, _uav] spawn {
		params ["_target", "_vehicle"];
		waitUntil { sleep 1; !alive _target || {magazineCargo _target isEqualTo []} };
		if (alive _target) exitWith {
			private _objAttached = +(_vehicle getVariable ["mavic_drop_var_grenadeList", []]);
			_objAttached deleteAt (_objAttached findIf {_target in _x});
			_vehicle setVariable ["mavic_drop_var_grenadeList", _objAttached, true];
			deleteVehicle _target;
		};
	};
};

_attachedGrenades pushBack [_grenade, _holder];
_uav setVariable ["mavic_drop_var_grenadeList", _attachedGrenades, true];
