-- ==================================================================
-- ==================================================================
--  _____                _                  _     _    _
-- |  ___|              (_)                | |   | |  | |
-- | |__ _ __ ___  _ __  _ _ __ ___    __ _| |_  | |  | | __ _ _ __
-- |  __| '_ ` _ \| '_ \| | '__/ _ \  / _` | __| | |/\| |/ _` | '__|
-- | |__| | | | | | |_) | | | |  __/ | (_| | |_  \  /\  / (_| | |
-- \____/_| |_| |_| .__/|_|_|  \___|  \__,_|\__|  \/  \/ \__,_|_|
--                | |
--                |_|
--  _____                          _                ______
-- |  ___|                        | |               |  _  \
-- | |__ _ __ ___  _ __ ___  _   _| |    _   _  __ _| | | |___   ___
-- |  __| '_ ` _ \| '_ ` _ \| | | | |   | | | |/ _` | | | / _ \ / __|
-- | |__| | | | | | | | | | | |_| | |___| |_| | (_| | |/ / (_) | (__
-- \____/_| |_| |_|_| |_| |_|\__, \_____/\__,_|\__,_|___/ \___/ \___|
--                            __/ |
--                           |___/
-- ==================================================================
-- ==================================================================
---@class TaskForce
local TaskForce = {}
---@public
---@param targetingPrioritySetName string The name of the Targeting Priority Set as defined in the XML.
---@param categoryMask string The Category Mask of the units contained within the TaskForce to attach the Targeting Priority Set to.
---Attaches a given Targeting Priority Set to all units in the TaskForce that match the given Category Mask.
function TaskForce.Set_Targeting_Priorities(targetingPrioritySetName,
                                            categoryMask) end
---@public
---@return GameObject[] The units contained within the Task Force.
---Returns all units that are part of the task force. WARNING: The units may not be valid.
function TaskForce.Get_Unit_Table() end
---@public
---@return number The amount of units in the TaskForce's unit table.
---Returns the number of units in a task force.
function TaskForce.Get_Force_Count() end
---@public
---@param target GameObject The object to get the distance to.
---@return number The distance to the given game object.
function TaskForce.Get_Distance(target) end
---@public
---@overload fun()
---@overload fun(stage:PlanetObject)
---@param stage PlanetObject The planet to produce the taskforce on.
---@param unknownArgument boolean TODO: Find out what this does.
---Produces a task force.
function TaskForce.Produce_Force(stage, unknownArgument) end
---@public
---@param target GameObject The target to attack.
---Orders the task force to attack a given target.
function TaskForce.Attack_Target(target) end
---@public
---@param target GameObject The target to attack.
---@param unknownArgument number TODO: Find out what this does.
---@param shouldPathThroughObstacle boolean Should the task force ignore space obstacles.
---Orders the task force to attack a given target.
function TaskForce.Attack_Target(target, unknownArgument,
                                 shouldPathThroughObstacle) end
---@public
---@param target GameObject The target to guard.
---Orders the task force to guard a given target.
function TaskForce.Guard_Target(target) end
---@public
---@param target GameObject The target to reinforce (usually a position).
-----Orders the task force to reinforce (at) a given target.
function TaskForce.Reinforce(target) end
---@public
---@param target GameObject The target to move to (usually a position).
-----Orders the task force to move to a given target.
function TaskForce.Move_To(target) end
---@public
---@param gameObject GameObject The object to release.
---Releases a given unit from the task force.
function TaskForce.Release_Unit(gameObject) end
---@public
---@param abilityName string The ability to (de-)activate.
---@param shouldActivate boolean Activates the ability if true, deactivates if false.
---Activates or deactivates a given ability.
function TaskForce.Activate_Ability(abilityName, shouldActivate) end
---@public
---@return (PlanetObject|Position) The task force's staging area.
---Returns the task force's staging area.
function TaskForce.Get_Stage() end
---@public
---Lands the task force's units
function TaskForce.Land_Units() end
---@public
---Launches the task force's units into orbit.
function TaskForce.Launch_Units() end
---@public
---@return boolean Returns true if the invasion succeeded, false if the invasion failed.
---Invades a planet.
function TaskForce.Invade() end
---@public
---@param isRemovable boolean
---Adjusts whether the Goal the task force is associated with can be removed before it's been achieved.
function TaskForce.Set_As_Goal_System_Removable(isRemovable) end

---@class GameObject
---A wrapper around a single instance of a generic GameObjectType
local GameObject = {}
---@public
---@return GameObjectType
---Gets the type of the current game object wrapper.
function GameObject.Get_Type() end
---@public
---@param propertyFlag string A string representation of 1..n properties.
---@return boolean
---Tests if a GameObject has 1..n flags of the bitfield defined in GameObjectPropertiesType.xml set. Valid inputs are single items `"Turret"` or many `"Turret | InBase"`.
function GameObject.Has_Property(propertyFlag) end
---@public
---@return PlayerObject The PlayerObject owning the GameObject
---Returns the owner of the game object.
function GameObject.Get_Owner() end
---@public
---@return Position
---Returns the current position of the object in the world.
function GameObject.Get_Position() end
---@public
---@param categoryMask string The category mask to test for. Can be a single mask, or a combination: "CAPITAL" or "CAPITAL | SPACE_HERO"
---@return boolean
---Tests whether a given game object has a given category mask assigned to it.
function GameObject.Is_Category(categoryMask) end
---@public
---@return (GameObject|nil)
---Returns a game object if the unit has an attack target, nil else.
function GameObject.Get_Attack_Target() end
---@public
---@param abilityName string The ability to (de-)activate.
---@param shouldActivate boolean Activates the ability if true, deactivates if false.
---Activates or deactivates a given ability.
function GameObject.Activate_Ability(abilityName, shouldActivate) end
---@public
---@return boolean
---Tests whether a unit has active orders.
function GameObject.Has_Active_Orders() end
---@public
---@return number
---Returns a number between 0 and 1 representing the current percentage of hull points left.
function GameObject.Get_Hull() end
---@public
---@return number
---Returns a number between 0 and 1 representing the current percentage of shield points left.
function GameObject.Get_Shield() end
---@public
---@param target GameObject|Position
---@return number
function GameObject.Get_Distance(target) end
---@public
---@overload fun(target:Position|GameObject|PlanetObject):CommandBlock
---@param unit_list GameObject[]
---@param target Position|GameObject|PlanetObject
---@return CommandBlock
---Orders the GameObject to move to the given target. Returns a CommandBlock is marked as finished when the GameObject has arrived at target
function GameObject.Move_To(unit_list, target) end
---@public
---Despawns the GameObject
function GameObject.Despawn() end
---@public
---@param new_owner PlayerObject The PlayerObject the ownership will be transferred to
---Transfers ownership of a GameObject over to another Player
function GameObject.Change_Owner(new_owner) end
---@public
---@param behavior_id int The ID of the behavior
---@param enable boolean Enables the behavior if set to true. Disables it if it's false.
---Enables or disables a behavior defined in the XML entry of the GameObject
function GameObject.Enable_Behavior(behavior_id, enable) end
---@public
---@return GameObject Returns the parent object of the given GameObject. In galactic conquest this will return either a planet, a company or a container. In tactical mode it returns the squadron for single fighters.
function GameObject.Get_Parent_Object() end
---@public
---@return PlanetObject
---Returns the Planet the GameObject is located on. Can be nil if the GameObject is in Hyperspace
function GameObject.Get_Planet_Location() end
---@public
---@param hidden boolean Determines whether the GameObject is visible or invisible
---Makes the GameObject visible or invisible
function GameObject.Hide(hidden) end
---@public
---@param animation_name string The name of the animation
---@param should_repeat boolean Determines whether the animation gets repeated
---@param animation_index number The index of the animation, e.g. `3` to play `deploy_03.ala`
---Plays an animation on a GameObject. The animation must be present in the 3D model
function GameObject.Play_Animation(animation_name, should_repeat,
                                   animation_index) end
---@public
---@param abilityName string
---@return boolean
function GameObject.Is_Ability_Autofire(abilityName) end
---@public
---@param sfxEventName string
function GameObject.Play_SFX_Event(sfxEventName) end
---@public
---@return boolean
function GameObject.Is_Transport() end
---@public
---@param planet PlanetObject
---@return boolean
function GameObject.Can_Land_On_Planet(planet) end
---@public
function GameObject.Get_Game_Scoring_Type() end
---@public
---@param abilityName string
---@return boolean
function GameObject.Is_Ability_Ready(abilityName) end
---@public
---@param position Position|GameObject
function GameObject.Divert(position) end
---@public
---@return boolean
function GameObject.Is_On_Diversion() end
---@public
---@return GameObject[]
function GameObject.Get_Garrisoned_Units() end
---@public
---@param target GameObject
---@return boolean
function GameObject.Should_Switch_Weapons(target) end
---@public
---@param allow_spawn boolean
function GameObject.Set_Garrison_Spawn(allow_spawn) end
---@public
---@param disable boolean
function GameObject.Disable_Capture(disable) end
---@public
---@overload fun(damageAmount:number)
---@param damageAmount number
---@param hardpoint string
function GameObject.Take_Damage(damageAmount, hardpoint) end
---@public
---@overload fun(callbackFunction:function, range:number)
---@param callbackFunction fun(obj:GameObject, trigger:GameObject)
---@param range number
---@param player PlayerObject
function GameObject.Event_Object_In_Range(callbackFunction, range, player) end
---@public
---@param callbackFunction function
function GameObject.Cancel_Event_Object_In_Range(callbackFunction) end
---@public
--- The returned command block will never finish, even if the move is done and there is no target to be attacked.
---@overload fun(target:GameObject):CommandBlock
---@param unit_list GameObject[]
---@param target GameObject|Position
---@return CommandBlock
function GameObject.Attack_Move(unit_list, target) end
---@public
---@overload fun(target:GameObject):CommandBlock
---@param unit_list GameObject[]
---@param target GameObject
---@return CommandBlock
function GameObject.Attack_Target(unit_list, target) end
---@public
---@overload fun(target:GameObject):CommandBlock
---@param unit_list GameObject[]
---@param target GameObject|Position
---@return CommandBlock
function GameObject.Guard_Target(unit_list, target) end
---@public
--- Returns true if the unit can currently move (is false e.g. during hyperspace in)
---@return boolean
function GameObject.Can_Move() end
---@public
--- Stops the unit.
function GameObject.Stop() end
---@public
--- Movability on or off
---@param suspend boolean
function GameObject.Suspend_Locomotor(suspend) end
---@public
--- Activates targeted ability
---@param ability_name string 
---@param turn_on GameObject|Position|boolean A target to turn on targeted abilities or a boolean.
function GameObject.Activate_Ability(ability_name, turn_on) end
---@public
--- Finishes ability cooldowns
function GameObject.Reset_Ability_Counter() end
---@public
---@param ability_name string 
---@param autofire boolean
function GameObject.Set_Single_Ability_Autofire(ability_name, autofire) end
---@public
---@param autofire boolean
function GameObject.Set_All_Abilities_Autofire(autofire) end
---@public
---@param ability_name string 
---@return boolean
function GameObject.Is_Ability_Active(ability_name) end
---@public
---@param ability_name string 
---@return boolean
function GameObject.Has_Ability(ability_name) end
---@public
---@param ability_name string
---@param optional number
function GameObject.Force_Ability_Recharge(ability_name, optional) end
---@public
---@param ability_name string
function GameObject.Cancel_Ability(ability_name) end
---@public
---@return boolean
function GameObject.Are_Engines_Online() end
---@public
---@param speed number
function GameObject.Override_Max_Speed(speed) end
---@public
--- Makes the unit hyperspace into battle with a delay by the given number of frames.
---@param delay number The number of frames before the hyperspace animation is started
function GameObject.Cinematic_Hyperspace_In(delay) end
---@public
--- Makes unit leave into hyperspace. Will be removed from galactic level as well if the optional parameter is not set to false.
---@param remove_from_campaign boolean Default is true
function GameObject.Hyperspace_Away(remove_from_campaign) end
---@public
function GameObject.Cancel_Hyperspace() end
---@public
--- Allow or prevent AI usage. In tactical battles this crashes the game if the unit has no active AI! When the faction's AI changes, the unit is AI usable again.
---@param prevent boolean
function GameObject.Prevent_AI_Usage(prevent) end
---@public
--- Shall object be displayed in Cinematic?
---@param keep_visible boolean
function GameObject.In_End_Cinematic(keep_visible) end
---@public
---@param target Position|GameObject
function GameObject.Teleport(target) end
---@public
--- Teleport object make it face the same way as the target
---@param target GameObject
function GameObject.Teleport_And_Face(target) end
---@public
---@param target Position|GameObject
function GameObject.Face_Immediate(target) end
---@public
---@param target Position|GameObject
function GameObject.Turn_To_Face(target) end
---@public
--- Prevent automatically firing at targets in range
---@param prevent boolean
function GameObject.Prevent_Opportunity_Fire(prevent) end
---@public
--- Completely prevent a unit from firing
---@param prevent boolean
function GameObject.Prevent_All_Fire(prevent) end
---@public
--- Stops the unit from taking any damage
---@param invulnerable boolean
function GameObject.Make_Invulnerable(invulnerable) end
---@public
---@param check boolean
function GameObject.Set_Check_Contested_Space(check) end
---@public
function GameObject.Lock_Current_Orders() end
---@public
function GameObject.Unlock_Current_Orders() end
---@public
---@return boolean
function GameObject.Is_In_Asteroid_Field() end
---@public
---@return boolean
function GameObject.Is_In_Ion_Storm() end
---@public
---@return boolean
function GameObject.Is_In_Nebula() end
---@public
---@param enable boolean
function GameObject.Enable_Dynamic_LOD(enable) end
---@public
--- Only for fleets with land units in orbit over an enemy planet (is used in FoC campaign but doesn't seem to work)
function GameObject.Invade() end
---@public
---@param unknown boolean
function GameObject.Set_In_Limbo(unknown) end
---@public
--- Returns a list of the projectile types the unit uses
---@return GameObjectType[]
function GameObject.Get_All_Projectile_Types() end
---@public
---@return boolean
function GameObject.Is_Selectable() end
---@public
--- Sets a unit to be selectable or not selectable by the player
---@param selectable boolean
function GameObject.Set_Selectable(selectable) end
---@public
--- Returns the projectile type the unit is currently using
---@return GameObjectType
function GameObject.Get_Current_Projectile_Type() end
---@public
---@param target GameObject
---@return boolean
function GameObject.Is_Good_Against(target) end
---@public
---@return boolean
function GameObject.Is_In_Garrison() end
---@public
--- Returns true if the object contains any garrisoned units
---@return boolean
function GameObject.Has_Garrison() end
---@public
--- Eject all garrisoned units
function GameObject.Eject_Garrison() end
---@public
--- Make a garrisoned unit leave its garrison
function GameObject.Leave_Garrison() end
---@public
---@return boolean
function GameObject.Can_Garrison_Fire() end
---@public
--- Can the unit be garrisoned in the given object?
---@param target GameObject
---@return boolean
function GameObject.Can_Garrison(target) end
---@public
--- Garrison the unit in the given object
---@param target GameObject
function GameObject.Garrison(target) end
---@public
function GameObject.Play_Cinematic_Engine_Flyby() end
---@public
---@overload fun(event_name:string)
---@param event_name string
---@param optional number
function GameObject.Stop_SFX_Event(event_name, optional) end
---@public
---@overload fun(type:string|GameObjectType)
---@param type string|GameObjectType
---@param optional string
---@return GameObject
function GameObject.Attach_Particle_Effect(type, optional) end
---@public
---@return boolean
function GameObject.Has_Attack_Target() end
---@public
---@param emitter string
---@param show boolean
function GameObject.Show_Emitter(emitter, show) end
---@public
--- Put a small arrow highlight on top of the object
---@overload fun(highlight:boolean)
---@param highlight boolean
---@param optional number Seems to change the distance of the arrow to the object
function GameObject.Highlight_Small(highlight, optional) end
---@public
--- Put an arrow highlight on top of the object
---@overload fun(highlight:boolean)
---@param highlight boolean
---@param optional number Seems to change the distance of the arrow to the object
function GameObject.Highlight(highlight, optional) end
---@public
---@param target AITarget
---@return CommandBlock
function GameObject.Explore_Area(target) end
---@public
--- Check if a space battle should be initiated, e.g. after spawning a fleet at an enemy planet (only works on fleets and planets)
function GameObject.Force_Test_Space_Conflict() end
---@public
--- Keep a unit from dying (it can still be damaged)
---@param cannot_be_killed boolean
function GameObject.Set_Cannot_Be_Killed(cannot_be_killed) end
---@public
--- Returns the hint set for this object in the map editor or nil.
---@return string|nil
function GameObject.Get_Hint() end
---@public
--- Fire death star in tactical mode
function GameObject.Fire_Tactical_Superweapon() end
---@public
--- Test if death star is ready to fire
---@return boolean
function GameObject.Is_Tactical_Superweapon_Ready() end
---@public
---@param bone_name string
---@return Position
function GameObject.Get_Bone_Position(bone_name) end
---@public
---@param lock boolean
function GameObject.Lock_Build_Pad_Contents(lock) end
---@public
--- Only used on fleets
---@param number number
function GameObject.Destroy_Contained_Objects(number) end
---@public
--- Only used on fleets
---@param object_type GameObjectType
---@return boolean
function GameObject.Contains_Object_Type(object_type) end
---@public
--- Only used on fleets
---@return number
function GameObject.Get_Contained_Object_Count() end
---@public
--- (tactical only)
---@param game_object GameObject
---@return number
function GameObject.Get_AI_Power_Vs_Unit(game_object) end
---@public
--- Use in tactical. This kills the corresponding GC object
function GameObject.Mark_Parent_Mode_Object_For_Death() end
---@public
---@param number number
function GameObject.Set_Importance(number) end
---@public
function GameObject.Service_Wrapper() end
---@public
--- Possibly only for build pad contents
function GameObject.Sell() end
---@public
--- Use on build pads or MDUs
---@return GameObject
function GameObject.Get_Build_Pad_Contents() end
---@public
--- Only for fleets
---@return GameObject[]
function GameObject.Get_Contained_Heroes() end
---@public
--- Only for fleets
---@return boolean
function GameObject.Contains_Hero() end
---@public
--- Use on spawned special weapon or on space station with special weapon
---@param target GameObject
---@param user PlayerObject
function GameObject.Fire_Special_Weapon(target, user) end
---@public
---@return number
function GameObject.Get_Rate_Of_Damage_Taken() end
---@public
--- Expected time til death based on damage taken. 
---@return number
function GameObject.Get_Time_Till_Dead() end
---@public
---@param number number
function GameObject.Set_Targeting_Stickiness_Time_Threshold(number) end
---@public
---@param targeting_priority_set string
function GameObject.Set_Targeting_Priorities(targeting_priority_set) end
---@public
--- Obeject needs UNIT_AI behavior
---@param prefer boolean
function GameObject.Set_Prefer_Ground_Over_Space(prefer) end
---@public
--- Normalized with respect to unit's total energy
---@return number Float between 0 and 1
function GameObject.Get_Energy() end
---@public
--- Normalized with respect to unit's total health
---@return number Float between 0 and 1
function GameObject.Get_Health() end
---@public
function GameObject.Release() end
---@public
--- Use on buildpads and MDUs. Takes a UC type
---@param type string|GameObjectType
---@param optional boolean
function GameObject.Build(type, optional) end

---@class Position
---Represents a position in the world.
local Position = {}

---@class GameObjectType
---A generic GameObjectType that represents a C++ GameObjectTypeClass
local GameObjectType = {}
---@public
---@return string
---Retrieves the XML name of a GameObjectType
function GameObjectType.Get_Name() end
---@public
---@return boolean
function GameObjectType.Is_Hero() end
---@public
---@return number
function GameObjectType.Get_Build_Cost() end
---@public
--- Returns the AI_Combat_Power
---@return number
function GameObjectType.Get_Combat_Rating() end
---@public
--- Returns required tech level
---@return number
function GameObjectType.Get_Tech_Level() end
---@public
--- Returns level of a starbase type
---@return number
function GameObjectType.Get_Base_Level() end
---@public
---@param player PlayerObject
---@return boolean
function GameObjectType.Is_Affiliated_With(player) end
---@public
---@param player PlayerObject
---@return boolean
function GameObjectType.Is_Build_Locked(player) end
---@public
---@param player PlayerObject
---@return boolean
function GameObjectType.Is_Obsolete(player) end
---@public
---@return number
function GameObjectType.Get_Tactical_Build_Cost() end
---@public
---@return number
function GameObjectType.Get_Score_Cost_Credits() end
---@public
---@return number
function GameObjectType.Get_Max_Range() end
---@public
---@return number
function GameObjectType.Get_Min_Range() end
---@public
---@return number
function GameObjectType.Get_Bribe_Cost() end
---@public
--- This only makes sense for projectile types though it can be used for others as well.
---@return boolean
function GameObjectType.Is_Affected_By_Missile_Shield() end
---@public
--- This only makes sense for projectile types though it can be used for others as well.
---@return boolean
function GameObjectType.Is_Affected_By_Laser_Defense() end

---@class GameObjectWrapper
---A generic wrapper around a GameObject
local GameObjectWrapper = {}
---@public
---Returns `true` if the contained game object is valid.
---@return boolean
function GameObjectWrapper.Is_Valid() end

---@class PlayerObject
---A wrapper around a player (AI or human) taking control of a faction.
local PlayerObject = {}
---@public
---@return boolean
---Tests whether a PlayerObject is human.
function PlayerObject.Is_Human() end
---@public
---@param playerObject PlayerObject
---@return boolean
---Tests whether a player object is an enemy of another player object.
function PlayerObject.Is_Enemy(playerObject) end
---@public
---@param amount number
function PlayerObject.Give_Money(amount) end
---@public
---@return number
function PlayerObject.Get_ID() end
---@public
---@param playerObject PlayerObject
---@return boolean
function PlayerObject.Is_Ally(playerObject) end
---@public
--- Enables Advisor Hints
---@param mode string Is "space" or "ground"
---@param enable boolean
function PlayerObject.Enable_Advisor_Hints(mode, enable) end
---@public
--- Returns an enemy player (may only ever returns Rebel or Empire, in any case there is not much point using it outside the base EaW though it might be related to the Primary Enemy tag)
---@return PlayerObject
function PlayerObject.Get_Enemy() end
---@public
--- Forces player to select object
---@param object GameObject
function PlayerObject.Select_Object(object) end
---@public
--- Activates the AI for the player
function PlayerObject.Enable_As_Actor() end
---@public
--- Enables retreat event. Returns false if player is not able to retreat.
---@return boolean
function PlayerObject.Retreat() end
---@public
--- returns the displayed faction name
---@return string
function PlayerObject.Get_Name() end
---@public
--- Returns xml faction name
---@return string
function PlayerObject.Get_Faction_Name() end
---@public
---@return number
function PlayerObject.Get_Tech_Level() end
---@public
function PlayerObject.Give_Random_Sliceable_Tech() end
---@public
--- Gets reset with any game mode changes, in particular at the end of every tactical battle!
---@param player PlayerObject
function PlayerObject.Make_Ally(player) end
---@public
--- Gets reset with any game mode changes, in particular at the end of every tactical battle!
---@param player PlayerObject
function PlayerObject.Make_Enemy(player) end
---@public
--- Returns the player's space station in space tactical
---@return GameObject
function PlayerObject.Get_Space_Station() end
---@public
--- Team ID in skirmish
---@return number
function PlayerObject.Get_Team() end
---@public
--- Clan ID in skirmish
---@return number
function PlayerObject.Get_Clan_ID() end
---@public
--- Removes the orbital bombardment. Countdown for usage will continue and not be reset if the bombardment is re-enabled.
---@param remove boolean
function PlayerObject.Remove_Orbital_Bombardment(remove) end
---@public
--- Disable the bombardment. The countdown for usage will continue.
---@param disable boolean
function PlayerObject.Disable_Orbital_Bombardment(disable) end
---@public
---@param set boolean
function PlayerObject.Set_Sabotage_Tutorial(set) end
---@public
---@param set boolean
function PlayerObject.Set_Black_Market_Tutorial(set) end
---@public
---@return string Returns "Easy", "Normal" or "Hard"
function PlayerObject.Get_Difficulty() end
---@public
--- The parameter logic is reversed here. The bombing run is disabled if false is passed.
---@param enable boolean
function PlayerObject.Disable_Bombing_Run(enable) end
---@public
---@param object_type GameObjectType
function PlayerObject.Unlock_Tech(object_type) end
---@public
function PlayerObject.Get_GameSpy_Stats_Player_ID() end
---@public
---@return number
function PlayerObject.Get_Credits() end
---@public
--- For AI player (with galactic AI) only. Releases credits for spending in tactical mode.
---@param amount number
function PlayerObject.Release_Credits_For_Tactical(amount) end
---@public
---@param level number
function PlayerObject.Set_Tech_Level(level) end

---@class PlanetObject
local PlanetObject = {}
---@public
---@return boolean
function PlanetObject.Get_Is_Planet_AI_Usable() end
---@public
---@return boolean
function PlanetObject.Is_Corrupted() end
---@public
--- Check if a space battle should be initiated, e.g. after spawning a fleet at an enemy planet (only works on fleets and planets)
function PlanetObject.Force_Test_Space_Conflict() end
---@public
---@return boolean
function PlanetObject.Is_Planet_Destroyed() end
---@public
--- Returns the indigenous unit type of that planet affiliated with the given player
---@return GameObjectType
function PlanetObject.Get_Affiliated_Indigenous_Type(player) end
---@public
---@return GameObjectType
function PlanetObject.Get_Next_Starbase_Type() end
---@public
---@return PlayerObject
function PlanetObject.Get_Final_Blow_Player() end
---@public
---@return number
function PlanetObject.Get_Starbase_Level() end

---@class GameScoringType
local GameScoringType = {}
---@public
---@return number
function GameScoringType.Get_Score_Cost_Credits() end
---@public
---@return number
function GameScoringType.Get_Combat_Rating() end
---@public
---@return number
function GameScoringType.Get_Build_Cost() end

---@class CommandBlock
local CommandBlock = {}

---@public
---@return table
---Returns the result of the CommandBlock
function CommandBlock.Result() end

---@public
---@return boolean
---Returns a boolean indicating whether the CommandBlock has finished its command
function CommandBlock.IsFinished() end

---@class AITarget
local AITarget = {}
---@public
--- Returns corresponding game object if there is one (e.g. a targeted unit or planet).
---@return GameObject
function AITarget.Get_Game_Object() end
---@public
---@param position Position
---@return number
function AITarget.Get_Distance(position) end

-- return TaskForce, GameObject, Position, GameObjectType, GameObjectWrapper, PlayerObject, PlanetObject, GameScoringType, CommandBlock
