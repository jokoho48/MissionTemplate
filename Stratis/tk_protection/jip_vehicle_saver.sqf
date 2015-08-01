// by psycho
// scan for JIPs and prevent them to use a vehicle turret or driver place for a few minutes
private ["_p","_to_wait","_acc_time","_tks","_shoots","_cp","_uid"];
_p = _this select 0;

_uid = getPlayerUID _p;
_cp = TcB_Ref_Point getVariable _uid;

if (time < 30) exitWith {};	// nur JIPS die 30sekunden nach Spielstart connecten
if !(isNil "tcb_known_player") then {
	_tks = _cp select 2;
	_shoots = _cp select 3;
	_protection_time_over = _cp select 4;
} else {
	_tks = 0;
	_shoots = 0;
	_protection_time_over = false;
};
if ((!isNil "tcb_known_player") && (_tks < tcb_max_num_tk || _shoots < tcb_base_shoots)) exitWith {};
if (_tks >= tcb_max_num_tk || _shoots >= tcb_base_shoots) then {
	tcb_jip_vehicle_protection_time = tcb_jip_vehicle_protection_time * 3;
};
_acc_time = time;
while {time < (_acc_time + tcb_jip_vehicle_protection_time)} do {
	waitUntil {(time > (_acc_time + tcb_jip_vehicle_protection_time)) || (vehicle player != _p)};
	_v = vehicle player;
	if (_v != _p) then {
		if ((_p == driver _v) || (_p == gunner _v)) then {
            player action ["ENGINEOFF", _v];
            player action ["Eject",_v];
            _v setVelocity [0, 0, 0];
            sleep 1.1;
            if (isEngineOn _v) then {
               _v engineOn false;
               player action ["engineOff", _v];
            };
            player action ["Eject",_v];
            _v setVelocity [0, 0, 0];
            disableUserInput false;
            ["tk_local_message",[_p, "Mission Protection System: You are not allow to do this at the moment."]] call TKNetCallEvent;
		} else {
			waitUntil {(time > (_acc_time + tcb_jip_vehicle_protection_time)) || (vehicle player == _p)};
		};
	};
	sleep 0.5;
};

if (!isNull player) then {
	TcB_Ref_Point setVariable [_uid, [name player, _uid, (_cp select 2), (_cp select 3), true, (_cp select 5), (_cp select 6), (_cp select 7)], true];
};