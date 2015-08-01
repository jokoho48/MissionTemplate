#include "tk_macros.sqf"

TK_event_holder = "Land_HelipadEmpty_F" createVehicleLocal [0, 0, 0];

// multiple events per type
TKNetAddEvent = {
	private ["_a", "_ea"];
	_a = switch (_this select 0) do {
		case 0: {true}; // all
		case 1: {if (isServer) then {true} else {false}}; // server only
		case 2: {if (TK_Client) then {true} else {false}}; // client only
		case 3: {if (isDedicated) then {true} else {false}}; // dedicated only
		case 4: {if (!isServer) then {true} else {false}}; // client only, 2
	};
	if (_a) then {
		_ea = TK_event_holder getVariable (_this select 1);
		if (isNil "_ea") then {_ea = []};
		_ea set [count _ea, _this select 2];
		TK_event_holder setVariable [_this select 1, _ea];
	};
};

TKNetRemoveEvent = {
	if (!isNil {TK_event_holder getVariable _this}) then {TK_event_holder setVariable [_this, nil]};
};

TKNetRunEvent = {
	private ["_ea", "_p", "_pa"];
	_ea = TK_event_holder getVariable (_this select 0);
	if (!isNil "_ea") then {
		_pa = _this select 1;
		if (!isNil "_pa") then {
			{_pa call _x} forEach _ea;
		} else {
			{call _x} forEach _ea;
		};
	};
};

TKNetCallEvent = {
	TK_n_e_gl = _this; publicVariable "TK_n_e_gl";
	_this call TKNetRunEvent;
};

"TK_n_e_gl" addPublicVariableEventHandler {
	(_this select 1) call TKNetRunEvent;
};

TKNetSetJIP = {
	__TKJIPSetVar [_this select 0,_this select 1,true];
};


tk_netinit_compiled = true;