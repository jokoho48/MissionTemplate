// by psycho
disableSerialization;
closeDialog 0;

_uid = getPlayerUID player;
_storage = TcB_Ref_Point getVariable _uid;
_num = (_storage select 6);
_bool = (_storage select 7);


if (!_bool && (_num < 3)) then {
	"You have leaved the captcha dialog before you have passed them." call TKfGlobalChat;
	sleep 3;
	if (vehicle player != player) then {
		moveOut player;
	};
	sleep 1;
	closeDialog 0;
	sleep 0.1;
	createDialog "Captcha_Dialog";
};