/*
 * Name: removeKeyDownEH
 *
 * Author: joko // Jonas
 *
 * Discription: Remove a Key Down Event
 *
 * Parameter:
 * 0-N: EH that will deltetd
 *
 * Return:
 * Array with Boolean if KeyDown is Removed
 *
 */
 private ["_return", "_deleted"];

_deleted = 0;

{
    params ["_currentName"];
    if (_currentName in _this) then {
        _this set[_this find (JK_var_KeyDownEvents deleteAt _foreachindex + _deleted) select 0, true];
        _deleted = _deleted + 1;
    };
} forEach JK_var_KeyDownEvents;

{
  if (typeName _x == "STRING") then {
    _this set[_foreachindex,false];
  };
} forEach _this;

_this
