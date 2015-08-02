/*
    Author: joko // Jonas

    Description:

    Parameter(s):
    - Nothing
    Returns:
    - Nothing
*/
if ("Grenade" in JK_var_EMPSHandler) then {
	player addEventHandler ["Fired", {
    	private "_inBase";
    	_inBase = (_this select 0) call JK_EMPS_fnc_inBase;
    	if (_inBase) then {
    	    if (typeOf (_this select 6) in ["GrenadeHand","SmokeShell","SmokeShellGreen","SmokeShellRed","SmokeShellPurple","SmokeShellBlue"]) then {
                deleteVehicle (_this select 6);
                ["Grenade Thow is Not Allowed in Base Please Stop this " + name player] call JK_EMPS_fnc_log;
            };
    	};
    }];
};

if ("Gun" in JK_var_EMPSHandler) then {
	player addEventHandler ["Fired", {
    	private "_inBase";
    	_inBase = (_this select 0) call JK_EMPS_fnc_inBase;
    	if (_inBase) then {
    	    if (typeOf (_this select 6) isKindOf "BulletBase") then {
                deleteVehicle (_this select 6);
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
