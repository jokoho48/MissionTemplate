/*
	Author: joko // Jonas

	Description:


	Parameter(s):
	0:
	Returns:
	-

	Example:
	[] call JK_Settings_fnc_setNametag;
*/

_mode = _this select 0;

if (_mode in ["RED","YELLOW","GREEN","BLUE","MAIN"]) exitWith {
    if !(assignedTeam player isEqualTo _mode) then {
        [[player,_mode],"assignTeam",true,true,true] call BIS_fnc_MP;
        hintSilent format[localize "STR_JK_NAMETAGS_YOURENOW",localize (format["STR_JK_NAMETAGS_%1",_mode])];
    } else {
        hintSilent format[localize "STR_JK_NAMETAGS_YOUREDNOW",localize (format["STR_JK_NAMETAGS_%1",_mode])];
    };
};

if (_mode isEqualTo "Enable") exitWith {
    if !(JK_NameTagsactiv) then {
        JK_Nametag_EVH = addMissionEventHandler ["Draw3D", JK_Core_fnc_draw3D];
        hintSilent "Nametags are Now Enabled";
        JK_NameTagsActiv = true;
    } else {
        hintSilent "Nametags Are allready Enalbed";
    };

};

if (_mode isEqualTo "Disable") exitWith {
    if (JK_NameTagsactiv) then {
        removeMissionEventHandler ["Draw3D",JK_Nametag_EVH];
        JK_NameTagsActiv = false;
        hintSilent "Nametags are Now Disabled";
    } else {
        hintSilent "Nametags Are allready Disalbed";
    };
};

if (_mode isEqualTo "Leave") exitWith {
    [player] joinSilent grpNull;
    hintSilent localize "STR_JK_LeaveGroup";
};

if (_mode isEqualTo "Join") exitWith {
    JK_NameTags_var_JoinGroup = !JK_NameTags_var_JoinGroup;
    hintSilent format[localize "STR_JK_GM_JoinGroup",[localize "STR_JK_GM_Disabled",localize "STR_JK_GM_Enabled"] select JK_NameTags_var_JoinGroup];
};

if (_mode isEqualTo "Leader") exitWith {
    group player selectLeader player;
    hintSilent localize "STR_JK_TakeLeader";
};

hint "Error";
