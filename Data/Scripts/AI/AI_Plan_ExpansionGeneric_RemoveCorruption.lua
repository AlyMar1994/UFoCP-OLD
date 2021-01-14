-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): James Yarrow
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 12/02/19, 11:40 PM
-- ======================================================================
require("PGEvents")

function Definitions()
	Category = "Remove_Corruption"
	IgnoreTarget = true
	TaskForce =
	{
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
	return
end

function MainForce_Production_Failed(tf, failed_object_type)
	ScriptExit()
end