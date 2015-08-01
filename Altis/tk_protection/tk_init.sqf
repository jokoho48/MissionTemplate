#include "tk_macros.sqf"
#include "tk_setup_file.sqf"

TK_INIT = false;TK_Server = false; TK_Client = false; TK_JIP = false;TK_SPE = false;TK_MP = isMultiplayer;
if (isServer) then {
	TK_Server = true;
	if (!isDedicated) then {
		TK_Client = true;
		TK_SPE = true;
		__tkwaitpl;
	} else {
		TK_INIT = true;	
	};
} else {
	TK_Client = true;
	if (isNull player) then {
		TK_JIP = true;
		__tkwaitpl;
	} else {	
		TK_INIT = true;
	};
};

TK_IS_HC_CLIENT = !isDedicated && {!hasInterface};
if (TK_IS_HC_CLIENT) exitWith {};

if (isNil "tk_netinit_compiled") then {
	__tkccppfln(func\tk_common_functions.sqf);
	__tkccppfln(func\tk_netinit.sqf);
};

[0, "tk_kick", {serverCommand ("#kick " + _this)}] call TKNetAddEvent;
[2, "tk_global_message", {(_this select 0) call TKfGlobalChat}] call TKNetAddEvent;
[2, "tk_local_message", {if ((_this select 0) == (vehicle player)) then {(_this select 1) call TKfGlobalChat}}] call TKNetAddEvent;
[2, "tk_end_mission", {if (player == (_this select 0)) then {endMission "LOSER"; titleCut ["Mission Protection System: You was punished cause you are a stupid noob or cause you are only stupid.","black faded", 0];}}] call TKNetAddEvent;
[2, "tk_freezing", {if (player == (_this select 0)) then {
	disableUserInput true;
}}] call TKNetAddEvent;
[2, "tk_create_log_entry", {_this call TK_fcreateLog}] call TKNetAddEvent;


if (name player in tk_black_list) then {
	serverCommand ("#kick " + name player);
	["tk_end_mission", [_tk]] call TKNetCallEvent;
};

__tkcppfln(set_new_player_events,func\new_player_events.sqf);
__tkcppfln(set_knowing_player_events,func\known_player_events.sqf);
__tkcppfln(check_for_TK,func\check_TK.sqf);
__tkcppfln(get_Penalty,func\penalty.sqf);
__tkcppfln(keyUnbind,func\keyUnbind.sqf);

0 spawn {
	waitUntil {!isNull player || {time > 1}};
	if !(name player in tk_white_list) then {[name player,getPlayerUID player] call TK_p_c};
	
	_subject = player createDiarySubject ["tk_log", "Punished Player List"];
	player createDiaryRecord ["tk_log", ["About this List", "In dieser Liste befinden sich alle Spieler, welche durch das Mission-Protection-System als auffaellig markiert wurden bzw. automatisch vom Server gekickt wurden. Die Liste wird automatisch vom Server aktualisiert.<br/><br/>made by Psychobastard<br/>Version: 1.10<br/>"]];
};

/*
waitUntil {time > 5};
if (isDedicated) exitWith {};

if (isClass(configFile/"CfgPatches"/"dayz")) then {
	endMission "LOSER";
	titleCut ["Mission Protection System: A non supported mod was found - DayZ. Disable this mod to play on this server.","black faded", 0];
};
*/