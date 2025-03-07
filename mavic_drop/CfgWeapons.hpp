class CfgWeapons
{
	class Default;
	class GrenadeLauncher: Default{};
	class Throw: GrenadeLauncher
	{
		Muzzles[] += {"Mavic_M67_Muzzle","Mavic_V40_Muzzle","Mavic_F1_Muzzle","Mavic_VOG25_Muzzle","Mavic_TBG_Muzzle","Mavic_M433_Muzzle"};
		class ThrowMuzzle: GrenadeLauncher {};
		class Mavic_M67_Muzzle: ThrowMuzzle
		{
			magazines[] = {"Mavic_M67"};
		};
		class Mavic_V40_Muzzle: ThrowMuzzle
		{
			magazines[] = {"Mavic_V40"};
		};
		class Mavic_F1_Muzzle: ThrowMuzzle
		{
			magazines[] = {"Mavic_F1"};
		};
		class Mavic_VOG25_Muzzle: ThrowMuzzle
		{
			magazines[] = {"Mavic_VOG25"};
		};
		class Mavic_TBG_Muzzle: ThrowMuzzle
		{
			magazines[] = {"Mavic_TBG"};
		};
		class Mavic_M433_Muzzle: ThrowMuzzle
		{
			magazines[] = {"Mavic_M433"};
		};
	};
};
