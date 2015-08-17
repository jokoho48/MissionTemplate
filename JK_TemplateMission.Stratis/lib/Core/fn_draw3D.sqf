_playerPos = positionCameraToWorld [0, 0, 0];
_targets = _playerPos nearObjects ["Man", 13.3];
if (!surfaceIsWater _playerPos) then {
    _playerPos = ATLtoASL _playerPos;
};

{
    _target = effectiveCommander _x;
    _targetSide = (_target getVariable ["jk_var_side","CIV"]);
    if (!(_x in allUnitsUAV) && isPlayer _target && (_target != player || JK_Debug) && alive player && (str(playerside) == _targetSide || "CIV" == _targetSide || str(playerside) == "CIV")) then {
        _targetPos = visiblePositionASL _target;
        _distance = _targetPos distance _playerPos;
        _headPosition = _target modelToWorldVisual (_target selectionPosition "pilot");
        _icon = format ["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x];
        _alpha = ((1 - 0.2 * (_distance - 8) min 1) * 0.8) max 0;
        _isInGroup = (group _target == group player);
        if (lineIntersects [_playerPos, _targetPos vectorAdd [0,0,1], vehicle player, _target]) exitWith {};

        _color = if (_isInGroup) then {
            _tempColor = [
                [1,1,1,_alpha],//Main
                [1,0,0.1,_alpha],//Red
                [0.1,1,0,_alpha],//Green
                [0.1,0,1,_alpha],//Blue
                [1,1,0.1,_alpha]//Yellow
            ] select (["MAIN","RED","GREEN","BLUE","YELLOW"] find assignedTeam _target);
            _tempColor
        } else {
            [0.77, 0.51, 0.08, _alpha]
        };

        _text = name _target;
        if (_target in (missionNamespace getVariable ["BIS_revive_units", []])) then {
            _icon = "\A3\Ui_f\data\IGUI\Cfg\Cursors\unitbleeding_ca.paa";
            _text = _text + " (Unconscious)";
        } else {
            _text1 = call {
                if (_isInGroup) then {
                    if (str(_target) in ["GM1","GM2"]) exitWith {"Zeus"};
                    if (str(_target) in ["Bopz","Iopz","Oopz"]) exitWith {"Operationsführung"};
                    if (str(_target) in ["Bpilot_1","Oopz","Iopz"]) exitwith {"Schwarm Führer"};
                    _name = (_target getVariable["JK_NameTagClass",""]);
                    _string = format ["STR_JK_GEAR_%1",toUpper _name];
                    if ( isLocalized (_string)) then { _name = localize _string; };
                     _name
                } else {
                    _GroupName = groupID (group _target);
                    if !(_GroupName == "") then {
                        _GroupName
                    };
                };
            };
            if (_text1 != "") then {_text = _text + " (" + _text1 + ")"};
        };
        drawIcon3D [_icon, _color, _headPosition vectorAdd [0, 0, 0.4], 0.8, 0.8, 0, _text, 2, 0.033, "PuristaMedium"];
    };
    false
} count _targets;

_targetPos = getPos (JK_LZ_Marker select 0);
_distance = _targetPos distance _playerPos;
if (_distance > 300) exitWith {};
{
    _target = _x;
    _targetPos = getPos _target;
    _distance = _targetPos distance _playerPos;
    if (_distance > 60) exitWith {};
    _nearestHeli = _target nearObjects ["AIR",5];
    _text = _x getVariable ["JK_LZ_Name","LZ"];
    _text = if !(_nearestHeli isEqualTo []) then {
        _x getVariable ["JK_LZ_Name","LZ"]
    } else {
        format [localize "STR_JK_NAMETAGS_HELI", (_x getVariable ["JK_LZ_Name","LZ"])]
    };
    _alpha = ((1 - 0.02 * (_distance - 30) min 0.9999999) * 0.9) max 0;
    _color = [1, 1, 1, _alpha];
    _icon = "a3\ui_f\data\map\Markers\HandDrawn\start_ca.paa";
    _text = _x getVariable ["JK_LZ_Name","LZ"];
    drawIcon3D [_icon, _color, _targetPos vectorAdd [0, 0, 3], 1.5, 1.5, 0, _text, 2, 0.033, "PuristaMedium"];
    false
} count JK_LZ_Marker;
