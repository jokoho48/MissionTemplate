// Features
// -- First Person and Thrid Person
#define JK_var_enableFirstPersonOnly		                                                            // Aktiviert First Person Only Deaktivieren mit //
JK_var_enableVehicle3rdPerson = true;		                                                            // 3rd Person in Fahrzeugen erlaubt
JK_var_enable3rdPersonInBase = 300;                                                                    // Entferntung von der Basis bis 3D Person Deaktiviert wird bei 0 immer First Person

// -- Pilots Only Fly
#define JK_var_enablePilotsOnly		                                                                        // nur Piloten können als Fahrer in Fluggeräte einsteigen
JK_var_pilotClasses = ["I_G_Story_Protagonist_F","C_man_pilot_F","O_Pilot_F","O_helicrew_F","B_helicrew_F","B_Pilot_F","I_pilot_F","I_helicrew_F","I_helipilot_F","O_helipilot_F","B_Helipilot_F"];                                                               // Classnamen für die Piloten
JK_var_pilotNames = ["joko // Jonas"];                                                                                // Player Names that Can Fly
JK_var_pilotObjects = ["Bpilot_1","Bpilot_2","Bpilot_3","Bpilot_4","Opilot_1","Opilot_2","Opilot_3","Opilot_4","Ipilot_1","Ipilot_2","Ipilot_3","Ipilot_4"];                                        // Names of Units inGame that Can Fly

// -- JK Vehicle Crew Display
//#define JK_var_enableCrewDisplay

// -- JK Loadout                                                                                       // Kisten an den JK ChooseLoadout dran ist
JK_var_ChooseLoadout_Boxes = [BLoadoutCrate_1,BLoadoutCrate_2,BLoadoutCrate_3,
BLoadoutCrate_4,BLoadoutCrate_5,BLoadoutCrate_6,BLoadoutCrate_7,BLoadoutCrate_8,
ILoadoutCrate_1,ILoadoutCrate_2,ILoadoutCrate_3,ILoadoutCrate_4,ILoadoutCrate_5,
ILoadoutCrate_6,ILoadoutCrate_7,ILoadoutCrate_8,OLoadoutCrate_1,OLoadoutCrate_2,
OLoadoutCrate_3,OLoadoutCrate_4,OLoadoutCrate_5,OLoadoutCrate_6,OLoadoutCrate_7,
OLoadoutCrate_8];
JK_var_Commander = ["GM1","GM2","Bopz","Oopz","Iopz"];
JK_var_gearByClasses = True;

// -- TvT Settings
//#define JK_var_isTvT
JK_var_Bases = [BASE1, BASE2, BASE3, BASE4, BASE5, BASE6, BASE7, BASE8];
JK_var_TvTTime = 10800;

// -- JK Crate
JK_var_INDIPENDETFORCRATES = ["I_CargoNet_01_ammo_F"];
JK_var_OPFORCRATES = ["O_CargoNet_01_ammo_F"];
JK_var_BLUFORCRATES = ["B_CargoNet_01_ammo_F"];
JK_var_AllCrates = [Bcrate_1,Bcrate_2,Bcrate_3,Bcrate_4,
Bcrate_5,Bcrate_6,Bcrate_7,Bcrate_8,
Bcrate_9,Bcrate_10,
Icrate_1,Icrate_2,Icrate_3,Icrate_4,
Icrate_5,Icrate_6,Icrate_7,Icrate_8,
Icrate_9,Icrate_10,
Ocrate_1,Ocrate_2,Ocrate_3,Ocrate_4,
Ocrate_5,Ocrate_6,Ocrate_7,Ocrate_8,
Ocrate_9,Ocrate_10];

// -- JK Viewdistance
JK_var_TerrainLow = 30;
JK_var_TerrainMiddle = 12.5;
JK_var_TerrainHigh = 3.125;

// -- Nametags
#define JK_var_enableNametags			                                                                        // Show Nametags by Player That not Loaded A3C NameTag or StHud Nametags Deaktivieren mit //
JK_Debug = false;

JK_LZ_Marker = [LZ1,LZ2,LZ3,LZ4];

// - Zeus Actions
JK_var_Zeus_Actions = ["pilot_1"];                                                                     // How have the Zeus Actions Applied
JK_var_Zeus_Actions append JK_var_Commander;                                                           // Add Basic Commander to Zeus Actions
JK_var_Zeus_Actions_Player = ["joko // Jonas"];                 // Add Player Zeus Actions

// -- Fuck You BIS
BIS_revive_respawnAllowed = true;                                                                       //Work around for Bis Shit
enableEnvironment false;                                                                                //Disable Animals
BIS_revive_selected = player;
BIS_revive_units = [];

// -- Revive Time
JK_var_reviveTime = 350;                                                                                // Revive Zeit für das Respawn template "Revive"

// Allgemeine Einstellungen
enableSaving [false,false];
enableTeamSwitch false;
setViewDistance 2500;
setTerrainGrid 6.25;

//-------------------------------------------------------------------------------------------------
//----------------------------------- DO NOT EDIT BELOW ------------------------------------
//-------------------------------------------------------------------------------------------------

//fix BIS feature
if (isServer) then {
    [] spawn {
        waitUntil {!(isNil "BIS_marta_mainscope")};
        BIS_marta_mainscope setVariable ["rules",[["o_",[0.5,0,0,0]],["b_",[0,0.3,0.6,1]],["n_",[0,0.5,0,0]],["n_",[0.4,0,0.5,0]]],true];
    };
};
if(!isDedicated && hasInterface) then {
    //only pilots can fly
    #ifdef JK_var_enablePilotsOnly
        if (alive player && (!(typeOf player in JK_var_pilotClasses) && !(name player in JK_var_pilotNames) && !(player in JK_var_pilotObjects))) then {
            JK_var_PilotsOnly_EVH = addMissionEventHandler ["Draw3D", {
                if (vehicle player isKindOf "Air" && (player == assignedDriver vehicle player || player == (vehicle player) turretUnit [0])) then {
                    doGetOut player;
                    hint (localize "STR_JK_ONLYPILOTS");
                };
            }];
        };
    #endif

    //Bis Fixes
    player addEventHandler ["Killed",{ BIS_revive_reviveBleedOutDelayDefault = JK_var_reviveTime; }];
    player addEventHandler ["Respawn",{ (_this select 0) setVariable ["JK_Core_Interaction_Actions", [],true]; }];

    //Nametags
    #ifdef JK_var_enableNametags
        if !((isClass (configFile >> "CfgPatches" >> "cba_ee"))&&((isClass (configFile >> "CfgPatches" >> "AGM_NameTags")) || (isClass (configFile >> "CfgPatches" >> "ACE_Nametags")) || (isClass (configFile >> "CfgPatches" >> "cse_sys_tags")) || (isClass (configFile >> "CfgPatches" >> "")) || (isClass (configFile >> "CfgPatches" >> "A3C_NameTag"))||(isClass (configFile >> "CfgPatches" >> "STNametags")))) then {
            JK_Nametag_EVH = addMissionEventHandler ["Draw3D", JK_Core_fnc_draw3D];
            JK_NameTagsActiv = true;
        };
    #endif

    //first person only
    #ifdef JK_var_enableFirstPersonOnly
        JK_FPV_EVH = addMissionEventHandler ["Draw3D", {
            if (cameraView in ["INTERNAL","GUNNER"]) exitWith {};
            if ((JK_var_enable3rdPersonInBase) > (player distance (getMarkerPos "respawn_west"))) exitWith {};
            if ((JK_var_enable3rdPersonInBase) > (player distance (getMarkerPos "respawn_east"))) exitWith {};
            if ((JK_var_enable3rdPersonInBase) > (player distance (getMarkerPos "respawn_guerrila"))) exitWith {};
            if (JK_var_enableVehicle3rdPerson && (vehicle player != player)) exitWith {};
            vehicle player switchCamera "INTERNAL";
        }];
    #endif
};

#ifdef JK_var_isTvT
    missionNameSpace setVariable ["JK_TvT_Time",JK_var_TvTTime];
    [BASE1, BASE2, BASE3, BASE4, BASE5, BASE6, BASE7, BASE8] call JK_TvT_fnc_init;
#endif

JK_var_AllCrates append JK_var_ChooseLoadOut_Boxes;
JK_var_AllCrates call JK_Core_fnc_crate;

//-------------------------------------------------------------------------------------------------
