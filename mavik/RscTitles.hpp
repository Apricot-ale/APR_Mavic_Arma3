class ctrlStaticPicture;
class ctrlControlsGroupNoScrollBars;
class ctrlStaticBackGround;
class ctrlStructuredText;
class RscTitles
{
	class Mavic_Interface
	{
		idd = -1;
		duration = 1e+010;
		class controls
		{
			class Camera_Button: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\main\camera.paa";
				x = "safeZoneX + safeZoneWAbs - ( 3 * ( pixelGridNoUIScale * pixelW * 2 )) / 2 - ( 2.0 * ( pixelGridNoUIScale * pixelW * 2 ))/2 - ( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "safeZoneY + safeZoneH - ( 2.0 * ( pixelGridNoUIScale * pixelH * 2 )) - ( ( 1.3 * ( pixelGridNoUIScale * pixelH * 2 )) )";
				w = "( 2.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class Settings_Button: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\main\dots.paa";
				x = "safeZoneX + safeZoneWAbs - ( 3 * ( pixelGridNoUIScale * pixelW * 2 )) / 2 - ( 2.0 * ( pixelGridNoUIScale * pixelW * 2 ))/2 - ( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "safeZoneY + ( ( 1.3 * ( pixelGridNoUIScale * pixelH * 2 )) )";
				w = "( 2.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class Exit_Button: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\main\triangle.paa";
				x = "safeZoneX + ( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "safeZoneY + ( ( 1.3 * ( pixelGridNoUIScale * pixelH * 2 )) )";
				w = "( 2.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class FlightMode_Text: ctrlStructuredText
			{
				idc = -1;
				text = "$STR_Mavic_HUD_Mode_Flight";
				onLoad = "uiNameSpace setVariable ['mavic_ctrl_FlightMode_Text', _this # 0];";
				x = "safeZoneX + ( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) ) + ( 2.0 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 3.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
				y = "safeZoneY + ( ( 1.3 * ( pixelGridNoUIScale * pixelH * 2 )) )  + ( 0.3 * ( pixelGridNoUIScale * pixelH * 2 ))";
				w = "( 10 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
				size = "( 1.2 * ( pixelGridNoUIScale * pixelH * 2 ))";
				class Attributes
				{
					font = "PuristaMedium";
				};
			};
			class FlightStatus_Text: FlightMode_Text
			{
				text = "In Flight";
				onLoad = "uiNameSpace setVariable ['mavic_ctrl_FlightStatus_Text', _this # 0];";
				x = "safeZoneX + ( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) ) + ( 2.0 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 3.0 * ( pixelGridNoUIScale * pixelW * 2 )) + 2*( 3.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
			};
			class Cross: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\main\kross.paa";
				onLoad = "uiNameSpace setVariable ['mavic_ctrl_Cross', _this # 0]";
				x = "0.5 - ( 5.0 * ( pixelGridNoUIScale * pixelW * 2 )) / 2";
				y = "0.5 - ( 5.0 * ( pixelGridNoUIScale * pixelH * 2 )) / 2";
				w = "( 5.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 5.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class MapTriangle_Button: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\main\maptriangle.paa";
				x = "safeZoneX + ( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "0.5 - ( 2.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
				w = "( 2.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class RTH_Button: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\main\arrow.paa";
				onLoad = "uiNameSpace setVariable ['mavic_ctrl_RTH_Button', _this # 0]";
				x = "safeZoneX + ( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "0.5 + ( 2.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
				w = "( 2.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class Record_Button: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\main\redcircle.paa";
				x = "safeZoneX + safeZoneWAbs - ( 3 * ( pixelGridNoUIScale * pixelW * 2 )) - ( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "0.5 - ( 3 * ( pixelGridNoUIScale * pixelH * 2 )) / 2";
				w = "( 3 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 3 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class Play_Button: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\main\play.paa";
				x = "safeZoneX + safeZoneWAbs - ( 3 * ( pixelGridNoUIScale * pixelW * 2 )) / 2 - ( 2.0 * ( pixelGridNoUIScale * pixelW * 2 ))/2 - ( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "0.5 - ( 2.0 * ( pixelGridNoUIScale * pixelH * 2 )) / 2 + ( 3 * ( pixelGridNoUIScale * pixelH * 2 )) + ( ( 1.3 * ( pixelGridNoUIScale * pixelH * 2 )) )";
				w = "( 2.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class Galery_Button: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\main\galery.paa";
				x = "safeZoneX + safeZoneWAbs - ( 3 * ( pixelGridNoUIScale * pixelW * 2 )) / 2 - ( 2.0 * ( pixelGridNoUIScale * pixelW * 2 ))/2 - ( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "0.5 - ( 2.0 * ( pixelGridNoUIScale * pixelH * 2 )) / 2 - ( 3 * ( pixelGridNoUIScale * pixelH * 2 )) - ( ( 1.3 * ( pixelGridNoUIScale * pixelH * 2 )) )";
				w = "( 2.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class Zoom_Display: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\zoom\zoom.paa";
				x = "safeZoneX + safeZoneWAbs - ( 3 * ( pixelGridNoUIScale * pixelW * 2 )) - ( 2.2 * ( pixelGridNoUIScale * pixelW * 2 )) - 2*( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "0.5 - ( 2.2 * ( pixelGridNoUIScale * pixelH * 2 )) / 2";
				w = "( 2.2 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.2 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class Zoom_Text: ctrlStructuredText
			{
				idc = -1;
				text = "4x";
				onLoad = "uiNameSpace setVariable ['mavic_ctrl_Zoom_Text', _this # 0];";
				x = "safeZoneX + safeZoneWAbs - ( 3 * ( pixelGridNoUIScale * pixelW * 2 )) - ( 2.2 * ( pixelGridNoUIScale * pixelW * 2 )) - 2*( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "0.5 - ( 2.2 * ( pixelGridNoUIScale * pixelH * 2 )) / 2 + ( 0.5 * ( pixelGridNoUIScale * pixelH * 2 ))";
				w = "( 2.2 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.2 * ( pixelGridNoUIScale * pixelH * 2 ))";
				size = "( 1.1 * ( pixelGridNoUIScale * pixelH * 2 ))";
				class Attributes
				{
					align = "center";
					font = "PuristaSemiBold";
				};
			};
			class MemoryPicture: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\main\memory.paa";
				x = "safeZoneX + safeZoneWAbs - ( 3 * ( pixelGridNoUIScale * pixelW * 2 )) - ( 2.2 * ( pixelGridNoUIScale * pixelW * 2 )) - 2*( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "safeZoneY + safeZoneH - ( 2.0 * ( pixelGridNoUIScale * pixelH * 2 )) - ( ( 1.3 * ( pixelGridNoUIScale * pixelH * 2 )) )";
				w = "( 2.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class AF_Button: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\zoom\AF.paa";
				x = "safeZoneX + safeZoneWAbs - ( 3 * ( pixelGridNoUIScale * pixelW * 2 )) - ( 2.2 * ( pixelGridNoUIScale * pixelW * 2 )) - 2*( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "0.5 - ( 2.2 * ( pixelGridNoUIScale * pixelH * 2 )) / 2 + ( 2.2 * ( pixelGridNoUIScale * pixelH * 2 )) + ( 0.05 * ( pixelGridNoUIScale * pixelH * 2 ))";
				w = "( 2.2 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.2 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class Binoc_Button: ctrlStaticPicture
			{
				idc = -1;
				text = "\mavik\interface\zoom\binocular.paa";
				x = "safeZoneX + safeZoneWAbs - ( 3 * ( pixelGridNoUIScale * pixelW * 2 )) - ( 2.2 * ( pixelGridNoUIScale * pixelW * 2 )) - 2*( ( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) )";
				y = "0.5 - ( 2.2 * ( pixelGridNoUIScale * pixelH * 2 )) / 2 - ( 2.2 * ( pixelGridNoUIScale * pixelH * 2 )) - ( 0.3 * ( pixelGridNoUIScale * pixelH * 2 ))";
				w = "( 2.2 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.2 * ( pixelGridNoUIScale * pixelH * 2 ))";
			};
			class UAVInfo_Group: ctrlControlsGroupNoScrollBars
			{
				idc = -1;
				x = "safeZoneXAbs + ( 0.8 * ( pixelGridNoUIScale * pixelW * 2 ))";
				y = "safezoneY + safeZoneH - ( 3 * ( pixelGridNoUIScale * pixelH * 2 )) - ( 0.4 * ( pixelGridNoUIScale * pixelH * 2 ))";
				w = "( 15 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 3 * ( pixelGridNoUIScale * pixelH * 2 ))";
				class controls
				{
					class Map_Picture: ctrlStaticPicture
					{
						idc = -1;
						text = "\mavik\interface\main\map.paa";
						x = 0;
						y = 0;
						w = "( 3.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 3.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
					};
					class Map_Picture_Arrow: ctrlStaticPicture
					{
						idc = -1;
						onLoad = "uiNameSpace setVariable ['mavic_ctrl_Map_Picture_Arrow', _this # 0];";
						text = "\mavik\interface\main\map_arrow.paa";
						x = 0;
						y = 0;
						w = "( 3.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 3.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
					};
					class H_Text: ctrlStructuredText
					{
						idc = -1;
						x = "( 3.0 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 0.2 * ( pixelGridNoUIScale * pixelW * 2 ))";
						y = "( 3 * ( pixelGridNoUIScale * pixelH * 2 )) - ( 1.4 * ( pixelGridNoUIScale * pixelH * 2 ))";
						w = "( 1.4 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 1.4 * ( pixelGridNoUIScale * pixelH * 2 ))";
						text = "H";
						size = "( 1.4 * ( pixelGridNoUIScale * pixelH * 2 ))";
						class Attributes
						{
							color = "#ccc5c5";
							font = "PuristaMedium";
						};
					};
					class VSpeed: ctrlStructuredText
					{
						idc = -1;
						onLoad = "uiNameSpace setVariable ['mavic_ctrl_VSpeed', _this # 0];";
						x = "( 3.0 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 1.4 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 0.2 * ( pixelGridNoUIScale * pixelW * 2 ))";
						y = "( 0.7 * ( pixelGridNoUIScale * pixelH * 2 ))";
						w = "( 6 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 3 * ( pixelGridNoUIScale * pixelH * 2 )) - ( 0.7 * ( pixelGridNoUIScale * pixelH * 2 ))";
						text = "0.0 km/h";
						size = "( 0.9 * ( pixelGridNoUIScale * pixelH * 2 ))";
						class Attributes
						{
							font = "PuristaMedium";
						};
					};
					class Height: VSpeed
					{
						idc = -1;
						onLoad = "uiNameSpace setVariable ['mavic_ctrl_Height', _this # 0];";
						y = "( 3 * ( pixelGridNoUIScale * pixelH * 2 )) - ( 1.3 * ( pixelGridNoUIScale * pixelH * 2 )) - ( 0.1 * ( pixelGridNoUIScale * pixelH * 2 ))";
						h = "( 1.3 * ( pixelGridNoUIScale * pixelH * 2 ))";
						text = "0.0 ft";
						size = "( 1.3 * ( pixelGridNoUIScale * pixelH * 2 ))";
					};
					class D_Text: H_Text
					{
						idc = -1;
						x = "( 3.0 * ( pixelGridNoUIScale * pixelW * 2 )) + 4*( 1.4 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 1.0 * ( pixelGridNoUIScale * pixelW * 2 )) - ( 1.4 * ( pixelGridNoUIScale * pixelW * 2 ))";
						text = "D";
					};
					class HSpeed: ctrlStructuredText
					{
						idc = -1;
						onLoad = "uiNameSpace setVariable ['mavic_ctrl_HSpeed', _this # 0];";
						x = "( 3.0 * ( pixelGridNoUIScale * pixelW * 2 )) + 4*( 1.4 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 1.0 * ( pixelGridNoUIScale * pixelW * 2 ))";
						y = "( 0.7 * ( pixelGridNoUIScale * pixelH * 2 ))";
						w = "( 6 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 3 * ( pixelGridNoUIScale * pixelH * 2 )) - ( 0.7 * ( pixelGridNoUIScale * pixelH * 2 ))";
						text = "0.0 km/h";
						size = "( 0.9 * ( pixelGridNoUIScale * pixelH * 2 ))";
						class Attributes
						{
							font = "PuristaMedium";
						};
					};
					class Distance: HSpeed
					{
						idc = -1;
						onLoad = "uiNameSpace setVariable ['mavic_ctrl_Distance', _this # 0];";
						y = "( 3 * ( pixelGridNoUIScale * pixelH * 2 )) - ( 1.3 * ( pixelGridNoUIScale * pixelH * 2 )) - ( 0.1 * ( pixelGridNoUIScale * pixelH * 2 ))";
						h = "( 1.3 * ( pixelGridNoUIScale * pixelH * 2 ))";
						text = "0.0 ft";
						size = "( 1.3 * ( pixelGridNoUIScale * pixelH * 2 ))";
					};
				};
			};
			class StatusInfo_Group: ctrlControlsGroupNoScrollBars
			{
				idc = -1;
				x = "safeZoneX + safeZoneWAbs - ( 5 * ( pixelGridNoUIScale * pixelW * 2 )) - ( 11.2 * ( pixelGridNoUIScale * pixelW * 2 ))";
				y = "safeZoneY + ( ( 1.3 * ( pixelGridNoUIScale * pixelH * 2 )) )";
				w = "( 15 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 2.0 * ( pixelGridNoUIScale * pixelH * 2 ))";
				class controls
				{
					class Battery: ctrlStaticPicture
					{
						idc = -1;
						onLoad = "uiNameSpace setVariable ['mavic_ctrl_Battery', _this # 0]";
						text = "\mavik\interface\bat\100.paa";
						x = 0;
						y = 0;
						w = "( 1.5 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 1.5 * ( pixelGridNoUIScale * pixelH * 2 ))";
					};
					class BatteryText: ctrlStructuredText
					{
						idc = -1;
						onLoad = "uiNameSpace setVariable ['mavic_ctrl_BatteryText', _this # 0]";
						text = "99";
						x = 0;
						y = "( 0.8 * ( pixelGridNoUIScale * pixelH * 2 )) / 2 - ( 0.08 * ( pixelGridNoUIScale * pixelH * 2 ))";
						w = "( 1.5 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 1.5 * ( pixelGridNoUIScale * pixelH * 2 )) - ( 0.8 * ( pixelGridNoUIScale * pixelH * 2 ))";
						size = "( 0.8 * ( pixelGridNoUIScale * pixelH * 2 ))";
						class Attributes
						{
							color = "#4cbb90";
							font = "PuristaMedium";
							align = "center";
						};
					};
					class RemainingTime: ctrlStructuredText
					{
						idc = -1;
						onLoad = "uiNameSpace setVariable ['mavic_ctrl_RemainingTime', _this # 0]";
						text = "00'00""";
						size = "( 1.2 * ( pixelGridNoUIScale * pixelH * 2 ))";
						class Attributes
						{
							font = "PuristaMedium";
						};
						x = "( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 0.1 * ( pixelGridNoUIScale * pixelW * 2 ))";
						y = 0;
						w = "( 4 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 2 * ( pixelGridNoUIScale * pixelH * 2 ))";
					};
					class Signal: ctrlStaticPicture
					{
						idc = -1;
						onLoad = "uiNameSpace setVariable ['mavic_ctrl_Signal', _this # 0]";
						text = "\mavik\interface\signal\100.paa";
						x = "( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 3.2 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 0.1 * ( pixelGridNoUIScale * pixelW * 2 ))";
						y = "( 1.5 * ( pixelGridNoUIScale * pixelH * 2 )) / 2 - ( 1.2 * ( pixelGridNoUIScale * pixelH * 2 )) / 2";
						w = "( 1.2 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 1.2 * ( pixelGridNoUIScale * pixelH * 2 ))";
					};
					class Sensor: ctrlStaticPicture
					{
						idc = -1;
						text = "\mavik\interface\main\sensor.paa";
						x = "( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 3.2 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 1.2 * ( pixelGridNoUIScale * pixelW * 2 )) + 4*( 0.1 * ( pixelGridNoUIScale * pixelW * 2 ))";
						y = "( 1.5 * ( pixelGridNoUIScale * pixelH * 2 )) / 2 - ( 1.2 * ( pixelGridNoUIScale * pixelH * 2 )) / 2";
						w = "( 1.2 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 1.2 * ( pixelGridNoUIScale * pixelH * 2 ))";
					};
					class Satellite: ctrlStaticPicture
					{
						idc = -1;
						onLoad = "uiNameSpace setVariable ['mavic_ctrl_Satellite', _this # 0]";
						text = "\mavik\interface\main\sat0.paa";
						x = "( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 3.2 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 1.2 * ( pixelGridNoUIScale * pixelW * 2 )) + 4*( 0.1 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 1.2 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 0.1 * ( pixelGridNoUIScale * pixelW * 2 ))";
						y = "( 1.5 * ( pixelGridNoUIScale * pixelH * 2 )) / 2 - ( 1.2 * ( pixelGridNoUIScale * pixelH * 2 )) / 2";
						w = "( 1.2 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 1.2 * ( pixelGridNoUIScale * pixelH * 2 ))";
					};
					class Datchik: ctrlStaticPicture
					{
						idc = -1;
						text = "\mavik\interface\main\datchik.paa";
						x = "( 1.5 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 3.2 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 1.2 * ( pixelGridNoUIScale * pixelW * 2 )) + 5*( 0.1 * ( pixelGridNoUIScale * pixelW * 2 )) + 2*( 1.2 * ( pixelGridNoUIScale * pixelW * 2 )) + ( 0.1 * ( pixelGridNoUIScale * pixelW * 2 ))";
						y = "( 1.5 * ( pixelGridNoUIScale * pixelH * 2 )) / 2 - ( 1.2 * ( pixelGridNoUIScale * pixelH * 2 )) / 2";
						w = "( 1.2 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 1.2 * ( pixelGridNoUIScale * pixelH * 2 ))";
					};
				};
			};
			class DetachGrenade: ctrlControlsGroupNoScrollBars
			{
				idc = -1;
				fade = 1;
				onLoad = "uiNameSpace setVariable ['mavic_ctrl_DetachGrenade', _this # 0]";
				x = "0.5 - ( 11 * ( pixelGridNoUIScale * pixelW * 2 )) / 2";
				y = "0.5 - ( 6 * ( pixelGridNoUIScale * pixelH * 2 )) / 2";
				w = "( 11 * ( pixelGridNoUIScale * pixelW * 2 ))";
				h = "( 6 * ( pixelGridNoUIScale * pixelH * 2 ))";
				class controls
				{
					class BackGround: ctrlStaticPicture
					{
						idc = -1;
						text = "\mavik\interface\detach\big.paa";
						x = 0;
						y = 0;
						w = "( 11 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 6 * ( pixelGridNoUIScale * pixelH * 2 ))";
					};
					class Text: ctrlStructuredText
					{
						idc = -1;
						class Attributes
						{
							align = "center";
							font = "PuristaMedium";
						};
						size = "( 0.9 * ( pixelGridNoUIScale * pixelH * 2 ))";
						onLoad = "uiNameSpace setVariable ['mavic_ctrl_DetachGrenade_Text', _this # 0]";
						text = "$STR_Mavic_HUD_DropMessage";
						x = 0;
						y = "( 6 * ( pixelGridNoUIScale * pixelH * 2 )) - ( 1 * ( pixelGridNoUIScale * pixelH * 2 )) - ( 0.9 * ( pixelGridNoUIScale * pixelH * 2 ))";
						w = "( 11 * ( pixelGridNoUIScale * pixelW * 2 ))";
						h = "( 1 * ( pixelGridNoUIScale * pixelH * 2 ))";
					};
				};
			};
		};
		class controlsBackground
		{
			class Gradient: ctrlStaticPicture
			{
				idc = -1;
				onLoad = "uiNamespace setVariable ['mavic_ctrl_Gradient', _this # 0];";
				text = "\mavik\interface\signal\gradient.paa";
				x = "safeZoneXAbs";
				y = "safeZoneY";
				w = "safeZoneWAbs";
				h = "safeZoneH";
				show = 0;
			};
		};
	};
};
