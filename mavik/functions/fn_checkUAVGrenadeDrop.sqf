//
// fn_checkUAVGrenadeDrop.sqf
//
// mavic_fnc_checkUAVGrenadeDrop
//
// check UAV is connected and that is mavic then call drop feature
//
params ["_player"];

private _drone = getConnectedUAV _player;

if (isNull _drone) exitWith {};
if (cameraOn isNotEqualTo _drone) exitWith {};

if (typeOf _drone isKindOf "Mavic_drone_base_F") exitWith {
	private _lightStatus = _drone getVariable ["mavic_var_lightStatus", [objNull, false]];
	private _lightObj = _lightStatus #0;
	if ((isNull _lightObj) && mavic_setting_lightAllowed) then {
		_lightObj = [_drone] call mavic_fnc_createLight;
	};
	private _lightOn = _lightStatus #1;
	if (_lightOn) then {
		private _text = uiNameSpace getVariable ["mavic_ctrl_DetachGrenade_Text", controlNull];
		_text ctrlSetText format ["%1", localize "STR_Mavic_HUD_DropMessage_Off"];
		if (mavic_setting_lightAllowed) then {_lightObj hideObjectGlobal true;};
		_drone setVariable ["mavic_var_lightStatus", [_lightObj, false], true];
	} else {
		private _text = uiNameSpace getVariable ["mavic_ctrl_DetachGrenade_Text", controlNull];
		_text ctrlSetText format ["%1", localize "STR_Mavic_HUD_DropMessage"];
		if (mavic_setting_lightAllowed) then {_lightObj hideObjectGlobal false;};
		_drone setVariable ["mavic_var_lightStatus", [_lightObj, true], true];
	};
	[missionNamespace, "mavic_EH_showMessage", []] call BIS_fnc_callScriptedEventHandler;
	[_player] call mavic_drop_fnc_dropGrenade;
};