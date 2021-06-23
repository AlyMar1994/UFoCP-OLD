-- ======================================================================
-- UFoCP (by AlyMar1994) SCRIPT FILE.
--
-- ORIGINAL AUTHOR (Petroglyph): James Yarrow
-- NEW AUTHOR: Connor "AlyMar1994" Hess
--
-- LAST REVISION DATE: 06/20/2021, 7:14 PM
-- ======================================================================
require("PGStateMachine")

function Definitions()
	-- Object isn't valid at this point so don't do any operations that would require it.
	-- State_Init is the first chance you have to do operations on Object.
	DebugMessage("%s -- In Definitions", tostring(Script))

	Define_State("State_Init", State_Init);
end

function State_Init(message)
	if message == OnEnter then
		underworld_player = Find_Player("Underworld") -- AM1994 (03/13/2020): Adding variable to prevent calling NIL later on.
		closerange = false

		Register_Prox(Object, Unit_Prox, 100, underworld_player)
		Create_Thread("AdeptFour_AI")
	end
end

function Unit_Prox(self_obj, trigger_obj)
	DebugMessage("-- %s -- %s", tostring(Object.Get_Type()), tostring(Object.Get_Owner()))

	if not trigger_obj then
		DebugMessage("WARNING: prox received a nil trigger_obj.")

		return
	end

	closerange = true
end

function AdeptFour_AI()
	local warp1 = Find_Hint("STORY_TRIGGER_ZONE", "a4-w1")
	local warp2 = Find_Hint("STORY_TRIGGER_ZONE", "a4-w2")
	local warp3 = Find_Hint("STORY_TRIGGER_ZONE", "a4-w3")
	local warp4 = Find_Hint("STORY_TRIGGER_ZONE", "a4-w4")
	local warp5 = Find_Hint("STORY_TRIGGER_ZONE", "a4-w5")
	local warp6 = Find_Hint("STORY_TRIGGER_ZONE", "a4-w6")

	local warptimer = 0
	local noteleports
	local cage
	local dist
	local rand_index

	while TestValid(Object) do
		noteleports = false
		cage = Find_Nearest(Object, "Underworld_Ysalamiri_Cage")

		if TestValid(cage) then
			dist = Object.Get_Distance(cage)

			if dist < 200 then
				noteleports = true
				Object.Override_Max_Speed(.10)
				Object.Attach_Particle_Effect("STUNNED_OBJECT")
				Object.Set_Cannot_Be_Killed(false)
			end
		else
			Object.Set_Cannot_Be_Killed(true)
			Object.Override_Max_Speed(false)
			noteleports = false
		end

		warptimer = warptimer + 1
		if not noteleports then
			if warptimer/5 > Object.Get_Hull() then
				rand_index = GameRandom(1, 6)

				Object.Suspend_Locomotor(true)
				Object.Play_Animation("Idle", true, 0)
				Object.Attach_Particle_Effect("BOTHAN_STUN_GAS")

				Sleep(1)

				if rand_index == 1 then
					Object.Teleport_And_Face(warp1)
				elseif rand_index == 2 then
					Object.Teleport_And_Face(warp2)
				elseif rand_index == 3 then
					Object.Teleport_And_Face(warp3)
				elseif rand_index == 4 then
					Object.Teleport_And_Face(warp4)
				elseif rand_index == 5 then
					Object.Teleport_And_Face(warp5)
				elseif rand_index == 6 then
					Object.Teleport_And_Face(warp6)
				end

				Object.Suspend_Locomotor(false)
				warptimer = 0
			end
		end

		local target = Find_Nearest(Object, underworld_player)
		if TestValid(target) then
			Object.Attack_Move(target)
		end

		Sleep(1)
		closerange = false
	end
end