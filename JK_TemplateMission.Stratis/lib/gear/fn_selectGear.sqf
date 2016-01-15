/*
    Author: joko // Jonas

    Description:
    Take Unit and String and Call it

    Parameter(s):
    0: Unit
    1: Class as String
    Returns:
    - Nothing

    Example:
    [player,"GearName"] call JK_loadOut_fnc_selectGear;
*/
params["_unit", "_class"];

if (rating _unit >= 400) then {
    _unit addrating (floor (rating - 600)));
};
_side = side _unit;
if !(str(_side) in ["WEST","EAST","GUER"]) then {
    _side = playerSide;
    if !(str(_side) in ["WEST","EAST","GUER"]) then {
        _side = "WEST";
    };
};
_varName = format ["jk_loadOut_fnc_%1%2", _class, _side];
_fnc = missionNamespace getVariable _varName;
if (isNil _varName) then {
    _fnc = {hint 'Critical Error'};
};
[_unit] call _fnc;

if !(isNil 'JK_respawn_EVH') then {
    _unit removeEventHandler ['Respawn',JK_respawn_EVH];
};
JK_fnc_respawnFunction = _fnc;
JK_respawn_EVH = _unit addEventhandler['Respawn',{
    if !((_this select 0) getVariable ['BIS_revive_incapacitated',true]) then {
        _this call JK_fnc_respawnFunction;
    };
}];
