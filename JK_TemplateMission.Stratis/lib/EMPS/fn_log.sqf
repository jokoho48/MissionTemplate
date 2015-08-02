/*
    Author: joko // Jonas

    Description:

    Parameter(s):
     0: Base Text as String
     1: Target as Boolean or Object or Array
    Returns:
    - Nothing
*/
_text = _this  select 0;
_text = "Enhanced Mission Protections System: " + _text;
[_text,{
    private "_text";
    _text = _this select 0;
    hint _text;
    systemChat _text;
},_this select 1, true, false] BIS_fnc_MP;
[_text, "BIS_fnc_log", false, true, false] BIS_fnc_MP;
