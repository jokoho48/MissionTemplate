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
 private["_return"]
{
    private "_currentName"
    _currentName = _x select 0;
    if (_currentName in _this) then {
        _this set[_this find (JK_var_KeyDownEvents deleteAt _foreachindex) select 0,true];
    };
} forEach JK_var_KeyDownEvents;

{
  if (typeName _x == "STRING") then {
    _this set[_foreachindex,false];
  };
} forEach _this;

_this
