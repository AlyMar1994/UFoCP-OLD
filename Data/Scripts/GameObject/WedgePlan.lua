-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): Steve Copeland
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 3/13/2020, 3:48 PM
-- ======================================================================
require("HeroPlanAttach")

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))

	-- Only join plans that meet our expense requirements:
	MinPlanAttachCost = 45000
	MaxPlanAttachCost = 0

	-- Commander hit list:
	Attack_Ability_Type_Names =
	{
		"Capital", "Corvette", "Frigate", "Fighter", "Death_Star_II",	-- ATTACK these types.
		"Bounty_Hunter_Team_E", "Bounty_Hunter_Team_R"					-- STAY AWAY from these types.
	}

	Attack_Ability_Weights =
	{ 
		1, 1, 1, 1,				-- ATTACK-type weights.
		BAD_WEIGHT, BAD_WEIGHT	-- FEARED-type weights.
	}

	Attack_Ability_Types = WeightedTypeList.Create()
	Attack_Ability_Types.Parse(Attack_Ability_Type_Names, Attack_Ability_Weights)

	-- Prefer task forces with these units:
	Escort_Ability_Type_Names = { "Capital", "Corvette", "Frigate", "Fleet_Com_Rebel_Team", "Fleet_Com_Empire_Team" }
	Escort_Ability_Weights = { 10, 10, 10, BAD_WEIGHT, BAD_WEIGHT }
	Escort_Ability_Types = WeightedTypeList.Create()
	Escort_Ability_Types.Parse(Escort_Ability_Type_Names, Escort_Ability_Weights)
end

function Evaluate_Attack_Ability(target, goal)
	return Get_Target_Weight(target, Attack_Ability_Types, Attack_Ability_Weights)
end

function Get_Escort_Ability_Weights(goal)
	return Escort_Ability_Types
end

function HeroService()
	return
end