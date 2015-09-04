/*
    Author: joko // Jonas

    Description:

    Parameter(s):
    - Nothing
    Returns:
    - Nothing
*/


JK_var_BaseProtectionDistance = 600


if ("Grenade" in JK_var_EMPSHandler) then {
    player addEventHandler ["Fired", {
        private "_inBase";
        params ["_unit", "", "", "", "", "", "_bullet"];
        _inBase = _unit call JK_EMPS_fnc_inBase;
        if (_inBase) then {
            if (typeOf _bullet in ["GrenadeHand","SmokeShell","SmokeShellGreen","SmokeShellRed","SmokeShellPurple","SmokeShellBlue"]) then {
                deleteVehicle _bullet;
                ["Grenade Thow is Not Allowed in Base Please Stop this " + name player] call JK_EMPS_fnc_log;
            };
        };
    }];
};

if ("Gun" in JK_var_EMPSHandler) then {
    player addEventHandler ["Fired", {
        private "_inBase";
        params ["_unit", "", "", "", "", "", "_bullet"];
        _inBase = _unit call JK_EMPS_fnc_inBase;
        if (_inBase) then {
            if (typeOf _bullet isKindOf "BulletBase") then {
                deleteVehicle _bullet;
                ["Shooting is Not Allowed in Base Please Stop this " + name player] call JK_EMPS_fnc_log;
            };
        };
    }];
};
/*
if ("Satchel" in JK_var_EMPSHandler) then {
    player addEventHandler ["Fired", {
        private "_inBase";
        _inBase = (_this select 0) call JK_EMPS_fnc_inBase;
        if (_inBase) then {

        };
    }];

};
*/
