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

JK_var_KeyDownEvents pushBack [_this select 0, _this select 2, _this select 3, _this select 2];
