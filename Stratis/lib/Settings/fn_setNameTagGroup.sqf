/*
	Author: joko // Jonas

	Description:
    Set Group Name for All Playable Units

	Parameter(s):
	-

	Returns:
	-

	Example:
	[] call JK_Settings_fnc_setNameTagGroup;
*/

if (!isServer) exitWith {};
_groupNames = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","November","Kilo","Yankee","Zulu","Buffalo","Guardian","Fox"];
_groupNamesAll = + _groupNames;

{
    if (leader _x in playableUnits) exitWith {};
    if ((groupID (group _x)) in _groupNamesAll) exitWith {};
    _x setGroupID [_groupNames deleteAt 0];
    false
} count allGroups;