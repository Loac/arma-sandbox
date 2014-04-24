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

if (isServer) then {
	[] execVM "init\init_server.sqf";
};

if (not isDedicated) then {
	[] execVM "init\init_client.sqf";
};