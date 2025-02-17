/*
 * fn_checkUAVGrenadeDrop.sqf
 * Check the UAV is connected and it's a Mavic, then change the light state and invoke the drop function.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call mavic_fnc_checkUAVGrenadeDrop;
 *
 * Public: Yes
 */
params ["_player"];

private _uav = getConnectedUAV _player;

if (isNull _uav) exitWith {};
if (cameraOn isNotEqualTo _uav) exitWith {};

if (typeOf _uav isKindOf "Mavic_drone_base_F") exitWith {
	private _lightStatus = _uav getVariable ["mavic_var_lightStatus", [objNull, false]];
	private _lightObj = _lightStatus #0;
	if ((isNull _lightObj) && mavic_setting_lightAllowed) then {
		_lightObj = [_uav] call mavic_fnc_createLight;
	};
	private _lightOn = _lightStatus #1;
	if (_lightOn) then {
		private _text = uiNameSpace getVariable ["mavic_ctrl_DetachGrenade_Text", controlNull];
		_text ctrlSetText format ["%1", localize "STR_Mavic_HUD_DropMessage_Off"];
		if (mavic_setting_lightAllowed) then {_lightObj hideObjectGlobal true;};
		_uav setVariable ["mavic_var_lightStatus", [_lightObj, false], true];
	} else {
		private _text = uiNameSpace getVariable ["mavic_ctrl_DetachGrenade_Text", controlNull];
		_text ctrlSetText format ["%1", localize "STR_Mavic_HUD_DropMessage"];
		if (mavic_setting_lightAllowed) then {_lightObj hideObjectGlobal false;};
		_uav setVariable ["mavic_var_lightStatus", [_lightObj, true], true];
	};
	[missionNamespace, "mavic_EH_showMessage", []] call BIS_fnc_callScriptedEventHandler;
	[_player] call mavic_drop_fnc_dropGrenade;
};