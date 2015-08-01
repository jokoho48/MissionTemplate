/*
loadout script by joko
Idea by Belbo
adds the loadouts to the specific playable units for the side West
Call from initPlayerLocal.sqf via:
[object,true] call JK_loadOut_fnc_applyLoadout;
    with
    _this select 0 = object - target the loadout is applied to.
    _this select 1 = boolean - whether or not the target in _zeus is supposed to be invincible.
*/

// insert names of new units here in their correspondent Objects:
//commanders
_command = ["opz_1","opz_2","GM1","GM2"];
//group leaders
_SL = ["leader_alpha","leader_bravo","leader_charlie","leader_delta","leader_echo","leader_foxtrot","leader_golf","leader_hotel"];
//medics
_medics = ["medic_alpha","medic_bravo","medic_charlie","medic_delta","medic_echo","medic_foxtrot","medic_golf","medic_hotel"];
//Assaultriflemen
_AR = ["AR_alpha","AR_bravo","AR_charlie","AR_delta","AR_echo","AR_foxtrot","AR_golf","AR_hotel"];
//MG-Schützen
_MG = ["MG_alpha","MG_bravo","MG_charlie","MG_delta","MG_echo","MG_foxtrot","MG_golf","MG_hotel"];
//assistant Assaultriflemen
_assMG = ["assMG_alpha","assMG_bravo","assMG_charlie","assMG_delta","assMG_echo","assMG_foxtrot","assMG_golf","assMG_hotel"];
//AT-Soldiers/AT-Specialists
_AT = ["AT_alpha","AT_bravo","AT_charlie","AT_delta","AT_echo","AT_foxtrot","AT_golf","AT_hotel"];
//Grenadiers
_grenadier = ["gren_alpha","gren_bravo","gren_charlie","gren_delta","gren_echo","gren_foxtrot","gren_golf"];
//Riflemen
_soldier = ["soldier_alpha","soldier_bravo","soldier_charlie","soldier_delta","soldier_echo","soldier_foxtrot","soldier_golf","soldier_hotel"];
//designated Marksmen
_marksmen = ["marksman_alpha","marksman_bravo","marksman_charlie","marksman_delta","marksman_echo","marksman_foxtrot","marksman_golf"];
//engineers/repair-/explosive-specialists
_spec = [];
//pilots
_pilots = ["pilot_1","pilot_2","pilot_3","pilot_4"];
//Crew
_Crew = [];

// insert Classnames of the units
_commandClass = ["B_officer_F","O_officer_F","I_officer_F"];
_SLClass = ["B_Soldier_SL_F","O_Soldier_SL_F","I_Soldier_SL_F"];
_medicsClass = ["B_medic_F","O_medic_F","I_medic_F"];
_ARClass = ["B_soldier_AR_F","O_soldier_AR_F","I_soldier_AR_F"];
_MGClass = ["B_support_MG_F","O_support_MG_F","I_support_MG_F"];
_assMGClass = ["B_Soldier_A_F","O_Soldier_A_F","I_Soldier_A_F"];
_ATClass = ["B_soldier_AT_F","O_soldier_AT_F","I_soldier_AT_F"];
_grenadierClass = ["B_Soldier_GL_F","O_Soldier_GL_F","I_Soldier_GL_F"];
_soldierClass = ["B_Soldier_F","O_Soldier_F","I_Soldier_F"];
_marksmenClass = ["B_soldier_M_F","O_soldier_M_F","I_soldier_M_F"];
_specClass = [];
_pilotsClass = ["I_G_Story_Protagonist_F","C_man_pilot_F","O_Pilot_F","O_helicrew_F","B_helicrew_F","B_Pilot_F","I_pilot_F","I_helicrew_F","I_helipilot_F","O_helipilot_F","B_Helipilot_F"];
_crewClass = ["B_crew_F","I_crew_F","O_crew_F"];

///// No editing necessary below this line /////
private ["_object","_target"];
_target = [_this, 0, player] call BIS_fnc_param;
_object = str _target;

_class = "";
//switch to select the applicable loadout function
if (!JK_var_gearByClasses) then {
    _class = switch true do {
        case (_object in _command): {"command"};
        case (_object in _SL): {"leader"};
        case (_object in _medics): {"medic"};
        case (_object in _AR): {"ARman"};
        case (_object in _MG): {"MG"};
        case (_object in _assMG): {"assMG"};
        case (_object in _AT): {"AT"};
        case (_object in _grenadier): {"grenadier"};
        case (_object in _soldier): {"Rifleman"};
        case (_object in _marksmen): {"marksman"};
        case (_object in _spec): {"specialist"};
        case (_object in _pilots): {"pilot"};
        case (_object in _crew): {"pilot"};
        default{""};
    };
};
if (_class == "" || JK_var_gearByClasses) then {
    _class = switch true do {
        case (typeOf _target in _commandClass): {"command"};
        case (typeOf _target in _SLClass): {"leader"};
        case (typeOf _target in _medicsClass): {"medic"};
        case (typeOf _target in _ARClass): {"ARman"};
        case (typeOf _target in _MGClass): {"MG"};
        case (typeOf _target in _assMGClass): {"assMG"};
        case (typeOf _target in _ATClass): {"AT"};
        case (typeOf _target in _grenadierClass): {"grenadier"};
        case (typeOf _target in _soldierClass): {"Rifleman"};
        case (typeOf _target in _marksmenClass): {"marksman"};
        case (typeOf _target in _specClass): {"specialist"};
        case (typeOf _target in _pilotsClass): {"pilot"};
        case (typeOf _target in _crewClass): {"crew"};
        default {"Rifleman"};
    };
};

[_target,_class] call JK_loadOut_fnc_selectGear;

if (true) exitWith {};
