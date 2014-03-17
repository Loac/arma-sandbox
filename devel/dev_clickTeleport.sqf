/*
    Description:
        Initialisation teleport by click on map.

    Example:
        _null = player addAction ["Teleport", "devel\dev_clickTeleport.sqf"];
*/

openMap [true, false];

onMapSingleClick {
    player setPos _pos;
    openMap [false, false];
    onMapSingleClick {};
};