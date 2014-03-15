// v1h PLAYER TAGS BY [STELS]ZEALOT

if (isDedicated) exitWith {};
waituntil{sleep 0.5; player == player};

_friendlysides = ([playerSide] call BIS_fnc_friendlySides) - [civilian];
_show = false;

zlt_headcount = [];
zlt_tag_killer = "";

zlt_tag_prepareStat = {
	private "_txt";
	_txt = "";
	_txt = _txt + "Вы убиты: " + zlt_tag_killer + "<br/>";
	{
		if ( _foreachindex == 0 ) then {_txt = _txt + "Вы убили:<br/>"};
		_txt = _txt + _x + "<br/>";
	} foreach zlt_headcount;
	_txt;	
};


player setvariable ['zlt_playertag', name player, true];

player addAction ["<t color='#FF9900'>Опознать тело</t>",{
	[ format["<t size='1' font='PuristaMedium' color='#ffff00' shadow = 2>%1</t>", cursortarget getvariable ['zlt_playertag','Неизвестный солдат'] ], 0,0.55,3,0,0,412] spawn bis_fnc_dynamicText;
},[],-1,false,true,"",'cursorTarget isKindOf "CAManBase" and {not alive cursorTarget} and {cursorTarget distance player < 10}'];  

player addEventHandler ['Killed',{
	_unit = _this select 0;
	_killer = _this select 1;
	_nm = name (_killer);
	if ( _nm == "" or _nm == "Error: No vehicle" or _nm == "Error: No unit") then {_nm = "Неизвестным"};
	zlt_tag_killer = _nm;
	if (not isnil '_killer' and {not isnull _killer}) then{
		_unitname = _unit getVariable ["zlt_playertag",""];
		[ [ [_unitname], {
			zlt_headcount = zlt_headcount + [_this select 0] ; 
		} ],"bis_fnc_spawn",_killer] call bis_fnc_mp;
	};

	[_nm] spawn {
		_nm = _this select 0;
		sleep 1.;
		_txt = ([] call zlt_tag_prepareStat);

		player createDiarySubject ["Статистика","Статистика"];
		player createDiaryRecord ["Статистика",["Статистика", _txt]];



		(findDisplay 46) displayAddEventHandler ["KeyDown",
		 "if (((_this select 1) == 207) and !(_this select 2) and !(_this select 3) and !(_this select 4)) then
		  { [ format[""<t size='0.75' font='PuristaMedium' color='#ffff00' shadow = 2>%1</t>"",[] call zlt_tag_prepareStat ], 0,0.5,10,0,0,4120 ] spawn bis_fnc_dynamicText;true};"];



	};

	//[ format["<t size='0.5' font='PuristaMedium' color='#ffff00' shadow = 2>%1 %2</t>","Вы убиты:" , _nm  ], 0,1,16,0,0,4120 ] spawn bis_fnc_dynamicText;
	
}];

while {true} do {
	if ( not isnull cursortarget and {cursorTarget distance player < 10} and {side cursorTarget in _friendlysides} 
		and {alive cursorTarget} 
		and {name cursortarget != "Error: No unit"} 
		and {not visibleMap}) then {
		[ format["<t size='0.5' font='PuristaMedium' color='#dfd7a5' shadow = 2>%1</t>", name cursortarget ], 0,0.55,0.5,0,0,412] spawn bis_fnc_dynamicText;
		_show = true;
	};
	sleep 0.5;
	if (_show) then {
		_show = false;
		[ "", 0,0.55,0.5,0,0,412] spawn bis_fnc_dynamicText;

	};
};















