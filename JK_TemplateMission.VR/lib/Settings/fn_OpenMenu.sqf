/*
    Author: joko // Jonas

    Description:


    Parameter(s):
    0:
    Returns:
    -

    Example:
    [] call JK_Settings_fnc_OpenMenu;
*/
if(!createDialog "JK_Settings_Dialog") exitWith {hint "Something went wrong, the menu won't open?"};
disableSerialization;
call jk_settings_fnc_updateUI;
