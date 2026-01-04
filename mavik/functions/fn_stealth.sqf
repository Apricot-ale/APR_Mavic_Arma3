//this script not used yet

params ["_uav"];

private _lastUAVStatus = [false,false,false];

if (mavic_setting_stealth && !(captive _uav)) then {
	while {mavic_setting_stealth} do {
		private _isCaptive = captive _uav;
		private _altitude = (getPosATL _uav) select 2;
		private _currentUAVStatus = [_isCaptive, _altitude > 10];

		if (_currentUAVStatus isNotEqualTo _lastUAVStatus) then {
			_lastUAVStatus = _currentUAVStatus;
			_uav setCaptive (_altitude > 10)
		};
		sleep 0.1;
	};
	_uav setCaptive false;
};

waitUntil {sleep 1; mavic_setting_stealth && !(captive _uav)};
[_uav] spawn mavic_fnc_stealth;
