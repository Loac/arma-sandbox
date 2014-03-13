/*
    Description:
        Load parameters from config file.

    Can compile "code" from params:
    class sideTimer
    {
        title = "Hold time positions";
        values[] = { 10, 30, 60, 90, 120 };
        texts[] = { "00:10", "00:30", "01:00", "01:30", "02:00" };
        default = 10;
        code = "blueTimer = %1; redTimer = %1;";
    };
*/

private [
    "_index",
    "_name",
    "_value",
    "_code"
];

for "_index" from 0 to (count paramsArray) - 1 do {
    _name = configName ((missionConfigFile >> "Params") select _index);

    if (not isNil "paramsArray") then {
        _value = paramsArray select _index;
    }
    else {
        _value = getNumber (missionConfigFile >> "Params" >> _name >> "default");
    };

    _code = getText (missionConfigFile >> "Params" >> _name >> "code");

    if (_code == "") then {
        _code = _name + " = %1";
    };

    call compile format[_code, _value];
};