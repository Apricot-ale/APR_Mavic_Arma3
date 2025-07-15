class CfgVehicles
{
	class UAV_06_base_F;
	class Mavic_drone_base_F: UAV_06_base_F
	{
		soundEngineOnInt[] = {"mavik\sounds\MavicOnNewIn.ogg",0,1};
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
				sound[] = {"mavik\sounds\MavicEngineIn.ogg",0,1};
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
	};
};
