// penalty system
#include "tk_macros.sqf"
private ["_noob","_reason"];
_noob = _this select 0;
_reason = _this select 1;

_storage = TcB_Ref_Point getVariable (getPlayerUID _noob);


switch (_reason) do {
	case ("Shooting at Base") : {
		if (tcb_auto_kick) then {
			["tk_kick", (_storage select 0)] call TKNetCallEvent;
			["tk_end_mission", [_noob]] call TKNetCallEvent;
			["tk_global_message",[format ["Mission Protection System: %1 was kicked automatically from the Server.", name _noob]]] call TKNetCallEvent;
		};
		if (tcb_show_his_ass) then {["tk_create_log_entry", [_noob,_reason]] call TKNetCallEvent};
	};
	case ("Teamkiller") : {
		["tk_local_message",[_noob, "Mission Protection System: You are attracted negative attention cause team killing or the experimental of them."]] call TKNetCallEvent;
		if (tcb_show_his_ass) then {["tk_create_log_entry", [_noob,_reason]] call TKNetCallEvent};
	};
	case ("Satchel on Base") : {
		["tk_local_message",[_noob, "Mission Protection System: You are attracted negative attention cause you have placed explosives in our base."]] call TKNetCallEvent;
		if (tcb_show_his_ass) then {["tk_create_log_entry", [_noob,_reason]] call TKNetCallEvent};
	};
	default {diag_log "Mission Protection System: Fehler in penalty.sqf"};
};