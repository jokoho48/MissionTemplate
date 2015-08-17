/*
 * Name: addKeyDownEH
 *
 * Author: joko // Jonas
 *
 * Discription: Add a Key Down Event
 *
 * Parameter:
 *  0: Name as String
 *  1: Event Code as Code
 *  2: DIKKey
 *  3: Modifier Array
 *
 * Return:
 *
 */
params ["_name", "_code", "_dikKey", "_modifier"];
JK_var_KeyDownEvents pushBack [_name, _dikKey, _modifier, _code];
