/*
    Author:
        Dmitry Loac.

    Description:
        Получить значение параметра по его имени.

    Global variables:
        paramsArray
        params
*/

private [
    "_index"
];

// Найти индекс нужного параметра в массиве со значениями.
_index = params find (_this select 0);

// Если индекс найден.
if (_index > -1) then {
    // Вернуть значение.
    paramsArray select _index;
}
else {
    // Если такой переменной нет, вернуить "ничто".
    nil;
};
