-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): James Yarrow
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 12/02/2020, 11:40 PM
-- ======================================================================
require("PGEvents")

-- Tell the script pooling system to pre-cache this number of scripts.
ScriptPoolCount = 16

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))

	Category = "Upgrade_Starbase | Build_Initial_Starbase_Only"
	IgnoreTarget = true
	TaskForce =
	{
		{
			"BaseForce",
			"Rebel_Star_Base_1 | Rebel_Star_Base_2 | Rebel_Star_Base_3 | Rebel_Star_Base_4 | Rebel_Star_Base_5 | Empire_Star_Base_1 | Empire_Star_Base_2 | Empire_Star_Base_3 | Empire_Star_Base_4 | Empire_Star_Base_5 | Underworld_Star_Base_1 | Underworld_Star_Base_2 | Underworld_Star_Base_3 | Underworld_Star_Base_4 | Underworld_Star_Base_5 = 1"
		}
	}

	DebugMessage("%s -- Done Definitions", tostring(Script))
end

function BaseForce_Thread()
	DebugMessage("%s -- In BaseForce_Thread.", tostring(Script))

	BaseForce.Set_As_Goal_System_Removable(false)
	AssembleForce(BaseForce)
	BaseForce.Set_Plan_Result(true)

	DebugMessage("%s -- Base Force done!", tostring(Script));

	ScriptExit()
end

function BaseForce_Production_Failed(tf, failed_object_type)
	DebugMessage("%s -- Abandoning plan owing to production failure.", tostring(Script))

	ScriptExit()
end