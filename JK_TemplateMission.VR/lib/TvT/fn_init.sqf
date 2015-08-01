private["_fnc_createTaskArray"];
if (isServer) then {JK_TvT_setvar = false; publicVariable "JK_TvT_setvar"; JK_TvT_takePointWork = false; publicVariable "JK_TvT_takePointWork"; JK_TvT_handler = "Land_HelipadEmpty_F" createVehicle [0,0,0];};
_count = 0;
_fnc_createTaskArray = {
    _taskParameter = [];
    {
        _pushbackParams = [_x,(format["TakeBase&1%2",_x,_count]), (format[localize "STR_JK_TVT_TAKEBASESHORT",_count]),(format[localize "STR_JK_TVT_TAKEBASELONG",_x,_count]),"DESTROY",(format["marker%1", _count])];
        _taskParameter append _pushbackParams;
        diag_log str(_taskParameter);
        false
    } count [WEST,EAST,INDEPENDENT];
    _taskParameter
};

{
    _count = _count + 1;
    [
        (format [localize "STR_JK_TVT_TAKEPOINT", _count]),
        _x,
        5,
        "!(_target getVariable['JK_TvT_isTaken',false]) && alive _target",
        {
            _target = _this select 0;
            _target setVariable["JK_TvT_isTaken",true,true];
            _target setVariable["JK_TvT_isTakenby",[player, playerSide, name player], true];
            [player, _target, playerSide] call JK_TvT_fnc_takePoint;
            0 spawn {
                waitUntil { !JK_TvT_setvar };
                JK_TvT_setvar = true;
                publicVariable "JK_TvT_setvar";
                JK_TvT_handler setVariable ["JK_TvT_DoneCount", ((JK_TvT_handler getVariable ["JK_TvT_DoneCount",0]) + 1),true];
                JK_TvT_handler setVariable [format["JK_TvT_%1Count", playerside], ((JK_TvT_handler getVariable [format["JK_TvT_%1Count", playerside], 0]) + 1),true];
                JK_TvT_handler setVariable ["JK_TvT_DoneCount", (JK_TvT_handler getVariable ["JK_TvT_DoneCount",0]) + 1,true];
                JK_TvT_setvar = false;
                publicVariable "JK_TvT_setvar";
            };
        }
    ] call JK_Core_fnc_Interaction_addAction;
    _x setVariable["JK_TvT_Count", _count, true];
    _x setVariable["JK_TvT_isTakenby",[ObjNull, civilian, "None"],true];
    call Compile format["_marker%2 = createMarker ['marker%2',position %1]; 'marker%2' setMarkerText 'Base %2'; 'marker%2' setMarkerShape 'ICON'; 'marker%2' setMarkerColor 'ColorWhite'; 'marker%2' setMarkerType 'hd_objective';", _x , _count];


    [(call _fnc_createTaskArray),"FHQ_TT_addTasks",true,false,false] call BIS_fnc_MP;

    false
} count _this;

_this call JK_TvT_fnc_gameManager;
JK_TvT_handler setVariable["JK_TvT_Stored",[_this,_count],true];
diag_log format["%1 Bases Created", _count];
