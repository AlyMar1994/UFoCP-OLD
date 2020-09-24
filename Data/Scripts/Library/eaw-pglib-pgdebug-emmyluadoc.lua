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
---Opens a message box that contains the handled event and its parameters as multi-line formatted string.
---**WARNING:** Appears to be non-functional.
---@param event any TODO: This is most likely be the same Event type as used in gamescoring.lua
---@param params table
function DebugEventAlert(event, params) end

---@vararg string
---Opens a message box that contains the formatted input string provided as a vararg.
---The vararg should be a string with _n_ formatting placeholders, and _n_ elements that will be handled via `string.format(unpack(arg))`.
---**WARNING:** Appears to be non-functional!
function MessageBox(...) end

---@vararg string
---Prints a debug message to the `AILog.txt` that contains the formatted input string provided as a vararg if the command `aiff script` has been used in the ingame console.
---The vararg should be a string with _n_ formatting placeholders, and _n_ elements that will be handled via `string.format(unpack(arg))`.
function ScriptMessage(...) end

---@vararg string
---Prints a debug message to the `AILog.txt` that contains the formatted input string provided as a vararg if the command `aiff script` has been used in the ingame console.
---The vararg should be a string with _n_ formatting placeholders, and _n_ elements that will be handled via `string.format(unpack(arg))`.
function DebugMessage(...) end

---@vararg string
---Prints a debug message that contains the formatted input string provided as a vararg directly to the `LogFile.txt`. Usually used as Error Log.
---The vararg should be a string with _n_ formatting placeholders, and _n_ elements that will be handled via `string.format(unpack(arg))`.
---@see string#format
---@see unpack
function OutputDebug(...) end

---@vararg string
---Prints an error log to `LogFile.txt` and `AILog.txt` including the contains the formatted input string provided as a vararg and a stack trace.
---The vararg should be a string with _n_ formatting placeholders, and _n_ elements that will be handled via `string.format(unpack(arg))`.
---@see string#format
---@see unpack
function ScriptError(...) end

---@param unit_table GameObjectWrapper[]
---Unpacks a table and prints its content to the `AILog.txt` if the command `aiff script` has been used in the ingame console.
function DebugPrintTable(unit_table) end
