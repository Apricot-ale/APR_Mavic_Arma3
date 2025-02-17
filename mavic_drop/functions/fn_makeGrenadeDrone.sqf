/*
 * fn_makeGrenadeDrone.sqf
 * Adds an action to attach a grenade to the drone.
 *
 * Arguments:
 * 0: UAV <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call mavic_drop_fnc_makeGrenadeDrone;
 *
 * Public: No
 */
params ["_uav"];
waitUntil {!isNull player && player == player};

_dropId = _uav addAction [
	["<t color='#FF0000'>", localize "STR_Mavic_UserAction_Drop_Attach", "</t>"] joinString "",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_this call mavic_drop_fnc_uiGrenadeSelector;
	},
	nil,
	10,
	true,
	true,
	"",
	"
		mavic_drop_setting_dropAllowed
		and {player distance _target < 3}
		and {(cameraOn == player)||(cameraOn == _target)}
		and {(speed _target) < 1}
		and {!(isEngineOn _target)}
		and {alive _target}
		and {count (_target getVariable [""mavic_drop_var_grenadeList"", []]) < 2}
	",
	5
];

_detachId = _uav addAction [
	["<t color='#00FF00'>", localize "STR_Mavic_UserAction_Drop_Detach", "</t>"] joinString "",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_this call mavic_drop_fnc_detach_uiGrenadeSelector;
	},
	nil,
	10,
	true,
	true,
	"",
	"
		mavic_drop_setting_dropAllowed
		and {player distance _target < 3}
		and {(cameraOn == player)||(cameraOn == _target)}
		and {(speed _target) < 1}
		and {!(isEngineOn _target)}
		and {alive _target}
		and {count (_target getVariable [""mavic_drop_var_grenadeList"", []]) > 0}
	",
	5
];

/*
_uav addEventHandler ["Disassembled", {
	params ["_entity", "_primaryBag", "_secondaryBag"];
	player removeAction _dropId;
	player removeAction _detachId;
}];
*/

_uav addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	//removeAllActions _unit;
	_unit removeAction _dropId;
	_unit removeAction _detachId;
	private _iterationGreandes = _unit getVariable ["mavic_drop_var_grenadeList", []];
	private _count = count _iterationGreandes;
	for "_i" from 0 to _count - 1 do {
		[_unit, true] call mavic_drop_fnc_dropGrenade;
	};
}];
