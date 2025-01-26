#define GRID_W( num ) ( num * ( pixelGridNoUIScale * pixelW * 2 ))
#define GRID_H( num ) ( num * ( pixelGridNoUIScale * pixelH * 2 ))

private _player = missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player];
private _uav = cameraOn;

// BATTERY
private _batteryPicture = uiNameSpace getVariable ["mavic_ctrl_Battery", controlNull];
private _batteryText = uiNameSpace getVariable ["mavic_ctrl_BatteryText", controlNull];

private _currentBattery = fuel _uav;
private _batteryPictureSet = "\mavik\interface\bat\25.paa";
private _textColor = [0.298039, 0.733334, 0.564706, 1];

switch (true) do {
    case (_currentBattery > 0.75): {
        _batteryPictureSet = "\mavik\interface\bat\100.paa";
        _textColor = [0.298039, 0.733334, 0.564706, 1];
    };
    case (_currentBattery > 0.5): {
        _batteryPictureSet = "\mavik\interface\bat\75.paa";
        _textColor = [0.298039, 0.733334, 0.564706, 1];
    };
    case (_currentBattery > 0.25): {
        _batteryPictureSet = "\mavik\interface\bat\50.paa";
        _textColor = [0.976471, 0.541177, 0.082353, 1];
    };
    default {
        _batteryPictureSet = "\mavik\interface\bat\25.paa";
        _textColor = [0.929412, 0.196078, 0.145098, 1];
    };
};

_batteryPicture ctrlSetText _batteryPictureSet;
_batteryText ctrlSetText str(floor (_currentBattery * 100));
_batteryText ctrlSetTextColor _textColor;

// ESTIMATED TIME
private _remainingTimeText = uiNameSpace getVariable ["mavic_ctrl_RemainingTime", controlNull];
private _maxFlightTime = 30; // min

private _remainingFlightTimeMinutes = _maxFlightTime * _currentBattery;
private _remainingFlightTimeSeconds = _remainingFlightTimeMinutes * 60;
private _minutes = floor(_remainingFlightTimeSeconds / 60);
private _seconds = floor(_remainingFlightTimeSeconds % 60);

private _formattedSeconds = [format ["%1", _seconds], format ["0%1", _seconds]] select (_seconds < 10);

_remainingTimeText ctrlSetText format ["%1'%2""", _minutes, _formattedSeconds];

private _rthPicture = uiNameSpace getVariable ["mavic_ctrl_RTH_Button", controlNull];
private _rthPictureSet = "\mavik\interface\main\arrow.paa";
_rthPictureSet = (["\mavik\interface\main\home.paa", "\mavik\interface\main\arrow.paa"] select (isTouchingGround _uav));
_rthPicture ctrlSetText _rthPictureSet;

// SIGNAL & STATUS & MODE
private _signal = [_player, _uav] call Mavic_fnc_getSignal;
private _signalControl = uiNameSpace getVariable ["mavic_ctrl_Signal", controlNull];
private _signalPictureSet = "\mavik\interface\signal\0.paa";

private _modeText = uiNameSpace getVariable ["mavic_ctrl_FlightMode_Text", controlNull];
private _modeTextSelected = localize "STR_Mavic_HUD_Mode_Flight";
private _statusText = uiNameSpace getVariable ["mavic_ctrl_FlightStatus_Text", controlNull];
private _statusTextSelected = ([localize "STR_Mavic_HUD_FlightStatus_Flying", localize "STR_Mavic_HUD_FlightStatus_Ground"] select (isTouchingGround _uav));

switch (true) do {
    case (_signal > 0.8): {
        _signalPictureSet = "\mavik\interface\signal\100.paa";
    };
    case (_signal > 0.6): {
        _signalPictureSet = "\mavik\interface\signal\80.paa";
    };
    case (_signal > 0.4): {
        _signalPictureSet = "\mavik\interface\signal\60.paa";
    };
	case (_signal > 0.2): {
        _signalPictureSet = "\mavik\interface\signal\40.paa";
    };
	case (_signal > 0.05): {
        _signalPictureSet = "\mavik\interface\signal\20.paa";
		_statusTextSelected = localize "STR_Mavic_HUD_FlightStatus_weak";
    };
	case (_signal > 0): {
        _signalPictureSet = "\mavik\interface\signal\0.paa";
		_statusTextSelected = localize "STR_Mavic_HUD_FlightStatus_notConnected";
		_modeTextSelected  = localize "STR_Mavic_HUD_Mode_None";
    };
    default {
        _signalPictureSet = "\mavik\interface\signal\0.paa";
		_statusTextSelected = localize "STR_Mavic_HUD_FlightStatus_notConnected";
		_modeTextSelected  = localize "STR_Mavic_HUD_Mode_None";
    };
};
_signalControl ctrlSetText _signalPictureSet;
_modeText ctrlSetText _modeTextSelected;
_statusText ctrlSetText _statusTextSelected;

// SATELITE
private _satelitePicture = uiNameSpace getVariable ["mavic_ctrl_Satellite", controlNull];

_satelitePicture ctrlSetText (["\mavik\interface\main\sat100.paa", "\mavik\interface\main\sat0.paa"] select (_signal < 0.6));

// MAP
private _mapPicture = uiNameSpace getVariable ["mavic_ctrl_Map_Picture_Arrow", controlNull];

_angle = floor(getDir _uav);
if (_angle > 359) then { _angle = 0 };
_mapPicture ctrlSetAngle [_angle, 0.5, 0.5];

// SPEED AND HEIGHT (or HDG)
private _vSpeedText = uiNameSpace getVariable ["mavic_ctrl_VSpeed", controlNull];
private _hSpeedText = uiNameSpace getVariable ["mavic_ctrl_HSpeed", controlNull];

private _speedV = floor((speed _uav)/3.6);
private _speedVIndicator = localize "STR_Mavic_HUD_Speed";
switch (mavic_setting_hudVSpeedUnit) do {
	case 0: {
		_speedV = floor((speed _uav)/3.6);
		_speedVIndicator = localize "STR_Mavic_HUD_Speed";
	};
    case 1: {
		_speedV = floor(speed _uav);
		_speedVIndicator = localize "STR_Mavic_HUD_Speed_KMH";
	};
    case 2: {
		_speedV = floor((speed _uav)/1.609);
		_speedVIndicator = localize "STR_Mavic_HUD_Speed_MPH";
	};
    case 3: {
		_speedV = floor((speed _uav)/1.852);
		_speedVIndicator = localize "STR_Mavic_HUD_Speed_KPH";
	};
    case 4: {
		_speedV = floor((speed _uav)/1.097);
		_speedVIndicator = localize "STR_Mavic_HUD_Speed_FPS";
	};
    default {
		_speedV = floor((speed _uav)/3.6);
		_speedVIndicator = localize "STR_Mavic_HUD_Speed";
	};
};
_vSpeedText ctrlSetText format ["%1 %2", _speedV, _speedVIndicator];
private _speedH = floor((velocityModelSpace _uav) # 2);
private _speedHIndicator = localize "STR_Mavic_HUD_Speed";
switch (mavic_setting_hudHSpeedUnit) do {
	case 0: {
		_speedH = floor((velocityModelSpace _uav) # 2);
		_speedHIndicator = localize "STR_Mavic_HUD_Speed";
	};
    case 1: {
		_speedH = floor(((velocityModelSpace _uav) # 2)*3.6);
		_speedHIndicator = localize "STR_Mavic_HUD_Speed_KMH";
	};
    case 2: {
		_speedH = floor(((velocityModelSpace _uav) # 2)*2.237);
		_speedHIndicator = localize "STR_Mavic_HUD_Speed_MPH";
	};
    case 3: {
		_speedH = floor(((velocityModelSpace _uav) # 2)*1.944);
		_speedHIndicator = localize "STR_Mavic_HUD_Speed_KPH";
	};
    case 4: {
		_speedH = floor(((velocityModelSpace _uav) # 2)*3.281);
		_speedHIndicator = localize "STR_Mavic_HUD_Speed_FPS";
	};
    default {
		_speedH = floor((velocityModelSpace _uav) # 2);
		_speedHIndicator = localize "STR_Mavic_HUD_Speed";
	};
};
if (mavic_setting_hudHeading) then {
	_heading = floor(getDir _uav);
	_heading = str _heading;
	while {count _heading < 3} do {_heading = "0" + _heading;};
	_speedHIndicator = _heading;
	_speedH = localize "STR_Mavic_HUD_Heading";
};
_hSpeedText ctrlSetText format ["%1 %2", _speedH, _speedHIndicator];

private _heightText = uiNameSpace getVariable ["mavic_ctrl_Height", controlNull];
private _height = floor(_uav call CBA_fnc_realHeight);
private _heightIndicator = localize "STR_Mavic_HUD_Meters";
switch (mavic_setting_hudHeightUnit) do {
	case 0: {
		_height = floor(_uav call CBA_fnc_realHeight);
		_heightIndicator = localize "STR_Mavic_HUD_Meters";
	};
    case 1: {
		_height = floor((_uav call CBA_fnc_realHeight)*3.281);
		_heightIndicator = localize "STR_Mavic_HUD_Feet";
	};
    default {
		_height = floor(_uav call CBA_fnc_realHeight);
		_heightIndicator = localize "STR_Mavic_HUD_Meters";
	};
};
_heightText ctrlSetText format["%1 %2", _height, _heightIndicator];
private _distanceText = uiNameSpace getVariable ["mavic_ctrl_Distance", controlNull];
private _distance = floor(_uav call CBA_fnc_realHeight);
private _distanceIndicator = localize "STR_Mavic_HUD_Meters";
switch (mavic_setting_hudDistanceUnit) do {
	case 0: {
		_distance = floor(_player distance _uav);
		_distanceIndicator = localize "STR_Mavic_HUD_Meters";
	};
    case 1: {
		_distance = floor((_player distance _uav)*3.281);
		_distanceIndicator = localize "STR_Mavic_HUD_Feet";
	};
    case 2: {
		_distance = floor((_player distance _uav)*1.094);
		_distanceIndicator = localize "STR_Mavic_HUD_Yard";
	};
    case 3: {
		_distance = ((_player distance _uav)/1609);
		_distance = (round (_distance * 1000)) / 1000;
		_distanceIndicator = localize "STR_Mavic_HUD_Mile";
	};
    default {
		_distance = floor(_player distance _uav);
		_distanceIndicator = localize "STR_Mavic_HUD_Meters";
	};
};
_distanceText ctrlSetText format["%1 %2", _distance, _distanceIndicator];

private _CrossPicture = uiNameSpace getVariable ["mavic_ctrl_Cross", controlNull];
private _CrossPictureSet = "\mavik\interface\main\kross.paa";
switch (mavic_setting_hudCrosshair) do {
	case 0: {_CrossPictureSet = "\mavik\interface\main\kross_none.paa";};
    case 1: {_CrossPictureSet = "\mavik\interface\main\kross.paa";};
    case 2: {_CrossPictureSet = "\mavik\interface\main\kross_x.paa";};
    case 3: {_CrossPictureSet = "\mavik\interface\main\kross_big.paa";};
    default {_CrossPictureSet = "\mavik\interface\main\kross.paa";};
};
_CrossPicture ctrlSetText _CrossPictureSet;

// ZOOM
private _zoomText = uiNameSpace getVariable ["mavic_ctrl_Zoom_Text", controlNull];
//private _zoom = floor(0.25/getObjectFov _uav);
private _zoom = floor(0.8/getObjectFov _uav);
_zoomText ctrlSetText format ["%1x", _zoom];

if !(isNil "mavic_ppEffect_zoomBlur") then { mavic_ppEffect_zoomBlur ppEffectEnable false; };

switch true do {
    case (_zoom < 7): {
        mavic_ppEffect_zoomBlur ppEffectEnable true;
        mavic_ppEffect_zoomBlur ppEffectAdjust [0.1];
        mavic_ppEffect_zoomBlur ppEffectCommit 0; 
    };

    case (_zoom < 14): {
        mavic_ppEffect_zoomBlur ppEffectEnable true;
        mavic_ppEffect_zoomBlur ppEffectAdjust [0.3];
        mavic_ppEffect_zoomBlur ppEffectCommit 0; 
    };
    
    case (_zoom <= 28): {
        mavic_ppEffect_zoomBlur ppEffectEnable true;
        mavic_ppEffect_zoomBlur ppEffectAdjust [0.5];
        mavic_ppEffect_zoomBlur ppEffectCommit 0; 
    };
};
