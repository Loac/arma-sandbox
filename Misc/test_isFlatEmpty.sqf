/*
    Author:
        Dmitry Privalov.

    Description:
        Check valid surface normal.

    Example:
        _validNormal = [] execVM "rqf\functions\fnc_validNormal.sqf";
 */

private [
    "_position",
    "_ret"
];

_position = _this select 0;
_ret = true;

_isFlat = (_position) isFlatEmpty [
        1,      // Minimal distance from another object.
        0,      // If 0, just check position. If >0, select new one.
        0.7,    // Max gradient.
        3,      // Gradient area ~7 for player.
        0,      // 0 for restricted water, 2 for required water.
        false,  // True if some water can be in 25m radius.
        player  // Ignored object.
];

if (count _isFlat == 0) then {
    _ret = false;
};

// Return.
_ret;