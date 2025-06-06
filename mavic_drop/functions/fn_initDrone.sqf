/*
 * fn_initDrone.sqf
 * Spawns a drone equipped with a grenade.
 *
 * Arguments:
 * 0: UAV <OBJECT>
 * 1: Magazine <STRINGS>
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

_grenadeAmmo = getText(configFile >> "CfgMagazines" >> _grenade >> "ammo");
_grenadeLive = getNumber(configFile >> "CfgAmmo" >> _grenadeAmmo >> "timeToLive");

_attachedGrenades = _uav getVariable ["mavic_drop_var_grenadeList", []];

_selectionMagazine = [0,0,0];
_selectionAmmo = [0,0,0];

if ((typeOf _uav) in ["Mavic_3_OPF", "Mavic_3_BLU", "Mavic_3_IND", "Mavic_3_CIV", "Mavic_3T_OPF", "Mavic_3T_BLU", "Mavic_3T_IND", "Mavic_3T_CIV"]) then {
	_selectionMagazine = [[-0.14,0,0.55], [-0.07,0,0.55]] select (count _attachedGrenades > 0);
	_selectionAmmo = [[-0.02, 0, -0.04], [0.02, 0, -0.04]] select (count _attachedGrenades > 0);
};

_holder = objNull;
if (_grenadeLive isEqualTo 1e+10) then {
	_holder = _grenadeAmmo createVehicle [0,0,1000];
	_holder attachTo [_uav, _selectionAmmo];
	[_holder, _uav] remoteExecCall ["disableCollisionWith", 0, _uav];
	_holder setVectorDirandUp [[0,0,-1],[0.1,0.1,1]];
} else {
	_holder = "GroundWeaponHolder_Scripted" createVehicle [0,0,1000];
	_holder addMagazineCargoGlobal [_grenade, 1];
	_holder lockInventory true;
	_holder attachTo [_uav, _selectionMagazine];
	[_holder, _uav] remoteExecCall ["disableCollisionWith", 0, _uav];
	
	[_holder, _uav] spawn {
		params ["_target", "_vehicle"];
		waitUntil {sleep 1; !alive _target || ((magazineCargo _target) isEqualTo [])};
		if (alive _target) exitWith {
			_objAttached = _vehicle getVariable ["mavic_drop_var_grenadeList", []];
			_objAttached deleteAt (_objAttached findIf {_target in _x});
			_vehicle setVariable ["mavic_drop_var_grenadeList", _objAttached, true];
			deleteVehicle _target;
		};
	};
};

_attachedGrenades pushBack [_grenade, _holder];
_uav setVariable ["mavic_drop_var_grenadeList", _attachedGrenades, true];
