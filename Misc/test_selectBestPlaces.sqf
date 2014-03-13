// usage: _null = [] execvm "rqf\functions\debug2.sqf"
// http://forums.bistudio.com/showthread.php?93897-selectBestPlaces-(do-it-yourself-documentation)

_places = selectBestPlaces [position player, 25, "meadow", 1, 50];

_i = 0;
{
    _marker = ["MARK11ER1" + str(_i), _x select 0, [["type", "mil_dot"]]] call rqf_createMarker;
    _i = _i + 1;
} forEach _places;
