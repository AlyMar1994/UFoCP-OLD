-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): Steve Copeland
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 06/17/2020, 6:43 PM
-- ======================================================================
-- This plan simply puts Vader in the right places.
-- It relies on the object script DarthVader.lua to activate abilities.
require("PGEvents")

function Definitions()
	Category = "VaderAssists"
	TaskForce =
	{
		{
			"MainForce",
			"DenyHeroAttach",
			"Darth_Vader_Expansion = 1"
		}
	}

	IgnoreTarget = true
	AllowEngagedUnits = true
end

function MainForce_Thread()
	local vader = MainForce.Get_Unit_Table()[1]

	if not TestValid(vader) then ScriptExit() end

	BlockOnCommand(MainForce.Produce_Force())
	QuickReinforce(PlayerObject, AITarget, MainForce)
	MainForce.Set_As_Goal_System_Removable(false)

	-- Continuously try to heal, attack any threat for 30 seconds
	-- and assist the most significant ally for 20 seconds.
	while true do
		local enemy_location
		local best_ally
		local duration_to_fight = 30
		local duration_to_assist = 20

		ConsiderHeal(vader)

		enemy_location = FindTarget.Reachable_Target(PlayerObject, "Current_Enemy_Location", "Tactical_Location", "Any_Threat", 0.5)
		if TestValid(enemy_location) then
			DebugMessage("%s--  moving toward enemy concentration", tostring(Script))

			BlockOnCommand(MainForce.Attack_Move(enemy_location), duration_to_fight)
		end

		ConsiderHeal(vader)

		best_ally = FindTarget(MainForce, "Needs_Vader_Assist", "Friendly_Unit", 1.0, 1500)
		if TestValid(best_ally) then
			DebugMessage("%s-- assisting %s", tostring(Script), tostring(best_ally))

			BlockOnCommand(MainForce.Guard_Target(best_ally), duration_to_assist)
		end

		MainForce.Set_Plan_Result(true)

		-- Make sure the loop always yields.
		Sleep(1)
	end
end