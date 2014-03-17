/*
    Author:
        Dmitry Loac.

    Description:
        Загрузить имена переменных.

    Global variables:
        paramsArray
        params
 */

private [
    "_value",
    "_name"
];

for "_index" from 0 to (count paramsArray) - 1 do {
    _name = configName ((missionConfigFile >> "Params") select _index);
    _value = paramsArray select _index;

    params = params + [_name];
};