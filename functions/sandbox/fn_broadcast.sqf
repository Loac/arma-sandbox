/*
    Author:
        Dmitry Loac.

    Description:
        Send public variables to all clients.

    See:
        setVariable
        publicVariable

    Example:
        [["missionComplete", true], ["blueTimer", 0]] call rqf_fnc_broadcast;
*/

private [
    "_name",
    "_value"
];

{
    _name = _x select 0;

    // If variable with value, we must change it.
    if (count _x > 1) then {
        _value = _x select 1;

        missionNamespace setVariable [_name, _value];
    };

    // Broadcast variable.
    publicVariable _name;

} forEach _this;