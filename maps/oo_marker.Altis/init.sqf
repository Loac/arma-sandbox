		call compilefinal preprocessFileLineNumbers "oo_marker.sqf";

		// create marker
		_mark = ["new", position player] call OO_MARKER;
		hint "create OO marker";

		sleep 2;

		// set text
		["SetText", "Player is here"] spawn _mark;

		hint "Set text";
		sleep 2;

		// set color
		["SetColor", "ColorRed"] spawn _mark;

		hint "Set red color";
		sleep 2;

		// set size
		["SetSize", [3,3]] spawn _mark;

		hint "Increase size";
		sleep 2;

		// set position
		["SetPos", position player] spawn _mark;

		hint "Set Pos to player pos";
		sleep 2;

		// set Alpha
		["SetAlpha", 1] spawn _mark;

		hint "Set Alpha to 1";
		sleep 2;

		// set Type
		["SetType", "mil_triangle"] spawn _mark;

		hint "Set Type to triangle";
		sleep 2;

		// set Brush
		["SetBrush", "Solid"] spawn _mark;
		
		hint "Set Brush";
		sleep 2;

		// attach marker to object
		["Attach", player] spawn _mark;

		hint "Attach marker to player";
		sleep 2;

		// blink marker each x seconds
		["Blink", 0.5] spawn _mark;

		hint "Blink marker";
		sleep 5;

		// unblink marker
		["UnBlink"] spawn _mark;

		// detach marker
		["Detach"] spawn _mark;

		hint "UnBlink & detach marker";
		sleep 5;

		// Fadeoff marker in x seconds
		["Fadeoff", 5] spawn _mark;

		hint "Fade off";
		sleep 5;

		// Fadein marker in x seconds
		["Fadein", 5] spawn _mark;

		hint "Fade in";
		sleep 5;

		hint "Delete marker";
		// delete marker
		["delete", _mark] call OO_MARKER;