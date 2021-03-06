/*
    Author: joko // Jonas

    Description:


    Parameter(s):
    0:
    Returns:
    -

    Example:
    [] call JK_Settings_fnc_Init;
*/

jk_var_VDman = profileNameSpace getVariable ["JK_viewDistanceMan", profileNameSpace getVariable ["CHVD_foot", viewDistance]];
jk_var_VDcar = profileNameSpace getVariable ["JK_viewDistanceCar", profileNameSpace getVariable ["CHVD_car", viewDistance]];
jk_var_VDair = profileNameSpace getVariable ["JK_viewDistanceAir",profileNameSpace getVariable ["CHVD_air", viewDistance]];
jk_var_VDobj = profileNameSpace getVariable ["JK_viewDistanceObj",profileNameSpace getVariable ["CHVD_footObj", 1500]];

JK_Settings_Action = player addAction [(format["<t color='#FF0000'>%1</t>",localize "STR_JK_OPENSETTINGS"]),{call JK_Settings_fnc_OpenMenu;},nil,-99,false,true,"","player == player"];

JK_NameTags_var_JoinGroup = false;

player addEventHandler ["Respawn",{
    [] spawn {
        if(!alive player) then {
            _old = player;
            _old removeAction JK_Settings_Action;
            waitUntil {alive player};
            JK_Settings_Action = player addAction [(format["<t color='#FF0000'>%1</t>",localize "STR_JK_OPENSETTINGS"]),{call JK_Settings_fnc_OpenMenu;},nil,-99,false,true,"","player == player"];
        };
    };
}];
[] call JK_Settings_fnc_updateVD;
call jk_settings_fnc_updateUI;

[
    "Join Team",
    ["Man"],
    3,
    "JK_NameTags_var_JoinGroup && group _target != group player",
    {
        params ["_unit"];
        [player] joinSilent group _unit;
        JK_NameTags_var_JoinGroup = false;
        hintSilent format[localize "STR_JK_GM_GroupJoined",name (leader _unit)];
    }
] call JK_Core_fnc_Interaction_addAction;
