class CfgAmmo
{
	class Grenade;
	class GrenadeHand: Grenade {};
	class mini_Grenade: GrenadeHand {};
	class Mavic_Impact_M67: GrenadeHand
	{
		explosionTime = -1;
		timeToLive = 1e+10;
		Mavic_weight = 400;
	};
	class Mavic_Impact_V40: mini_Grenade
	{
		explosionTime = -1;
		timeToLive = 1e+10;
		Mavic_weight = 140;
	};
	class Mavic_Impact_F1: GrenadeHand
	{
		model = "\mavic_drop\f1.p3d";
		hit = 10;
		indirectHit = 6;
		indirectHitRange = 10;
		typicalspeed = 16;
		explosionEffectsRadius = 7.5;
		explosionTime = -1;
		timeToLive = 1e+10;
		Mavic_weight = 600;
	};
	class Mavic_Impact_VOG25: GrenadeHand
	{
		model = "\mavic_drop\vog25.p3d";
		hit = 80;
		typicalspeed = 76;
		deflecting = 5;
		explosionTime = -1;
		timeToLive = 1e+10;
		Mavic_weight = 275;
	};
	class Mavic_Impact_TBG: GrenadeHand
	{
		model = "\mavic_drop\tbg.p3d";
		hit = 40;
		indirectHit = 25;
		indirectHitRange = 4;
		typicalspeed = 70;
		deflecting = 5;
		explosionTime = -1;
		timeToLive = 1e+10;
		fuseDistance = 0;
		Mavic_weight = 300;
	};
	class Mavic_Impact_M433: GrenadeHand
	{
		model = "\mavic_drop\m433.p3d";
		hit = 100;
		indirectHit = 6;
		indirectHitRange = 4;
		caliber = 3;
		
		warheadName = "HEAT";
		submunitionAmmo = "Mavic_Impact_M433_Penetrator";
		submunitionDirectionType = "SubmunitionModelDirection";
		submunitionInitialOffset[] = {0,0,-0.1};
		submunitionParentSpeedCoef = 0;
		submunitionInitSpeed = 1053;
		triggerOnImpact = 1;
		deleteParentWhenTriggered = 0;
		
		typicalSpeed = 185;
		
		deflecting = 5;
		explosionTime = -1;
		timeToLive = 1e+10;
		fuseDistance = 2;
		Mavic_weight = 230;
	};
	class ammo_Penetrator_Base;
	class Mavic_Impact_M433_Penetrator: ammo_Penetrator_Base
	{
		caliber = 3.3333;
		hit = 90;
	};
};
