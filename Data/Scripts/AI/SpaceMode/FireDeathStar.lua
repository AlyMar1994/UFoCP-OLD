-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): Steve Copeland
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 6/29/19, 12:50 PM
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

function MainForce_Thread()
	BlockOnCommand(MainForce.Produce_Force())

	ds = Find_First_Object("Death_Star_II")
	while not TestValid(ds) do
		-- Death Star II isn't present, hang this plan indefinately!
		Sleep(100)
	end

	repeat
		Sleep(1)
	until ds.Is_Tactical_Superweapon_Ready() and (Evaluate_In_Galactic_Context("Want_To_Fire_DS", PlayerObject) ~= 0)

    ds.Fire_Tactical_Superweapon()
	Sleep(30)

	ScriptExit()
end