// by psycho
private ["_answer","_storage","_question","_dialog","_randomval","_txt"];

disableSerialization;
_dialog = findDisplay 53000;
_question = _dialog displayCtrl 53002;


_randomval = tk_captcha_array select (floor (random (count tk_captcha_array)));
_txt = _randomval select 0;

sleep 3;
_question ctrlSetText _txt;
_uid = getPlayerUID player;
_storage = TcB_Ref_Point getVariable _uid;
TcB_Ref_Point setVariable [_uid, [(_storage select 0), _uid, (_storage select 2), (_storage select 3), (_storage select 4), _randomval, (_storage select 6), (_storage select 7)], true];