// Flags for early start.
blueReady = false;
redReady = false;

// Init server side.
if (isServer) then {
    // Set parameters.
    _handle = [] execVM "init\init_params.sqf"; waitUntil { scriptDone _handle };

    // Init freeze time.
    _null = execVM "init\init_freeze.sqf";
};

// Init client side.
if (not isDedicated) then {
    // Magic.
    waitUntil { not isNull Player and isPlayer Player };

    _null = execVM "init\init_clientRadio.sqf";
    _null = execVM "init\init_clientFreeze.sqf";
    // _null = execVM "init\init_clientFreezeByTrigger.sqf";
};