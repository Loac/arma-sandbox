private [
	"_startMarker"
];

// Get marker of start position.
switch (playerSide) do {
    case west: { _startMarker = "FREEZE" };
};

// Get marker parameters.
_freezePosition = getMarkerPos "FREEZE";
_freezeRange = (getMarkerSize "FREEZE") select 0;

// Show timer.
_null = execVM "ui\ui_freezeTimer.sqf";

// Set freeze trigger.
_trigger = createTrigger["EmptyDetector", _freezePosition];
_trigger setTriggerArea[_freezeRange, _freezeRange, 0, false];
_trigger setTriggerActivation["WEST", "PRESENT", true];
_trigger setTriggerStatements["freezeTime > 0", "blueHold = true", "blueHold = false"];
_trigger triggerAttachVehicle [player];