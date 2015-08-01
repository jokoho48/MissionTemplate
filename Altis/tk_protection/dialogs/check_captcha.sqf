// by psycho
private ["_answer","_storage","_needed","_num","_dialog","_uid"];
disableSerialization;
_dialog = findDisplay 53000;
_answer = _dialog displayCtrl 53001;

if (ctrlText _answer != "") then {
	_uid = getPlayerUID player;
	_storage = TcB_Ref_Point getVariable _uid;
	_needed = (_storage select 5) select 1;
	
	if (isNil "_needed" || (_needed == "")) exitWith {diag_log "Mission Protection System: Error in Captcha System!"};
	if (_needed == ctrlText _answer) then {
		closeDialog 0;
		createDialog "Captcha_Passed_Dialog";
		"Captcha passed" call TKfGlobalChat;
		TcB_Ref_Point setVariable [_uid, [(_storage select 0), _uid, (_storage select 2), (_storage select 3), (_storage select 4), (_storage select 5), 0, true], true];
	} else {
		_num = (_storage select 6);
		_num = _num + 1;
		TcB_Ref_Point setVariable [_uid, [(_storage select 0), _uid, (_storage select 2), (_storage select 3), (_storage select 4), (_storage select 5), _num, false], true];
		switch (_num) do {
			case (1) : {"Captcha failed - 2 times left" call TKfGlobalChat; [] execVM tk_path + "dialogs\create_captcha.sqf";};
			case (2) : {"Captcha failed - 1 times left" call TKfGlobalChat; [] execVM tk_path + "dialogs\create_captcha.sqf";};
			case (3) : {
				"Captcha limit reached!" call TKfGlobalChat;
				sleep 1;
				closeDialog 0;
				sleep 0.1;
				createDialog "Captcha_Failed_Dialog";
				if (tcb_show_his_ass) then {["tk_create_log_entry", [player,"Captcha limit reached"]] call TKNetCallEvent};
				sleep (15 + random 5);
				["tk_kick", (_storage select 0)] call TKNetCallEvent;
				["tk_global_message",[format ["%1 was kicked automatically from the Server.", name player]]] call TKNetCallEvent;
				endMission "LOSER";
				titleCut ["Mission Protection System: You was moved out cause you failed three times the captcha code.","black faded", 0];
			};
			default {};
		};
		_answer ctrlSetText "";
	};
} else {
	"Error - missing input" call TKfGlobalChat;
};