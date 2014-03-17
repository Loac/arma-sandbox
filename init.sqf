/*

*/

// Состояние сервера.
serverStatus = "Initialization";

initClient = true;
initStep = "step1";

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