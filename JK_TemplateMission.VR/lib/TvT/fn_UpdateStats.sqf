


params["_name","_target","_side"]
//Show Update Stats
_text = format["<img size= '3' shadow='false' image='a3\ui_f\data\map\Markers\Flags\%1_ca.paa'/><br/>",["nato","csat","aaf"] select ([WEST,EAST,INDEPENDENT] find (_this select 2))];
_text = _text + format ["%1 has Taken Base %2", name _name, _target getVariable["JK_TvT_Count",1]];
if (playerside == _side) then {
    _text = _text + " for Your Team";
} else {
    _text = _text + format[" for %1", _side];
};
[_text] spawn {
    waitUntil { !JK_TvT_takePointWork };
    JK_TvT_takePointWork = true;
    publicVariable "JK_TvT_takePointWork";
    [[_this select 0,0,0,2,2], "BIS_fnc_dynamicText", true, false, false] call BIS_fnc_MP;
    sleep 10;
    JK_TvT_takePointWork = false;
    publicVariable "JK_TvT_takePointWork";
};
