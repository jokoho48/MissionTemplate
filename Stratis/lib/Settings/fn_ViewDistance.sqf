/*
    Author: joko // Jonas

    Description:


    Parameter(s):
    0:
    1:
    Returns:
    -

    Example:
    [] call JK_Settings_fnc_ViewDistance;
*/
params["_mode","_value"];

//View Distance
if (_mode isEqualTo "man") exitwith {
    jk_var_VDman = _value;
    profileNameSpace setVariable ["JK_GeCo_viewDistanceMan",jk_var_VDman];
    call JK_Settings_fnc_updateVD;
    call JK_Settings_fnc_UpdateUI;
};
if (_mode isEqualTo "car") exitwith {
    jk_var_VDcar = _value;
    profileNameSpace setVariable ["JK_GeCo_viewDistanceCar",jk_var_VDcar];
    call JK_Settings_fnc_updateVD;
    call JK_Settings_fnc_UpdateUI;
};
if (_mode isEqualTo "air") exitwith {
    jk_var_VDair = _value;
    profileNameSpace setVariable ["JK_GeCo_viewDistanceAir",jk_var_VDair];
    call JK_Settings_fnc_updateVD;
    call JK_Settings_fnc_UpdateUI;
};
//Object View Distance
if (_mode isEqualTo "obj") exitwith {
    jk_var_VDobj = _value;
    profileNameSpace setVariable ["JK_GeCo_viewDistanceObj",jk_var_VDobj];
    call JK_Settings_fnc_updateVD;
    call JK_Settings_fnc_UpdateUI;
};

//Terrain Grid
if (_mode isEqualTo "low") exitwith {setTerrainGrid JK_var_TerrainLow;};
if (_mode isEqualTo "middle") exitwith {setTerrainGrid JK_var_TerrainMiddle;};
if (_mode isEqualTo "high") exitwith {setTerrainGrid JK_var_TerrainHigh;};


if (true) exitwith {};
