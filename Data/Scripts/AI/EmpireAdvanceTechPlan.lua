-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): James Yarrow
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 11/06/2020, 10:52 PM
-- ======================================================================
require("PGEvents")

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))

	Category = "Advance_Tech_Empire"
	IgnoreTarget = true
	TaskForce =
	{
		{
			"TechForce",
			"DS_Primary_Hyperdrive | DS_Shield_Gen | DS_Superlaser_Core | DS_Durasteel | Darth_Team_Executor | Death_Star_II = 1"
		}
	}

	DebugMessage("%s -- Done Definitions", tostring(Script))
end

function TechForce_Thread()
	DebugMessage("%s -- In TechForce_Thread.", tostring(Script))

	-- Ensure that all goal feasability will be reevaluated based on the new production budgetting conditions
	-- (production underway that is already paid for and remains affordable under new budgets should continue).
	Purge_Goals(PlayerObject)

	TechForce.Set_As_Goal_System_Removable(false)
	Sleep(1)
	BlockOnCommand(TechForce.Produce_Force())
	TechForce.Set_Plan_Result(true)

	DebugMessage("%s -- TechForce done!", tostring(Script));

	ScriptExit()
end

function TechForce_Production_Failed(tf, failed_object_type)
	DebugMessage("%s -- Abandoning plan owing to production failure.", tostring(Script))

	ScriptExit()
end