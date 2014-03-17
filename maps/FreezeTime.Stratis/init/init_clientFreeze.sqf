/*
    Author:
        Dmitry Loac.

    Description:
        Client side procedures in freeze time.
*/

private [
    "_playerPosition",
    "_freezeMarker",
    "_freezePosition",
    "_freezeRange",
    "_freezeDir"
];

/*
    Control player position.
*/

// Get marker of start position.
switch (playerSide) do {
    case west: { _freezeMarker = "BLUESTART" };
    case east: { _freezeMarker = "REDSTART" };
};

// Get marker parameters.
_freezePosition = getMarkerPos _freezeMarker;
_freezeRange = (getMarkerSize _freezeMarker) select 0;

// Show timer.
_null = execVM "ui\ui_freezeTimer.sqf";

// Wait freezeTime is over.
waitUntil {
    _playerPosition = position player;

    // If player leave of the freeze area.
    if (_playerPosition distance _freezePosition > _freezeRange) then {

        // Fade out screen.
        cutText ["Please, wait to start mission.", "BLACK OUT", 0.5];

        // Wait fade out, before set position.
        sleep 1;

        // Get direction to center of start position.
       _freezeDir = ([_playerPosition, _freezePosition] call bis_fnc_dirTo);

       // Move player back.
        player setPos [
            ((_freezePosition select 0) + (sin (_freezeDir + 180)) * (_freezeRange - 10)),
            ((_freezePosition select 1) + (cos (_freezeDir + 180)) * (_freezeRange - 10)),
            0
        ];

        // Fade in screen.
        cutText ["", "BLACK IN", 0.5];
    };

    // No need to a lot of checks.
    sleep 1;

    freezeTime < 0;
};