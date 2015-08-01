// Take Point
params ["_target","_side"];

if (_side == WEST) then {
    call Compile format["[['marker%1','Base %1'], 'setMarkerTextLocal',true,true,true] call BIS_fnc_MP; [['marker%1','ICON'],'setMarkerShapeLocal',true,true,true] call BIS_fnc_MP; [['marker%1','ColorWhite'],'setMarkerColorLocal',true,true,true] call BIS_fnc_MP; [['marker%1','flag_NATO'],'setMarkerTypeLocal',true,true,true] call BIS_fnc_MP;", _target getVariable["JK_TvT_Count", 1]];
    [[format["TaskBaseWEST%1",_target getVariable["TvTCount", 1]],"succeeded"], "FHQ_TT_setTaskState", false, false, true] call BIS_fnc_MP;
    [[format["TaskBaseEAST%1",_target getVariable["TvTCount", 1]],"failed"], "FHQ_TT_setTaskState", false, false, true] call BIS_fnc_MP;
    [[format["TaskBaseGUER%1",_target getVariable["TvTCount", 1]],"failed"], "FHQ_TT_setTaskState", false, false, true] call BIS_fnc_MP;
};
if (_side == EAST) then {
    call Compile format["[['marker%1','Base %1'], 'setMarkerTextLocal',true,true,true] call BIS_fnc_MP; [['marker%1','ICON'],'setMarkerShapeLocal',true,true,true] call BIS_fnc_MP; [['marker%1','ColorWhite'],'setMarkerColorLocal',true,true,true] call BIS_fnc_MP; [['marker%1','flag_CSAT'],'setMarkerTypeLocal',true,true,true] call BIS_fnc_MP;", _target getVariable["JK_TvT_Count", 1]];
    [[format["TaskBaseWEST%1",_target getVariable["TvTCount", 1]],"failed"], "FHQ_TT_setTaskState", false, false, true] call BIS_fnc_MP;
    [[format["TaskBaseEAST%1",_target getVariable["TvTCount", 1]],"succeeded"], "FHQ_TT_setTaskState", false, false, true] call BIS_fnc_MP;
    [[format["TaskBaseGUER%1",_target getVariable["TvTCount", 1]],"failed"], "FHQ_TT_setTaskState", false, false, true] call BIS_fnc_MP;
};
if (_side == INDEPENDENT) then {
    call Compile format["[['marker%1','Base %1'], 'setMarkerTextLocal',true,true,true] call BIS_fnc_MP; [['marker%1','ICON'],'setMarkerShapeLocal',true,true,true] call BIS_fnc_MP; [['marker%1','ColorWhite'],'setMarkerColorLocal',true,true,true] call BIS_fnc_MP; [['marker%1','flag_AAF'],'setMarkerTypeLocal',true,true,true] call BIS_fnc_MP;", _target getVariable["JK_TvT_Count", 1]];
    [[format["TaskBaseWEST%1",_target getVariable["TvTCount", 1]],"failed"], "FHQ_TT_setTaskState", false, false, true] call BIS_fnc_MP;
    [[format["TaskBaseEAST%1",_target getVariable["TvTCount", 1]],"failed"], "FHQ_TT_setTaskState", false, false, true] call BIS_fnc_MP;
    [[format["TaskBaseGUER%1",_target getVariable["TvTCount", 1]],"succeeded"], "FHQ_TT_setTaskState", false, false, true] call BIS_fnc_MP;
};
[_this, "JK_TvT_fnc_UpdateStats", false, true] call BIS_fnc_MP;
