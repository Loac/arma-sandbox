private ["_state", "_field", "_newValue", "_fieldIndex"];

_state = _this select 0;
_field = _this select 1;
_newValue = _this select 2;

_fieldIndex = _field call Sayer_fnc_getFieldIndex;

_state set [_fieldIndex, _newValue];
