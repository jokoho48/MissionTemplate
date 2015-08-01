#define __UI_Path(lfile) QUOTE(\A3\ui_f\data\lfile)
#define __UI_Path_Map(mfile) QUOTE(\A3\ui_f\data\map\mapcontrol\mfile)
#define __UI_Path_Scrollbar(sfile) QUOTE(\A3\ui_f\data\gui\cfg\scrollbar\sfile)
#define __UI_Path_ShortcutButton(scfile) QUOTE(\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\scfile)
#define __UI_Path_Combo(cbfile) QUOTE(\A3\ui_f\data\GUI\RscCommon\rsccombo\cbfile)
#define __UI_Path_Slider(slfile) QUOTE(\A3\ui_f\data\gui\cfg\slider\slfile)
#define __UI_Path_Roles(rlfile) QUOTE(\A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\rlfile)
#define __UI_Sound_Path(sfile) QUOTE(\A3\ui_f\data\sound\sfile)

#define CT_STATIC			0
#define CT_BUTTON			1
#define CT_EDIT				2
#define CT_SLIDER			3
#define CT_COMBO			4
#define CT_LISTBOX			5
#define CT_TOOLBOX			6
#define CT_CHECKBOXES		7
#define CT_PROGRESS			8
#define CT_HTML				9
#define CT_STATIC_SKEW		10
#define CT_ACTIVETEXT		11
#define CT_TREE				12
#define CT_STRUCTURED_TEXT	13 
#define CT_3DSTATIC			20
#define CT_3DACTIVETEXT		21
#define CT_3DLISTBOX		22
#define CT_3DHTML			23
#define CT_3DSLIDER			24
#define CT_3DEDIT			25
#define CT_OBJECT			80
#define CT_OBJECT_ZOOM		81
#define CT_OBJECT_CONTAINER	82
#define CT_OBJECT_CONT_ANIM	83
#define CT_USER				99
#define ST_HPOS				0x0F
#define ST_LEFT				0
#define ST_RIGHT			1
#define ST_CENTER			2
#define ST_UP				3
#define ST_DOWN				4
#define ST_VCENTER			5
#define ST_TYPE				0xF0
#define ST_SINGLE			0
#define ST_MULTI			16
#define ST_TITLE_BAR		32
#define ST_PICTURE			48
#define ST_FRAME			64
#define ST_BACKGROUND		80
#define ST_GROUP_BOX		96
#define ST_GROUP_BOX2		112
#define ST_HUD_BACKGROUND	128
#define ST_TILE_PICTURE		144
#define ST_WITH_RECT		160
#define ST_LINE				176
#define ST_SHADOW			256
#define ST_NO_RECT			512
#define ST_KEEP_ASPECT_RATIO  0x800
#define ST_TITLE			ST_TITLE_BAR + ST_CENTER
#define FontHTML			"PuristaMedium"
#define FontM				"PuristaMedium"
#define Dlg_ROWS			36
#define Dlg_COLS			90
#define Dlg_CONTROLHGT		((100/Dlg_ROWS)/100)
#define Dlg_COLWIDTH		((100/Dlg_COLS)/100)
#define Dlg_TEXTHGT_MOD		0.9
#define Dlg_ROWSPACING_MOD	1.3
#define Dlg_ROWHGT			(Dlg_CONTROLHGT*Dlg_ROWSPACING_MOD)
#define Dlg_TEXTHGT			(Dlg_CONTROLHGT*Dlg_TEXTHGT_MOD)
#define UILEFT				0
#define UICOMBO				4
#define DEFAULTFONT			"PuristaMedium"

#define TextBlack			colorText[] = {1, 1, 1, 1}
#define TextBI			colorText[] = {0.543, 0.5742, 0.4102, 1}
//#define TextBI			colorText[] = {1, 1, 1, 1}
#define TextHud			colorText[] = {0.543, 0.5742, 0.4102, 0.9}
//#define MainCapt			colorText[] = {0.543, 0.5742, 0.4102, 1.0}
#define MainCapt			colorText[] = {1, 1, 1, 1}
#define Color_Green 		colorText[] = {0.24, 0.47, 0.07, 1.0}
#define Color_Red 			colorText[] = {0.9, 0.2, 0.2, 1}
#define Color_Yellow 		colorText[] = {0.8, 0.9, 0.4, 1}
#define __GUI_BCG_RGB {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"}
#define __GUI_TXT_RGB {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1}


class tkRscButton {
	idc = -1;
	type = CT_BUTTON;
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = FontM;
	sizeEx = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1";
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.7};
	colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
	colorShadow[] = {0,0,0,1};
	colorBorder[] = {0,0,0,1};
	borderSize = 0.0;
	soundEnter[] = {__UI_Sound_Path(mouse2), 0.09,1};
	soundPush[] = {__UI_Sound_Path(new1), 0.0, 1};
	soundClick[] = {__UI_Sound_Path(mouse3), 0.07, 1};
	soundEscape[] = {__UI_Sound_Path(mouse1), 0.09, 1};
	default = false;
};
class tkRscNavButton:tkRscButton {
	w = 0.1; h = 0.04;
	x = 0.90;
};

class tkRscPicture {
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	x = 0.1; y = 0.1;
	w = 0.4; h = 0.2;
	sizeEx = Dlg_TEXTHGT;
	colorBackground[] = {0, 0, 0, 0};
	TextBlack;
	font = FontM;
	text = "";
};

class tkRscShortcutButton {
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	color[] = {1,1,1,1.0};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
	colorBackground2[] = {1,1,1,1};
	textureNoShortcut = "";
	animTextureDefault = __UI_Path_ShortcutButton(normal_ca.paa);
	animTextureNormal = __UI_Path_ShortcutButton(normal_ca.paa);
	animTextureDisabled = __UI_Path_ShortcutButton(normal_ca.paa);
	animTextureOver = __UI_Path_ShortcutButton(over_ca.paa);
	animTextureFocused = __UI_Path_ShortcutButton(focus_ca.paa);
	animTexturePressed = __UI_Path_ShortcutButton(down_ca.paa);
	periodFocus = 1.2;
	periodOver = 0.8;
	class HitZone {
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos {
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos {
		left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	period = 0.4;
	font = FontM;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	soundEnter[] = {"\A3\ui_f\data\sound\onover",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\new1",0.0,0};
	soundClick[] = {"\A3\ui_f\data\sound\onclick",0.07,1};
	soundEscape[] = {"\A3\ui_f\data\sound\onescape",0.09,1};
	action = "";
	class Attributes {
		font = FontM;
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class AttributesImage {
		font = FontM;
		color = "#E5E5E5";
		align = "left";
	};
};

class tkButtonBase: tkRscShortcutButton {
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.039216;
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,0.5)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = {0,0,0,0.8};
	colorBackground2[] = {1,1,1,0.5};
	colorBackgroundFocused[] = {1,1,1,0.5};
	colorFocused[] = {1,1,1,0.5};
	color[] = {1,1,1,1};
	color2[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	class TextPos {
		left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	class Attributes {
		font = FontM;
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class ShortcutPos {
		left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
};

class tkUIList {
	font = FontM;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	colorShadow[] = {0,0,0,0.5};
	color[] = {1,1,1,1};
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	period = 1.2;
	colorBackground[] = {0,0,0,0.3};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	class ScrollBar {
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = __UI_Path_Scrollbar(thumb_ca.paa);
		arrowFull = __UI_Path_Scrollbar(arrowFull_ca.paa);
		arrowEmpty = __UI_Path_Scrollbar(arrowEmpty_ca.paa);
		border = __UI_Path_Scrollbar(border_ca.paa);
	};
};
class tkRscCombo {
	style = 16;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelect[] = {0,0,0,1};
	colorText[] = {0.95,0.95,0.95,1};
	colorBackground[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.7};
	colorScrollbar[] = {1,0,0,1};
	arrowEmpty = __UI_Path_Combo(arrow_combo_ca.paa);
	arrowFull = __UI_Path_Combo(arrow_combo_active_ca.paa);
	wholeHeight = 0.45;
	color[] = {1,1,1,1};
	colorActive[] = {1,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	font = FontM;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	class ScrollBar {
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = __UI_Path_Scrollbar(thumb_ca.paa);
		arrowFull = __UI_Path_Scrollbar(arrowFull_ca.paa);
		arrowEmpty = __UI_Path_Scrollbar(arrowEmpty_ca.paa);
		border = __UI_Path_Scrollbar(border_ca.paa);
	};
};
class tkUIComboBox: tkRscCombo {
	type = UICOMBO;
	//style = 0;
	idc = -1;
	sizeEx = 0.025;
	wholeHeight = 0.3;
	colorText[] = {1,1,1,1};
};
class tkRscText {
	type = CT_STATIC;
	idc = -1;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 1;
	colorShadow[] = {0,0,0,0.5};
	font = FontM;
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,1,1,1.0};
	colorBackground[] = {0,0,0,0};
	linespacing = 1;
	text = "";
};



// -----------------------------------------------------------------------------------------
// ------------ ! Standard Defintions for Backgrounds and Buttons ! ------------------------
class tkRscText_Header: tkRscText {
	w = 0.6; h = 0.1;
	shadow = 1;
	font = FontM;
	colorShadow[] = {0, 0, 0, 0.5};
	colorBackground[] = {1, 1, 1, 0};
	sizeEx = 0.055;
	MainCapt;
};
class tkCA_Mainback: tkRscPicture {
	x = 0.0;
	y = 0.0;
	w = 1.15;
	h = 0.9;
	text = "#(argb,8,8,3)color(0.2,0.2,0.3,0.4)";
	colorBackground[] = {0, 0, 0, 0.7};
	colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
};
class tkCA_Back: tkCA_Mainback {
	x = 0.29;
	y = 0.38;
	w = 0.56;
	h = 0.57;
	colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
	text = "#(argb,8,8,3)color(0,0,0,0.5)";
};
class tkCA_Title_Back: tkCA_Mainback {
	x = 0; y = 0;
	w = 1.15; h = 0.1;
	colorBackground[] = {0.5,1,1,0.8};
	text = "#(argb,8,8,3)color(0,0,0,0.5)";
	colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
};

// standard background, dark grey and header, black and header text (must be defined in the expected dialog
class tkpsy_BackGround : tkCA_Mainback {
	x = -0.04; y = 0;
	w = 1.15; h = 0.9;
};
class tkpsy_BackGround_Header : tkCA_Title_Back {
	x = -0.04; y = 0;
	w = 1.15; h = 0.1;
};
class tkpsy_MainCaption_Header : tkRscText_Header {
	x = 0.00; y = 0.01;
	text = "define text header";
};
// x cross picture and red button for exit at right top corner
class tkpsy_exit_cross_picture : tkRscPicture {
	sizeEx = 0.01;
	x = 1.062; y = 0.015;
	w = 0.03; h = 0.03;
	text = "\a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};
class tkpsy_exit_cross_button : tkRscButton {
	idc = -1;
	x = 1.062; y = 0.015;
	w = 0.032; h = 0.032;
	text = "";
	colorBackground[] = {0.9, 0.2, 0.2, 0.3};
	colorBackgroundActive[] = {0.9, 0.2, 0.2, 0.5};
	colorShadow[] = {0.023529, 0, 0.0313725, 0.2};
	colorBorder[] = {0.6, 0.6, 0.6, 0.3};
	borderSize = 0.000;
	action = "closeDialog 0";
	default = false;
};


// same background but smaller
class tkpsy_BackGround_small : tkCA_Mainback {
	x = 0; y = 0;
	w = 0.7666; h = 0.45;
};
class tkpsy_BackGround_Header_small : tkCA_Title_Back {
	x = 0; y = 0;
	w = 0.7666; h = 0.05;
};
class tkpsy_MainCaption_Header_small : tkRscText_Header {
	x = 0.01; y = -0.02;
	sizeEx = 0.05;
	text = "define text header";
};
// xcross for small backgrounds
class tkpsy_exit_cross_picture_small : tkpsy_exit_cross_picture {
	x = 0.725; y = 0.0075;
};
class tkpsy_exit_cross_button_small : tkpsy_exit_cross_button {
	idc = -1;
	x = 0.725; y = 0.0075;
};