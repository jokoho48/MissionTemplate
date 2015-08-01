player setVariable["jk_var_side", str(playerside), true];
player addEventhandler["Respawn",{ if !(player getVariable ["BIS_revive_incapacitated",true]) then {player setVariable["jk_var_side", str(playerside), true];};}];
JK_ChangeLog = call compile preprocessfilelinenumbers "Changelog.txt";
_info = player createDiarySubject ["Info", "Info"];
player createDiaryRecord ["Info",["Credits","Logistic System - By joko // Jonas<br/>Medical Drag and Drop - By joko // Jonas<br/>TvT Template - By Joko<br/>Generell Template Rework - By Joko // Jonas<br/>Belbo - Gear Script<br/>NetFusion - AME Nametags and AME Drag and Drop<br/>Astavinu - Basic Setup and Some Functions<br/>Pychobastard - TK Protection<br/>TAW_VD<br/>Xeno - X_Reload<br/>[FHQ] Varanon - FHQ Task Tracker<br/>Vehicle Crew List By X39"]];
player createDiaryRecord ["Info",["Version",format["<font size='18'>Version 1.9 Changelog:</font><br/><br/> %1",JK_ChangeLog]]];
player createDiaryRecord ["Info",["Teamspeak des Servers","<font size='18'Teamspeak IP:<br/>81.169.153.237:9985</font>"]];
JK_var_Info = "Lorem Ipsum";
player createDiaryRecord ["Info",["Informationen zur Mission",JK_var_Info]];
0 spawn {
    waitUntil {player == player && time > 1};
    [player] call JK_loadOut_fnc_loadOutsInit;
	[format["<img size= '6' shadow='false' image='data\logo.paa'/><br/><t size='.9' color='#FFFFFF'>%1<br/></t><t size='.5' color='#FFFFFF'>%2 81.169.153.237:9985</t>", localize "STR_JK_WELCOME_MESSAGE_1", localize "STR_JK_WELCOME_MESSAGE_2"],0,0,2,2] spawn BIS_fnc_dynamicText;
};
