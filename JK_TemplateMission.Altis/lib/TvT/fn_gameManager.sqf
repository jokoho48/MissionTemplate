// Set Time and End Mission After Time is Over
if !(isServer) exitWith {};

_this spawn {
    _time = missionNameSpace getVariable["JK_TvT_Time",10800];
    _sleepTime = _time / 4;
    _currentTime = _time;
    _minTime = _CurrentTime /60;
    waitUntil { sleep 10; JK_TvT_handler getVariable["JK_TvT_Starts",false] };
    [[format["Mission Timer Starts Now.<br/> You have %1 minutes to Mission End.", _minTime],0,0,2,2], "BIS_fnc_dynamicText", true, false, false] call BIS_fnc_MP;
    sleep _sleepTime;
    _currentTime = _currentTime - _sleepTime;
    _minTime = _CurrentTime /60/60;
    [[format["%1 Time is Left",floor(_minTime)],0,0,2,2], "BIS_fnc_dynamicText", true, false, false] call BIS_fnc_MP;
    sleep _sleepTime;
    _currentTime = _currentTime - _sleepTime;
    _minTime = _CurrentTime /60/60;
    [[format["%1 Time is Left",floor(_minTime)],0,0,2,2], "BIS_fnc_dynamicText", true, false, false] call BIS_fnc_MP;
    sleep _sleepTime;
    _currentTime = _currentTime - _sleepTime;
    _minTime = _CurrentTime /60/60;
    [[format["%1 Time is Left",floor(_minTime)],0,0,2,2], "BIS_fnc_dynamicText", true, false, false] call BIS_fnc_MP;
    sleep _sleepTime;
    [["Mission is End Now",0,0,2,2], "BIS_fnc_dynamicText", true, false, false] call BIS_fnc_MP;
    missionNameSpace setVariable ["JK_TvT_Ends",true];
};

_this spawn {
    waitUntil { sleep 10; JK_TvT_handler getVariable["JK_TvT_Ends", false] || (((JK_TvT_handler getVariable ["JK_TvT_Stored",[[],999]]) select 1) == (JK_TvT_handler getVariable ["JK_TvT_DoneCount",0])) };
    [[1,1],"fadeMusic",true,false,false] call BIS_fnc_MP;
    [{openMap false},"BIS_fnc_call"] call BIS_fnc_MP;
    _music = "LeadTrack01_F_Bootcamp";
    [_music,"playMusic",true,false,true] call BIS_fnc_MP;
    _takenByText = "";
    _winnerVar = [[JK_TvT_handler getVariable ["JK_TvT_WESTCount",0],"WEST"],[JK_TvT_handler getVariable ["JK_TvT_EASTCount",0],"EAST"],[JK_TvT_handler getVariable ["JK_TvT_GUERCount",0],"INDEPENDENT"]];
    _winnerVar sort false;
    _winnerText = "";
    _img1 = format["<img size= '4' shadow='false' image='a3\ui_f\data\map\Markers\Flags\%1_ca.paa'/>",["nato","csat","aaf"] select (["WEST","EAST","INDEPENDENT"] find ((_winnerVar select 0) select 1))];
    _img2 = format["<img size= '1.5' shadow='false' image='a3\ui_f\data\map\Markers\Flags\%1_ca.paa'/>",["nato","csat","aaf"] select (["WEST","EAST","INDEPENDENT"] find ((_winnerVar select 1) select 1))];
    _img3 = format["<img size= '1.5' shadow='false' image='a3\ui_f\data\map\Markers\Flags\%1_ca.paa'/>",["nato","csat","aaf"] select (["WEST","EAST","INDEPENDENT"] find ((_winnerVar select 2) select 1))];
    _winnerText = _winnerText + format ["<t size='.9' color='#FFFFFF'>The Winner is<br/>%2<br/>%1</t><br/>", _img1,(_winnerVar select 0) select 1];
    _winnerText = _winnerText + format ["<t size='.5' color='#FFFFFF'>The Second Place makes:<br/>%2<br/>%1</t><br/>", _img2, (_winnerVar select 1) select 1];
    _winnerText = _winnerText + format ["<t size='.5' color='#FFFFFF'>The Third place makes:<br/>%2<br/>%1</t><br/>", _img3, (_winnerVar select 2) select 1];
    {
        _img = "";
        _takenBy = _x getVariable ["JK_TvT_isTakenby",[ObjNull, CIVILIAN, "None"]];
        _takenByName = _takenBy select 3;
        _counts = _x getVariable ["JK_TvT_Count", 0];
        if (str(_takenBy select 1) == "CIV") then {
            _img = "<img size= '1' shadow='false' image='a3\ui_f\data\map\Markers\HandDrawn\objective_ca.paa'/>";
        } else {
            _img = format["<img size= '1' shadow='false' image='a3\ui_f\data\map\Markers\Flags\%1_ca.paa'/>",["nato","csat","aaf"] select ([WEST,EAST,INDEPENDENT] find (_takenBy select 1))];
        };
        _takenByText = _takenByText + format ["%2 <t size='1' color='#FFFFFF'>Base %1 Taken for %3 by %4</t><br/>", _counts, _img, _takenBy select 1, _takenBy select 2];
        false
    } count ((JK_TvT_handler getVariable["JK_TvT_Stored",[[],0]]) select 0);
    sleep 10;
    [{disableUserInput true},"BIS_fnc_call"] call BIS_fnc_MP;
    sleep 1;
    [[_winnerText,0,0,2,6], "BIS_fnc_dynamicText", true, false, false] call BIS_fnc_MP;
    sleep 10;
    [[_takenByText,0,0,2,2], "BIS_fnc_dynamicText", true, false, false] call BIS_fnc_MP;
    sleep 6;
    [{disableUserInput false},"BIS_fnc_call"] call BIS_fnc_MP;
    [["JKEnd"],"BIS_fnc_endMissionServer"] call BIS_fnc_MP;
};
