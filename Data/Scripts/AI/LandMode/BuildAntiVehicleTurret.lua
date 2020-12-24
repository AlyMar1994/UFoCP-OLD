-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): Steve Copeland
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 12/22/2020, 6:25 PM
-- ======================================================================
require("PGEvents")

-- Build a single turret.
function Definitions()
	Category = "Build_AntiVehicle_Turret"
	TaskForce =
	{
		{
			"MainForce",
			"TaskForceRequired",
			"UC_Empire_Buildable_Anti_Vehicle_Turret | UC_Rebel_Buildable_Anti_Vehicle_Turret | UC_Underworld_Buildable_Mass_Driver_Turret | UC_Pirate_Buildable_Anti_Vehicle_Turret | UC_Hutt_Grenade_Mortar = 1"
		}
	}
end

function MainForce_Thread()
	local pad_table = MainForce.Get_Reserved_Build_Pads()

	-- Make sure we've ended up with a build location that's reasonably close to our original target.
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