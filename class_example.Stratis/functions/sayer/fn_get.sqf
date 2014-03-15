private ["_state", "_field", "_fieldIndex"];

_state = _this select 0;
_field = _this select 1;

_fieldIndex = _field call Sayer_fnc_getFieldIndex;

_state select _fieldIndex;
