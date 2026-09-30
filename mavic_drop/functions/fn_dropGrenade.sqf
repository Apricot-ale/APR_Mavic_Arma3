/*
 * fn_dropGrenade.sqf
 * Drops the next attached munition from the drone.
 * Runs on the server (CBA serverEvent from clients).
 *
 * Arguments:
 * 0: Caller (player) OR UAV when _isForce is true <OBJECT>
 * 1: isForce <BOOLEAN> — if true, arg 0 is the UAV
 *
 * Return Value:
 * Boolean
 *
 * Example:
 * [player] call mavic_drop_fnc_dropGrenade;
 * [uav, true] call mavic_drop_fnc_dropGrenade;
 *
 * Public: No
 */
params [["_caller", objNull], ["_isForce", false]];

if (!isServer) exitWith {
	["mavic_drop_server_dropGrenade", _this] call CBA_fnc_serverEvent;
	true
};

private _uav = if (_isForce) then { _caller } else { getConnectedUAV _caller };
if (isNull _uav) exitWith { false };

private _attachedGrenades = +(_uav getVariable ["mavic_drop_var_grenadeList", []]);
if (_attachedGrenades isEqualTo []) exitWith { false };

// LIFO — drop the last attached munition
private _dropGrenade = _attachedGrenades deleteAt ((count _attachedGrenades) - 1);
_dropGrenade params ["_grenade", ["_holder", objNull]];

_uav setVariable ["mavic_drop_var_grenadeList", _attachedGrenades, true];

private _grenadeAmmo = getText (configFile >> "CfgMagazines" >> _grenade >> "ammo");
if (_grenadeAmmo isEqualTo "") exitWith {
	if (!isNull _holder) then { deleteVehicle _holder };
	false
};

private _windEffectMultiplier = missionNamespace getVariable ["mavic_drop_setting_windCoef", 0.11];
private _grenadeMass = (getNumber (configFile >> "CfgAmmo" >> _grenadeAmmo >> "Mavic_weight") / 1000) max 0.2;
private _wind = wind;
private _scaledWind = [
	(_wind select 0) * _windEffectMultiplier / _grenadeMass,
	(_wind select 1) * _windEffectMultiplier / _grenadeMass
];
private _uavVelocity = velocity _uav;
private _dropPos = _uav modelToWorldWorld [0, 0, -0.2];
private _velocity = [
	(_uavVelocity select 0) + (_scaledWind select 0),
	(_uavVelocity select 1) + (_scaledWind select 1),
	(_uavVelocity select 2) - 3
];

// Impact munitions: holder IS the ammo — detach and release it (don't delete/recreate)
if (!isNull _holder && {typeOf _holder isEqualTo _grenadeAmmo}) then {
	detach _holder;
	_holder allowDamage true;
	_holder enableSimulationGlobal true;
	_holder setPosASL _dropPos;
	_holder setVectorDirAndUp [[0, 0, -1], [0.1, 0.1, 1]];
	_holder setVelocity _velocity;
} else {
	if (!isNull _holder) then {
		detach _holder;
		deleteVehicle _holder;
	};

	private _projectile = _grenadeAmmo createVehicle [
		(_dropPos select 0),
		(_dropPos select 1),
		(_dropPos select 2) + 500
	];
	[_projectile, _uav] remoteExecCall ["disableCollisionWith", 0, _uav];
	_projectile setPosASL _dropPos;
	_projectile setVectorDirAndUp [[0, 0, -1], [0.1, 0.1, 1]];
	_projectile setVelocity _velocity;
};

true
