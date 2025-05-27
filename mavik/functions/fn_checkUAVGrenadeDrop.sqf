/*
 * fn_checkUAVGrenadeDrop.sqf
 * Check the UAV is connected and it's a Mavic, then change the light state and invoke the drop function.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Light or Drop or Both <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 0] call mavic_fnc_checkUAVGrenadeDrop;
 *
 * Public: Yes
 */
params ["_player", ["_switch", 0]];

private _uav = getConnectedUAV _player;

if (isNull _uav) exitWith {};
if (cameraOn isNotEqualTo _uav) exitWith {};

if (typeOf _uav isKindOf "Mavic_drone_base_F") exitWith {
	private _lightStatus = _uav getVariable ["mavic_var_lightStatus", [objNull, false]];
	private _lightObj = _lightStatus #0;
	private _lightOn = _lightStatus #1;
	if ((isNull _lightObj) && mavic_setting_lightAllowed) then {
		_lightObj = [_uav] call mavic_fnc_createLight;
	};
	if (_lightOn) then {
		private _text = uiNameSpace getVariable ["mavic_ctrl_DetachGrenade_Text", controlNull];
		_text ctrlSetText format ["%1", localize "STR_Mavic_HUD_DropMessage_Off"];
		_uav setVariable ["mavic_var_lightStatus", [_lightObj, false], true];
	} else {
		private _text = uiNameSpace getVariable ["mavic_ctrl_DetachGrenade_Text", controlNull];
		_text ctrlSetText format ["%1", localize "STR_Mavic_HUD_DropMessage"];
		_uav setVariable ["mavic_var_lightStatus", [_lightObj, true], true];
	};
	[missionNamespace, "mavic_EH_showMessage", []] call BIS_fnc_callScriptedEventHandler;
	switch (_switch) do
	{
		case 0: {
			[_player] call mavic_drop_fnc_dropGrenade;
		};
		case 1: {
			if (mavic_setting_lightAllowed) then {
				if (_lightOn) then {
					_lightObj hideObjectGlobal true;
				} else {
					_lightObj hideObjectGlobal false;
				};
			};
		};
		case 2: {
			[_player] call mavic_drop_fnc_dropGrenade;
			if (mavic_setting_lightAllowed) then {
				if (_lightOn) then {
					_lightObj hideObjectGlobal true;
				} else {
					_lightObj hideObjectGlobal false;
				};
			};
		};
		default {};
	};
};
