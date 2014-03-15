// by [STELS]Zealot

private ["_fuel","_freeztime","_infoStr1","_infoStr2","_infoString"];
_freeztime = [_this, 0, 60] call BIS_fnc_param;

if (not isServer) exitWith {};

_vehs = [];

{
	if (local _x) then {
		_fuel = fuel _x;
		if (_fuel !=0) then {
			_vehs set [count _vehs, _x];
			_x setVariable ["freezefuel", _fuel];
			if( not (isEngineOn _x and _x isKindOf "Air")) then {
				_x setFuel 0;
			} else {
				_x lock true;
			};
		};
	};
} forEach (vehicles); 

waitUntil {sleep 0.9; zlt_pub_frz_state >= 3};

{
	_fuel = _x getVariable ["freezefuel", 1];
	if (isEngineOn _x and _x isKindOf "Air") then {
		[ [ [_x,false], {(_this select 0) lock (_this select 1);} ],"bis_fnc_spawn",_x] call bis_fnc_mp;
	};
	[ [ [_x, _fuel], {(_this select 0) setFuel (_this select 1);} ],"bis_fnc_spawn",_x] call bis_fnc_mp;
} forEach _vehs; 

// if lags
sleep 10;
{
	_fuel = _x getVariable ["freezefuel", 1];
	if (isEngineOn _x and _x isKindOf "Air") then {
		[ [ [_x,false], {(_this select 0) lock (_this select 1);} ],"bis_fnc_spawn",_x] call bis_fnc_mp;
	};
	[ [ [_x, _fuel], {(_this select 0) setFuel (_this select 1);} ],"bis_fnc_spawn",_x] call bis_fnc_mp;
} forEach _vehs; 

