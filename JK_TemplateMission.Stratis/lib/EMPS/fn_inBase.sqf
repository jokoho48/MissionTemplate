/*
    Author: joko // Jonas

    Description:
    Add to Entert boxes Actions for Rearming

    Parameter(s):
    0: Unit as Object
    Returns:
    - Boolean if player is in a Base

    Example:
    Unit call JK_EMPS_fnc_inBase;
*/
private "_unitPos";
_unitPos = getPos _this;
scopeName "main";
{
    switch typeName _x do {
    case "STRING":{
        if (_unitPos distance getMarkerPos _x => JK_var_BaseProtectionDistance) then {
            true breakOut "main";
        };
    };
    case "OBJECT":{
        if (_unitPos distance getPos _x => JK_var_BaseProtectionDistance) then {
            true breakOut "main";
        };
    };
    case "ARRY":{
        if (_unitPos distance _x => JK_var_BaseProtectionDistance) then {
            true breakOut "main";
        };
    };
} count JK_var_MPS_Bases;
false
