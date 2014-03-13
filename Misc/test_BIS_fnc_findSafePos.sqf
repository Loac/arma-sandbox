// usage: _null = [] execvm "rqf\functions\debug2.sqf"

_newPosition = [
    _newPosition, // center position.
    0,            // minimum distance from the center position.
    25,          // maximum distance from the center position.
    10,           // minimum distance from the nearest object.
    0,            // water mode (0: can't be in water).
    0.4,          // maximum terrain gradient.
    0,            // shore mode (0: does not have to be at a shore).
    [],
    [[0,0],[0,0]]
] call BIS_fnc_findSafePos;