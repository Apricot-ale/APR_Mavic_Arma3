("mavic_rscLayer_interface" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
private _prevHUD = missionNamespace getVariable ["mavic_var_prevHud", shownHUD];
showHUD _prevHUD;
private _gradient = uiNamespace getVariable ["mavic_ctrl_Gradient", controlNull];
_gradient ctrlShow false;
if !(isNil "mavic_ppEffect_zoomBlur") then {
	mavic_ppEffect_zoomBlur ppEffectEnable false;
	mavic_ppEffect_zoomBlur ppEffectCommit 0;
};
if !(isNil "mavic_ppEffect_signalBlur") then {
	mavic_ppEffect_signalBlur ppEffectEnable false;
	mavic_ppEffect_signalBlur ppEffectCommit 0;
};
