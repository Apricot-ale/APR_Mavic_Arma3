/*
 * fn_moduleAttachGrenade.sqf
 * Zeus module: resolve target on the server, then open UI only on the
 * placing Zeus client (the one whose curator mouseOver matches the drone).
 *
 * Dedicated-server safe: isGlobal=0 runs here on the server; UI is remoteExec'd.
 */

params ["_module"];

if (!isServer) exitWith {};

[_module] spawn {
	params ["_module"];

	// curatorCanAttach may take a moment to sync on dedicated
	private _attached = attachedTo _module;
	if (isNull _attached) then {
		private _t = diag_tickTime + 1.5;
		waitUntil {
			_attached = attachedTo _module;
			!isNull _attached || {diag_tickTime > _t}
		};
	};

	private _mavic = objNull;
	if (!isNull _attached && {_attached isKindOf "Mavic_drone_base_F"}) then {
		_mavic = _attached;
	};

	if (isNull _mavic) then {
		{
			if (!isNull _x && {_x isKindOf "Mavic_drone_base_F"}) exitWith {
				_mavic = _x;
			};
		} forEach (synchronizedObjects _module);
	};

	if (isNull _mavic || {!alive _mavic}) exitWith {
		{
			private _unit = getAssignedCuratorUnit _x;
			if (!isNull _unit) then {
				["ERROR!", "No Mavic drone found. Place this module on a Mavic drone."] remoteExecCall ["BIS_fnc_curatorHint", _unit];
			};
		} forEach allCurators;
		deleteVehicle _module;
	};

	// Open UI on clients: only the placer (matching mouseOver) will proceed
	[_mavic, _module] remoteExecCall ["mavic_drop_fnc_moduleAttachGrenadeClient", 0];

	// Fallback cleanup if no client claims the module
	[_module] spawn {
		params ["_module"];
		sleep 5;
		if (!isNull _module) then {
			deleteVehicle _module;
		};
	};
};
