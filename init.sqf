if (isServer) then {

};


if (not isDedicated) then {
	waitUntil { not isNull Player and isPlayer Player };

    _null = player addAction ["Teleport", "dev_clickTeleport.sqf"];
};