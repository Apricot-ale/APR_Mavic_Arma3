params ["_unit", "_container", "_item"];

if !(_item in ["ItemMavic3T", "ItemMavic3", "ItemMavic", "Item_Mavic3T", "Item_Mavic3", "Item_Mavic"]) exitWith {};
if ((typeOf _container) != "GroundWeaponHolder") exitWith {};

private _fuelReal = 100;
private _uavType = ["Mavic_3", "Mavic_3T"] select (_item == "ItemMavic3T");

if (_item in ["Item_Mavic3T", "Item_Mavic3", "Item_Mavic"]) then {
	private _magazines = magazinesAmmo _container;
	private _containerCargo = magazineCargo _container;
	private _magazineIndex = _containerCargo find _item;
	if (_magazineIndex != -1) then {
		private _magazineSelected = _magazines select _magazineIndex;
		_fuelReal = _magazineSelected select 1;
	};
	_fuelReal = _fuelReal / 100;
	_uavType = ["Mavic_3", "Mavic_3T"] select (_item == "Item_Mavic3T");
};

_container addItemCargo [_item, -1];

private _uavClass = switch (side _unit) do {
	case EAST: { _uavType + "_OPF" };
	case WEST: { _uavType + "_BLU" };
	case RESISTANCE: { _uavType + "_IND" };
	case CIVILIAN: { _uavType + "_CIV" };
	default { _uavType + "_CIV" };
};

private _Mavic = createVehicle [_uavClass, getPosATL _container, [], 0, "CAN_COLLIDE"];
createVehicleCrew _Mavic;
_Mavic setFuel _fuelReal;
