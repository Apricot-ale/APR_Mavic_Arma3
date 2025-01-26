params ["_drone"];

private _lastUAVStatus = [false,false,false];

private _allowedDamage = isDamageAllowed _drone;

if (mavic_setting_landingProtection && _allowedDamage) then {
	while {mavic_setting_landingProtection} do {
		private _isTouchingGround = isTouchingGround _drone;
		private _isEngineOn = isEngineOn _drone;
		private _altitude = (getPosATL _drone) select 2;
		private _isFallingFast = abs(speed _drone) >= 10;
		private _currentUAVStatus = [_isTouchingGround, _isEngineOn, _altitude > 10, _isFallingFast];

		if (_currentUAVStatus isNotEqualTo _lastUAVStatus) then {
			_lastUAVStatus = _currentUAVStatus;
			_drone allowDamage !((_isTouchingGround && _isEngineOn && !_isFallingFast) || (_altitude <= 10 && !_isFallingFast));
		};
		sleep 0.1;
	};
	_drone allowDamage true;
};

waitUntil {sleep 1; mavic_setting_landingProtection && _allowedDamage};
[_drone] spawn mavic_fnc_landingProtection;