params ["_uav"];

private _itemType = ["Item_Mavic3", "Item_Mavic3T"] select ((typeOf _uav) isKindOf "Mavic3T_drone_base_F");

alive _uav && player canAdd _itemType && cameraOn == player && {((speed _uav) < 1) && {!(isEngineOn _uav)}}