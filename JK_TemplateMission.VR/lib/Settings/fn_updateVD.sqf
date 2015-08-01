/*
	Author: joko // Jonas

	Description:
	

	Parameter(s):
	0: 
	Returns:
	- 

	Example:
	[] call JK_Settings_fnc_updateVD;
*/
switch (true) do {
    case ((vehicle player ) isKindOf "Man"): {
        setViewDistance jk_var_VDman;
    };
    case ((vehicle player ) isKindOf "LandVehicle"): {
        setViewDistance jk_var_VDcar;
    };
    case ((vehicle player ) isKindOf "Air"): {
        setViewDistance jk_var_VDair;
    };
};

setObjectViewDistance jk_var_VDobj;