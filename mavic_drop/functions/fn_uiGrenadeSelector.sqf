#define GRID_W( num ) ( num * ( pixelGridNoUIScale * pixelW * 2 ))
#define GRID_H( num ) ( num * ( pixelGridNoUIScale * pixelH * 2 ))
/*
 * fn_uiGrenadeSelector.sqf
 * Description
 *
 * Arguments:
 * 0: _actionInfo <ARRAY>
 * ["_target", "_caller", "_actionId", "_arguments"]
 *
 * Return Value:
 * None
 *
 * Example:
 * [["_target", "_caller", "_actionId", "_arguments"]] call mavic_drop_fnc_uiGrenadeSelector;
 *
 * Public: No
 */
params ["_actionInfo"];

private _player = missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player];
private _allItems = [_player, true, true, true, true, true, true] call CBA_fnc_uniqueUnitItems;
_allItems = _allItems apply { toUpperANSI _x };
private _allowedGrenades = missionNamespace getVariable ["mavic_drop_setting_allowedGrenades", ["Mavic_M67", "Mavic_V40", "Mavic_F1", "Mavic_VOG25", "Mavic_TBG", "Mavic_M433"]];
_allowedGrenades = call compile _allowedGrenades;
_allowedGrenades = _allowedGrenades apply { toUpperANSI _x };
_allItems = _allItems select { _x in _allowedGrenades };

if (_allItems isEqualTo []) exitWith { systemChat "There are no suitable grenades in inventory..." };

private _display = findDisplay 46 createDisplay "RscDisplayEmpty";
_display displayAddEventHandler ["Unload", { ["UNLOAD"] call mavic_drop_fnc_dynamicBlurToggle; }];

["ONLOAD"] call mavic_drop_fnc_dynamicBlurToggle;

private _mainText = _display ctrlCreate ["ctrlStructuredText", -1];
_mainText ctrlSetPosition [safeZoneXAbs, safeZoneY + GRID_H(3), safeZoneWAbs, GRID_H(3)];
_mainText ctrlSetStructuredText parseText "<t font='PuristaLight' align='center'>Attach Grenades</t>";
_mainText ctrlSetFontHeight (GRID_H(1.3));
_mainText ctrlCommit 0.0;

private _radius = GRID_H(8);
private _sizeW = GRID_W(3);
private _sizeH = GRID_H(3);

private _count = count _allItems;
for "_i" from 0 to _count - 1 do {
    private _angle = deg(_i * (2 * pi / _count));
    private _newGrenade = _allItems select _i;

    private _x = 0.5 + (_radius * cos(_angle)) - (_sizeW / 2);
    private _y = 0.5 + (_radius * sin(_angle)) - (_sizeH / 2);

    private _pictureButton = _display ctrlCreate ["ctrlButtonPictureKeepAspect", -1];
    _pictureButton ctrlSetText (getText(configFile >> "CfgMagazines" >> _newGrenade >> "picture"));
    _pictureButton ctrlSetBackgroundColor [0, 0, 0, 0];
    _pictureButton ctrlSetPosition [_x, _y, _sizeW, _sizeH];
    _pictureButton setVariable ["mavic_drop_var_grenadeUIdata", [_actionInfo, _newGrenade, _display]];
    _pictureButton ctrlAddEventHandler ["ButtonClick", {
        params ["_control"];

        private _data = _control getVariable ["mavic_drop_var_grenadeUIdata", []];
        private _player = missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player];

        _data params ["_actionInfo", "_newGrenade", "_display"];
        _actionInfo params ["_target", "_caller", "_actionId", "_arguments"];

        private _grenades = _target getVariable ["mavic_drop_var_grenadeList", []];
        private _totalMass = 0;

        {
            _x params ["_grenade", ""];

			private _grenadeAmmo = getText(configFile >> "CfgMagazines" >> _grenade >> "ammo");
            private _grenadeMass = getNumber(configFile >> "CfgAmmo" >> _grenadeAmmo >> "Mavic_weight");
            _totalMass = _totalMass + _grenadeMass;
        } forEach _grenades + [[_newGrenade, ""]];

        if (_totalMass > 750) exitWith { systemChat "The grenade's weight exceeds the maximum load capacity." }; // 750 hardcoded

        _target removeAction _actionId;
        _player removeMagazineGlobal _newGrenade;

        [_target, _newGrenade] call mavic_drop_fnc_initDrone;

        _display closeDisplay 1;
    }];

    _pictureButton ctrlCommit 0;

    private _pictureText = _display ctrlCreate ["ctrlStructuredText", -1];
    _pictureText ctrlSetPosition [_x, _y + _sizeH + GRID_H(0.2), _sizeW, GRID_H(2)];
    _pictureText ctrlSetStructuredText parseText format ["<t font='PuristaMedium' align='center'>%1</t>", getText(configFile >> "CfgMagazines" >> _newGrenade >> "displayName")];
    _pictureText ctrlSetFontHeight (GRID_H(0.8));
    _pictureText ctrlCommit 0.0;
};
