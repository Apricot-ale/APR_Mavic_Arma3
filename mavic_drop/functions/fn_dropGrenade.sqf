//
// fn_dropGrenade.sqf
//
// mavic_drop_fnc_dropGrenade
//
// Spawns projectile(ammo) from magazine on drone and drop it.
//
params [["_caller", player], ["_isForce", false]];
private _drone = objNull;
if (_isForce) then {_drone = _caller} else {_drone = getConnectedUAV _caller;};

private _attachedGrenades = _drone getVariable ["mavic_drop_var_grenadeList", []];
if (_attachedGrenades isEqualTo []) exitWith {false};
reverse _attachedGrenades;

_dropGrenade = _attachedGrenades select 0;
_grenade = _dropGrenade select 0;
_grenadeAmmo = getText(configFile >> "CfgMagazines" >> _grenade >> "ammo");
_holder = _dropGrenade select 1;

deleteVehicle _holder;
_attachedGrenades deleteAt 0;
_drone setVariable ["mavic_drop_var_grenadeList", _attachedGrenades, true];

_windEffectMultiplier = (missionNamespace getVariable ["mavic_drop_setting_windCoef", 0.1/0.9]);
_grenadeMass = (getNumber(configFile >> "CfgAmmo" >> _grenadeAmmo >> "Mavic_weight") / 1000) max 0.200;
private _wind = wind;
_scaledWind = [
	(_wind select 0) * _windEffectMultiplier / _grenadeMass,
	(_wind select 1) * _windEffectMultiplier / _grenadeMass
];
_droneVelocity = velocity _drone;

_projectile = _grenadeAmmo createVehicle [0,0,1000];
[_projectile, _drone] remoteExecCall ["disableCollisionWith", 0, _drone];
_projectile setPos (_drone modelToWorld [0, 0, -0.3]);
_projectile setVectorDirandUp [[0,0,-1],[0.1,0.1,1]];
_projectile setVelocity [
	(_droneVelocity select 0) + (_scaledWind select 0),
	(_droneVelocity select 1) + (_scaledWind select 1),
	-3
];

true
