{
	sliderSetRange [_x select 0,100,12000];
	((findDisplay 5002) displayCtrl (_x select 0)) sliderSetSpeed [100,100,100];
	sliderSetPosition[_x select 0, _x select 1];
	false
} count [[1611,jk_var_VDman],[1612,jk_var_VDcar],[1613,jk_var_VDair],[1614,jk_var_VDobj]];
ctrlSetText[1615, format["%1", jk_var_VDman]];
ctrlSetText[1616, format["%1", jk_var_VDcar]];
ctrlSetText[1617, format["%1", jk_var_VDair]];
ctrlSetText[1618, format["%1", jk_var_VDobj]];