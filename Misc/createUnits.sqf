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
        ---
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

// Posseble waypoint parameters.
_bundle = [
    ["CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"],                                             // 0: Behaviour.
    ["BLUE", "GREEN", "WHITE", "YELLOW", "RED"],                                                    // 1: Combat Mode.
    ["COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "LINE", "FILE", "DIAMOND"],  // 2: Formation.
    ["LIMITED", "NORMAL", "FULL"],                                                                  // 3: Speed.
    ["MOVE", "DESTROY", "GETIN", "SAD", "JOIN", "LEADER", "GETOUT", "CYCLE", "LOAD", "UNLOAD",      // 4: Type.
        "TR UNLOAD", "HOLD", "SENTRY", "GUARD", "TALK", "SCRIPTED", "SUPPORT", "GETIN NEAREST", "DISMISS", "LOITER"]];

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
          // if ((_behaviour find _x) > -1) then { _waypoint setWaypointBehaviour _x };
          // if ((_mode find _x) > -1) then { _waypoint setWaypointCombatMode _x };
          // if ((_formation find _x) > -1) then { _waypoint setWaypointFormation _x };
          // if ((_speed find _x) > -1) then { _waypoint setWaypointSpeed _x };
          // if ((_type find _x) > -1) then { _waypoint setWaypointType _x };


          _parameter = _x;

          {
            switch (_x find _parameter) do {
              case (0): { _waypoint setWaypointBehaviour _parameter };
              case (1): { _waypoint setWaypointCombatMode _parameter };
              case (2): { _waypoint setWaypointFormation _parameter };
              case (3): { _waypoint setWaypointSpeed _parameter };
              case (4): { _waypoint setWaypointType _parameter };
            };
          } forEach _bundle;

      } forEach _parameters;
    };
} foreach _waypoints;


/*
setWaypointBehaviour
"UNCHANGED", "CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"

setWaypointCombatMode
"BLUE", "GREEN", "WHITE", "YELLOW", "RED",

setWaypointFormation
"COLUMN" ,"STAG COLUMN" ,"WEDGE" ,"ECH LEFT" ,"ECH RIGHT" ,"VEE" ,"LINE" ,"FILE" ,"DIAMOND"

setWaypointSpeed
"LIMITED", "NORMAL", "FULL"

setWaypointType
"MOVE", "DESTROY", "GETIN", "SAD", "JOIN", "LEADER", "GETOUT", "CYCLE", "LOAD",
"UNLOAD", "TR UNLOAD", "HOLD", "SENTRY", "GUARD", "TALK", "SCRIPTED", "SUPPORT", "GETIN NEAREST", "DISMISS", "LOITER"


// Posseble waypoint parameters.
_bundleWaypointParameters = [
    ["CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"],                                             // 0: Behaviour.
    ["BLUE", "GREEN", "WHITE", "YELLOW", "RED"],                                                    // 1: Combat Mode.
    ["COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "LINE", "FILE", "DIAMOND"]   // 2: Formation.
    ["LIMITED", "NORMAL", "FULL"],                                                                  // 3: Speed.
    ["MOVE", "DESTROY", "GETIN", "SAD", "JOIN", "LEADER", "GETOUT", "CYCLE", "LOAD", "UNLOAD",      // 4: Type.
        "TR UNLOAD", "HOLD", "SENTRY", "GUARD", "TALK", "SCRIPTED", "SUPPORT", "GETIN NEAREST", "DISMISS", "LOITER"]];


*/
