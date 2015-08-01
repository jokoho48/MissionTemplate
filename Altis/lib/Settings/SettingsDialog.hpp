#include "defines.hpp"

// Settings Dialog
class JK_Settings_Dialog
{
    idd = 5013;
    movingenabled = 1;
    class controlsBackground
    {
        class vdBackground:  JK_RSCText
        {
        	idc = 1000;
        	x = 0.389669 * safezoneW + safezoneX;
        	y = 0.302043 * safezoneH + safezoneY;
        	w = 0.21138 * safezoneW;
        	h = 0.444924 * safezoneH;
        	colorBackground[] = {0, 0, 0, 0.7};
        };
        class vdTaskbar:  JK_RSCText
        {
        	idc = 1001;
        	text = "GeCo Settings Window"; //--- ToDo: Localize;
        	x = 0.38967 * safezoneW + safezoneX;
        	y = 0.280039 * safezoneH + safezoneY;
        	w = 0.21138 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
        };
        class vdText1:  JK_RSCText
        {
        	idc = 1002;
        	text = "Man"; //--- ToDo: Localize;
        	x = 0.38967 * safezoneW + safezoneX;
        	y = 0.458213 * safezoneH + safezoneY;
        	w = 0.041245 * safezoneW;
        	h = 0.0219957 * safezoneH;
        };
        class vdText2:  JK_RSCText
        {
        	idc = 1003;
        	text = "Car"; //--- ToDo: Localize;
        	x = 0.38967 * safezoneW + safezoneX;
        	y = 0.491207 * safezoneH + safezoneY;
        	w = 0.041245 * safezoneW;
        	h = 0.0219957 * safezoneH;
        };
        class vdText3:  JK_RSCText
        {
        	idc = 1004;
        	text = "Air"; //--- ToDo: Localize;
        	x = 0.38967 * safezoneW + safezoneX;
        	y = 0.5264 * safezoneH + safezoneY;
        	w = 0.041245 * safezoneW;
        	h = 0.0219957 * safezoneH;
        };
        class terrainText:  JK_RSCText
        {
        	idc = 1005;
        	text = "Terrain Grid Size"; //--- ToDo: Localize;
        	x = 0.448444 * safezoneW + safezoneX;
        	y = 0.609993 * safezoneH + safezoneY;
        	w = 0.0973343 * safezoneW;
        	h = 0.0219957 * safezoneH;
        };
        class vdTeamText:  JK_RSCText
        {
        	idc = 1006;
        	text = "Nametags"; //--- ToDo: Localize;
        	x = 0.470095 * safezoneW + safezoneX;
        	y = 0.30643 * safezoneH + safezoneY;
        	w = 0.0564006 * safezoneW;
        	h = 0.0219957 * safezoneH;
        };
        class vdObjText:  JK_RSCText
        {
        	idc = 1007;
        	text = "Object View Distance"; //--- ToDo: Localize;
        	x = 0.447411 * safezoneW + safezoneX;
        	y = 0.552789 * safezoneH + safezoneY;
        	w = 0.1179568 * safezoneW;
        	h = 0.0219957 * safezoneH;
        };
        class vdBy:  JK_RSCText
        {
        	idc = 1008;
        	text = "by Joko"; //--- ToDo: Localize;
        	x = 0.38967 * safezoneW + safezoneX;
        	y = 0.722767 * safezoneH + safezoneY;
        	w = 0.0490894 * safezoneW;
        	h = 0.0219957 * safezoneH;
        };
        class vdText:  JK_RSCText
        {
        	idc = 1009;
        	text = "View Distance"; //--- ToDo: Localize;
        	x = 0.459787 * safezoneW + safezoneX;
        	y = 0.431813 * safezoneH + safezoneY;
        	w = 0.0870231 * safezoneW;
        	h = 0.0319957 * safezoneH;
        };
        class grpMText:  JK_RSCText
        {
        	idc = 1010;
        	text = "Group Management"; //--- ToDo: Localize;
        	x = 0.459787 * safezoneW + safezoneX;
        	y = 0.65903 * safezoneH + safezoneY;
        	w = 0.0870231 * safezoneW;
        	h = 0.0319957 * safezoneH;
        };
    };
    class controls
    {
        //Buttons
        //-- Close
        class vdClose:  JK_RSCButton
        {
        	idc = 1600;
        	text = "X"; //--- ToDo: Localize;
        	x = 0.585584 * safezoneW + safezoneX;
        	y = 0.280035 * safezoneH + safezoneY;
        	w = 0.0154669 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	colorBackground[] = {1,0,0,1};
        	action = "closeDialog 0";
        };

        //--Nametag Disable
        class vdDisable:  JK_RSCButton
        {
        	idc = 1601;
        	text = "Disable"; //--- ToDo: Localize;
        	x = 0.393795 * safezoneW + safezoneX;
        	y = 0.33503 * safezoneH + safezoneY;
        	w = 0.08249 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	action = "[""Disable""] call JK_Settings_fnc_setNametag;";
        };
        class vdEnable:  JK_RSCButton
        {
        	idc = 1602;
        	text = "Enable"; //--- ToDo: Localize;
        	x = 0.512373 * safezoneW + safezoneX;
        	y = 0.335033 * safezoneH + safezoneY;
        	w = 0.08249 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	action = "[""Enable""] call JK_Settings_fnc_setNametag;";
        };

        //--Join/Leave Group
        class vdJoin:  JK_RSCButton
        {
        	idc = 1619;
        	text = "Toggle Group"; //--- ToDo: Localize;
        	x = 0.393795 * safezoneW + safezoneX;
        	y = 0.69003 * safezoneH + safezoneY;
        	w = 0.06149 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	action = "[""Join""] call JK_Settings_fnc_setNametag;";
        	Tooltip = "Enable or Disable Group Management"; //--- ToDo: Localize;
        };
        class vdLeave:  JK_RSCButton
        {
        	idc = 1620;
        	text = "Leave Group"; //--- ToDo: Localize;
        	x = 0.533373 * safezoneW + safezoneX;
        	y = 0.69003 * safezoneH + safezoneY;
        	w = 0.06149 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	action = "[""Leave""] call JK_Settings_fnc_setNametag;";
        	Tooltip = "Leave Group and Enable Group Management"; //--- ToDo: Localize;
        };
        class vdLeader:  JK_RSCButton
        {
        	idc = 1621;
        	text = "Take Leader"; //--- ToDo: Localize;
        	x = 0.459378 * safezoneW + safezoneX;
        	y = 0.69003 * safezoneH + safezoneY;
        	w = 0.06749 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	action = "[""Leader""] call JK_Settings_fnc_setNametag;";
        };
        //-- Nametag Color
        class vdTeam1:  JK_RSCButton
        {
        	idc = 1603;
        	text = "Join Team Red"; //--- ToDo: Localize;
        	x = 0.393795 * safezoneW + safezoneX;
        	y = 0.368028 * safezoneH + safezoneY;
        	w = 0.08249 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	action = "[""RED""] call JK_Settings_fnc_setNametag;";
        };
        class vdTeam2:  JK_RSCButton
        {
        	idc = 1604;
        	text = "Join Team Yellow"; //--- ToDo: Localize;
        	x = 0.393794 * safezoneW + safezoneX;
        	y = 0.39882 * safezoneH + safezoneY;
        	w = 0.08249 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	action = "[""YELLOW""] call JK_Settings_fnc_setNametag;";
        };
        class vdTeam3:  JK_RSCButton
        {
        	idc = 1605;
        	text = "Join Team Green"; //--- ToDo: Localize;
        	x = 0.513404 * safezoneW + safezoneX;
        	y = 0.365828 * safezoneH + safezoneY;
        	w = 0.08249 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	action = "[""GREEN""] call JK_Settings_fnc_setNametag;";
        };
        class vdTeam4:  JK_RSCButton
        {
        	idc = 1606;
        	text = "Join Team Blue"; //--- ToDo: Localize;
        	x = 0.513404 * safezoneW + safezoneX;
        	y = 0.396622 * safezoneH + safezoneY;
        	w = 0.08249 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	action = "[""BLUE""] call JK_Settings_fnc_setNametag;";
        };
        class vdTeam5:  JK_RSCButton
        {
        	idc = 1607;
        	text = "Leave"; //--- ToDo: Localize;
        	x = 0.479378 * safezoneW + safezoneX;
        	y = 0.332834 * safezoneH + safezoneY;
        	w = 0.0309337 * safezoneW;
        	h = 0.0879826 * safezoneH;
        	action = "[""MAIN""] call JK_Settings_fnc_setNametag;";
        };

        //-- Terrin Grid
        class vdTerrainLow:  JK_RSCButton
        {
        	idc = 1608;
        	text = "Low"; //--- ToDo: Localize;
        	x = 0.437101 * safezoneW + safezoneX;
        	y = 0.636383 * safezoneH + safezoneY;
        	w = 0.0309337 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	action = "[""low"",0] call JK_Settings_fnc_ViewDistance;";
        };
        class vdTerrainMiddle:  JK_RSCButton
        {
        	idc = 1609;
        	text = "Middle"; //--- ToDo: Localize;
        	x = 0.474221 * safezoneW + safezoneX;
        	y = 0.636383 * safezoneH + safezoneY;
        	w = 0.0309337 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	action = "[""middle"",0] call JK_Settings_fnc_ViewDistance;";
        };
        class vdTerrainHigh:  JK_RSCButton
        {
        	idc = 1610;
        	text = "High"; //--- ToDo: Localize;
        	x = 0.512373 * safezoneW + safezoneX;
        	y = 0.636383 * safezoneH + safezoneY;
        	w = 0.0309337 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	action = "[""high"",0] call JK_Settings_fnc_ViewDistance;";
        };

        //-- View Distance Slider
        class vdSlider1:  JK_RSCSlider
        {
        	idc = 1611;
        	text = "";
        	x = 0.422666 * safezoneW + safezoneX;
        	y = 0.460407 * safezoneH + safezoneY;
        	w = 0.144357 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	onSliderPosChanged = "[""man"",_this select 1] call JK_Settings_fnc_ViewDistance;";
        };
        class vdSlider2:  JK_RSCSlider
        {
        	idc = 1612;
        	text = "";
        	x = 0.422666 * safezoneW + safezoneX;
        	y = 0.493407 * safezoneH + safezoneY;
        	w = 0.144357 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	onSliderPosChanged = "[""car"",_this select 1] call JK_Settings_fnc_ViewDistance;";
        };
        class vdSlider3:  JK_RSCSlider
        {
        	idc = 1613;
        	text = "";
        	x = 0.422666 * safezoneW + safezoneX;
        	y = 0.5286 * safezoneH + safezoneY;
        	w = 0.144357 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	onSliderPosChanged = "[""air"",_this select 1] call JK_Settings_fnc_ViewDistance;";
        };
        class vdSlider4:  JK_RSCSlider
        {
        	idc = 1614;
        	text = "";
        	x = 0.422666 * safezoneW + safezoneX;
        	y = 0.581383 * safezoneH + safezoneY;
        	w = 0.144357 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	onSliderPosChanged = "[""obj"",_this select 1] call JK_Settings_fnc_ViewDistance;";
        };

        //-- View Distance Eidts
        class vdEdit1:  JK_RSCEdit
        {
        	idc = 1615;
        	x = 0.571148 * safezoneW + safezoneX;
        	y = 0.458213 * safezoneH + safezoneY;
        	w = 0.0257781 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	onKeyDown = "[""man"",parseNumber(ctrlText 1615)] call JK_Settings_fnc_ViewDistance;";
        };
        class vdEdit2:  JK_RSCEdit
        {
        	idc = 1616;
        	x = 0.571148 * safezoneW + safezoneX;
        	y = 0.491207 * safezoneH + safezoneY;
        	w = 0.0257781 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	onKeyDown = "[""car"",parseNumber(ctrlText 1616)] call JK_Settings_fnc_ViewDistance;";
        };
        class vdEdit3:  JK_RSCEdit
        {
        	idc = 1617;
        	x = 0.571016 * safezoneW + safezoneX;
        	y = 0.524845 * safezoneH + safezoneY;
        	w = 0.0257781 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	onKeyDown = "[""air"",parseNumber(ctrlText 1617)] call JK_Settings_fnc_ViewDistance;";
        };
        class VDEdit4:  JK_RSCEdit
        {
        	idc = 1618;
        	x = 0.571148 * safezoneW + safezoneX;
        	y = 0.576989 * safezoneH + safezoneY;
        	w = 0.0257781 * safezoneW;
        	h = 0.0219957 * safezoneH;
        	onKeyDown = "[""obj"",parseNumber(ctrlText 1618)] call JK_Settings_fnc_ViewDistance;";
        };
    };
};