/*
  Author:
    ---

  Description:
    ---

  Global variables:
    ---

  Example:
    ---

  See:
    ---
*/

// Во время инициализации игрок ничего не должен видеть.
// ["off"] call sandbox_fnc_fade;


_index = 0;

waitUntil {

    switch (initStep) do {
        case "step1": {};
        case "terminate": {};
    };

    initStep = "";
    _index = _index + 1;

    sleep 0.5;
    hint format ["%1", serverStatus];

    not initClient;
};
//execVM "A3\Missions_F_EPA\Campaign_shared\Scripts\zoneRestriction_warn_A.sqf"
//execVM "A3\Missions_F_EPA\Campaign_shared\Scripts\zoneRestriction_punish_A.sqf"


[format ["%1_blackScreen", missionName], false] call BIS_fnc_blackOut; enableRadio false; BIS_inf enableSimulation false; format ["%1_disabledSave", missionName] call BIS_fnc_disableSaving

["in"] call sandbox_fnc_fade;


 // this setCaptive true; {this disableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"]; removeAllWeapons this; removeAllAssignedItems this; removeAllItems this; this unlinkItem "NVGoggles"; removeHeadgear this; removeGoggles this; this setBehaviour "CARELESS"; this setCombatMode "BLUE";
 // this attachTo [BIS_logic1, [0,0,0]]