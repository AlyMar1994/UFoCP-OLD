-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): James Yarrow
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 12/22/2020, 6:30 PM
-- ======================================================================
require("PGEvents")

function Definitions()
	Category = "Purchase_Land_Upgrades_Generic"
	IgnoreTarget = true
	TaskForce =
	{
		{
			"ReserveForce",
			"DenySpecialWeaponAttach",
			"DenyHeroAttach",

			-- Even though only one can be purchased, the 0,10 should increase the liklihood of items from these lists being chosen.
			"EL_Increased_Mobility_Upgrade | EL_Stamina_Boost_Upgrade | EL_Light_Reflective_Armor_L1_Upgrade | EL_Light_Reflective_Armor_L2_Upgrade | EL_Enhanced_Reactors_L1_Upgrade | EL_Enhanced_Reactors_L2_Upgrade | EL_Heavy_Reflective_Armor_L1_Upgrade | EL_Heavy_Reflective_Armor_L2_Upgrade | EL_Improved_ATAT_Reactors_L1_Upgrade | EL_Improved_ATAT_Reactors_L2_Upgrade | EL_Increased_Production_L1_Upgrade | EL_Increased_Production_L2_Upgrade | EL_Bombing_Run_Use_Upgrade | EL_Reinforced_Structures_Upgrade | EL_Enhanced_Turret_Firepower_L1_Upgrade | EL_Enhanced_Turret_Firepower_L2_Upgrade | EL_Enhanced_Base_Shield_Upgrade | EL_Weatherproof_Upgrade | EL_Planetary_Bombard_Use_Upgrade | E_Magnetically_Sealed_Structure_Upgrade | E_Secure_Area_Upgrade = 0,10",
			"EL_Increased_Mobility_Upgrade_NoPre | EL_Stamina_Boost_Upgrade_NoPre | EL_Enhanced_Reactors_L1_Upgrade_NoPre | EL_Enhanced_Reactors_L2_Upgrade_NoPre | EL_Heavy_Reflective_Armor_L1_Upgrade_NoPre | EL_Heavy_Reflective_Armor_L2_Upgrade_NoPre = 0,10",
			"EL_Scout_Trooper_Research_Upgrade | EL_ATAA_Research_Upgrade | EL_ATST_Research_Upgrade | EL_M1_Tank_Research_Upgrade | EL_SPMAT_Research_Upgrade | EL_ATAT_Research_Upgrade | EL_Enhanced_Deployment_L1_Upgrade = 0,1",

			"RL_Combat_Armor_L1_Upgrade | RL_Combat_Armor_L2_Upgrade | RL_Light_Armor_L1_Upgrade | RL_Light_Armor_L2_Upgrade | RL_Enhanced_Repulsors_L1_Upgrade | RL_Enhanced_Repulsors_L2_Upgrade | RL_Heavy_Armor_L1_Upgrade | RL_Heavy_Armor_L2_Upgrade | RL_Improved_Treads_L1_Upgrade | RL_Improved_Treads_L2_Upgrade | RL_Improved_T4B_Damage_L1_Upgrade | RL_Improved_T4B_Damage_L2_Upgrade | RL_Increased_Production_L1_Upgrade | RL_Increased_Production_L2_Upgrade | RL_Bombing_Run_Use_Upgrade | RL_Reinforced_Structures_Upgrade | RL_Enhanced_Turret_Firepower_L1_Upgrade | RL_Enhanced_Turret_Firepower_L2_Upgrade | RL_Enhanced_Base_Shield_Upgrade | RL_Weatherproof_Upgrade | RL_Planetary_Bombard_Use_Upgrade | R_Magnetically_Sealed_Structure_Upgrade | R_Secure_Area_Upgrade= 0,10",
			"RL_Combat_Armor_L1_Upgrade_NoPre | RL_Combat_Armor_L2_Upgrade_NoPre | RL_Enhanced_Repulsors_L1_Upgrade_NoPre | RL_Enhanced_Repulsors_L2_Upgrade_NoPre | RL_Improved_Treads_L1_Upgrade_NoPre | RL_Improved_Treads_L2_Upgrade_NoPre = 0,10",
			"RL_Plex_Soldier_Research_Upgrade | RL_Infiltrator_Research_Upgrade | RL_T2B_Research_Upgrade | RL_Snowspeeder_Research_Upgrade | RL_T4B_Research_Upgrade | RL_MPTL_Research_Upgrade | RL_Enhanced_Deployment_L1_Upgrade = 0,1",

			"UL_Bounty_Upgrade | UL_Smuggled_Droid_Systems_L1_Upgrade | UL_MDU_Armor_Plating_L2_Upgrade | UL_Weapon_Boost_L1_Upgrade | UL_Weapon_Boost_L2_Upgrade | UL_Smuggled_Droid_Systems_L2_Upgrade | UL_Extort_Cash_L1_Upgrade | UL_Extort_Cash_L2_Upgrade | U_Magnetically_Sealed_Structure_Upgrade | UL_Planetary_Bombard_Use_Upgrade | UL_Bombing_Run_Use_Upgrade | U_Secure_Area_Upgrade = 0,10",
			"UL_Black_Market_Shielding_L1_Upgrade | UL_Black_Market_Shielding_L2_Upgrade | UL_MDU_Armor_Plating_L1_Upgrade | UL_Rancor_Stimulant_L1_Upgrade | UL_Rancor_Stimulant_L2_Upgrade | UL_Enhanced_Deployment_L1_Upgrade = 0,1"
		}
	}

	RequiredCategories = { "Upgrade" }
	AllowFreeStoreUnits = false
end

function ReserveForce_Thread()
	local tech_level
	local min_credits
	local current_sleep_seconds
	local max_sleep_seconds

	ReserveForce.Set_Plan_Result(true)
	ReserveForce.Set_As_Goal_System_Removable(false)
	BlockOnCommand(ReserveForce.Produce_Force())

	-- Give some time to accumulate money.
	-- Depending on the tech level, sleep until we have enough to purchase an upgrade.
	tech_level = PlayerObject.Get_Tech_Level()
	min_credits = 2000
	if tech_level == 2 then
		min_credits = 3000
	elseif tech_level >= 3 then
		min_credits = 4000
	end

	current_sleep_seconds = 0
	max_sleep_seconds = 50
	while (PlayerObject.Get_Credits() < min_credits) and (current_sleep_seconds < max_sleep_seconds) do
		current_sleep_seconds = current_sleep_seconds + 1
		Sleep(1)
	end

	ScriptExit()
end