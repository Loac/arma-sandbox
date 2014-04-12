_passedPos = _this select 0;
_color = _this select 1;

_mrk = createMarker [(format["%1",_passedPos]), _passedPos];
_mrk setMarkerColor (_color);
_mrk setMarkerBrush "Solid";
_mrk setMarkerShape "ELLIPSE";
_mrk setMarkerSize [1,1];