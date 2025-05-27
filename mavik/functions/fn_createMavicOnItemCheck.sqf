/*
 * fn_createMavicOnItemCheck.sqf
 * Create mavic on GroundWeaponHolder (Ground Inventory).
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: GroundWeaponHolder <OBJECT>
 * 2: UAV Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, Box_Dummy, "ItemMavic3T"] call mavic_fnc_createMavicOnItemCheck;
 *
 * Public: No
 */
params ["_unit", "_container", "_item"];

if ((typeOf _container) != "GroundWeaponHolder") exitWith {};
if !(_item in ["ItemMavic", "ItemMavic3", "ItemMavic3N", "ItemMavic3T", "ItemMavic3X", "Item_Mavic", "Item_Mavic3", "Item_Mavic3T", "Item_Mavic3N", "Item_Mavic3X"]) exitWith {};

private _fuelReal = 100;
private _magazineIndex = (magazineCargo _container) find _item;
if (_magazineIndex != -1) then {
	private _magazineSelected = (magazinesAmmo _container) select _magazineIndex;
	_fuelReal = (_magazineSelected select 1) / 100;
};
_container addItemCargo [_item, -1];

private _uavType = switch (_item) do {
	case "ItemMavic3X": { "Mavic_3X" };
	case "ItemMavic3N": { "Mavic_3N" };
	case "ItemMavic3T": { "Mavic_3T" };
	case "ItemMavic3": { "Mavic_3" };
	default { "Mavic_3" };
};

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
