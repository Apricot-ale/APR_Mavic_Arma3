/*
 * fn_dropGrenade.sqf
 * Generates and drops projectiles (ammunition) from the drone's attached magazines.
 *
 * Arguments:
 * 0: _caller (Player or UAV if "isForced") <OBJECT>
 * 1: isForced <BOOLEAN> (Optional, force _caller used as UAV)
 *
 * Return Value:
 * Boolean (drop or not)
 *
 * Example:
 * [this] call mavic_drop_fnc_dropGrenade;
 *
 * Public: No
 */
params [["_caller", player], ["_isForce", false]];
private _uav = objNull;
if (_isForce) then {_uav = _caller} else {_uav = getConnectedUAV _caller;};

private _attachedGrenades = _uav getVariable ["mavic_drop_var_grenadeList", []];
if (_attachedGrenades isEqualTo []) exitWith {false};
reverse _attachedGrenades;

_dropGrenade = _attachedGrenades select 0;
_grenade = _dropGrenade select 0;
_grenadeAmmo = getText(configFile >> "CfgMagazines" >> _grenade >> "ammo");
_holder = _dropGrenade select 1;

deleteVehicle _holder;
_attachedGrenades deleteAt 0;
_uav setVariable ["mavic_drop_var_grenadeList", _attachedGrenades, true];

_windEffectMultiplier = (missionNamespace getVariable ["mavic_drop_setting_windCoef", 0.11]);
_grenadeMass = (getNumber(configFile >> "CfgAmmo" >> _grenadeAmmo >> "Mavic_weight") / 1000) max 0.200;
private _wind = wind;
_scaledWind = [
	(_wind select 0) * _windEffectMultiplier / _grenadeMass,
	(_wind select 1) * _windEffectMultiplier / _grenadeMass
];
_uavVelocity = velocity _uav;

_projectile = _grenadeAmmo createVehicle [0,0,1000];
[_projectile, _uav] remoteExecCall ["disableCollisionWith", 0, _uav];
_projectile setPos (_uav modelToWorld [0, 0, -0.3]);
_projectile setVectorDirandUp [[0,0,-1],[0.1,0.1,1]];
_projectile setVelocity [
	(_uavVelocity select 0) + (_scaledWind select 0),
	(_uavVelocity select 1) + (_scaledWind select 1),
	-3
];

true
