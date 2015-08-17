/*
 * cratefiller script by Joko
 * put this into init-line of the crate that's supposed to contain the items specified below:
 * [this] call JK_loadOut_fnc_crate;
*/

if (!isServer) exitWith {};

//Variablen zu weisung für Kisten
//Base Items was add to Every Box
if (true) then {
    JK_var_BaseWeapons = [];
    JK_var_BaseMagazines = [
        ["HandGrenade",20],
        ["SmokeShell",20],
        ["SmokeShellGreen",20],
        ["SmokeShellRed",20],
        ["SmokeShellBlue",20],
        ["SmokeShellYellow",20],
        ["UGL_FlareYellow_F",20],
        ["1Rnd_Smoke_Grenade_shell",20],
        ["1Rnd_SmokeRed_Grenade_shell",20],
        ["1Rnd_SmokeYellow_Grenade_shell",20]
    ];
    JK_var_BaseItems = [
        ["Toolkit",2],
        ["acc_flashlight",5],
        ["FirstAidKit",20],
        ["MediKit",5]
    ];
    JK_var_BaseBackpacks = [];
};
//Blufor Items was add To Boxes in BluforCrates
if (true) then {
    JK_var_BluforWeapons = [
        ["launch_B_Titan_short_F",3]
    ];
    JK_var_BluforMagazines = [
        ["200Rnd_65x39_cased_Box",20],
        ["200Rnd_65x39_cased_Box_Tracer",20],
        ["30Rnd_65x39_caseless_mag",40],
        ["30Rnd_65x39_caseless_mag_Tracer",40],
        ["30rnd_556x45_STANAG",20],
        ["30Rnd_556x45_Stanag_Tracer_Red",20],
        ["20Rnd_762x51_Mag",40],
        ["100Rnd_65x39_caseless_mag",20],
        ["100Rnd_65x39_caseless_mag_Tracer",20],
        ["11Rnd_45ACP_Mag",10],
        ["7Rnd_408_Mag",10],
        ["Titan_AT",5],
        ["Titan_AP",5]
    ];
    JK_var_BluforItems = [
        ["H_HelmetSpecB",5]
    ];

    JK_var_BluforBackpacks = [
        ["B_AssaultPack_rgr",5],
        ["B_Parachute",15]
    ];
};
//Opfor Items was add To Boxes in OpforCrates
if (true) then {
    JK_var_OpforWeapons = [
        ["launch_B_Titan_short_F",3]
    ];
    JK_var_OpforMagazines = [
        ["200Rnd_65x39_cased_Box",20],
        ["200Rnd_65x39_cased_Box_Tracer",20],
        ["30Rnd_65x39_caseless_mag",40],
        ["30Rnd_65x39_caseless_mag_Tracer",40],
        ["30rnd_556x45_STANAG",20],
        ["30Rnd_556x45_Stanag_Tracer_Red",20],
        ["20Rnd_762x51_Mag",40],
        ["100Rnd_65x39_caseless_mag",20],
        ["100Rnd_65x39_caseless_mag_Tracer",20],
        ["11Rnd_45ACP_Mag",10],
        ["7Rnd_408_Mag",10],
        ["Titan_AT",5],
        ["Titan_AP",5]
    ];
    JK_var_OpforItems = [
        ["H_HelmetSpecB",5]
    ];

    JK_var_OpforBackpacks = [
        ["B_AssaultPack_rgr",5],
        ["B_Parachute",15]
    ];
};
//Indipendet Items was add To Boxes in IndipendetCrates
if (true) then {
    JK_var_IndiependentWeapons = [
        ["launch_B_Titan_short_F",3]
    ];
    JK_var_IndiependentMagazines = [
        ["200Rnd_65x39_cased_Box",20],
        ["200Rnd_65x39_cased_Box_Tracer",20],
        ["30Rnd_65x39_caseless_mag",40],
        ["30Rnd_65x39_caseless_mag_Tracer",40],
        ["30rnd_556x45_STANAG",20],
        ["30Rnd_556x45_Stanag_Tracer_Red",20],
        ["20Rnd_762x51_Mag",40],
        ["100Rnd_65x39_caseless_mag",20],
        ["100Rnd_65x39_caseless_mag_Tracer",20],
        ["11Rnd_45ACP_Mag",10],
        ["7Rnd_408_Mag",10],
        ["Titan_AT",5],
        ["Titan_AP",5]
    ];
    JK_var_IndiependentItems = [
        ["H_HelmetSpecB",5]
    ];

    JK_var_IndiependentBackpacks = [
        ["B_AssaultPack_rgr",5],
        ["B_Parachute",15]
    ];
};

{
    _call = format["JK_var_%1Weapons append JK_var_BaseWeapons; ",_x];
    _call = _call + format["JK_var_%1Magazines append JK_var_BaseMagazines; ",_x];
    _call = _call + format["JK_var_%1Items append JK_var_BaseItems; ",_x];
    _call = _call + format["JK_var_%1Backpacks append JK_var_BaseBackpacks; ",_x];
    call compile _call;
} count ["Blufor","Indiependent","Opfor"];
//---------Dont Edit Below This Line---------//
{
    if (isNull _x) exitwith {};

    //makes the crates indestructible:
    _x allowDamage false;
    //Clear Crates
    clearWeaponCargoGlobal _x;
    clearMagazineCargoGlobal _x;
    clearBackpackCargoGlobal _x;
    clearItemCargoGlobal _x;
    _paramArray = [];
    _paramArray = (_x) call {
            if ((TypeOf _this) in JK_var_INDIPENDETFORCRATES) exitWith {[_this, JK_var_OpforWeapons, JK_var_OpforMagazines, JK_var_OpforItems, JK_var_OpforBackpacks]};
            if ((TypeOf _this) in JK_var_OPFORCRATES) exitWith {[_this, JK_var_IndiependentWeapons, JK_var_IndiependentMagazines, JK_var_IndiependentItems, JK_var_IndiependentBackpacks]};
            if ((TypeOf _this) in JK_var_BLUFORCRATES) exitWith {[_this, JK_var_BluforWeapons, JK_var_BluforMagazines, JK_var_BluforItems, JK_var_BluforBackpacks]};
            [_this, JK_var_BaseWeapons, JK_var_BaseMagazines, JK_var_BaseItems, JK_var_BaseBackpacks]
    };

    _paramArray call {
        params["_create","_weapons","_magazines","_items","_backpacks"];
        if(JK_debug) then {
            diag_log format["Crate Filled: %1; Side: %2", _create, typeOf _create];
        };
        {
                _create addWeaponCargoGlobal _x;
        } count _weapons;
        {
                _create addMagazineCargoGlobal _x;
        } count _magazines;
        {
                _create addItemCargoGlobal _x;
        } count _items;
        {
                _create addBackpackCargoGlobal _x;
        } count _backpacks;
    };
    false
} count _this;

if (true) exitWith {};
