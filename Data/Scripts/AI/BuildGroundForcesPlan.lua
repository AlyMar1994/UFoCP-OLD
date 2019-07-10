-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): James Yarrow
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 6/28/19, 3:24 PM
-- ======================================================================
require("pgevents")

function Definitions()	
	Category = "Build_Ground_Forces"
	IgnoreTarget = true

	TaskForce =
	{
		{
			"ReserveForce",
			"Infantry = 0, 2",
			"Vehicle = 0, 2",
			"Air = 0, 2"
		}
	}

	RequiredCategories = { "Vehicle" }
	AllowFreeStoreUnits = false
end

function ReserveForce_Thread()
	ReserveForce.Set_As_Goal_System_Removable(false)
	BlockOnCommand(ReserveForce.Produce_Force())
	ReserveForce.Set_Plan_Result(true)
end