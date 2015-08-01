class Captcha_Dialog {	// missionConfigFile >> "Captcha_Dialog"
	idd = 53000;
	movingEnable = 1;
	objects[] = {};
	onLoad= "[] execVM tk_path + 'dialogs\create_captcha.sqf'; uiNamespace setVariable ['Captcha_Dialog', _this select 0];";
	onUnLoad="uiNamespace setVariable ['Captcha_Dialog', nil];";
	
	class controlsBackground {
		class XD_BackGround : tkpsy_BackGround {};
		class XD_BackGround_Header : tkpsy_BackGround_Header {};
		class XD_MainCaption : tkpsy_MainCaption_Header {
			sizeEx = 0.065;
			text = "GeCo - Personality Test";
		};
		class exit_cross : tkpsy_exit_cross_picture {};
	};
	
	class controls {
		class tkxcross_button : tkpsy_exit_cross_button {action = "[] execVM tk_path + 'dialogs\leave_captcha.sqf'";};
		class InfoLine1 : tkRscText {
			idc = -1;
			x = 0.02;
			y = 0.11;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.045;
			colorBackground[] = {1, 1, 1, 0};
			Color_Yellow;
			text = "Willkommen auf dem GeCo Server!";
		};
		class InfoLine2 : tkRscText {
			idc = -1;
			x = 0.02;
			y = 0.16;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "Hier findet im Moment die groesste offene";
		};
		class InfoLine3 : tkRscText {
			idc = -1;
			x = 0.02;
			y = 0.195;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "Coop-Schlacht statt die es im deutschsprachigen";
		};
		class InfoLine35 : tkRscText {
			idc = -1;
			x = 0.02;
			y = 0.23;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "Raum gibt. Besuche unseren Teamspeakserver";
		};
		class InfoLine4 : tkRscText {
			idc = -1;
			x = 0.02;
			y = 0.265;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "um maximalen Spielspass zu erleben.";
		};
		class InfoLine5 : tkRscText {
			idc = -1;
			x = 0.02;
			y = 0.36;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "Im folgenden wirst du dazu aufgefordert";
		};
		class InfoLine6 : tkRscText {
			idc = -1;
			x = 0.02;
			y = 0.395;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "eine einfache Frage zu beantworten. Daraufhin";
		};
		class InfoLine7 : tkRscText {
			idc = -1;
			x = 0.02;
			y = 0.43;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "werden dir die Daten fuer den Teamspeakserver";
		};
		class InfoLine8 : tkRscText {
			idc = -1;
			x = 0.02;
			y = 0.465;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "angezeigt - trau dich! ;-)";
		};
		
		class picture : tkRscPicture {
			x = 0.63;
			y = 0.22;
			w = 0.26;
			h = 0.3;
			colorBackground[] = {0,0,0,0};
			text = "tk_protection\dialogs\geco_logo.paa";
		};
		
		class MessageLine : tkRscText {
			idc = -1;
			x = 0.008;
			y = 0.58;
			w = 0.97;
			h = 0.002;
			sizeEx = 0.001;
			colorBackground[] = {0, 0, 0, 0.8};
			TextBlack;
			text = "";
		};
		
		class Question : tkRscText {
			idc = 53002;
			x = 0.02;
			y = 0.6;
			w = 1.5;
			h = 0.08;
			sizeEx = 0.05;
			colorBackground[] = {1, 1, 1, 0};
			TextBI;
			text = "loading...";
		};
		class AnswerHint : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.665;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.03;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "Antwort:";
		};
		class Answer {
			idc = 53001;
			type = 2;
			style = ST_LEFT + ST_MULTI;
			x = 0.29;
			y = 0.7;
			w = 0.6;
			h = 0.0362429;
			sizeEx = 0.035;
			font = DEFAULTFONT;
			text = "";
			
			colorText[] = {0.9, 0.2, 0.2, 1};
			colorDisabled[] = {0,0,0,0};
			colorSelection[] = {0.0, 0.0, 0.0, 0};
			autocomplete = false;
		};
		
		class ClearButton: tkButtonBase {
			idc = -1;
			text = "Clear"; 
			action = "_ctrl = (uiNamespace getVariable 'Captcha_Dialog') displayCtrl 53001;_ctrl ctrlsettext ''";
			x = 0.665;
			y = 0.77;
		};
		class CheckButton: tkButtonBase {
			idc = -1;
			text = "Check";
			action = "[] execVM tk_path + 'dialogs\check_captcha.sqf'";
			default = true;
			x = 0.125;
			y = 0.77;
			w = 0.4;
		};
		/*
		class CloseButton: tkButtonBase {
			idc = -1;
			text = "Exit"; 
			action = "[] execVM tk_path + 'dialogs\leave_captcha.sqf'";
			x = 0.665;
			y = 0.91;
		};
		*/
	};
};




class Captcha_Passed_Dialog {	// missionConfigFile >> "Captcha_Passed_Dialog"
	idd = -1;
	movingEnable = 1;
	objects[] = {};
	onLoad="";
	onUnLoad="";
	class controlsBackground {
		class XD_BackGround : tkpsy_BackGround {};
		class XD_BackGround_Header : tkpsy_BackGround_Header {};
		class XD_MainCaption : tkpsy_MainCaption_Header {
			sizeEx = 0.065;
			Color_Green;
			text = "GeCo - Captcha Passed";
		};
		class exit_cross : tkpsy_exit_cross_picture {};
	};
	
	class controls {
		class tkxcross_button : tkpsy_exit_cross_button {};

		class InfoLine1 : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.11;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "Geschafft! Um voll in das Teamspiel integriert sein zu koennen,";
		};
		class InfoLine2 : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.145;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "besuche doch einfach unseren Teamspeak Server. :-)";
		};
		class InfoLine3 : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.3;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "Server IP:";
		};
		class InfoLine4 : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.35;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "Server Passwort:";
		};
		class InfoLine45 : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.4;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "Homepage:";
		};
		class InfoLine5 : tkRscText {
			idc = -1;
			x = 0.5;
			y = 0.3;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.04;
			colorBackground[] = {1, 1, 1, 0};
			Color_Yellow;
			text = "46.4.121.253:9988";
		};
		class InfoLine6 : tkRscText {
			idc = -1;
			x = 0.5;
			y = 0.35;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.04;
			colorBackground[] = {1, 1, 1, 0};
			Color_Yellow;
			text = "ohne Passwort";
		};
		class InfoLine65 : tkRscText {
			idc = -1;
			x = 0.5;
			y = 0.4;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.04;
			colorBackground[] = {1, 1, 1, 0};
			Color_Yellow;
			text = "www.germany-coop.de";
		};

		class checkButton: tkButtonBase {
			idc = -1;
			text = "Verstanden";
			action = "closeDialog 0";
			default = true;
			x = 0.3;
			y = 0.77;
			w = 0.4;
		};
		/*
		class CloseButton: tkButtonBase {
			idc = -1;
			text = "Exit"; 
			action = "closeDialog 0";
			x = 0.665;
			y = 0.91;
		};
		*/
	};
};




class Captcha_Failed_Dialog {	// missionConfigFile >> "Captcha_Failed_Dialog"
	idd = -1;
	movingEnable = 1;
	objects[] = {};
	onLoad="";
	onUnLoad="";
	class controlsBackground {
		class XD_BackGround : tkpsy_BackGround {};
		class XD_BackGround_Header : tkpsy_BackGround_Header {};
		class XD_MainCaption : tkpsy_MainCaption_Header {
			sizeEx = 0.065;
			Color_Red;
			text = "GeCo - Captcha Failed";
		};
		class exit_cross : tkpsy_exit_cross_picture {};
	};
	
	class controls {
		class tkxcross_button : tkpsy_exit_cross_button {};

		class InfoLine1 : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.11;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "You have reached the Captcha-Limit!";
		};
		class InfoLine2 : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.16;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "This is a German Coop Community Event Mission for german players.";
		};
		class InfoLine3 : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.19;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "If you want more information visit our Homepage.";
		};
		class InfoLine4 : tkRscText {
			idc = -1;
			x = 0.35;
			y = 0.3;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.055;
			colorBackground[] = {1, 1, 1, 0};
			Color_Yellow;
			text = "www.germany-coop.de";
		};
		class InfoLine5 : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.5;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "You will be removed from the server automatically";
		};
		class InfoLine6 : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.53;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "in a few moments.";
		};
		class InfoLine7 : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.56;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "We are sorry and hope you understand this.";
		};
		class InfoLine8 : tkRscText {
			idc = -1;
			x = 0.12;
			y = 0.66;
			w = 1.0;
			h = 0.1;
			sizeEx = 0.035;
			colorBackground[] = {1, 1, 1, 0};
			TextBlack;
			text = "Kind regards!";
		};

		class CloseButton: tkButtonBase {
			idc = -1;
			text = "Exit"; 
			action = "closeDialog 0";
			default = true;
			x = 0.665;
			y = 0.77;
		};
	};
};