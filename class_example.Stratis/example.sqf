_sayer = call Sayer_fnc_new;

for "_i" from 1 to 10 do {
    _count = [_sayer, "count"] call Sayer_fnc_get;
    [_sayer, format ["Hello (%1)", _count]] call Sayer_fnc_say;
    sleep 1;
};