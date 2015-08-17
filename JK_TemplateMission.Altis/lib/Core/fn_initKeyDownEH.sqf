/*
 * Name: initKeyDownEH
 *
 * Author: joko // Jonas
 *
 * Discription: init for KeyDown EH
 *
 * Parameter:
 *  0-N: With Display are Used Display 46 is Default
 *
 * Return:
 *
 */

_EHKeyDown = {
    params["_dikkeyInput","_modifierInput"];
    {
        _x params["_name","_dikkey","_modifier","_code"];
        if !(_dikkey == _dikkeyInput) exitWith {};
         if !(_modifier == _modifierInput)exitWith{};
          call _code;
          nil
    } count JK_var_KeyDownEvents;
    false
};

(findDisplay 46) displayAddEventHandler["KeyDown",_EHKeyDown];
{
    (findDisplay _x) displayAddEventHandler["KeyDown",_EHKeyDown];
} forEach _this;
