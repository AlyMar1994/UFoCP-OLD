-- $Id: //depot/Projects/StarWars_Expansion/Run/Data/Scripts/GameObject/DeathStarPlan.lua#1 $
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
-- (C) Petroglyph Games, Inc.
--
--
--  *****           **                          *                   *
--  *   **          *                           *                   *
--  *    *          *                           *                   *
--  *    *          *     *                 *   *          *        *
--  *   *     *** ******  * **  ****      ***   * *      * *****    * ***
--  *  **    *  *   *     **   *   **   **  *   *  *    * **   **   **   *
--  ***     *****   *     *   *     *  *    *   *  *   **  *    *   *    *
--  *       *       *     *   *     *  *    *   *   *  *   *    *   *    *
--  *       *       *     *   *     *  *    *   *   * **   *   *    *    *
--  *       **       *    *   **   *   **   *   *    **    *  *     *   *
-- **        ****     **  *    ****     *****   *    **    ***      *   *
--                                          *        *     *
--                                          *        *     *
--                                          *       *      *
--                                      *  *        *      *
--                                      ****       *       *
--
--/////////////////////////////////////////////////////////////////////////////////////////////////
-- C O N F I D E N T I A L   S O U R C E   C O D E -- D O   N O T   D I S T R I B U T E
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
--	$File: //depot/Projects/StarWars_Expansion/Run/Data/Scripts/GameObject/DeathStarPlan.lua $
--
--	Original Author: Steve_Copeland
--
--	$Author: Andre_Arsenault $
--
--	$Change: 37816 $
--
--	$DateTime: 2006/02/15 15:33:33 $
--
--	$Revision: #1 $
--
--/////////////////////////////////////////////////////////////////////////////////////////////////
require("HeroPlanAttach")

-- Self attachment plan is currently unused; the Death Star has a plan that names it in the task force.

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))

	-- ONLY join plans that meet our expense requirements.
	MinPlanAttachCost = 50000
	MaxPlanAttachCost = 0

	-- Commander hit list.
	Attack_Ability_Type_Names =
	{
		"Infantry", "Vehicle", "Air", "Structure", -- ATTACK these types.
		"Rogue_Squadron_Space", "IG88_Team" -- STAY AWAY from these types.
	}

	Attack_Ability_Weights =
	{
		1, 1, 1, 10, -- ATTACK-type weights.
		BAD_WEIGHT -- FEARED-type weights.
	}
	Attack_Ability_Types=WeightedTypeList.Create()
	Attack_Ability_Types.Parse(Attack_Ability_Type_Names, Attack_Ability_Weights)

	-- Prefer task forces with these units:
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