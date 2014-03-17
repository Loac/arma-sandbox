/*
    Author:
        Dmitry Loac.

    Description:
        Load parameters from config file.
 */

private [
    "_value",
    "_name"
];

for "_index" from 0 to (count paramsArray) - 1 do {
    _name = configName ((missionConfigFile >> "Params") select _index);
    _value = paramsArray select _index;

    call compile format["%1 = %2", _name, _value];
};