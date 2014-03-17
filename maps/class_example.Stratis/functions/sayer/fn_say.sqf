private ["_state", "_text", "_count"];

_state = _this select 0;
_text = _this select 1;

_count = [_state, "count"] call Sayer_fnc_get;
_count = _count + 1;
[_state, "count", _count] call Sayer_fnc_set;

hint _text;
