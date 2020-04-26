-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): Steve Copeland
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 4/26/2020, 5:56 PM
-- ======================================================================
require("pgevents")

function Definitions()
	DebugMessage("%s -- In Definitions", tostring(Script))

	Category = "Fire_Death_Star"
	IgnoreTarget = true
	TaskForce =
	{
		{
			"MainForce",
			"TaskForceRequired"
		}
	}

	DebugMessage("%s -- Done Definitions", tostring(Script))
end

-- AM1994 (4/26/2020): Thanks, Nikomer.
function MainForce_Thread()
	BlockOnCommand(MainForce.Produce_Force())

	ds = Find_First_Object("Death_Star")
	if not TestValid(ds) then
		ds = Find_First_Object("Death_Star_II")
	end

	if TestValid(ds) then
		-- Tactical Superweapon(s) are present, continue plan!
		repeat
			Sleep(1)
		until ds.Is_Tactical_Superweapon_Ready() and (Evaluate_In_Galactic_Context("Want_To_Fire_DS", PlayerObject) ~= 0)

		ds.Fire_Tactical_Superweapon()
	end

	Sleep(30)
	ScriptExit()
end