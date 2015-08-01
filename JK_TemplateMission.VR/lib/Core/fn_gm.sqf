/*
 * cratefiller script by Joko
 * put this into init-line of the crate that's supposed to contain the items specified below:
 * [this] call JK_Core_fnc_gm;
*/

if(isDedicated) exitWith {};
JK_fnc_gm = {
    _condition = "player == player && (name player in JK_var_Zeus_Actions_Player || player in JK_var_Zeus_Actions)";
    JKendMission = false;
    if (true) then {
	    player addAction ["CleanUp",
	    	{
	    		[
	    			{
	    					{
	    						deleteVehicle _x;
	    						true
	    					} count allDead;
	    					{
	    						deleteVehicle _x;
	    						true
	    					} count allMissionObjects ("WeaponHolder");
	    					{
	    						deleteVehicle _x;
	    						true
	    					} count allMissionObjects ("GroundWeaponHolder");
	    					{
	    						deleteVehicle _x;
	    						true
	    					} count allMissionObjects ("WeaponHolderSimulated");
	    					{ if (count units _x==0) then { deleteGroup _x;}; true } count allGroups;
	    			},
	    			"BIS_fnc_spawn",false,false
	    		] call BIS_fnc_MP;
	    	},
	    	nil,
	    	99,
	    	false,
	    	true,
	    	"",
            _condition
	    ];
	};
    if (true) then {
	    player addAction ["Sync Zeus",
	    	{
	    		[
	    			{
	    			        {
	    			            _x addCuratorEditableObjects [allUnits, true];
	    			            true
	    			        } count allCurators;
	    			        {
	    			            _x addCuratorEditableObjects [vehicles, true];
	    			             true
	    			        } count allCurators;
	    			},
	    			"BIS_fnc_spawn",false,false
	    		] call BIS_fnc_MP;
	    	},
	    	nil,
	    	99,
	    	false,
	    	true,
	    	"",
	    	_condition
	    ];
    };
	if (true) then {
	    player addAction ["Arsenal",
	    	{
	    		["Open", true, {true}] call BIS_fnc_arsenal;
	    	},
	    	nil,
	    	99,
	    	false,
	    	true,
	    	"",
	    	_condition
	    ];
	};
	if (true) then {
	    player addAction ["End Mission",
	    	{
	    		JKendMission = true;
	    	},
	    	nil,
	    	99,
	    	false,
	    	true,
	    	"",
	    	"player == player && (name player in JK_var_Zeus_Actions_Player || player in JK_var_Zeus_Actions)&& !(JKendMission)"
	    ];
        player addAction ["No - End Mission",
	    	{
	    		JKendMission = false;
	    	},
	    	nil,
	    	99,
	    	false,
	    	true,
	    	"",
	    	"player == player && (name player in JK_var_Zeus_Actions_Player || player in JK_var_Zeus_Actions)&& (JKendMission)"
	    ];
	    player addAction ["Yes - End Mission",
         	{
         		["JKEnd", "BIS_fnc_endMissionServer",false,false,false] call BIS_fnc_MP;
         	},
         	nil,
         	99,
         	false,
         	true,
         	"",
         	"player == player && (name player in JK_var_Zeus_Actions_Player || player in JK_var_Zeus_Actions)&& (JKendMission)"
         ];
	};
};

[] spawn {
	waitUntil {!(isNil "JK_var_Zeus_Actions_Player") && !(isNil "JK_var_Zeus_Actions")};
	if(str(player) in JK_var_Zeus_Actions || name player in JK_var_Zeus_Actions_Player) then {
		call JK_fnc_gm;
		GM_respawn_EVH = player addEventhandler ["Respawn", { removeallactions (_this select 1); call JK_fnc_gm;}];
	};
};



//-- Fix for Zeus Reveal Mine Feature
_fnc_deleteRevealMineMarker = {
    if !(_x isKindOf "MineGeneric") exitWith {};
    {
        _prefix = _x select [0,16];
        if(_prefix == "bis_fnc_drawminef") then {
            deleteMarker _x;
        };
        false
    } count allMapMarkers;
};

_fnc_ZeusSync = {
    _allCurators = allCurators;
    _allCurators deleteAt (_allCurators find (_this select 0));
    if ((typeName (_this select 1)) == "OBJECT") then {
        {
            _x addCuratorEditableObjects [[_this select 1],true];
            false
        } count _allCurators;
    };
};

{
    _x addEventHandler ["CuratorObjectPlaced",_fnc_deleteRevealMineMarker];
    _x addEventHandler ["CuratorObjectPlaced",_fnc_ZeusSync];
    false
} count allCurators;
