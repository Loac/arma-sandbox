/*
    Author:
        Dmitry Loac.

    Description:
        Init fading effect.

    Example:
        ["out", "Hello world", 2] call sandbox_fnc_fade;
*/

_type = [_this, 0, "in", ["in", "out"]] call BIS_fnc_param;
_text = [_this, 1, "", [""]] call BIS_fnc_param;
_speed = [_this, 2, 2, [0]] call BIS_fnc_param;

switch (_type) do {
    case "in": {_type = "BLACK IN" };
    case "out": {_type = "BLACK OUT" };
    case "on": {_type = "BLACK" };
    case "off": {_type = "BLACK FADED" };
};

cutText [_text, _type, _speed];