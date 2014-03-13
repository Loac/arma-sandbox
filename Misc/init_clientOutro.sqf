/*
    Author:
        Dmitry Loac.

    Description:
        Wait global variable "completeMission" for initialize of end mission.

    External variables:
        completeMission

    See:
        playerSide
        side group player
        BIS_fnc_MP
*/

"completeMission" addPublicVariableEventHandler {
    _completeMission = _this select 1;

    switch (_completeMission) do {

        case "blueHoldTarget" : {
            switch (playerSide) do {
                case west: { ["win_blueHoldTarget", true, true] call BIS_fnc_endMission };
                case east: { ["lose_blueHoldTarget", false, true] call BIS_fnc_endMission };
            };
        };

        case "redHoldTarget" : {
            switch (playerSide) do {
                case west: { ["lose_redHoldTarget", false, true] call BIS_fnc_endMission };
                case east: { ["win_redHoldTarget", true, true] call BIS_fnc_endMission };
            };
        };

        case "blueDominate" : {
            switch (playerSide) do {
                case west: { ["win_blueDominate", true, true] call BIS_fnc_endMission };
                case east: { ["lose_blueDominate", false, true] call BIS_fnc_endMission };
            };
        };

        case "redDominate" : {
            switch (playerSide) do {
                case west: { ["lose_redDominate", false, true] call BIS_fnc_endMission };
                case east: { ["win_redDominate", true, true] call BIS_fnc_endMission };
            };
        };

    };
};