-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
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
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- Finders as sorted by SGMG documentation
-- ------------------------------------------------------------------
---@public
---Finds the game object that currently attacks the given game object and deals the highest damage.
---@param gameObject GameObject|TaskForce
---@return GameObject
function FindDeadlyEnemy(gameObject) end
---@public
---@param faction_name string The name of the faction
---@return PlayerObject|nil
---Returns the PlayerObject matching the given faction name
function Find_Player(faction_name) end
---@public
---@param type_name string The type name
---@return GameObjectType|nil
---Returns the GameObjectType matching the given type name
function Find_Object_Type(type_name) end
---@public
---Literally finds all objects of this type. That may include projectiles or other unexpected objects. Categories can be piped together (e.g. `"Frigate | Capital"`)
---Filters by owner if filter is a `PlayerObject` or by `CategoryMask` if filter is a `string`
---@overload fun(propertyOrPlayer:string)
---@overload fun(propertyOrPlayer:string, playerOrCategory:PlayerObject)
---@overload fun(propertyOrPlayer:PlayerObject, playerOrCategory:string)
---@param propertyOrPlayer string|PlayerObject A property flag if used with a single parameter or with a player wrapper as second parameter
---@param playerOrCategory PlayerObject|string A player wrapper if the first parameter is a property flag, otherwise a category mask
---@return table<number, GameObject>
function Find_All_Objects_Of_Type(propertyOrPlayer, playerOrCategory) end
---@public
--- Returns the first object of the given type. Possibly finds objects in reverse spawn order.
---@param typeName string A type name as specified in the XML code
---@return GameObject|nil
function Find_First_Object(typeName) end
---@public
---@param hint string The hint
---@return GameObject|nil
---Returns the GameObject with the given hint. Hints can be set in the map editor.
function Find_Hint(hint) end
---@public
---@param hint string The object hint as set in the map editor.
---@return GameObject[]
function Find_All_Objects_With_Hint(hint) end
---@public
--- Returns the nearest object that has the given properties. May return nil. The two argument version takes as second parameter an object type name. The four argument version takes as second parameter a property flag string. The `isFriendly`parameter filters for friendlies or enemies, respectively.
---@overload fun(gameObject:GameObject|TaskForce, typeNameOrProperty:string)
---@overload fun(gameObject:GameObject|TaskForce, player:PlayerObject, isFriendly:boolean)
---@overload fun(gameObject:GameObject|TaskForce, typeNameOrProperty:string, player:PlayerObject, isFriendly:boolean)
---@param gameObject GameObject|TaskForce
---@param typeNameOrProperty string
---@param player PlayerObject
---@param isFriendly boolean
---@return GameObject
function Find_Nearest(gameObject, typeNameOrProperty, player, isFriendly) end
---@public
---@param gameObject GameObject|TaskForce
---@param spaceFieldType string Can be "Asteroid", "Nebula" or "Ion_Storm".
---@return GameObject
function Find_Nearest_Space_Field(gameObject, spaceFieldType) end
---@public
--- Returns position and combined threat of units (from the unit list) in range of the position.
---@param unitList table<number, GameObject>
---@param distance number
---@return Position
function Find_Best_Local_Threat_Center(unitList, distance) end
---@public
---@param gameObject GameObject
---@param player PlayerObject
---@return Position
function Get_Most_Defended_Position(gameObject, player) end
---@public
---Returns a position outside the range of the object that is given as first parameter.
---@param enemyObject GameObject The object whose weapon range is considered
---@param gameObject GameObject|TaskForce The object or task force looking to flee outside the range of the first object.
---@return Position
function Project_By_Unit_Range(enemyObject, gameObject) end
---@public
--- GC only. Only for AI players. Returns a list of planet objects.
---@param player PlayerObject
---@param startingPlanet PlanetObject
---@param destinationPlanet PlanetObject
---@return PlanetObject[]
function Find_Path(player, startingPlanet, destinationPlanet) end

---@type table|fun(planetName:string):PlanetObject
---@public
---Can be called directly with a planet name or can be indexed to call the function `Get_All_Planets`.
---@param planetName string
---@return PlanetObject
FindPlanet = {}
---@public
--- Returns all planets in the current GC game.
---@return PlanetObject[]
function FindPlanet.Get_All_Planets() end

-- ------------------------------------------------------------------
-- ------------------------ Spawn  Functions ------------------------
-- ------------------------------------------------------------------

---@public
---Spawns a unit and returns a table containing only the unit. Respects collision. If something blocks the spawn, the unit will be spawned as close as possible to the given position.
---@param unit_type GameObjectType The type of the unit
---@param location PlanetObject|GameObject|Position The location the unit is supposed to spawn at
---@param owner PlayerObject The owner of the unit
---@return GameObject[]
function Spawn_Unit(unit_type, location, owner) end

---@public
---Spawns a unit with Hyperspace/landing Transport animation.
---@param object_type GameObjectType The  GameObjectType of the unit to spawn
---@param location PlanetObject|GameObject|Position|nil The location the unit is supposed to spawn at. If nil, adds unit to reinforcement pool
---@param allow_ai_usage boolean Determines whether the AI is allowed to control the unit
---@param ignore_reinforcement_rules boolean Ignores reinforcement rules when set to true
---@return CommandBlock
---Returns a CommandBlock with a table containing the spawned unit
function Reinforce_Unit(object_type, location, player, allow_ai_usage,
                        ignore_reinforcement_rules) end

---@public
--- Spawns an object without regard for collision.
---@param object_type GameObjectType|string Object type or type xml name
---@param position Position A game object is also possible but can cause script crashes
---@param player PlayerObject
---@return GameObject The spawned object
function Create_Generic_Object(object_type, position, player) end

---@public
--- Spawns a unit from the reinforcement pool without hyperspace animation while respecting collision. Returns a list containing the spawned object. If the required unit is not in the reinforcement pool, it does nothing. The unit faces toward the center of the map.
---@param object_type GameObjectType
---@param position Position|GameObject
---@param player PlayerObject
---@return GameObject[]
function Spawn_From_Reinforcement_Pool(object_type, position, player) end

---@public
--- Space only. Spawns a ground to space weapon for the given player and returns it. Can be fired using `Fire_Special_Weapon` but is not available to the player.
---@param type_name string
---@param player PlayerObject
---@return GameObject The spawned weapon
function Spawn_Special_Weapon(type_name, player) end

-- -----------------------------------------------------------
-- ------------------------ Game time ------------------------
-- -----------------------------------------------------------

--- Returns game time of the current game mode in seconds if called. Can be indexed for additional functions.
---
---@type fun():number
---@public
---@return number
GetCurrentTime = {}

---@public
--- The current frame
---@return number
function GetCurrentTime.Frame() end

---@public
---@return number
function GetCurrentTime.Galactic_Time() end

-- ---------------------------------------------------------------
-- ------------------------ Randomization ------------------------
-- ---------------------------------------------------------------

--- Returns a random integer between the given integers when called (uses game time as seed). 
--- Can be indexed to access further functions.
---
---@type fun(lower:number, upper:number):number
---@public
---@param lower number
---@param upper number
---@return number
GameRandom = {}

---@public
--- Returns a random float between the given bounds or between zero and one if no bounds are given.
---@overload fun():number
---@param lower number
---@param upper number
---@return number
function GameRandom.Get_Float(lower, upper) end

---@public
--- Returns a random integer within the given bounds (uses real time or some other game independent value as seed).
---@param lower number
---@param upper number
---@return number
function GameRandom.Free_Random(lower, upper) end

-- -----------------------------------------------------------------------
-- ------------------------ Camera and Cinematics ------------------------
-- -----------------------------------------------------------------------

---@public
--- Teleports all units of the given player capable of retreating into retreat position and starts the retreat. 
--- The actual hyperspace jump is executed only after the given delay. This neither starts a countdown nor does it end the battle.
---@param playerID number
---@param delay number
function Start_Cinematic_Space_Retreat(playerID, delay) end

---@public
--- Ends the automatic cinematic camera.
function End_Cinematic_Mode() end

---@public
--- Starts the automatic cinematic camera.
function Start_Cinematic_Mode() end

---@public
--- Used in campaign openings to have a cinematic space scene when a ground map is loaded.
---@param on boolean
function Set_Cinematic_Environment(on) end

---@public
--- Used in campaign openings to have a cinematic space scene when a ground map is loaded.
---@param object GameObject
function Promote_To_Space_Cinematic_Layer(object) end

---@public
---@param type_name string
---@param player_id number
---@param transport_pos GameObject|Position
---@param zangle number
---@param phase_mode number Landing = 1, Unloading = 2, Leaving = 3
---@param anim_delta number
---@param idle_time number
---@param persist number
---@param hint any Unknown
---@return GameObject The spawned transport
function Create_Cinematic_Transport(type_name, player_id, transport_pos, zangle,
                                    phase_mode, anim_delta, idle_time, persist,
                                    hint) end

---@public
--- Zooms the cinematic camera in or out.
---@param transition_time number The time that the transition to the zoomed state takes
---@param magnification number Greater than 1 zooms out, less than 1 zooms in
function Cinematic_Zoom(transition_time, magnification) end

---@public
--- Transition from the cinematic camera back to the tactical view.
---@param time number
function Transition_To_Tactical_Camera(time) end

---@public
--- Transition the camera position to a new position. The position new is determined as an offset from some reference position.
---@param position GameObject|Position A reference position for the coordinate parameters
---@param transition_time number
---@param x_offset number Offset from the given position in x direction, or the distance to the given position depending on the following parameter
---@param y_offset number Offset from the given position in y direction, or pitch depending on the following parameter
---@param z_offset number Offset from the given position in y direction, or yaw depending on the following parameter
---@param euler_angles number Sets the previous parameters to cartesian coordinates (0), or spherical coordinates (1)
---@param attach_object GameObject|number A game object to attach the camera to. The camera will move with the object. Set to 0 to use no object
---@param use_object_orientation number Sets orientation of the used coordinate system to default (0) as seen in the map editor or to the orientation of the given object
---@param cinematic_animation number Play the given objects cinematic animation (1) or not (0)
function Transition_Cinematic_Camera_Key(position, transition_time, x_offset,
                                         y_offset, z_offset, euler_angles,
                                         attach_object, use_object_orientation,
                                         cinematic_animation) end

---@public
--- Set the camera position. The position is determined as an offset from some reference position.
---@param position GameObject|Position A reference position for the coordinate parameters
---@param x_offset number Offset from the given position in x direction, or the distance to the given position depending on the following parameter
---@param y_offset number Offset from the given position in y direction, or pitch depending on the following parameter
---@param z_offset number Offset from the given position in y direction, or yaw depending on the following parameter
---@param euler_angles number Sets the previous parameters to cartesian coordinates (0), or spherical coordinates (1)
---@param attach_object GameObject|number A game object to attach the camera to. The camera will move with the object. Set to 0 to use no object
---@param use_object_orientation number Sets orientation of the used coordinate system to default (0) as seen in the map editor or to the orientation of the given object
---@param cinematic_animation number Play the given objects cinematic animation (1) or not (0)
function Set_Cinematic_Camera_Key(position, x_offset, y_offset, z_offset,
                                  euler_angles, attach_object,
                                  use_object_orientation, cinematic_animation) end

---@public
--- Transition the camera target to a new position. The new position is determined as an offset from some reference position.
---@param position GameObject|Position A reference position for the coordinate parameters
---@param transition_time number
---@param x_offset number Offset from the given position in x direction, or the distance to the given position depending on the following parameter
---@param y_offset number Offset from the given position in y direction, or pitch depending on the following parameter
---@param z_offset number Offset from the given position in y direction, or yaw depending on the following parameter
---@param euler_angles number Sets the previous parameters to cartesian coordinates (0), or spherical coordinates (1)
---@param attach_object GameObject|number A game object to attach the camera to. The camera will move with the object. Set to 0 to use no object
---@param use_object_orientation number Sets orientation of the used coordinate system to default (0) as seen in the map editor or to the orientation of the given object
---@param cinematic_animation number Play the given objects cinematic animation (1) or not (0)
function Transition_Cinematic_Target_Key(position, transition_time, x_offset,
                                         y_offset, z_offset, euler_angles,
                                         attach_object, use_object_orientation,
                                         cinematic_animation) end

---@public
--- Set the camera target. The target position is determined as an offset from some reference position.
---@param position GameObject|Position A reference position for the coordinate parameters
---@param x_offset number Offset from the given position in x direction, or the distance to the given position depending on the following parameter
---@param y_offset number Offset from the given position in y direction, or pitch depending on the following parameter
---@param z_offset number Offset from the given position in y direction, or yaw depending on the following parameter
---@param euler_angles number Sets the previous parameters to cartesian coordinates (0), or spherical coordinates (1)
---@param attach_object GameObject|number A game object to attach the camera to. The camera will move with the object. Set to 0 to use no object
---@param use_object_orientation number Sets orientation of the used coordinate system to default (0) as seen in the map editor or to the orientation of the given object
---@param cinematic_animation number Play the given objects cinematic animation (1) or not (0)
--- Set a target position for the camera to point at. If W is given, the camera will follow its movements. Without W the parameters R and S(?) won't work. If R is 1, the function uses W's coordinate system.
function Set_Cinematic_Target_Key(position, x_offset, y_offset, z_offset,
                                  euler_angles, attach_object,
                                  use_object_orientation, cinematic_animation) end

---@public
--- End the cinematic camera and enable the command bar again.
function End_Cinematic_Camera() end

---@public
--- Start the cinematic camera disabling the command bar.
---@param unknown boolean Default is true
function Start_Cinematic_Camera(unknown) end

---@public
--- Point the camera to the given position. Can be used during camera sequences but only affects the tactical camera.
---@param position GameObject|Position
function Point_Camera_At(position) end

---@public
--- Rotate the camera to the given angle. Takes the shortest direction. Can be used during camera sequences, but 
--- only affects the tactical camera.
---@param z_angle number The angle around the z axis giving the new orientation
---@param transition_time number The duration of the transition
function Rotate_Camera_To(z_angle, transition_time) end

---@public
--- Rotates the camera around the z axis by the given amount of degrees. The sign of the angle determines the direction of the rotation. The rotation takes the given amount of time. 
---@param z_angle number
---@param transition_time number
function Rotate_Camera_By(z_angle, transition_time) end

---@public
--- Zoom in the tactical camera either immediately or with a short transition.
---@param zoom number Float between 0 (zoomed in) and 1 (zoomed out)
---@param immediate number Set the zoom immediately (1) or use a short transition (0)
function Zoom_Camera(zoom, immediate) end

---@public
--- Function and parameters unknown.
function Camera_To_Follow(...) end

---@public
--- Scroll the tactical camera to the given position.
---@param position GameObject|Position
function Scroll_Camera_To(position) end

---@public
--- Fade screen into blackness.
---@param time number
function Fade_Screen_Out(time) end

---@public
--- Fade screen back in from blackness
---@param time number
function Fade_Screen_In(time) end

---@public
--- Turn off blackness from fade
function Fade_Off() end

---@public
--- Make screen black immediately
function Fade_On() end

---@public
--- Move black bars at the top and bottom out of the screen
---@param time number
function Letter_Box_Out(time) end

---@public
--- Move black bars at the top and bottom into the screen
---@param time number
function Letter_Box_In(time) end

---@public
--- Get rid of black bars immediately
function Letter_Box_Off() end

---@public
--- Show black bars immediately
function Letter_Box_On() end

---@public
--- Hides and disables all units not marked by In_End_Cinematic. Ignores space stations and structures.
function Do_End_Cinematic_Cleanup() end

---@public
--- Pause/unpause weather audio.
---@param pause boolean
function Weather_Audio_Pause(pause) end

---@public
---@param allow boolean
function Allow_Localized_SFX(allow) end

---@type SFXManagerClass
SFXManager = {}

---@public
---@param allow boolean
function SFXManager.Allow_Ambient_VO(allow) end

---@public
---@param allow boolean
function SFXManager.Allow_Enemy_Sighted_VO(allow) end

---@public
---@param allow boolean
function SFXManager.Allow_HUD_VO(allow) end

---@public
--- Spelling mistake!
---@param allow boolean
function SFXManager.Allow_Unit_Reponse_VO(allow) end

---@public
---@param allow boolean
function SFXManager.Allow_Localized_SFXEvents(allow) end

---@public
--- Removes screen texts
function Remove_All_Text() end

---@public
function Stop_All_Speech() end

---@public
function Resume_Mode_Based_Music() end

---@public
function Stop_All_Music() end

---@public
--- Plays a music event defined in MusicEvents.xml
---@param music_event string
function Play_Music(music_event) end

---@public
function Stop_Bink_Movie() end

---@public
--- Plays a movie defined in Movies.xml
---@param movie_name string
function Play_Bink_Movie(movie_name) end

---@public
---@param environment number Integer
function Set_New_Environment(environment) end

---@public
--- Turn on weather effects
function Force_Weather() end

---@public
---@param enable boolean
function Enable_Distance_Fog(enable) end

---@public
---@param enable boolean
function Enable_Fog(enable) end

---@public
--- Plays a lightning effect between the given positions for a time.
---@param effect string
---@param position1 Position|GameObject
---@param position2 Position|GameObject
---@return CommandBlock
function Play_Lightning_Effect(effect, position1, position2) end

-- -------------------------------------------------------------------------
-- ------------------------ Miscellaneous Functions ------------------------
-- -------------------------------------------------------------------------

--- Used to run event handlers like `Default_Space_Conflict_Begin`. Returns an event handler function to be called or nil.
---
---@type function|table
---@public
---@return function|nil
GetEvent = {}

---@public
--- Returns a list with parameters for the function call returned by GetEvent()
---@return table
function GetEvent.Params() end

---@public
--- Clear out any thread events
function GetEvent.Reset() end

---@public
--- Returns the call stacks for all threads of this lua script.
---@return string
function DumpCallStack() end

---@public
--- Seems to be equivalent to Thread.Get_Current_ID()
---@return number The current thread ID, an integer
function GetThreadID() end

---@public
--- Prints to _LogFile.txt. Contains a spelling mistake.
---@param out_string string
function _OuputDebug(out_string) end

---@public
--- Trigger a message popup window
---@param out_string string
function _MessagePopup(out_string) end

---@public
--- Print to the given file.
---@param file_name string Just a filename, no path
---@param out_string string
function _CustomScriptMessage(file_name, out_string) end

---@public
--- Prints to the AILog if it is enabled
---@param out_string string
function _ScriptMessage(out_string) end

---@public
--- Sets a flag for the engine to terminate the script. The script will not be killed immediately, only after the next yield.
function _ScriptExit() end

---@public
---@param string1 string
---@param string2 string
---@return boolean
function StringCompare(string1, string2) end

---@public
--- Is this a multiplayer game?
---@return boolean
function Is_Multiplayer_Mode() end

---@public
--- Returns "Land", "Space" or "Galactic"
---@return string
function Get_Game_Mode() end

---@public
--- True for GC games
---@return boolean
function Is_Campaign_Game() end

---@public
--- (Un)Lock all player controls
---@param lock number Integer to denote true(1) or false(0)
function Lock_Controls(lock) end

---@public
--- Disable or enable all AIs
---@param suspend number Integer to denote true(1) or false(0)
function Suspend_AI(suspend) end

---@public
--- Stops fast forward
function Cancel_Fast_Forward() end

---@public
--- In tactical missions when reward parameter 9 of LINK_TACTICAL is set to 2, this will trigger the arrival of the attacking fleet. Should be called before the player is given control.
function Resume_Hyperspace_In() end

---@public
--- Displays the text entry as a droid advisor hint
---@param text_string string Text identifier from dat file
function Game_Message(text_string) end

---@public
--- For info_section == true the objective is added under the heading "Battle Information", otherwise it is added under the heading "Mission Objectives"
---@param text_string string Text identifier from dat file
---@param info_section boolean Add objective as "Battle Information" or as "Mission Objective"
function Add_Objective(text_string, info_section) end

---@public
---@param identifier string
function Remove_Planet_Highlight(identifier) end

---@public
---@param planet GameObject
---@param identifier string
function Add_Planet_Highlight(planet, identifier) end

---@public
--- Removes the radar blip identified by the given string.
---@param identifier string
function Remove_Radar_Blip(identifier) end

---@public
--- Add a radar blip on the given object with an identifier for removal.
---@param game_object GameObject
---@param identifier string
function Add_Radar_Blip(game_object, identifier) end

---@public
---@param object GameObject
---@param hide number
---@param sub_object_name string
function Hide_Sub_Object(object, hide, sub_object_name) end

---@public
---@param object GameObject
---@param hide number
function Hide_Object(object, hide) end

---@public
--- Assembles the passed objects into a fleet and returns the fleet object.
---@param object_list GameObject[]
---@return GameObject
function Assemble_Fleet(object_list) end

---@public
---@param position GameObject|Position
---@return boolean
function Is_Point_In_Asteroid_Field(position) end

---@public
---@param position GameObject|Position
---@return boolean
function Is_Point_In_Ion_Storm(position) end

---@public
---@param position GameObject|Position
---@return boolean
function Is_Point_In_Nebula(position) end

---@public
--- Only valid in land mode.
---@overload fun(position1, position2):boolean
---@param position1 position
---@param position2  position
---@param player PlayerObject
---@param unknown boolean
---@return boolean
function Are_On_Opposite_Sides_Of_Shield(position1, position2, player, unknown) end

---@public
--- Triggers the retry dialog that allows the player to restart the mission or quit.
function Activate_Retry_Dialog() end

---@public
---@param planet PlanetObject
---@param level number
---@return CommandBlock
function WaitForStarbase(planet, level) end

---@public
---@param planet PlanetObject
---@param level number
---@return CommandBlock
function WaitForGroundbase(planet, level) end

---@public
---@param planet PlanetObject
---@return GameObjectType
function GetNextGroundbaseType(planet) end

---@public
---@param planet PlanetObject
---@return GameObjectType
function GetNextStarbaseType(planet) end

-- ----------------------------------------------------------------
-- ------------------------ Multithreading ------------------------
-- ----------------------------------------------------------------

---@public
--- Starts the given function in a new thread on the next frame with the given parameter and returns the thread ID (an integer). If the parameter is a table, its contents will be copied into a new list which is given to the function, the keys of the original table will be lost.
---@param function_name string
---@param parameter any
---@return number Thread ID
function Create_Thread(function_name, parameter) end

Thread = {}

---@public
--- Starts the given function in a new thread on the next frame with the given parameter and returns the thread ID (an integer). If the parameter is a table, its contents will be copied into a new list which is given to the function, the keys of the original table will be lost.
---@param function_name string
---@param parameter any
---@return number Thread ID
function Thread.Create(function_name, parameter) end

---@public
--- Stops the thread with the given ID
---@param thread_id number
function Thread.Kill(thread_id) end

---@public
function Thread.Kill_All() end

---@public
---@param thread_id number
function Thread.Is_Thread_Active(thread_id) end

---@public
--- Returns the name of the main function ("main" or the function name passed to Create_Thread).
---@param thread_id number
function Thread.Get_Name(thread_id) end

---@public
--- Returns the ID of the current thread.
function Thread.Get_Current_ID() end

-- --------------------------------------------------------
-- ------------------------ Values ------------------------
-- --------------------------------------------------------

GlobalValue = {}

---@public
--- Get the value for the given name.
---@param name string
---@return any
function GlobalValue.Get(name) end

---@public
--- Set a value for the given name. This value is accessible for all lua scripts and can be any variable type except userdata or thread. Can theoretically still be used to access userdata from other scripts, however the game throws an error in that case.
---@param name string
---@param value any
function GlobalValue.Set(name, value) end

--- Get the value set for the given name. Can be indexed for further functions.
---
---@type fun(name:string):any
---@public
---@param name string
---@return any
ThreadValue = {}

---@public
--- Get the value set for the given name.
---@param name string
---@return any
function ThreadValue.Get(name) end

---@public
--- Set a value for the given identifier. This value is specific to a thread as defined by Create_Thread.
---@param name string
---@param value any
function ThreadValue.Set(name, value) end

---@public
--- Sets value for the given name to nil.
---@param name string
function ThreadValue.Reset(name) end

-- ------------------------------------------------------------
-- ------------------------ Fog of War ------------------------
-- ------------------------------------------------------------

FogOfWar = {}

---@public
--- Reveals the entire map for a player. Can be undone using the return value.
---@param player PlayerObject
---@return FowRevealClass
function FogOfWar.Reveal_All(player) end

---@public
--- Reveals FoW in a radius aroung the given position for a player. The return value can be used to undo the reveal.
---@param player PlayerObject
---@param position Position
---@param radius number
---@return FowRevealClass
function FogOfWar.Reveal(player, position, radius) end

---@public
--- Reveals FoW in a radius aroung the given position for a player for about 5 seconds.
---@param player PlayerObject
---@param position Position
---@param radius number
function FogOfWar.Temporary_Reveal(player, position, radius) end

---@public
---@param disable boolean
function FogOfWar.Disable_Rendering(disable) end

---@class FowRevealClass
local FowRevealClass = {}

---@public
--- Undo a reveal.
function FowRevealClass.Undo_Reveal() end

-- ---------------------------------------------------------------------
-- ------------------------ Story functionality ------------------------
-- ---------------------------------------------------------------------

---@public
--- Trigger a STORY_AI_NOTIFICATION event with the given identifier.
---@overload fun(identifier:string)
---@param identifier string
---@param unknownArgument GameObject
function Story_Event(identifier, unknownArgument) end

---@public
--- Checks if corresponding reward type TRIGGER_AI has fired.
---@param player PlayerObject
---@param identifier string
---@param gameObject GameObject|nil
---@param bool boolean
---@return boolean
function Check_Story_Flag(player, identifier, gameObject, bool) end

---@public
--- Returns the story file as StoryPlotWrapper object. The parameter is case sensitive.
---@param file_name string 
---@return StoryPlotWrapper
function Get_Story_Plot(file_name) end

---@class StoryPlotWrapper
local StoryPlotWrapper = {}

---@public
--- Finds an Xml event from the plot and returns it.
---@param event_name string
---@return StoryEventWrapper
function StoryPlotWrapper.Get_Event(event_name) end

---@public
--- Suspends the plot.
function StoryPlotWrapper.Suspend() end

---@public
--- Activates the plot
function StoryPlotWrapper.Activate() end

---@public
--- Resets all events of the plot.
function StoryPlotWrapper.Reset() end

---@class StoryEventWrapper
local StoryEventWrapper = {}

---@public
--- Sets the event's reward type.
---@param reward_type string
function StoryEventWrapper.Set_Reward_Type(reward_type) end

---@public
--- Sets a reward parameter. The index starts counting at zero which corresponds to <Reward_Param1>.
---@param parameter_index number
---@param value any
function StoryEventWrapper.Set_Reward_Parameter(parameter_index, value) end

---@public
--- Sets an event parameter. The index starts counting at zero which corresponds to <Event_Param1>.
---@param parameter_index number
---@param value any
function StoryEventWrapper.Set_Event_Parameter(parameter_index, value) end

---@public
--- Sets the dialog file.
---@param dialog_file_name string
function StoryEventWrapper.Set_Dialog(dialog_file_name) end

---@public
function StoryEventWrapper.Clear_Dialog_Text() end

---@public
--- The text will be formatted with any additional parameters given.
---@param text_identifier string
function StoryEventWrapper.Add_Dialog_Text(text_identifier, ...) end

-- ----------------------------------------------------------------------
-- ------------------------ AI related functions ------------------------
-- ----------------------------------------------------------------------

---@class MarkupBlockStatus

---@public
--- For tactical battle. Evaluates the perception at GC level.
---@param perception string
---@return number
function Evaluate_In_Galactic_Context(perception) end
---@public
---@param player PlayerObject
---@param path PlanetObject[]
---@param number number
---@param unknown MarkupBlockStatus
---@return MarkupBlockStatus
function Apply_Markup(player, path, number, unknown) end
---@public
---@param player PlayerObject
function Purge_Goals(player) end
---@public
---@param player PlayerObject
---@param goal string
---@param target GameObject|PlanetObject
---@param desire_bonus number
---@param unknown number Possibly goal cycles?
---@return CommandBlock
function GiveDesireBonus(player, goal, target, desire_bonus, unknown) end
---@public
--- Evaluates a perception and returns the result. Player and target are needed if and only if the perception uses Variable_Self and Variable_Target, respectively.
---@overload fun(perception:string):number
---@overload fun(perception:string, player:PlayerObject):number
---@param perception string
---@param player PlayerObject
---@param target GameObject|PlayerObject|AITarget
---@return number
function EvaluatePerception(perception, player, target) end
---@public
--- Deprecated but may still work as intended
---@param player PlayerObject
---@param target GameObject|PlanetObject
---@param taskforce TaskForce
---@return GameObject|PlanetObject
function _FindStageArea(player, target, taskforce) end
---@public
--- Deprecated but may still work as intended
---@param player PlayerObject
---@return any
function _ProduceObject(player, type, target) end

--- Find a target for a taskforce. Tries to find the one that the perception returns the highest value on.
---
---@type fun(taskforce:TaskForce, perception:string, goal_application_flag:string, probability:number, range:number):GameObject|PlanetObject|AITarget
---@public
---@overload fun(taskforce:TaskForce, perception:string, goal_application_flag:string, probability:number):GameObject|PlanetObject|AITarget
---@param taskforce TaskForce
---@param perception string
---@param goal_application_flag string
---@param probability number
---@param range number
---@return GameObject|PlanetObject|AITarget
FindTarget = {}

---@public
--- Find a target for an aiplayer. Tries to find the one that the perception returns the highest value on.
---@overload fun(player:PlayerObject, perception:string, goal_application:string, reachability:string, probability:number):GameObject|PlanetObject|AITarget
---@overload fun(player:PlayerObject, perception:string, goal_application:string, reachability:string, probability:number, target:PlanetObject|GameObject|AITarget):GameObject|PlanetObject|AITarget
---@param player PlayerObject
---@param perception string
---@param goal_application string
---@param reachability string
---@param probability number
---@param target PlanetObject|GameObject|AITarget
---@param range number
---@return PlanetObject|GameObject
function FindTarget.Reachable_Target(player, perception, goal_application,
                                     reachability, probability, target, range) end
---@public
---@param taskforce TaskForce
---@param list GameObject[]|PlanetObject[]
---@param perception string
---@return GameObject|PlanetObject
function FindTarget.Best_Of(taskforce, list, perception) end

FreeStore = {}

---@public
---@param game_object GameObject
---@return boolean
function FreeStore.Is_Object_On_Free_Store(game_object) end
---@public
---@return number
function FreeStore.Get_Object_Count() end
---@public
---@param game_object GameObject
---@return boolean
function FreeStore.Is_Unit_Safe(game_object) end
---@public
---@param game_object GameObject
---@return boolean
function FreeStore.Is_Unit_In_Transit(game_object) end
---@public
---@param game_object GameObject
---@param planet PlanetObject
function FreeStore.Move_Object(game_object, planet) end

---@public
---@param s string The otput message as string.
---Prints a message into a message box.
---**WARNING**: Appears to be non-functional!
function _MessagePopup(s) end
---@public
---@param s string The otput message as string.
---Prints a message to the `AILog.txt` if the command `aiff script` has been used in the ingame console.
function _ScriptMessage(s) end
---@public
---@param s string The otput message as string.
---Prints a debug message directly to the `LogFile.txt`. Usually used as Error Log.
function _OuputDebug(s) end
---@public
---@return string
---Dumps the current call stack of the LUA environment to a string.
function DumpCallStack() end
