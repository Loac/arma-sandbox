/*
  Author:
    ---

  Description:
    ---

  Global variables:
    ---

  Example:
    ---

  See:
    ---
*/

initClient = true;
initStep = "step1";

// Глобальный массив для хранения переменных в миссии.
variables = [
    [
        "players", // Массив с иигроками, сам не знаю зачем.
        []
    ],
    [
        "startZone", // Имя маркера, в котором стартует игра.
        ["START"]
    ]
];

// Состояние сервера.
serverStatus = "Initialization";

// Массив имен параметров в дополнение к массиву со значениями paramsArray.
params = [];

if (isServer) then {
	[] execVM "init\init_server.sqf";
};

if (not isDedicated) then {
	waitUntil { not isNull Player and isPlayer Player };

	[] execVM "init\init_client.sqf";


    //_null = player addAction ["Teleport", "dev_clickTeleport.sqf"];
};