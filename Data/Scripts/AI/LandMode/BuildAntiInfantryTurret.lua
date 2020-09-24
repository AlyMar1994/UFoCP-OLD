-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): Steve Copeland
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 9/21/2020, 11:56 PM
-- ======================================================================
require("pgevents")

-- Build a single turret.
function Definitions()
	
	Category = "Build_AntiInfantry_Turret"
	TaskForce =
	{
		{
			"MainForce",
			"TaskForceRequired",
			"UC_Empire_Buildable_Anti_Infantry_Turret | UC_Rebel_Buildable_Anti_Infantry_Turret | UC_Underworld_Buildable_Torpedo_Turret | UC_Pirate_Buildable_Anti_Infantry_Turret | UC_Hutt_Rapid_Fire_Laser_Turret = 1"
		}
	}
end

function MainForce_Thread()
	-- MessageBox("%s -- Building a turret.", tostring(Script))

	-- Make sure we've ended up with a build location that's reasonably close to our original target.
	pad_table = MainForce.Get_Reserved_Build_Pads()
	for i,pad in pad_table do
		if pad.Get_Distance(AITarget) > 120 then
			ScriptExit()
		end
	end

	-- Build the task force.
	-- Blocking shouldn't be necessary, but we'll use it to ease watching the script.
	MainForce.Set_Plan_Result(true)
	BlockOnCommand(MainForce.Build_All())

	ScriptExit()
end