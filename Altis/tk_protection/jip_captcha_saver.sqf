//by psycho
private ["_num","_bool"];
if (time < 10) exitWith {};	// nur JIPS die 10sekunden nach Spielstart connecten
sleep 10;

_uid = getPlayerUID player;
_storage = TcB_Ref_Point getVariable _uid;
_num = (_storage select 6);
_bool = (_storage select 7);


if (_bool && tcb_known_player) exitWith {};

if (isNil "tcb_known_player") then {
	while {!(_storage select 7)} do {
		sleep 7;
		
		if (!Dialog && !(_bool) && (_num < 3)) then {
			createDialog "Captcha_Dialog";
		};
		waitUntil {!Dialog};
		
		_uid = getPlayerUID player;
		_storage = TcB_Ref_Point getVariable _uid;
		_num = (_storage select 6);
		_bool = (_storage select 7);
		
		if (_bool) exitWith {};
	};
} else {
	if (!_bool) then {
		if (_num >= 3) then {
			if (tcb_tk_only_one_chance) then {
				sleep 3;
				createDialog "Captcha_Failed_Dialog";
				sleep (15 + random 5);
				["tk_kick", name player] call TKNetCallEvent;
				endMission "LOSER";
				titleCut ["Mission Protection System: You was moved from the server cause you failed three times the captcha code.","black faded", 0];
			};
		};
	};
};