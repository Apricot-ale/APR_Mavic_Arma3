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

if (_attachedGrenades isNotEqualTo []) then {
	{
		_Grenades = _x select 0;
		_player addMagazine _Grenades;
	} forEach _attachedGrenades;
	{deleteVehicle _x;} forEach attachedObjects _uav;
};

_uav setVariable ["mavic_drop_var_grenadeList", [], true];
deleteVehicle _uav;
_player action ["TakeBag", objNull];
