-- $Id: //depot/Projects/StarWars_Expansion/Run/Data/Scripts/AI/AI_Plan_ExpansionGeneric_RemoveCorruption.lua#5 $
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
--              $File: //depot/Projects/StarWars_Expansion/Run/Data/Scripts/AI/AI_Plan_ExpansionGeneric_RemoveCorruption.lua $
--
--    Original Author: James Yarrow
--
--            $Author: James_Yarrow $
--
--            $Change: 51602 $
--
--          $DateTime: 2006/08/16 13:27:22 $
--
--          $Revision: #5 $
--
--/////////////////////////////////////////////////////////////////////////////////////////////////

require("pgevents")

function Definitions()
	
	Category = "Remove_Corruption"
	IgnoreTarget = true
	TaskForce = {
		{
			"MainForce",
			"DenyHeroAttach",
			"Mon_Mothma_Team | Obi_Wan_Team | Katarn_Team | Yoda_Team | Luke_Skywalker_Jedi_Team | Han_Solo_Team | Emperor_Palpatine_Team | General_Veers_Team | Darth_Team_Executor | Mara_Jade_Team | Admonitor_Star_Destroyer = 1"
		}
	}
end

function MainForce_Thread()
	AssembleForce(MainForce)
	LaunchUnits(MainForce)
	MainForce.Set_As_Goal_System_Removable(false)
	MainForce.Activate_Ability()
	MainForce.Set_Plan_Result(true)	
	Sleep(300)
end

function MainForce_No_Units_Remaining(tf)
	--No action
end

function MainForce_Production_Failed(tf, failed_object_type)
	ScriptExit()
end