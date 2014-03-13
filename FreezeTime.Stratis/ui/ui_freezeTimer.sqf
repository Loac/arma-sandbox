disableSerialization;

// Register RSC layer.
_layer = "rscTimer" call BIS_fnc_rscLayer;

// Show timer display.
_layer cutRsc ["rscTimer", "PLAIN"];

// Get ID Display.
_rscTimer = uiNamespace getVariable "rscTimer";

// Get control display.
_ctrlDisplay = _rscTimer displayCtrl 1001;

// Get control icons.
_ctrlBlueIcon = _rscTimer displayCtrl 1002;
_ctrlRedIcon = _rscTimer displayCtrl 1003;

waitUntil {
    // Get new timer value.
    _timer = [freezeTime] call ft_fnc_timeToTimer;

    // Set new text.
    _ctrlDisplay ctrlSetText _timer;

    if (blueReady) then {
        _ctrlBlueIcon ctrlSetBackgroundColor [0, 0.3, 0.6, 0.8];
    };

    if (redReady) then {
        _ctrlRedIcon ctrlSetBackgroundColor [0.5, 0, 0, 0.8];
    };

    sleep 1;

    // Wait end of freeze.
    freezeTime < 0;
};

// Hide layer.
_layer cutFadeOut 1;




// Try to with out disableSerialization.
//
// // UI: Show timer display.
// cutRsc ["rscTimer", "PLAIN"];
//
// // UI: Change timer text.
// waitUntil {
//     // Update timer variable in uiNamespace.
//     uiNamespace setVariable ["timer", [freezeTime] call ft_fnc_timeToTimer];
//
//     with uiNamespace do {
//         _ctrlDisplay = (rscTimer displayCtrl 1001);
//         _ctrlDisplay ctrlSetText timer;
//         //_ctrlDisplay ctrlCommit 0;
//     };
//
//
//     freezeOver;
// };
//
