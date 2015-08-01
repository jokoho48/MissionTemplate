/*
	Author: joko // Jonas

	Description:


	Parameter(s):
	0:
	Returns:
	-

	Example:
	[] call JK_Settings_fnc_setLZName;
*/
[] spawn {
    waitUntil { !isNil "JK_LZ_Marker" };
    {
        _x setVariable ["JK_LZ_Name",format [localize "STR_JK_NAMETAGS_LZ", str(_foreachindex + 1)],false];
    } forEach JK_LZ_Marker;
};
