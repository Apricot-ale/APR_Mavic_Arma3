params ["_uav", "_player"];

private _itemType = ["Item_Mavic3", "Item_Mavic3T"] select ((typeOf _uav) isKindOf "Mavic3T_drone_base_F");

private _fuel = fuel _uav;
_fuel = round (_fuel * 100);
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
