// by psycho
// to disable grenade key at base to avoid accidents
private ["_key","_inBase","_return"];
_key = _this select 1;
_return = false;

_inBase = player call TKfgetBaseRange3;


if (_inBase) then {
	{
		if (_key in (actionkeys _x)) then {
			//_return = (_key == (actionkeys _x) select 0);
			_return = true;	// if more than one key is bind
			["tk_local_message",[player, "Mission Protection System: Grenade trowhing in base is disabled to avoid accidents."]] call TKNetCallEvent;
		};
	} forEach ['Throw'];
};

_return