class CfgVehicles
{
	class Helicopter_Base_F;
	class UAV_06_base_F: Helicopter_Base_F
	{
		class ViewPilot;
		class ViewOptics;
		class EventHandlers;
		class Components;
	};
	class Mavic_drone_base_F: UAV_06_base_F
	{
		author = "$STR_Mavic_Author";
		scope = 1;
		displayName = "$STR_Mavic_Vehicle_Mavic3_displayName";
		mapSize = 4;
		uavCameraDriverPos = "pip_pilot_pos";
		uavCameraDriverDir = "pip_pilot_dir";
		uavCameraGunnerPos = "pos_pilotcamera";
		uavCameraGunnerDir = "pos_pilotcamera_dir";
		memoryPointDriverOptics = "pos_pilotcamera";
		driverOpticsModel = "\mavik\mavik_hud.p3d";
		driverForceOptics = 1;
		extCameraPosition[] = {0,-0.25,-2.35};
		extCameraParams[] = {0.93,10,30,0.25,1,10,30,0,1};
		disableInventory = 1;
		unitInfoType = "RscOptics_UAV_06";
		unitInfoTypeRTD = "RscUnitInfoAirRTDFullDigital";
		unitInfoTypeLite = "RscUnitInfoAirRTDBasic";
		driverWeaponsInfoType = "RscOptics_UAV_06_TGP";
		epeImpulseDamageCoef = 5;
		model = "\mavik\mavik3.p3d";
		icon = "\mavik\interface\game\Mavick_map.paa";
		picture = "\mavik\interface\game\Mavick_map.paa";
		editorPreview = "\mavik\Mavic_editor.jpg";
		altFullForce = 5000;
		altNoForce = 6500;
		maxSpeed = 75;
		liftForceCoef = 1;
		cyclicAsideForceCoef = 2;
		cyclicForwardForceCoef = 1.2;
		bodyFrictionCoef = 0.3;
		backRotorForceCoef = 5;
		fuelCapacity = 0.5;
		fuelConsumptionRate = 0.00028;
		mainBladeRadius = 0.35;
		tailBladeRadius = 0.35;
		maximumLoad = 0;
		camouflage = 0.2;
		class TransportItems {};
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"mavik\textures\body_co.paa"};
		//destrType = "DestructWreck";
		class MarkerLights
		{
			class NavGreen
			{
				name = "nav_green";
				blinking = 1;
				blinkingStartsOn = 1;
				blinkingPattern[] = {0.5,0.5};
				blinkingPatternGuarantee = 1;
				color[] = {0,0.8,0};
				ambient[] = {0,0.08,0};
				intensity = 75;
				drawLight = 1;
				drawLightSize = 0.25;
				drawLightCenterSize = 0.05;
				activeLight = 0;
				dayLight = 1;
				useFlare = 1;
				flareSize = 0.05;
				size = 0.02;
				class Attenuation
				{
					start = 0;
					constant = 0;
					linear = 25;
					quadratic = 50;
					hardLimitStart = 0.75;
					hardLimitEnd = 1;
				};
			};
			class NavGreenB: NavGreen
			{
				name = "nav_greenB";
			};
			class NavRED: NavGreen
			{
				name = "nav_redB";
				blinkingStartsOn = 0;
				color[] = {0.8,0,0};
				ambient[] = {0.8,0,0};
			};
		};
		class ViewPilot: ViewPilot
		{
			minFov = 0.25;
			maxFov = 0.8;
			initFov = 0.8;
		};
		class ViewOptics: ViewOptics
		{
			minFov = 0.25;
			maxFov = 0.8;
			initFov = 0.8;
			visionMode[] = {"Normal"};
			thermalMode[] = {};
		};
		class PilotCamera
		{
			class OpticsIn
			{
				class Wide //x1~25
				{
					opticsDisplayName = "WFOV";
					initAngleX = 0;
					minAngleX = 0;
					maxAngleX = 0;
					initAngleY = 0;
					minAngleY = 0;
					maxAngleY = 0;
					initFov = 0.8;
					minFov = 0.028;
					maxFov = 0.8;
					//initFov = 0.25;
					//minFov = 0.01; //0.25x0.25= x25 zoom!
					//maxFov = 0.25; //from 1x scope. so it's x1 zoom
					directionStabilized = 1;
					visionMode[] = {"Normal"};
					thermalMode[] = {};
					gunnerOpticsModel = "\mavik\mavik_hud.p3d";
					opticsPPEffects[] = {"OpticsCHAbera2","OpticsBlur2"};
				};/*
				class Medium //x3~7
				{
					opticsDisplayName = "MFOV";
					initAngleX = 0;
					minAngleX = 0;
					maxAngleX = 0;
					initAngleY = 0;
					minAngleY = 0;
					maxAngleY = 0;
					initFov = 0.0833;
					minFov = 0.0357;
					maxFov = 0.0833;
					directionStabilized = 1;
					visionMode[] = {"Normal"};
					thermalMode[] = {};
					gunnerOpticsModel = "\mavik\mavik_hud.p3d";
					opticsPPEffects[] = {"OpticsCHAbera2","OpticsBlur2"};
				};
				class Narrow //x7~25
				{
					opticsDisplayName = "NFOV";
					initAngleX = 0;
					minAngleX = 0;
					maxAngleX = 0;
					initAngleY = 0;
					minAngleY = 0;
					maxAngleY = 0;
					initFov = 0.0357;
					minFov = 0.01;
					maxFov = 0.0357;
					directionStabilized = 1;
					visionMode[] = {"Normal"};
					thermalMode[] = {};
					gunnerOpticsModel = "\mavik\mavik_hud.p3d";
					opticsPPEffects[] = {"OpticsCHAbera2","OpticsBlur2"};
				};*/
				showMiniMapInOptics = 1;
				showUAVViewInOptics = 0;
				showSlingLoadManagerInOptics = 0;
			};
			minTurn = -27;
			maxTurn = 27;
			initTurn = 0;
			minElev = -35;
			maxElev = 90;
			initElev = 0;
			maxXRotSpeed = 1;
			maxYRotSpeed = 1;
			maxMouseXRotSpeed = 0.5;
			maxMouseYRotSpeed = 0.5;
			pilotOpticsShowCursor = 1;
			controllable = 1;
		};
		soundEngineOnInt[] = {"mavik\sounds\MavicOnNewIn.ogg",0.56,1};
		soundEngineOnExt[] = {"mavik\sounds\MavicOnNew.ogg",0.56,1,200};
		soundEngineOffInt[] = {"A3\Sounds_F\air\Uav_01\quad_stop_full_int",0,2};
		soundEngineOffExt[] = {"mavik\sounds\quad_engine_full_Mavic",0.56,3,60};
		class Sounds
		{
			class Engine
			{
				sound[] = {"mavik\sounds\quad_engine_full_Mavic",0.45,1,120};
				frequency = "rotorSpeed";
				volume = "camPos*((rotorSpeed-0.72)*4)";
			};
			class RotorLowOut
			{
				sound[] = {"A3\Sounds_F\air\Uav_01\blade",0.32,3,60};
				frequency = "rotorSpeed";
				volume = "camPos*(0 max (rotorSpeed-0.1))";
				cone[] = {1.6,3.1400001,1.6,0.94999999};
			};
			class RotorHighOut
			{
				sound[] = {"A3\Sounds_F\air\Uav_01\blade_high",0.32,3,65};
				frequency = "rotorSpeed";
				volume = "camPos*10*(0 max (rotorThrust-0.9))";
				cone[] = {1.6,3.1400001,1.6,0.94999999};
			};
			class EngineIn
			{
				sound[] = {"mavik\sounds\MavicEngineIn.ogg",0.56,1};
				frequency = "rotorSpeed";
				volume = "(1-camPos)*((rotorSpeed-0.75)*4)";
			};
			class RotorLowIn
			{
				sound[] = {"A3\Sounds_F\air\Uav_01\blade_int",0,2};
				frequency = "rotorSpeed";
				volume = "(1-camPos)*(0 max (rotorSpeed-0.1))";
			};
			class RotorHighIn
			{
				sound[] = {"A3\Sounds_F\air\Uav_01\blade_high_int",0,2};
				frequency = "rotorSpeed";
				volume = "(1-camPos)*3*(rotorThrust-0.9)";
			};
		};
		class EventHandlers: EventHandlers
		{
			class Mavic_EventHandlers
			{
				init = "if !(is3DEN) then { _this spawn mavic_fnc_init; };";
				killed = "if !(is3DEN) then { _this spawn mavic_fnc_killed; };";
			};
		};
		class UserActions
		{
			class MAVIC_DisassembleUAV
			{
				displayName = "$STR_Mavic_UserAction_DisassembleUAV";
				position = "";
				priority = -2;
				radius = 5;
				onlyForplayer = 1;
				showWindow = 0;
				condition = "[this, player] call Mavic_fnc_canDisassembly";
				statement = "[this, player] call Mavic_fnc_addUavToInventory";
			};
			class MAVIC_ResetCamera
			{
				displayName = "$STR_Mavic_UserAction_ResetCamera";
				position = "";
				priority = 6;
				radius = 5;
				onlyForplayer = 0;
				showWindow = 0;
				condition = "cameraOn isEqualTo this";
				statement = "this setPilotCameraDirection [0,1,0]";
			};
			class MAVIC_CollisionLightOff
			{
				displayName = "$STR_Mavic_UserAction_CollisionLightOff";
				position = "";
				priority = 0.5;
				radius = 5;
				onlyForplayer = 0;
				showWindow = 0;
				condition = "(getConnectedUAV player) isEqualTo this && driver this checkAIFeature 'LIGHTS'";
				statement = "driver this disableAI 'LIGHTS'; this setCollisionLight false;";
			};
			class MAVIC_CollisionLightOn
			{
				displayName = "$STR_Mavic_UserAction_CollisionLightOn";
				position = "";
				priority = 0.5;
				radius = 5;
				onlyForplayer = 0;
				showWindow = 0;
				condition = "(getConnectedUAV player) isEqualTo this && !(driver this checkAIFeature 'LIGHTS')";
				statement = "driver this enableAI 'LIGHTS'; this setCollisionLight true;";
			};
			class MAVIC_ChangeBattery
			{
				displayName = "$STR_Mavic_UserAction_ChangeBattery";
				priority = -1;
				radius = 5;
				position = "";
				onlyForplayer = 1;
				showWindow = 0;
				condition = "!(isClass (configFile >> ""CfgPatches"" >> ""ace_main"")) && (alive this) && ([player, ""Laserbatteries""] call BIS_fnc_hasItem) && (cameraOn == player) && {(fuel this) < 1} && {(speed this) < 1} && {!(isEngineOn this)}";
				statement = "[this, player] call Mavic_fnc_changeBattery";
			};
		};
		class Components
		{
			class TransportCountermeasuresComponent {};
			class VehicleSystemsDisplayManagerComponentLeft
			{
				componentType = "VehicleSystemsDisplayManager";
				left = 1;
				defaultDisplay = "EmptyDisplay";
				x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_X"",	(safezoneX + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40))])";
				y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
				class Components
				{
					class EmptyDisplay
					{
						componentType = "EmptyDisplayComponent";
					};
					class MinimapDisplay
					{
						componentType = "MinimapDisplayComponent";
						resource = "RscCustomInfoAirborneMiniMap";
					};
					class UAVDisplay
					{
						componentType = "UAVFeedDisplayComponent";
					};
				};
			};
			class VehicleSystemsDisplayManagerComponentRight
			{
				componentType = "VehicleSystemsDisplayManager";
				right = 1;
				defaultDisplay = "EmptyDisplay";
				x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_X"",	((safezoneX + safezoneW) - (		(10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)))])";
				y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
				class Components
				{
					class EmptyDisplay
					{
						componentType = "EmptyDisplayComponent";
					};
					class MinimapDisplay
					{
						componentType = "MinimapDisplayComponent";
						resource = "RscCustomInfoAirborneMiniMap";
					};
					class UAVDisplay
					{
						componentType = "UAVFeedDisplayComponent";
					};
				};
			};
		};
	};
	class Mavic3_drone_wreck_F: Mavic_drone_base_F
	{
		displayName = "$STR_Mavic_Vehicle_Mavic3W_displayName";
		destrType = "DestructWreck";
		class EventHandlers: EventHandlers
		{
			class Mavic_EventHandlers
			{
				init = "";
				killed = "";
			};
		};
	};
	class Mavic3_drone_base_F: Mavic_drone_base_F
	{
		displayName = "$STR_Mavic_Vehicle_Mavic3_displayName";
	};
	class Mavic3T_drone_base_F: Mavic_drone_base_F
	{
		displayName = "$STR_Mavic_Vehicle_Mavic3T_displayName";
		class ViewOptics: ViewOptics
		{
			visionMode[] = {"Normal","Ti"};
			thermalMode[] = {0,1,6};
		};
		class PilotCamera: PilotCamera
		{
			class OpticsIn: OpticsIn
			{
				class Wide: Wide
				{
					visionMode[] = {"Normal","Ti"};
					thermalMode[] = {0,1,6};
				};/*
				class Medium: Medium
				{
					visionMode[] = {"Normal","Ti"};
					thermalMode[] = {0,1,6};
				};
				class Narrow: Narrow
				{
					visionMode[] = {"Normal","Ti"};
					thermalMode[] = {0,1,6};
				};*/
			};
		};
	};
	class Mavic3N_drone_base_F: Mavic_drone_base_F
	{
		displayName = "$STR_Mavic_Vehicle_Mavic3N_displayName";
		class ViewOptics: ViewOptics
		{
			visionMode[] = {"Normal","NVG"};
			thermalMode[] = {0};
		};
		class PilotCamera: PilotCamera
		{
			class OpticsIn: OpticsIn
			{
				class Wide: Wide
				{
					visionMode[] = {"Normal","NVG"};
					thermalMode[] = {0};
				};
			};
		};
	};
	class Mavic3X_drone_base_F: Mavic_drone_base_F
	{
		displayName = "$STR_Mavic_Vehicle_Mavic3X_displayName";
		class ViewOptics: ViewOptics
		{
			visionMode[] = {"Normal","NVG","Ti"};
			thermalMode[] = {0,1,6};
		};
		class PilotCamera: PilotCamera
		{
			class OpticsIn: OpticsIn
			{
				class Wide: Wide
				{
					visionMode[] = {"Normal","NVG","Ti"};
					thermalMode[] = {0,1,6};
				};
			};
		};
	};
	class Mavic_3_OPF: Mavic3_drone_base_F
	{
		scope = 2;
		side = 0;
		faction = "OPF_F";
		crew = "O_UAV_AI_F";
		typicalCargo[] = {"O_UAV_AI_F"};
	};
	class Mavic_3_BLU: Mavic3_drone_base_F
	{
		scope = 2;
		side = 1;
		faction = "BLU_F";
		crew = "B_UAV_AI_F";
		typicalCargo[] = {"B_UAV_AI_F"};
	};
	class Mavic_3_IND: Mavic3_drone_base_F
	{
		scope = 2;
		side = 2;
		faction = "IND_F";
		crew = "I_UAV_AI_F";
		typicalCargo[] = {"I_UAV_AI_F"};
	};
	class Mavic_3_CIV: Mavic3_drone_base_F
	{
		scope = 2;
		side = 3;
		faction = "CIV_F";
		crew = "C_UAV_AI_F";
		typicalCargo[] = {"C_UAV_AI_F"};
	};
	class Mavic_3T_OPF: Mavic3T_drone_base_F
	{
		scope = 2;
		side = 0;
		faction = "OPF_F";
		crew = "O_UAV_AI_F";
		typicalCargo[] = {"O_UAV_AI_F"};
	};
	class Mavic_3T_BLU: Mavic3T_drone_base_F
	{
		scope = 2;
		side = 1;
		faction = "BLU_F";
		crew = "B_UAV_AI_F";
		typicalCargo[] = {"B_UAV_AI_F"};
	};
	class Mavic_3T_IND: Mavic3T_drone_base_F
	{
		scope = 2;
		side = 2;
		faction = "IND_F";
		crew = "I_UAV_AI_F";
		typicalCargo[] = {"I_UAV_AI_F"};
	};
	class Mavic_3T_CIV: Mavic3T_drone_base_F
	{
		scope = 2;
		side = 3;
		faction = "CIV_F";
		crew = "C_UAV_AI_F";
		typicalCargo[] = {"C_UAV_AI_F"};
	};
	class Mavic_3N_OPF: Mavic3N_drone_base_F
	{
		scope = 2;
		side = 0;
		faction = "OPF_F";
		crew = "O_UAV_AI_F";
		typicalCargo[] = {"O_UAV_AI_F"};
	};
	class Mavic_3N_BLU: Mavic3N_drone_base_F
	{
		scope = 2;
		side = 1;
		faction = "BLU_F";
		crew = "B_UAV_AI_F";
		typicalCargo[] = {"B_UAV_AI_F"};
	};
	class Mavic_3N_IND: Mavic3N_drone_base_F
	{
		scope = 2;
		side = 2;
		faction = "IND_F";
		crew = "I_UAV_AI_F";
		typicalCargo[] = {"I_UAV_AI_F"};
	};
	class Mavic_3N_CIV: Mavic3N_drone_base_F
	{
		scope = 2;
		side = 3;
		faction = "CIV_F";
		crew = "C_UAV_AI_F";
		typicalCargo[] = {"C_UAV_AI_F"};
	};
	class Mavic_3X_OPF: Mavic3X_drone_base_F
	{
		scope = 2;
		side = 0;
		faction = "OPF_F";
		crew = "O_UAV_AI_F";
		typicalCargo[] = {"O_UAV_AI_F"};
	};
	class Mavic_3X_BLU: Mavic3X_drone_base_F
	{
		scope = 2;
		side = 1;
		faction = "BLU_F";
		crew = "B_UAV_AI_F";
		typicalCargo[] = {"B_UAV_AI_F"};
	};
	class Mavic_3X_IND: Mavic3X_drone_base_F
	{
		scope = 2;
		side = 2;
		faction = "IND_F";
		crew = "I_UAV_AI_F";
		typicalCargo[] = {"I_UAV_AI_F"};
	};
	class Mavic_3X_CIV: Mavic3X_drone_base_F
	{
		scope = 2;
		side = 3;
		faction = "CIV_F";
		crew = "C_UAV_AI_F";
		typicalCargo[] = {"C_UAV_AI_F"};
	};
	class Item_Base_F;
	class Item_Mavic_3_Ground: Item_Base_F
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "$STR_Mavic_Item_Mavic3_displayName";
		author = "$STR_Mavic_Author";
		vehicleClass = "Items";
		class TransportItems
		{
			class _xx_ItemMavic3
			{
				name = "ItemMavic3";
				count = 1;
			};
		};
	};
	class Item_Mavic_3T_Ground: Item_Base_F
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "$STR_Mavic_Item_Mavic3T_displayName";
		author = "$STR_Mavic_Author";
		vehicleClass = "Items";
		class TransportItems
		{
			class _xx_ItemMavic3T
			{
				name = "ItemMavic3T";
				count = 1;
			};
		};
	};
	class Item_Mavic_3N_Ground: Item_Base_F
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "$STR_Mavic_Item_Mavic3N_displayName";
		author = "$STR_Mavic_Author";
		vehicleClass = "Items";
		class TransportItems
		{
			class _xx_ItemMavic3N
			{
				name = "ItemMavic3N";
				count = 1;
			};
		};
	};
	class Item_Mavic_3X_Ground: Item_Base_F
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "$STR_Mavic_Item_Mavic3X_displayName";
		author = "$STR_Mavic_Author";
		vehicleClass = "Items";
		class TransportItems
		{
			class _xx_ItemMavic3X
			{
				name = "ItemMavic3X";
				count = 1;
			};
		};
	};
};
