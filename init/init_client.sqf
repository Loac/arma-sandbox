/*
    Author:
        Dmitry Loac.
*/

// Switch off screen player.
["off"] call sandbox_fnc_fade;

_index = 0;

waitUntil {

    switch (initStep) do {
        case "step1": {};
        case "terminate": { };
    };

    initStep = "";
    _index = _index + 1;

    sleep 0.5;
    hint format ["%1", serverStatus];

    not initClient;
};

["in"] call sandbox_fnc_fade;