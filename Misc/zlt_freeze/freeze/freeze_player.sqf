// by [STELS]Zealot
_freeztime = [_this, 0, 60] call BIS_fnc_param;
_distance = [_this, 1, 150] call BIS_fnc_param;
_maxdistance = _distance + 20;

waitUntil {player == player and time > 0};

_startpos = getpos player;

_mrk = ["PlayerFreeze",_startpos,"","ColorGreen","EMPTY",[_distance, _distance],"ELLIPSE"] call zlt_fnc_createmarkerlocal;

_uav_term = ["B_UavTerminal","O_UavTerminal","I_UavTerminal"];

enableEngineArtillery false;


while {zlt_pub_frz_state < 3} do {
	_dist = player distance _startpos;
	if ( _dist > _distance and _dist < _maxdistance ) then {
		_msg = "<t size='0.75' color='#ff0000'>Вы выходитe из зоны подготовки! Остановитесь немедленно! </t>";
		[_msg, 0,0.25,3,0,0,27] spawn bis_fnc_dynamicText;

	};
	if (_dist > _maxdistance) then {
		player setVelocity [0,0,0];
		player setPos _startpos;
	};
	
	_aitems = assigneditems player;
	if ( (_uav_term select 0) in _aitems or (_uav_term select 1) in _aitems or (_uav_term select 2) in _aitems) then {
		{player unassignitem _x;} foreach _uav_term;
		_msg = "<t size='0.5' color='#ff0000'>UAV терминал будет доступен после старта игры!</t>";
		[_msg, 0,0.25,3,0,0,273] spawn bis_fnc_dynamicText;
	};
	
	sleep 0.75;

};

enableEngineArtillery true;


_aitems = (assigneditems player + items player);
if ( (_uav_term select 0) in _aitems or (_uav_term select 1) in _aitems or (_uav_term select 2) in _aitems) then {
		{player assignitem _x;} foreach _uav_term;
};

deleteMarkerLocal _mrk;
