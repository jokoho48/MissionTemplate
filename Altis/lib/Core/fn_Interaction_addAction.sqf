/*
    Author: NetFusion edit By Joko

    Description:
    Add an action to an object or type(s) of object(s).

    Parameter(s):
    0: STRING - the title of the action.
    1: OBJECT, ARRAY, STRING - the object (type) which the action should be added to.
    2: NUMBER - the distance in which the action is visible.
    3: STRING - the condition which is evaluated on every frame (if play is in range) to determine whether the action is visible.
    4: CODE - the callback which gets called when the action is activated.
    5: ARRAY - (optional) the arguments which get passed to the callback.

    Remarks:
    * '_target' is the object inside the condition string.
    * [object, caller, ID, arguments] is _this in the callback

    Returns:
    -

    Example:
    ["Hint Hello!", player, 0, "true", { hint format ["Hello %1", name player]; }] call JK_Core_fnc_Interaction_addAction;
    ["Hint Hello!", "Man", 3, "true", { hint format ["Hello %1", name (_this select 0)]; }] call JK_Core_fnc_Interaction_addAction;
*/
params["_text","_onObject","_distance","_condition","_callback",["_args",[]]]

_condition = if (_distance > 0) then {"[_target, " + (str _distance) + "] call JK_Core_fnc_inRange && " + _condition} else {_condition};

if (typeName _text == "STRING") then {_text = compile ("format[""" + _text + """]")};
if (typeName _onObject == "STRING") then {_onObject = [_onObject];};

if (typeName _onObject == "ARRAY") then {
    {
        JK_Core_Interaction_Actions pushBack [_x, _text, _condition, _callback, _args];
        false
    } count _onObject;
};

if (typeName _onObject == "OBJECT") then {
    if (_onObject == player) then {
        _text = (call _text);
        _onObject addAction [_text, _callback, _args, 1.5, false, true, "", _condition];
        _this spawn {
            waitUntil {(_this select 1) != player};
            _this set [1, player];
            _this call JK_Core_fnc_Interaction_addAction;
        };
    } else {
        JK_Core_Interaction_Actions pushBack [_onObject, _text, _condition, _callback, _args];
    };
};
