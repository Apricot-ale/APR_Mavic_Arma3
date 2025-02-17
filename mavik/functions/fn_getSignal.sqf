/*
 * fn_getSignal.sqf
 * Check the distance and obstacles between the UAV and the player.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: UAV <OBJECT>
 *
 * Return Value:
 * Floor (Signal Strength)
 *
 * Example:
 * [player, this] call mavic_fnc_getSignal;
 *
 * Public: No
 */
params ["_player", "_uav"];

private _fnc_evaluateTerrainImpact = {  
    params ["_startPoint", "_endPoint"];
    private _terrainInterceptionValue = 0; 
    private _initialPos = eyePos _startPoint; 
    private _finalPos = getPosWorld _endPoint; 
    private _isIntersecting = terrainIntersectASL[_initialPos, _finalPos];
    _terrainInterceptionValue = if (_isIntersecting) then { 1 } else { (_finalPos select 2) / 500 };
    _terrainInterceptionValue
};

private _fnc_countInterferingObjects = { 
    params ["_from", "_to"];
    private _intersectedSurfaces = lineIntersectsSurfaces [
        eyepos _from,
        getPosWorld _to,
        _from,
        _to,
        true,
        10,
        "FIRE",
        "NONE"
    ];
    private _filteredObstacles = _intersectedSurfaces select { 
        private _intersectedObject = _x select 2;
        private _isParent = (_intersectedObject isEqualTo objectParent _from) || (_intersectedObject isEqualTo objectParent _to);
        !_isParent && !(_intersectedObject isKindOf "Man")
    };
    count _filteredObstacles
};

private _fnc_findRetranslators = {
    params ["_position", "_radius"];
    private _retranslators = _position nearObjects ["FPV_Retranslator", _radius];
    _retranslators
};

private _fnc_distanceImpact = {
    params ["_distance", "_maxDistance"];
    private _distanceFactor = 1 - (_distance / _maxDistance);
    _distanceFactor
};


private _maxDistance = mavic_setting_maxConnectionDistance;

private _terrainInterception = [_player, _uav] call _fnc_evaluateTerrainImpact;
private _objectCount = [_player, _uav] call _fnc_countInterferingObjects;
private _distance = _player distance _uav;

private _signalStrength = 1 - (_objectCount * 0.05);

private _distanceImpact = [_distance, _maxDistance] call _fnc_distanceImpact;
_signalStrength = _signalStrength * (1 - (_terrainInterception * (_distance / _maxDistance))) * _distanceImpact;

if (_distance > _maxDistance) then {
    _signalStrength = 0;
};

_signalStrength = _signalStrength max 0 min 1;
_signalStrength;
