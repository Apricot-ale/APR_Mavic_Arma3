/*
 * fn_landingProtection.sqf
 * Prevents damage caused by model-based issues during takeoff and landing.
 *
 * Arguments:
 * 0: UAV <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call mavic_fnc_landingProtection;
 *
 * Public: No
 */
params ["_uav"];

private _lastUAVStatus = [];

if (mavic_setting_landingProtection && (isDamageAllowed _uav)) then {
	while {mavic_setting_landingProtection} do {
		private _isEngineOn = isEngineOn _uav;
		private _isTouchingGround = isTouchingGround _uav;
		private _altitude = (getPosATL _uav select 2) <= 3;
		private _isFallingFast = abs(speed _uav) <= 5;
		private _currentUAVStatus = [_isEngineOn, _isTouchingGround, _altitude, _isFallingFast];

		if (_currentUAVStatus isNotEqualTo _lastUAVStatus) then {
			_lastUAVStatus = _currentUAVStatus;
			_uav allowDamage !(_isEngineOn && (_isTouchingGround || (_altitude && _isFallingFast)));
		};
		sleep 0.1;
	};
	_uav allowDamage true;
};

waitUntil {sleep 1; mavic_setting_landingProtection && (isDamageAllowed _uav)};
[_uav] spawn mavic_fnc_landingProtection;