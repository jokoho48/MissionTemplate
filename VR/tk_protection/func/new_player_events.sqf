// new player set up
#include "tk_macros.sqf"
private ["_name","_uid","_shoots"];

_name = _this select 0;
_uid = _this select 1;
_tks = _this select 2;
_shoots = _this select 3;
_jip_protection = _this select 4;
_answer = _this select 5;
_failed_captchas = _this select 6;
_captcha_passed = _this select 7;

if (serverCommandAvailable "#shutdown") exitWith {diag_log "Mission Protection System: Admin excluded from MPS"};

_ais = player getVariable "bon_ais_agony";
bon_ais_active = if (!isNil "_ais") then {true} else {false};

player addEventHandler ["HandleDamage", {
	private ["_dammage"];
	_dammage = _this select 2;	
	_inBase = (_this select 3) call TKfgetBaseRange;
	
	if (_inBase && ((_this select 3) != (_this select 0))) then {
		if (_dammage > 0.3) then {
		diag_log format ["Mission Protection System: in checking -- getroffen: %1 ---- schuetze: %2",(_this select 0),(_this select 3)];
			[(_this select 3),(_this select 0)] call check_for_TK;
		};
		_dammage = if (tcb_tk_handler select 0) then {0} else {_dammage};
	};
	_dammage = if (bon_ais_active) then {0} else {_dammage};
	_dammage
}];


if (tcb_base_shoots > 0) then {
	player addEventHandler ["Fired", {
		private ["_inBase"];
		_inBase = (_this select 0) call TKfgetBaseRange;
		if (_inBase) then {
			if !(getText (configFile >> "CfgAmmo" >> (_this select 4) >> "Simulation") in ["shotSmoke","shotIlluminating","shotNVGMarker","shotCM","shotTimeBomb","shotMine","shotPipeBomb"]) then {
				_shoots = [_this select 0] call TKfcount_Shoots;
				if ((_this select 4) isKindOf "GrenadeCore") then {
					if (count _this > 6) then {deleteVehicle (_this select 6)};
				};
				["tk_local_message",[_this select 0, "Mission Protection System: Please stop shooting at base or you will be punished."]] call TKNetCallEvent;
				if (_shoots >= tcb_base_shoots) then {[_this select 0, "Shooting at Base"] call get_Penalty};
			};
		};
	}];
};


if (tcb_satchel_handler select 0) then {
	player addEventHandler ["Fired", {
		private ["_inBase"];
		
		_inBase = (_this select 0) call TKfgetBaseRange2;
		if (_inBase) then {
			if ((_this select 4) isKindOf "TimeBombCore" || (_this select 4) == "ACE_PipebombExplosion") then {
				if (count _this > 6) then {deleteVehicle (_this select 6)};
				if (tcb_satchel_handler select 1) then {
					[_this select 0] call TKfTKKickCheck;
					[_this select 0, "Satchel on Base"] call get_Penalty;
				};
			};
		};
	}];
};


if (tcb_grenade_handler select 0) then {
	[] spawn {
		waitUntil {sleep 0.3; !isNull (findDisplay 46)};
		(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call keyUnbind}];
		(findDisplay 46) displayAddEventHandler ["onButtonDblClick", {_this call keyUnbind}];
	};
	player addEventHandler ["Fired", {
    	private ["_inBase"];
    	_inBase = (_this select 0) call TKfgetBaseRange3;
    	if (_inBase) then {

    	    if (typeOf (_this select 6) in ["GrenadeHand","SmokeShell","SmokeShellGreen","SmokeShellRed","SmokeShellPurple","SmokeShellBlue"]) then {
                deleteVehicle (_this select 6);
            };
    	};
    }];
};


if (tcb_tk_captcha) then {
	_uid = getPlayerUID player;
	_storage = TcB_Ref_Point getVariable _uid;
	_try = _storage select 6;
	_pass = _storage select 7;
	[_try, _pass] execVM tk_path + "jip_captcha_saver.sqf";
};