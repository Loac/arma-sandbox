/*
    Description:
        Create group some units.

    Parameters:
        0: side - side.
        1: array - position.
        2: array - unit list.
        3: array (optional) - waypoint list.
        4: array (optional) - waypoint parameters.

    Example:
        [west, position player,
          ["B_officer_F", "B_Soldier_F", "B_Soldier_F"],
          [markerPos "Spot 1", markerPos "Spot 2"],
          ["CARELESS+BLUE", "COMBAT+RED+VEE"]
        ] execVM "misc\createUnits.sqf";

        [west, position player, ["B_officer_F"]] execVM "misc\createUnits.sqf";

    See:
        https://community.bistudio.com/wiki/CfgGroups
        https://community.bistudio.com/wiki/BIS_fnc_spawnGroup
        https://community.bistudio.com/wiki/BIS_fnc_taskDefend
        https://community.bistudio.com/wiki/BIS_fnc_taskPatrol
        https://community.bistudio.com/wiki/Category:Arma_3:_Editing

        Create patrol:

        _group = [markerPos "OBJECT", west, ["B_officer_F", "B_Soldier_F", "B_Soldier_F"]] call BIS_fnc_spawnGroup;
        [_group, markerPos "OBJECT", markerSize "OBJECT" select 0] call BIS_fnc_taskPatrol;

        _group = [markerPos "OBJECT", west, ["B_officer_F", "B_Soldier_F", "B_Soldier_F"]] call BIS_fnc_spawnGroup;
        [_group, markerPos "OBJECT"] call BIS_fnc_taskDefend;

*/

private [
    "_side", "_position", "_units", "_waypoints", "_waypointParameters",
    "_group", "_unit",
    "_waypoint", "_behaviour", "_mode", "_formation", "_speed", "_type", "_bundle"
];

_side = [_this, 0] call BIS_fnc_param;
_position = [_this, 1] call BIS_fnc_param;
_units = [_this, 2] call BIS_fnc_param;
_waypoints = [_this, 3, [], [[]]] call BIS_fnc_param;
_waypointParameters = [_this, 4, [], [[]]] call BIS_fnc_param;

// Posseble waypoint parameters.
_behaviour = ["CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"];
_mode = ["BLUE", "GREEN", "WHITE", "YELLOW", "RED"];
_formation = ["COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "LINE", "FILE", "DIAMOND"];
_speed = ["LIMITED", "NORMAL", "FULL"];
_type = ["MOVE", "DESTROY", "GETIN", "SAD", "JOIN", "LEADER", "GETOUT", "CYCLE", "LOAD", "UNLOAD", "TR UNLOAD", "HOLD",
            "SENTRY", "GUARD", "TALK", "SCRIPTED", "SUPPORT", "GETIN NEAREST", "DISMISS", "LOITER"];

// Make group for squad.
_group = createGroup _side;

// Create units.
{
    _group createUnit [_x, _position, [], 0, "FORM"];
} forEach _units;

// Add waypoints and setup parameters.
{
    // Add waypoint
    _waypoint = _group addWaypoint[_x, 0];

    // Try to set waypoint parameters.
    if (count _waypointParameters > 0) then {
        // Split string to array. For example: "CARELESS+BLUE" to ["CARELESS", "BLUE"].
        _parameters = [_waypointParameters call BIS_fnc_arrayPop, '+'] call BIS_fnc_splitString;

        {
            if (_x in _behaviour) then { _waypoint setWaypointBehaviour _x };
            if (_x in _mode) then { _waypoint setWaypointCombatMode _x };
            if (_x in _formation) then { _waypoint setWaypointFormation _x };
            if (_x in _speed) then { _waypoint setWaypointSpeed _x };
            if (_x in _type) then { _waypoint setWaypointType _x };
        } forEach _parameters;
    };
} foreach _waypoints;