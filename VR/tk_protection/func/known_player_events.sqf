// known player set up
#include "tk_macros.sqf"
private ["_captcha_passed","_failed_captchas"];

_name = _this select 0;
_uid = _this select 1;
_tks = _this select 2;
_shoots = _this select 3;
_jip_protection = _this select 4;
_answer = _this select 5;
_failed_captchas = _this select 6;
_captcha_passed = _this select 7;

if (isNil "_failed_captchas") then {_failed_captchas = 0;  diag_log "known player, varNum6 was nil"};
if (isNil "_captcha_passed") then {_captcha_passed = false; diag_log "known player, varNum7 was nil"};

[_name, _uid, _tks, _shoots, _jip_protection, _answer, _failed_captchas, _captcha_passed] call set_new_player_events;

if ((_tks >= tcb_max_num_tk || _shoots >= tcb_base_shoots) && tcb_tk_only_one_chance) then {
	//["tk_freezing",[player]] call TKNetCallEvent;
	["tk_end_mission", [player]] call TKNetCallEvent;
};