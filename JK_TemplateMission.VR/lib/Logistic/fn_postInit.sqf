if (isDedicated || !hasInterface) exitWith {};
#define __DRAGANIMSTATE ["amovpercmstpslowwrfldnon_acinpknlmwlkslowwrfldb_2", "amovpercmstpsraswpstdnon_acinpknlmwlksnonwpstdb_2", "amovpercmstpsnonwnondnon_acinpknlmwlksnonwnondb_2", "acinpknlmstpsraswrfldnon", "acinpknlmstpsnonwpstdnon", "acinpknlmstpsnonwnondnon"]
#define __MAXWEIGHT 800

[
    (localize "STR_JK_JK_DROP"),
    player,
    0,
    "!(isNull (player getVariable ['JK_DragDrop_Item', objNull]))",
    {
        private ["_draggedObject", "_position"];
        _draggedObject = player getVariable ["JK_DragDrop_Item", objNull];

        player playAction "released";

        if (isNull _draggedObject) exitWith {};

        player setVariable ["JK_DragDrop_Item", objNull, true];
        _draggedObject setVariable ["JK_DragDrop_Player", objNull, true];

        detach _draggedObject;
        player forceWalk false;
        _draggedObject setDamage 0;
        _draggedObject enableSimulationGlobal true;
        _position = getPosATL _draggedObject;
        if (_position select 2 < 0) then {
            _position set [2, 0];
            _draggedObject setPosATL _position;
        };
    }
] call JK_Core_fnc_Interaction_addAction;

[
    {format[localize "STR_JK_JK_LOADIN", getText(configFile >> "CfgVehicles" >> typeof cursorTarget >> "displayName")]},
    ["Car","Helicopter_Base_H","I_Heli_light_03_base_F ","Ship"],
    10,
    "!(isNull (player getVariable ['JK_DragDrop_Item', objNull]))",
    {
        private ["_draggedObject", "_ItemArray"];
        params ["_vehicle"];
        _draggedObject = player getVariable ["JK_DragDrop_Item", objNull];
        player playAction "released";
        _draggedObject enableSimulationGlobal false;
        _draggedObject allowDamage false;
        _draggedObject setDamage 0;
        detach _draggedObject;
        [[_draggedObject, true], "hideObjectGlobal", false, false, true] call BIS_fnc_MP;
        _draggedObject setPos [-10000,-10000,100000];
        _ItemArray = _vehicle getVariable ["JK_Loadedin", []];
        _ItemArray pushBack _draggedObject;
        _vehicle setVariable ["JK_Loadedin", _ItemArray];
        player setVariable ["JK_DragDrop_Item",objNull];
    }
] call JK_Core_fnc_Interaction_addAction;

[
    {format[localize "STR_JK_JK_LOADOUT",getText(configFile >> "CfgVehicles" >> typeOf (cursorTarget getVariable ["JK_Loadedin",[ObjNull]] select 0) >> "displayName"),getText(configFile >> "CfgVehicles" >> typeof cursorTarget >> "displayName")]},
    ["AllVehicles"],
    10,
    "isNull (player getVariable ['JK_DragDrop_Item', objNull]) && !((_target getVariable ['JK_Loadedin', []]) isEqualTo [])",
    {
        private ["_draggedObjectArray", "_draggedObject", "_attachPoint", "_item"];
        params ["_vehicle"];
        _draggedObjectArray = _vehicle getVariable ["JK_Loadedin",[ObjNull]];
        _draggedObject = _draggedObjectArray deleteAt 0;
        _currentWeight = _draggedObject call JK_Core_fnc_GetWeight;
        _vehicle setVariable ["JK_Loadedin",_draggedObjectArray,true];
        player setVariable ["JK_DragDrop_Item", _draggedObject, true];
        _draggedObject setVariable ["JK_DragDrop_Player", player, true];
        _attachPoint = [0, 1.3, 0.5];
        player forceWalk true;
        removeMissionEventHandler ["Draw3D",JK_var_GetInVehiclePFH];
        [[_draggedObject, true], "hideObjectGlobal", false, false, true] call BIS_fnc_MP;
        if (_draggedObject isKindOf "StaticWeapon" || _currentWeight >= __MAXWEIGHT /2) then {
            player playActionNow "grabDrag";
            waitUntil {animationState player in __DRAGANIMSTATE};
        } else {
            player action ["WeaponOnBack",player];
        };
        _draggedObject attachTo [player, _attachPoint];
        _draggedObject enableSimulationGlobal true;
        _draggedObject allowDamage true;
        _draggedObject setDamage 0;
    }
] call JK_Core_fnc_Interaction_addAction;
