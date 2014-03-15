// by [STELS]Zealot
//Общие функции

// zlt_fnc_endmission
// Функция завершает игру на клиенте, на котором запущена.
// Выводит сообщение на весь экран.
// Если в параметрах есть сторона, то сообщение выводит цветом данной стороны.
// Параметры: TBD
// Типичное использование в триггере:
// [west, "Запад победил!"] call zlt_fnc_endmission;


// zlt_fnc_localtasknotify
// Функция отмечаюет зону на карте как захваченную или маркер как уничтоженный и выводит сообщение.
// Если в параметрах есть сторона, то сообщение выводит цветом данной стороны и зона окрашивает в соответсвующий цвет.
// Параметры: TBD
// Типичное использование в триггере:
// [west, "Запад захватил радиовышку!", ["Zone1"]] call zlt_fnc_localtasknotify;
// [west, "Запад уничтожил танк!", ["TankMarker1"]] call zlt_fnc_localtasknotify;
// [east, "VIP убит агентами CSAT!"] call zlt_fnc_localtasknotify;

zlt_fnc_createtrigger = {
	private ["_pos","_isrectangle","_dir","_size","_tb","_timeout","_by","_type","_condition","_activation","_deactivation","_vehicle"];	
	_tb = [_this, 0, false ] call BIS_fnc_param;
	_timeout = [_this, 1, 3 ] call BIS_fnc_param;
	/* Side': "EAST", "WEST", "GUER", "CIV", "LOGIC", "ANY"
	* Radio: "ALPHA", "BRAVO", "CHARLIE", "DELTA", "ECHO", "FOXTROT", "GOLF", "HOTEL", "INDIA", "JULIET"
	* Object: "STATIC", "VEHICLE", "GROUP", "LEADER", "MEMBER"
	* Status: "WEST SEIZED", "EAST SEIZED" or "GUER SEIZED" */
	_by = [_this, 2, "ANY" ] call BIS_fnc_param;
	/* Presence: "PRESENT", "NOT PRESENT"
	Detection: "WEST D", "EAST D", "GUER D" or "CIV D" */
	_type = [_this, 3, "PRESENT" ] call BIS_fnc_param;
	_condition = [_this, 4, "this" ] call BIS_fnc_param;
	_activation = [_this, 5, "" ] call BIS_fnc_param;
	_deactivation = [_this, 6, "" ] call BIS_fnc_param;
	_text = [_this, 7, "" ] call BIS_fnc_param;
	_pos = [_this, 8, [0,0]] call BIS_fnc_param;
	_isrectangle = [_this, 9, true] call BIS_fnc_param;
	_dir = [_this, 10, 0] call BIS_fnc_param;
	_size = [_this, 11, [50,50] ] call BIS_fnc_param;
	_vehicle = [_this, 12, objNull ] call BIS_fnc_param;
	_trg=createTrigger["EmptyDetector",_pos];
	_trg setTriggerArea[_size select 0,_size select 1,_dir,_isrectangle];
	_trg setTriggerActivation[_by,_type,_tb];
	_trg setTriggerTimeout [_timeout, _timeout, _timeout, true ];
	_trg setTriggerText _text;
	if (_condition != "" ) then {	
		_trg setTriggerStatements[_condition,_activation,_deactivation];
	};
	if (not isNull(_vehicle) ) then {
		_trg triggerAttachVehicle [_vehicle];
	};
	_trg;
};

zlt_fnc_createmarkerlocal = {
	private ["_marker","_pos","_shape","_type","_text","_color","_dir","_brush","_size"];
	_marker = [_this, 0, "mrk"] call BIS_fnc_param;
	_pos = [_this, 1, [0,0]] call BIS_fnc_param;
	_text = [_this, 2, ""] call BIS_fnc_param;
	_color = [_this, 3, "ColorOrange"] call BIS_fnc_param;
	_type = [_this, 4, "mil_dot"] call BIS_fnc_param;
	_size = [_this, 5, [1,1] ] call BIS_fnc_param;
	_shape = [_this, 6, "ICON"] call BIS_fnc_param;
	_dir = [_this, 7, 0] call BIS_fnc_param;
	_brush = [_this, 8, "Solid"] call BIS_fnc_param;
	createMarkerLocal[_marker, _pos];
	_marker setMarkerShapeLocal _shape;
	_marker setMarkerTypeLocal _type;
	_marker setMarkerTextLocal _text;
	_marker setMarkerColorLocal _color;
	_marker setMarkerDirLocal _dir;
	_marker setMarkerBrushlocal _brush;
	_marker setMarkerSizelocal _size;
	_marker setMarkerPosLocal _pos;
	_marker;
};

zlt_fnc_endmission = {
	private ["_txt","_side","_text"];
	_text = "";
	for "_x" from 0 to (count _this)-1 do {
		_a = _this select _x;
		switch true do {
			case (typeName _a == typeName west) : {_side = _a;};
			case (typeName _a == typeName "") : {_text = _a};
		};
	};
	if (isNil {zlt_mutex_endmission}) then {
		zlt_mutex_endmission = false;
	};
	if (not zlt_mutex_endmission) then {
		if (not isNil{_side} and _text == "") then {
			_text = format["%1 победили!", [_side] call BIS_fnc_sideName];
		};
		_winner = true; _tcolor = '#ffffff';
		if (not (isNull player) and not isNil {_side}) then {_winner = ([_side, playerSide] call BIS_fnc_areFriendly);};
		zlt_mutex_endmission = true;
		if (not isNil {_side}) then {_tcolor = [_side] call bis_fnc_sidecolor call BIS_fnc_colorRGBtoHTML; };
		_txt  = format["<t size='2' color='%2'>%1</t>",_text,_tcolor];
		[_txt, 0,0,20,0,0,53] spawn bis_fnc_dynamicText;
		["End5", _winner, 7] call BIS_fnc_endMission;
	};
};

zlt_fnc_localtasknotify = {
	private ["_side","_text","_markers","_mcolor","_tcolor","_playerside","_notifyType","_brush","_size"];
	_side = civilian;
	_text = "";
	_markers = [] ;
	for "_x" from 0 to (count _this)-1 do {
		_a = _this select _x;
		switch true do {
			case (typeName _a == typeName west) : {_side = _a;};
			case (typeName _a == typeName "") : {_text = _a};
			case (typeName _a == typeName []) : {_markers = _a};
		};
	};
		
	_mcolor = [_side, true] call bis_fnc_sidecolor;
	_tcolor = [_side] call bis_fnc_sidecolor call BIS_fnc_colorRGBtoHTML ;
	hint composeText [parsetext format["<t size='1' align='center' color='%2'>%1</t>",_text,_tcolor]];
	_playerside = if (isNull player ) then {_side} else {playerSide};
	_notifyType = if ( [_playerSide ,_side] call BIS_fnc_areFriendly ) then {"TaskSucceeded"} else {"TaskFailed"};
	[_notifyType,[0, _text]] call bis_fnc_showNotification;
	{
		switch (markerSHape _x) do {
			case ("ICON") : {
				["destroyed"+str(time)+str(_x),getMarkerPos _x, "", _mcolor, "mil_objective" ] call zlt_fnc_createmarkerlocal;
			};
			default {
				_x setMarkerColorLocal _mcolor;
			};
		};
	} foreach _markers;
};

zlt_fnc_srvprocessmarker = {
	if (isServer) then {
		[_this,"zlt_fnc_processmarker" ] call BIS_fnc_MP;
	};

};

zlt_fnc_srvendmission = {
	if (isServer) then {
		[_this,"zlt_fnc_endmission" ] call BIS_fnc_MP;
	};
};

zlt_fnc_processmarker = {
	_this call zlt_fnc_localtasknotify;
};

