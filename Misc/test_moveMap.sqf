disableserialization;

openMap [true, false];
waitUntil { visibleMap };

_mapDisplay = findDisplay 12;
_mapCtrl = _mapDisplay displayCtrl 51;

_mapCtrl ctrlMapAnimAdd [3, 0.1, position player];
ctrlMapAnimCommit _mapCtrl;

// waitUntil { ctrlMapAnimDone _mapCtrl };