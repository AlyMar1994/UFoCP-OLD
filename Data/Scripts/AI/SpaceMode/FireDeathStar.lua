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

-- AM1994 (4/29/2020): function MainForce_Thread() was overhauled as a
-- future-proof fear that users won't be able to have the AI fire the DS1,
-- due to the code only focusing on finding the DS2. If someone uses
-- UFoCP as a base, and changes the buildable DS2 to 1, the AI may now fire it.
-- Thanks, Nikomer.
function MainForce_Thread()
	BlockOnCommand(MainForce.Produce_Force())

	ds = Find_First_Object("Death_Star")
	if not TestValid(ds) then
		ds = Find_First_Object("Death_Star_II")
	end

	if TestValid(ds) then
		-- Tactical superweapon is present, continue plan!
		repeat
			Sleep(1)
		until ds.Is_Tactical_Superweapon_Ready() and (Evaluate_In_Galactic_Context("Want_To_Fire_DS", PlayerObject) ~= 0)

		ds.Fire_Tactical_Superweapon()
	end

	Sleep(30)
	ScriptExit()
end