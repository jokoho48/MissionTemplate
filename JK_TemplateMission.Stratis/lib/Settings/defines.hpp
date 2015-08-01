///////////////////////////////////////////////////////////////////////////
/// Styles
///////////////////////////////////////////////////////////////////////////

// Access Types
#define AT_READWRITE        0
#define AT_READCREATE       1
#define AT_READONLY         2
#define AT_READONLYVERIFIED 3

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4
#define SIZEEX sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
///////////////////////////////////////////////////////////////////////////
/// Base Classes
///////////////////////////////////////////////////////////////////////////

class JK_RSCSlider
{
    style = 1024;
    type = 43;
    shadow = 2;
    x = 0;
    y = 0;
    h = 0.029412;
    w = 0.400000;
    color[] = {
            1, 1, 1, 0.7
    };
    colorActive[] = {
            1, 1, 1, 1
    };
    colorDisabled[] = {
            1, 1, 1, 0.500000
    };
    arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
    thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};
class JK_RSCBox
{
    access = AT_READWRITE;
    type = CT_STATIC;
    idc = -1;
    colorBackground[] = { 0.2,0.2,0.2, 0.9 };
    colorText[] = {1,1,1,1};
    style = ST_CENTER;
    shadow = 2;
    font = "PuristaMedium";
    sizeEx = 0.02;
    text = "";
};
class JK_RSCFrame
{
    access = READWRITE;
    type = CT_STATIC;
    idc = -1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    style = ST_FRAME;
    shadow = 2;
    font = "PuristaMedium";
    sizeEx = 0.02;
    text = "";
};
class JK_RSCText
{
    access = AT_READWRITE;
    type = CT_STATIC;
    idc = -1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    text = "";
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    style = ST_LEFT;
    shadow = 2;
    font = "PuristaMedium";
    SIZEEX
};
class JK_RSCStructuredText
{
    access = AT_READWRITE;
    type = CT_STRUCTURED_TEXT;
    idc = -1;
    style = ST_LEFT;
    colorText[] = {1,1,1,1};
    class Attributes
    {
        font = "PuristaMedium";
        color = "#ffffff";
        align = "left";
        shadow = 1;
    };

    // Doesn't work
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    class StructeredTextScrollBar
    {
        color[] = {1,1,1,1};
        autoScrollEnabled = 1;
    };
    // Doesn't work

    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    shadow = 1;
};
class JK_RSCPicture
{
    access = AT_READWRITE;
    type = CT_STATIC;
    idc = -1;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "PuristaMedium";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};
class JK_RSCButton
{
    access = AT_READWRITE;
    type = CT_BUTTON;
    text = "";
    colorText[] = {1,1,1,1};
    colorDisabled[] = {0.8,0.8,0.8,1};
    colorBackground[] = {0,0,0,0.9};
    colorBackgroundDisabled[] = {1,1,1,0};
    colorBackgroundActive[] = {1,1,1,0.1};
    colorFocused[] = {0.8,0.8,0.8,1};
    colorShadow[] = {1,1,1,0};
    colorBorder[] = {1,1,1,0};
    soundEnter[] = {"",0.09,1};
    soundPush[] = {"",0.09,1};
    soundClick[] = {"\ca\ui\data\sound\new1",0.07,1};
    soundEscape[] = {"",0.09,1};
    style = ST_CENTER;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaMedium";
    SIZEEX
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};
class JK_RSCEdit
{
    access = AT_READWRITE;
    type = CT_EDIT;
    style = ST_FRAME;
    text = "";
    font = "PuristaMedium";
    shadow = 0;
    SIZEEX
    colorBackground[] =    {0,0,0,0.3};
    colorText[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    colorSelection[] = {0.8784, 0.8471, 0.651, 1.0};
    autoComplete = "";
};
class JK_ScrollBar
{
    color[] = {1,1,1,0.6};
    colorActive[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.3};
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    shadow = 0;
    scrollSpeed = 0.06;
    width = 0;
    height = 0;
    autoScrollEnabled = 0;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
};

class JK_RSCListBox
{
    x = 0;
    y = 0;
    w = 0.3;
    h = 0.3;
    style = 16;
    font = "PuristaMedium";
    sizeEx = "(            (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    shadow = 0;
    colorShadow[] = {0,0,0,0.5};
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
    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,0.25};
    colorPictureRight[] = {1,1,1,1};
    colorPictureRightSelected[] = {1,1,1,1};
    colorPictureRightDisabled[] = {1,1,1,0.25};
    colorTextRight[] = {1,1,1,1};
    colorSelectRight[] = {0,0,0,1};
    colorSelect2Right[] = {0,0,0,1};
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
    class JK_ListScrollBar: JK_ScrollBar
    {
        color[] = {1,1,1,1};
        autoScrollEnabled = 1;
    };
};

class JK_RSCListbox_NoBackgroundColor: JK_RSCListBox
{
    idc = 1500;
    x = 17.22 * GUI_GRID_W + GUI_GRID_X;
    y = 9.81 * GUI_GRID_H + GUI_GRID_Y;
    w = 4 * GUI_GRID_W;
    h = 2.5 * GUI_GRID_H;
    style = 2;
    colorText[] = {0,0,0,0};
    colorBackground[] = {0,0,0,0};
    colorActive[] = {0,0,0,0};
};
