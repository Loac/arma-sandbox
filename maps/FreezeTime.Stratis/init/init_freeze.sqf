/*
    Author:
        Dmitry Loac.
*/

// Init freeze timer.
waitUntil {
	// Decrease value timer.
    freezeTime = freezeTime - 1;
    publicVariable "freezeTime";

    // Skip freeze time if both sides agree.
    if (freezeTime > 5 and blueReady and redReady) then {
    	freezeTime = 5;
    	publicVariable "freezeTime";
    };

    sleep 1;

    // Wait for timer is over or both sides is ready.
    freezeTime < 0;
};