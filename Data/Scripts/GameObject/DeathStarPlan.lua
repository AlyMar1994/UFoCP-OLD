-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): Steve Copeland
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 6/28/19, 2:27 PM
-- ======================================================================
-- Self Attachment plan is currently unused; the Death Star has a plan that names it in the task force.
require("HeroPlanAttach")

functionDefinitions()
	DebugMessage("%s -- In Definitions", tostring(Script))

	-- Only join plans that meet our expense requirements.
	MinPlanAttachCost = 50000
	MaxPlanAttachCost = 0

	-- Commander hit list.
	Attack_Ability_Type_Names =
	{
		"Infantry", "Vehicle", "Air", "Structure",	-- ATTACK these types!
		"Rogue_Squadron_Space", "IG88_Team"			-- STAY AWAY from these types!
	}

	Attack_Ability_Weights =
	{
		1, 1, 1, 10,	--ATTACK-type Weights.
		BAD_WEIGHT		--FEARED-type Weights.
	}
	Attack_Ability_Types = WeightedTypeList.Create()
	Attack_Ability_Types.Parse(Attack_Ability_Type_Names, Attack_Ability_Weights)

	--Prefertaskforceswiththeseunits.
	Escort_Ability_Type_Names = {"Fighter", "Capital", "Frigate", "Super"}
	Escort_Ability_Weights = {1, 5, 4, 6}
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
end


