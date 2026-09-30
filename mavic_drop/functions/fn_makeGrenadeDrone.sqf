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

// Drop payload on death from the server (holders are server-local)
if (isServer && {!(_uav getVariable ["mavic_drop_eh_killed", false])}) then {
	_uav setVariable ["mavic_drop_eh_killed", true];
	_uav addEventHandler ["Killed", {
		params ["_unit"];
		private _grenades = _unit getVariable ["mavic_drop_var_grenadeList", []];
		private _count = count _grenades;
		for "_i" from 0 to (_count - 1) do {
			[_unit, true] call mavic_drop_fnc_dropGrenade;
		};
	}];
};

// addAction is client-local; never wait on player on dedicated (player is always null)
if (!hasInterface) exitWith {};
if (_uav getVariable ["mavic_drop_actionsAdded", false]) exitWith {};

waitUntil {!isNull player};

_uav setVariable ["mavic_drop_actionsAdded", true];

private _dropId = _uav addAction [
	["<t color='#FF0000'>", localize "STR_Mavic_Drop_UserAction_Drop_Attach", "</t>"] joinString "",
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

private _detachId = _uav addAction [
	["<t color='#00FF00'>", localize "STR_Mavic_Drop_UserAction_Drop_Detach", "</t>"] joinString "",
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

_uav addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_unit removeAction _dropId;
	_unit removeAction _detachId;
}];
