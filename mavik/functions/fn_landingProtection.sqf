params ["_uav"];

private _lastUAVStatus = [true,false,true,false];

if (mavic_setting_landingProtection && (isDamageAllowed _uav)) then {
	while {mavic_setting_landingProtection} do {
		private _isTouchingGround = isTouchingGround _uav;
		private _isEngineOn = isEngineOn _uav;
		private _altitude = (getPosATL _uav) select 2;
		private _isFallingFast = abs(speed _uav) >= 10;
		private _currentUAVStatus = [_isTouchingGround, _isEngineOn, _altitude > 10, _isFallingFast];

		if (_currentUAVStatus isNotEqualTo _lastUAVStatus) then {
			_lastUAVStatus = _currentUAVStatus;
			_uav allowDamage !((_isTouchingGround && _isEngineOn && !_isFallingFast) || (_altitude <= 10 && !_isFallingFast));
		};
		sleep 0.1;
	};
	_uav allowDamage true;
};

waitUntil {sleep 1; mavic_setting_landingProtection && (isDamageAllowed _uav)};
[_uav] spawn mavic_fnc_landingProtection;