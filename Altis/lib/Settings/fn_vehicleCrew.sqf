/**
 *    @Param 1 - ACTION:
 *        STRING - String containing the action name, possible actions:
 *                    - init
 *                    - EH_KeyUp
 *                    - EH_KeyDown
 *                    - CreateDisplay
 *                    - DestroyDisplay
 *    @Param 2 - PARAMETERS:
 *        ARRAY, see:
 *            @Action "init":
 *                [
 *                    ARRAY   - Array containing all valid KeysArrays for this action (KeyArray: [KeyToPress:SCALAR, ShiftState:BOOLEAN, CtrlState:BOOLEAN, AltState:BOOLEAN])
 *                    OBJECT  - Object whichs vehicle partners are watches (most of the time should be player)
 *                ]
 *            @Action "EH_KeyUp", "EH_KeyDown":
 *                [
 *                    ANY     - Any thingy
 *                    SCALAR  - Key pressed
 *                    BOOLEAN - SHIFT state
 *                    BOOLEAN - CTRL state
 *                    BOOLEAN - ALT state
 *                ]
 *            @Action "CreateDisplay", "DestroyDisplay":
 *                []
 */
 
//Error Defines
#define ERROR_COULD_NOT_CREATE_DISPLAY "Could not create display"
#define ERROR_UNKNOWN_ACTION "Unknown action"
//UI Defines
#define uiPositionX debug_uiPositionX
#define uiPositionY debug_uiPositionY
#define uiPositionW debug_uiPositionW
#define uiPositionH debug_uiPositionH
#define uiPosition [uiPositionX, uiPositionY, uiPositionW, uiPositionH]
#define uiIDC 32001
#define uiPictureColor [0, 0, 0, 0]
#define uiBackgroundColor [0, 0, 0, 0]
#define uiActiveColor [0, 0, 0, 0]
#define uiForegroundColor [0, 0, 0, 0]
//Macros
#define uiVariable(VAR) (uiNamespace getVariable [VAR, displayNull])

 
private ["_action", "___returnValue___"];
_thisOriginal =_this;
_action = _this select 0;
_this = _this select 1;
___returnValue___ = false;
 
switch(_action) do
{
    case "init": {
        //Assign the different variables of this script
        X39_XLib_var_VehicleDisplay_ActionKeys = _this select 0;
        X39_XLib_var_VehicleDisplay_WatchedUnit = _this select 1;
        X39_XLib_var_VehicleDisplay_LastUnitsInVehicle = [];
        debug_uiPositionX = 0.8 * safezoneW + safezoneX;
        debug_uiPositionY = 0.20 * safezoneH + safezoneY;
        debug_uiPositionW = 0.154687 * safezoneW;
        debug_uiPositionH = 3 * safezoneH;
        X39_XLib_var_VehicleDisplay_KeyEventHandler = [
            (findDisplay 46) displayAddEventHandler ["KeyDown", format["(['EH_KeyDown', _this] call (missionNamespace getVariable %1))", str _fnc_scriptName]],
            (findDisplay 46) displayAddEventHandler ["KeyUp", format["(['EH_KeyUp', _this] call (missionNamespace getVariable %1))", str _fnc_scriptName]]
        ];
        
        //Create the display element
        ["CreateDisplay", nil] call (missionNamespace getVariable _fnc_scriptName);

        ___returnValue___ = true;
    };
    case "EH_KeyUp": {
        //Clear display element and after that exit this function if it is not in our key list
        _this deleteAt 0;
        if(!(_this in X39_XLib_var_VehicleDisplay_ActionKeys)) exitWith {};
        
        //Check if the vehicleDisplayUI has to be hidden
        if(ctrlShown uiVariable("X39_XLib_var_VehicleDisplay_UI")) then
        {
            uiVariable("X39_XLib_var_VehicleDisplay_UI") ctrlShow false;
        };
        ___returnValue___ = true;
    };
    case "EH_KeyDown": {
        //Clear display element and after that exit this function if it is not in our key list
        _this deleteAt 0;
        if(!(_this in X39_XLib_var_VehicleDisplay_ActionKeys)) exitWith {};
        
        private["_crew", "_index"];
        //check if we are currently in a vehicle and leave the script if we are not
        if(vehicle X39_XLib_var_VehicleDisplay_WatchedUnit == X39_XLib_var_VehicleDisplay_WatchedUnit) exitWith
        {
            if(ctrlShown uiVariable("X39_XLib_var_VehicleDisplay_UI")) then
            {
                uiVariable("X39_XLib_var_VehicleDisplay_UI") ctrlShow false;
            };
        };
        uiVariable("X39_XLib_var_VehicleDisplay_UI") ctrlShow true;
        //get current crew of the vehicle and compare it to the last
        _crew = fullCrew vehicle X39_XLib_var_VehicleDisplay_WatchedUnit;
        if(!(X39_XLib_var_VehicleDisplay_LastUnitsInVehicle isEqualTo _crew)) then
        {
            //last crew differs from current crew, clear the listbox and update every crew entry
            X39_XLib_var_VehicleDisplay_LastUnitsInVehicle = _crew;
            lbClear uiVariable("X39_XLib_var_VehicleDisplay_UI");
            {
                
                _index = uiVariable("X39_XLib_var_VehicleDisplay_UI") lbAdd name (_x select 0);
                switch(toLower (_x select 1)) do
                {
                    case "driver": {
                        uiVariable("X39_XLib_var_VehicleDisplay_UI") lbSetPicture  [_index, "a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa"];
                    };
                    case "gunner"; case "turret": {
                        uiVariable("X39_XLib_var_VehicleDisplay_UI") lbSetPicture  [_index, "a3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa"];
                    };
                    case "commander": {
                        uiVariable("X39_XLib_var_VehicleDisplay_UI") lbSetPicture  [_index, "a3\ui_f\data\IGUI\Cfg\Actions\getincommander_ca.paa"];
                    };
                    default {
                        uiVariable("X39_XLib_var_VehicleDisplay_UI") lbSetPicture  [_index, "a3\ui_f\data\IGUI\Cfg\Actions\getincargo_ca.paa"];
                    };
                };
                uiVariable("X39_XLib_var_VehicleDisplay_UI") lbSetPictureColor [_index, uiPictureColor];
                false
            } count _crew;
        };
        ___returnValue___ = true;
    };
    case "CreateDisplay": {
        uiNamespace setVariable ["X39_XLib_var_VehicleDisplay_UI", ((findDisplay 46) ctrlCreate ["RSCListbox", uiIDC])];
        if(isNull uiVariable("X39_XLib_var_VehicleDisplay_UI")) then
        {
            throw ERROR_COULD_NOT_CREATE_DISPLAY;
        };
        uiVariable("X39_XLib_var_VehicleDisplay_UI") ctrlShow false;
        uiVariable("X39_XLib_var_VehicleDisplay_UI") ctrlSetPosition uiPosition;
        uiVariable("X39_XLib_var_VehicleDisplay_UI") ctrlSetBackgroundColor uiBackgroundColor;
        uiVariable("X39_XLib_var_VehicleDisplay_UI") ctrlSetActiveColor uiActiveColor;
        uiVariable("X39_XLib_var_VehicleDisplay_UI") ctrlSetForegroundColor uiForegroundColor;
        uiVariable("X39_XLib_var_VehicleDisplay_UI") ctrlCommit 0;
        ___returnValue___ = true;
    };
    case "DestroyDisplay": {
        ctrlDelete uiVariable("X39_XLib_var_VehicleDisplay_UI");
        uiNamespace setVariable ["X39_XLib_var_VehicleDisplay_UI", nil];
        ___returnValue___ = true;
    }:
    default {
        throw ERROR_UNKNOWN_ACTION;
        hint str _thisOriginal;
        diag_log str _thisOriginal;
    };
};
___returnValue___