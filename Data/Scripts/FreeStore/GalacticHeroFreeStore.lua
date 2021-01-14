-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): Steve Copeland
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 12/04/2020, 1:25 PM
-- ======================================================================
require("PGCommands")

function Definitions()
	DebugMessage("%s -- Defining custom freestore movement perceptions", tostring(Script))

	-- Table which maps heroes to perceptions for systems they like to hang out on when not in active use.
	-- The boolean is for whether or not the hero prefers to stay in space, if he has a choice.
	-- Generally, this is to find the system where their abilities provide the best defensive or infrastructure bonuses.
	CustomUnitPlacement =
	{
		EMPEROR_PALPATINE_TEAM = { "Is_Home_Planet", false },
		GRAND_MOFF_TARKIN_TEAM = { "Is_Home_Planet", true },
		DARTH_TEAM = { nil, false },
		DARTH_TEAM_EXECUTOR = { nil, true },
		GENERAL_VEERS_TEAM = { nil, false },
		BOBA_FETT_TEAM = { nil, true },
		PIET_TEAM = { nil, true },
		ARC_HAMMER = { "Is_Home_Planet", true },
		ADMONITOR_STAR_DESTROYER = { nil, true },

		MON_MOTHMA_TEAM = { "Is_Home_Planet", false },
		HOME_ONE = { nil, true },
		HAN_SOLO_TEAM = { nil, false },
		OBI_WAN_TEAM = { nil, false },
		DROIDS_TEAM = { nil, false },
		LUKE_TEAM = { nil, true },
		SUNDERED_HEART = { nil, true },
		LUKE_SKYWALKER_JEDI_TEAM = { nil, false },
		YODA_TEAM = { nil, false },
		ROGUE_SQUADRON_SPACE = { nil, true },

		BOSSK_TEAM = { nil, true },
		IG88_TEAM = { nil, true },
		SILRI_TEAM = { nil, false },
		URAI_FEN_TEAM = { nil, false },
		TYBER_ZANN_TEAM = { nil, true }
	}
end

function Find_Custom_Target(object)
	local object_type = object.Get_Type()
	local object_type_name = object_type.Get_Name()
	local unit_entry = CustomUnitPlacement[object_type_name]
	local perception
	local prefers_space
	local target

	if unit_entry then
		perception = unit_entry[1]
		prefers_space = unit_entry[2]

		if perception then
			target = FindTarget.Reachable_Target(PlayerObject, perception, "Friendly", "No_Threat", 1.0, object)
			if TestValid(target) then
				return target
			end
		end

		if prefers_space then
			return Find_Space_Unit_Target(object)
		else
			return Find_Ground_Unit_Target(object)
		end
	else
		DebugMessage("%s -- Error: Type %s not found in CustomUnitPlacement table.", tostring(Script), object_type_name)
	end
end