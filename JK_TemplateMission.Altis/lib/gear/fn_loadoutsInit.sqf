/*
loadout script by joko
Idea by Belbo
adds the loadouts to the specific playable units for the side West
Call from initPlayerLocal.sqf via:
[Object,true,1] call JK_loadOut_fnc_loadoutsInit;
    with
    _this select 0 = object - target the loadout is applied to.
    _this select 1 = integer - if 1 gear will be saved, if 2 unit will respawn with it's original loadout.
*/

///// No editing necessary below this line /////
params [["_target", player, [objNull]]];

//call for the loadout function
[_target] call jk_loadOut_fnc_applyLoadout;
JK_var_ChooseLoadout_Boxes call jk_loadOut_fnc_chooseLoadout;
if (true) exitWith {};
