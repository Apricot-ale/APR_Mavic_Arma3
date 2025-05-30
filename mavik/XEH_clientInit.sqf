if (isClass(configFile >> "CfgPatches" >> "ace_main")) then { 
    private _player = missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player];
	private _id = _player addEventHandler ["Put", { _this call Mavic_fnc_createMavicOnItemCheck }];
	_player setVariable ["mavic_var_putEHID", _id];
};

["loadout", {
    params ["_player"];
	private _id = _player getVariable ["mavic_var_putEHID", -1];
	if (_id != -1) then { _player removeEventHandler ["Put", _id] };
    if !(isPlayer _player) exitWith {};
	private _id = _player addEventHandler ["Put", { _this call Mavic_fnc_createMavicOnItemCheck }];
	_player setVariable ["mavic_var_putEHID", _id];
}] call CBA_fnc_addPlayerEventHandler;

[missionNamespace, "mavic_EH_showMessage", {
	private _group = uiNameSpace getVariable ["mavic_ctrl_DetachGrenade", controlNull];
	if !(ctrlShown _group) exitWith {};
	
	private _controls = (allControls _group) + [_group];
	{
		_x ctrlSetFade 0;
		_x ctrlCommit 0.5;
	} forEach _controls;
	
	playSoundUI ["mavic_sound_beep"];
	
	[{
		_this params ["_controls"];
		{
			_x ctrlSetFade 1;
			_x ctrlCommit 0.0;
		} forEach _controls;
	}, [_controls], 1.5] call CBA_fnc_waitAndExecute;
	
}] call BIS_fnc_addScriptedEventHandler;

_ppEffect = {
	private _name = "DynamicBlur";
	private _priority = 500;
	private _handle_signal = -1;
	while { _handle_signal <= 0 } do {
		_handle_signal = ppEffectCreate [_name, _priority];
		_priority = _priority + 1;
		uiSleep 0.01;
	};
	mavic_ppEffect_signalBlur = _handle_signal;

	private _handle_zoom = -1;
	while { _handle_zoom <= 0 } do {
		_handle_zoom = ppEffectCreate [_name, _priority];
		_priority = _priority + 1;
		uiSleep 0.01;
	};
	mavic_ppEffect_zoomBlur = _handle_zoom;
};
0 spawn _ppEffect;

true
