/*
    Author:
        Dmitry Loac.

    Description:
        Convert time to string fomat 00:00.

    See:
    	BIS_fnc_timeToString
*/

private [
	"_time"
];

_time = _this select 0;

_min = floor (_time / 60);
_sec = _time - (_min * 60);

if (_min > 9) then { _min = str(_min) } else { _min = "0" + str(_min) };
if (_sec > 9) then { _sec = str(_sec) } else { _sec = "0" + str(_sec) };

format["%1:%2", _min, _sec];