/*
 * fn_uiGrenadeSelectorZeus.sqf
 * Zeus grenade selector (vanilla-style look) for Mavic payload attachment
 *
 * Author: tfl_icy
 * 
 * Args:
 *   0: _mavic <OBJECT>  Mavic drone
 */
params ["_mavic"];
if (isNull _mavic) exitWith {};

private _allowedGrenades = missionNamespace getVariable ["mavic_drop_setting_allowedGrenades", ["Mavic_M67", "Mavic_V40", "Mavic_F1", "Mavic_VOG25", "Mavic_TBG", "Mavic_M433"]];
_allowedGrenades = call compile _allowedGrenades;
_allowedGrenades = _allowedGrenades apply { toUpperANSI _x };

private _maxGrenades = 2;
private _maxWeight = 750; // grams

// Safe curator hint (avoid RPT spam when Zeus display isn't open)
private _fnCuratorHintSafe = {
	params ["_text", ["_type","INFO"]];
	if (!isNull findDisplay 312) then {
		[_text, _type] call BIS_fnc_curatorHint;
	};
};

// Helper: extract classname from entry (supports ["Class", obj] or "Class")
private _fnEntryClass = {
	params ["_entry"];
	if (_entry isEqualType "") exitWith {_entry};
	if (_entry isEqualType [] && {count _entry > 0}) exitWith {_entry # 0};
	""
};

// Helper: grenade mass (CfgAmmo Mavic_weight -> CfgMagazines mass -> 250g)
private _fnGrenadeMass = {
	params ["_grenadeClass"];
	private _ammo = getText (configFile >> "CfgMagazines" >> _grenadeClass >> "ammo");
	private _w = 0;
	if (_ammo != "") then {
		_w = getNumber (configFile >> "CfgAmmo" >> _ammo >> "Mavic_weight");
	};
	if (_w <= 0) then { _w = getNumber (configFile >> "CfgMagazines" >> _grenadeClass >> "mass"); };
	if (_w <= 0) then { _w = 250; };
	_w
};

// Helper: current payload state
private _fnPayloadState = {
	params ["_uav"];
	private _attached = _uav getVariable ["mavic_drop_var_grenadeList", []];
	private _count = count _attached;
	private _mass = 0;
	{
		private _cls = [_x] call _fnEntryClass;
		if (_cls != "") then { _mass = _mass + ([_cls] call _fnGrenadeMass); };
	} forEach _attached;
	[_count, _mass]
};

// Note: We allow opening the dialog even when payload is full, so users can detach grenades
// The OK button will be disabled automatically when payload is full via _fnUpdate

// Pick a parent display that always exists
private _parent = findDisplay 312; // Zeus
if (isNull _parent) then { _parent = findDisplay 46; };
if (isNull _parent) exitWith {};

// Build a lightweight "vanilla module" styled overlay
private _display = _parent createDisplay "RscDisplayEmpty";
_display setVariable ["mavic_drop_var_mavic", _mavic];

// Store helper functions and constants on display so they're accessible in closures
_display setVariable ["mavic_drop_fnEntryClass", _fnEntryClass];
_display setVariable ["mavic_drop_fnGrenadeMass", _fnGrenadeMass];
_display setVariable ["mavic_drop_maxGrenades", _maxGrenades];
_display setVariable ["mavic_drop_maxWeight", _maxWeight];

// --- Layout numbers (safe on most aspect ratios)
private _w = 0.62;
private _h = 0.34;  // Increased height to fit Attach button
private _x = 0.19;
private _y = 0.36;

private _headerH = 0.04;
private _pad = 0.012;

// Background
private _bg = _display ctrlCreate ["RscText", 1000];
_bg ctrlSetPosition [_x, _y, _w, _h];
_bg ctrlSetBackgroundColor [0,0,0,0.65];
_bg ctrlCommit 0;

// Header bar (orange-ish)
private _hdr = _display ctrlCreate ["RscText", 1001];
_hdr ctrlSetPosition [_x, _y, _w, _headerH];
_hdr ctrlSetBackgroundColor [0.80,0.45,0.0,0.95];
_hdr ctrlCommit 0;

// Title
private _title = _display ctrlCreate ["RscText", 1002];
_title ctrlSetPosition [_x + _pad, _y + 0.002, _w - (2*_pad), _headerH];
_title ctrlSetText "Attach Grenade(s) to Mavic Drone";
_title ctrlSetTextColor [1,1,1,1];
_title ctrlSetFontHeight 0.035;
_title ctrlCommit 0;

// Labels + combos (vanilla-ish)
private _labelW = 0.14;
private _controlW = _w - (3*_pad) - _labelW;

private _row1Y = _y + _headerH + 0.022;
private _rowH  = 0.04;

private _lblGren = _display ctrlCreate ["RscText", 1010];
_lblGren ctrlSetPosition [_x + _pad, _row1Y, _labelW, _rowH];
_lblGren ctrlSetText "Grenade type";
_lblGren ctrlSetTextColor [1,1,1,0.9];
_lblGren ctrlSetFontHeight 0.03;
_lblGren ctrlCommit 0;

private _cmbGren = _display ctrlCreate ["RscCombo", 1011];
_cmbGren ctrlSetPosition [_x + (2*_pad) + _labelW, _row1Y, _controlW, _rowH];
_cmbGren ctrlCommit 0;

{
	private _cfg = (configFile >> "CfgMagazines" >> _x);
	private _dn  = getText (_cfg >> "displayName");
	private _pic = getText (_cfg >> "picture");

	private _i = _cmbGren lbAdd (if (_dn == "") then {_x} else {_dn});
	_cmbGren lbSetData [_i, _x];
	if (_pic != "") then { _cmbGren lbSetPicture [_i, _pic]; };
} forEach _allowedGrenades;

_cmbGren lbSetCurSel 0;

private _row2Y = _row1Y + 0.055;

private _lblQty = _display ctrlCreate ["RscText", 1020];
_lblQty ctrlSetPosition [_x + _pad, _row2Y, _labelW, _rowH];
_lblQty ctrlSetText "Quantity";
_lblQty ctrlSetTextColor [1,1,1,0.9];
_lblQty ctrlSetFontHeight 0.03;
_lblQty ctrlCommit 0;

private _cmbQty = _display ctrlCreate ["RscCombo", 1021];
_cmbQty ctrlSetPosition [_x + (2*_pad) + _labelW, _row2Y, _controlW, _rowH];
_cmbQty ctrlCommit 0;

private _i1 = _cmbQty lbAdd "1";
_cmbQty lbSetData [_i1, "1"];
private _i2 = _cmbQty lbAdd "2";
_cmbQty lbSetData [_i2, "2"];
_cmbQty lbSetCurSel 0;

// Status line (bottom-left)
private _status = _display ctrlCreate ["RscText", 1030];
private _statusY = _y + _h - _pad - 0.03;
_status ctrlSetPosition [_x + _pad, _statusY, _w - (2*_pad), 0.03];
_status ctrlSetTextColor [1,1,1,0.9];
_status ctrlSetFontHeight 0.028;
_status ctrlCommit 0;

// Buttons
private _btnW = 0.14;
private _btnH = 0.045;
private _btnY2 = _statusY - 0.01 - _btnH; // First row (actions)
private _btnY = _btnY2 - 0.055; // Second row (Cancel/OK)

// Row 1: Detach Last, Detach All, Attach
private _btnDetachLast = _display ctrlCreate ["RscButton", 1041];
_btnDetachLast ctrlSetPosition [_x + _pad, _btnY2, _btnW, _btnH];
_btnDetachLast ctrlSetText "Detach last";
_btnDetachLast ctrlSetBackgroundColor [0.8, 0.6, 0, 0.9]; // Yellow
_btnDetachLast ctrlCommit 0;

private _btnDetachAll = _display ctrlCreate ["RscButton", 1042];
_btnDetachAll ctrlSetPosition [_x + _pad + _btnW + 0.01, _btnY2, _btnW, _btnH];
_btnDetachAll ctrlSetText "Detach all";
_btnDetachAll ctrlSetBackgroundColor [0.7, 0, 0, 0.9]; // Red
_btnDetachAll ctrlCommit 0;

private _btnAttach = _display ctrlCreate ["RscButton", 1044];
_btnAttach ctrlSetPosition [_x + _w - _pad - _btnW, _btnY2, _btnW, _btnH];
_btnAttach ctrlSetText "Attach";
_btnAttach ctrlSetBackgroundColor [0, 0.6, 0, 0.9]; // Green
_btnAttach ctrlCommit 0;

// Row 2: Cancel, OK
private _btnCancel = _display ctrlCreate ["RscButton", 1040];
_btnCancel ctrlSetPosition [_x + _pad, _btnY, _btnW, _btnH];
_btnCancel ctrlSetText "Cancel";
_btnCancel ctrlCommit 0;

private _btnOK = _display ctrlCreate ["RscButton", 1043];
_btnOK ctrlSetPosition [_x + _w - _pad - _btnW, _btnY, _btnW, _btnH];
_btnOK ctrlSetText "OK";
_btnOK ctrlCommit 0;

// Update function (status + OK enable)
private _fnUpdate = {
	params ["_display"];
	private _m = _display getVariable ["mavic_drop_var_mavic", objNull];
	if (isNull _m) exitWith {};

	private _fnEntryClass = _display getVariable ["mavic_drop_fnEntryClass", {}];
	private _fnGrenadeMass = _display getVariable ["mavic_drop_fnGrenadeMass", {}];
	private _maxGrenades = _display getVariable ["mavic_drop_maxGrenades", 2];
	private _maxWeight = _display getVariable ["mavic_drop_maxWeight", 750];

	// Rebuild payload state calculation using stored helper functions
	private _attached = _m getVariable ["mavic_drop_var_grenadeList", []];
	private _cnt = count _attached;
	private _mass = 0;
	{
		private _cls = [_x] call _fnEntryClass;
		if (_cls != "") then { _mass = _mass + ([_cls] call _fnGrenadeMass); };
	} forEach _attached;
	
	private _slotsLeft = _maxGrenades - _cnt;
	if (_slotsLeft < 0) then {_slotsLeft = 0;};

	private _massLeft = _maxWeight - _mass;
	if (_massLeft < 0) then {_massLeft = 0;};

	private _txt = format ["Payload: %1/%2 | Weight: %3g/%4g | Free: %5 slot(s), %6g",
		_cnt, _maxGrenades, _mass, _maxWeight, _slotsLeft, _massLeft
	];

	(_display displayCtrl 1030) ctrlSetText _txt;
	// Enable Attach button only if slots available
	(_display displayCtrl 1044) ctrlEnable (_slotsLeft > 0);
};

_display setVariable ["mavic_drop_fnUpdate", _fnUpdate];
[_display] call _fnUpdate;

// Quantity change refresh
_cmbQty ctrlAddEventHandler ["LBSelChanged", {
	params ["_control"];
	private _display = ctrlParent _control;
	private _fnUpdate = _display getVariable ["mavic_drop_fnUpdate", {}];
	[_display] call _fnUpdate;
}];

// Cancel
_btnCancel ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	(ctrlParent _control) closeDisplay 1;
}];

// Detach last
_btnDetachLast ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	private _display = ctrlParent _control;
	private _mavic = _display getVariable ["mavic_drop_var_mavic", objNull];
	if (isNull _mavic) exitWith {};

	private _attached = _mavic getVariable ["mavic_drop_var_grenadeList", []];
	if (_attached isEqualTo []) exitWith {};

	private _entry = _attached deleteAt ((count _attached) - 1);
	if (_entry isEqualType [] && {count _entry >= 2}) then {
		private _holder = _entry # 1;
		if (!isNull _holder) then { deleteVehicle _holder; };
	};

	_mavic setVariable ["mavic_drop_var_grenadeList", _attached, true];

	private _fnUpdate = _display getVariable ["mavic_drop_fnUpdate", {}];
	[_display] call _fnUpdate;
}];

// Detach all
_btnDetachAll ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	private _display = ctrlParent _control;
	private _mavic = _display getVariable ["mavic_drop_var_mavic", objNull];
	if (isNull _mavic) exitWith {};

	private _attached = _mavic getVariable ["mavic_drop_var_grenadeList", []];
	{
		if (_x isEqualType [] && {count _x >= 2}) then {
			private _holder = _x # 1;
			if (!isNull _holder) then { deleteVehicle _holder; };
		};
	} forEach _attached;

	_mavic setVariable ["mavic_drop_var_grenadeList", [], true];

	private _fnUpdate = _display getVariable ["mavic_drop_fnUpdate", {}];
	[_display] call _fnUpdate;
}];

// Attach button (green)
_btnAttach ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	private _display = ctrlParent _control;
	private _mavic = _display getVariable ["mavic_drop_var_mavic", objNull];
	if (isNull _mavic) exitWith {};

	private _fnEntryClass = _display getVariable ["mavic_drop_fnEntryClass", {}];
	private _fnGrenadeMass = _display getVariable ["mavic_drop_fnGrenadeMass", {}];
	private _maxGrenades = _display getVariable ["mavic_drop_maxGrenades", 2];
	private _maxWeight = _display getVariable ["mavic_drop_maxWeight", 750];

	private _cmbGren = _display displayCtrl 1011;
	private _cmbQty  = _display displayCtrl 1021;

	private _gIndex = lbCurSel _cmbGren;
	private _grenadeClass = _cmbGren lbData _gIndex;

	private _qIndex = lbCurSel _cmbQty;
	private _quantity = parseNumber (_cmbQty lbData _qIndex);
	if (_quantity < 1) then { _quantity = 1; };
	if (_quantity > 2) then { _quantity = 2; };

	// Get current payload state
	private _attached = _mavic getVariable ["mavic_drop_var_grenadeList", []];
	private _attachedCount = count _attached;
	private _attachedMass = 0;
	{
		private _cls = [_x] call _fnEntryClass;
		if (_cls != "") then { _attachedMass = _attachedMass + ([_cls] call _fnGrenadeMass); };
	} forEach _attached;

	private _slotsLeft = _maxGrenades - _attachedCount;
	if (_slotsLeft <= 0) exitWith {
		systemChat "Mavic: Payload is full. Cannot attach more grenades.";
	};

	if (_quantity > _slotsLeft) then { 
		_quantity = _slotsLeft;
		systemChat "Mavic: Not enough slots. Quantity reduced automatically.";
	};

	private _massOne = [_grenadeClass] call _fnGrenadeMass;
	private _totalMass = _attachedMass + (_massOne * _quantity);

	if (_totalMass > _maxWeight) exitWith {
		private _overWeight = _totalMass - _maxWeight;
		private _message = format ["Weight limit exceeded! Would be %1g (max 750g, over by %2g)", _totalMass, _overWeight];
		systemChat format ["Mavic: %1", _message];
	};

	// Attach grenades
	for "_i" from 1 to _quantity do {
		[_mavic, _grenadeClass] call mavic_drop_fnc_initDrone;
	};

	// Update status display
	private _fnUpdate = _display getVariable ["mavic_drop_fnUpdate", {}];
	[_display] call _fnUpdate;
}];

// OK (closes dialog)
_btnOK ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	(ctrlParent _control) closeDisplay 1;
}];

// Close on ESC
_display displayAddEventHandler ["KeyDown", {
	params ["_display", "_key"];
	if (_key == 1) exitWith { _display closeDisplay 1; true };
	false
}];
