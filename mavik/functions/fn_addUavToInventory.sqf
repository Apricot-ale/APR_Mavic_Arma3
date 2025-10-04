/*
 * fn_addUavToInventory.sqf
 * Check the remaining fuel and remove any attached grenades, then remove the UAV object and add it to your inventory as item.
 *
 * Arguments:
 * 0: UAV <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, player] call mavic_fnc_addUavToInventory;
 *
 * Public: No
 */
params ["_uav", "_player"];

_player action ["TakeBag", objNull];

private _uavType = typeOf _uav;
private _itemType = switch (true) do {
	case (_uavType isKindOf "Mavic3_drone_base_F"): { "Item_Mavic3" };
	case (_uavType isKindOf "Mavic3T_drone_base_F"): { "Item_Mavic3T" };
	case (_uavType isKindOf "Mavic3N_drone_base_F"): { "Item_Mavic3N" };
	case (_uavType isKindOf "Mavic3X_drone_base_F"): { "Item_Mavic3X" };
	default { "Item_Mavic3" };
};

private _fuel = round ((fuel _uav) * 100);
_player addMagazine [_itemType, _fuel];

private _attachedGrenades = _uav getVariable ["mavic_drop_var_grenadeList", []];
private _WeaponHolder = objNull;

if (_attachedGrenades isNotEqualTo []) then {
	{
		_Grenade = _x select 0;
		if (_player canAdd _Grenade) then {
			_player addMagazine _Grenade;
		} else {
			if (isNull _WeaponHolder) then {_WeaponHolder = createVehicle ["GroundWeaponHolder", _player modelToWorld [0,1,0.025], [], 0, "CAN_COLLIDE"];};
			_WeaponHolder addMagazineCargoGlobal [_Grenade, 1];
		};
	} forEach _attachedGrenades;
	{deleteVehicle _x;} forEach attachedObjects _uav;
};

_uav setVariable ["mavic_drop_var_grenadeList", [], true];
deleteVehicleCrew _uav;
deleteVehicle _uav;
