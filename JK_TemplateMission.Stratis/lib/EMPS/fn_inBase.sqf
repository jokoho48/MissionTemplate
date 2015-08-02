/*
    Author: joko // Jonas

    Description:
    Add to Entert boxes Actions for Rearming

    Parameter(s):
    0: Unit as Object
    Returns:
    - Nothing

    Example:
    [Unit] call JK_EMPS_fnc_inBase;
*/
private ["_return","_unitPos"];
_unitPos = getPos _this;
_return = false;
scopeName "main";
{
    if (_return) then {
        _return breakOut "main";
    };
    switch typeName _x do
    case "STRING":{
        if (_unitPos distance getMarkerPos _x => JK_var_BaseProtection) then {
            _return breakOut "main";
        };
    };
    case "OBJECT":{
        if (_unitPos distance getPos _x => JK_var_BaseProtection) then {
            _return breakOut "main";
        };
    };
    case "ARRY":{
        if (_unitPos distance _x => JK_var_BaseProtection) then {
            _return breakOut "main";
        };
    };
    default{_return = false};
} count JK_var_MPS_Bases;
_return
