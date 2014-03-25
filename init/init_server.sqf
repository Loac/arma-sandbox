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

sleep 2;

// Загрузить параметры.
[] call sandbox_fnc_getParams;

[["serverStatus", "Params loaded."]] call sandbox_fnc_broadcast;