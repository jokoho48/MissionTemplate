/*
    Author: joko // Jonas

    Description:

    Parameter(s):
     0: Base Text as String
     1: Target as Boolean or Object or Array
    Returns:
    - Nothing
*/
params ["_text"];
_text = "Enhanced Mission Protections System: " + _text;
[_text, {
    params ["_text"];
    hint _text;
    systemChat _text;
},_this select 1, true, false] BIS_fnc_MP;
[_text, "BIS_fnc_log", false, true, false] BIS_fnc_MP;
