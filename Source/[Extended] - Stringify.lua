--!strict
---------
--[[ Information:
		○ Author: @EgizianoEG
		○ About:
			- Stringify is a part of the module/library StringPlus that provides the ability to covert tables into strings.
]]
--------------------------------------------------------------------------------------------------------------------------|

--[[ Stringify - Converts a table to a string representation.
-| @param	Tabel: The table to convert.
-| @param	TabSize [optional]: The size of the indentation in spaces/provided character if any. Default is 4.
-| @param	IndentionCharacter [optional]: The character to use for indentation. Default is a space.
-| @param	Recursive [optional]: A boolean indicating whether to recursively process nested tables. Default is false.
-| @param	Cache [optional]: A table to use as a cache to detect circular references (Used by the recursive calls).
-| @param	CIndention [optional]: The current level of indentation (Used by the recursive calls).
-| @return	A string representation of the table.]]
local function Stringify(Tabel: {[any]: any}, TabSize: number?, IndentionCharacter: string?, Recursive: boolean?, Cache: {[any]: any}?, CIndention: number?)
	assert(type(Tabel) == "table", "Invalid Argument [1]; Table expected but got other type.")
	assert(type(TabSize) == "number" or TabSize == nil, "Invalid Argument [2]; Number expected but got other type.")
	assert(type(IndentionCharacter) == "string" or IndentionCharacter == nil, "Invalid Argument [3]; String expected but got other type.")
	-------------------------------------------------------------------------------------------------------------------------------------|

	Cache = Cache or {}
	if Cache and Cache[Tabel] then
		return "\"*** cycle table reference detected ***\""
	end

	(Cache::any)[Tabel] = true
	local InCharacter = (IndentionCharacter and IndentionCharacter) or (" ")
	local Indention = (TabSize and InCharacter:rep(TabSize)) or InCharacter:rep(4)
	local CurrentIndention = (CIndention and (CIndention + 1)) or 1
	local Stringified = {"{\n"}

	local KeyCount = 0
	local Processed = 0
	for _ in pairs(Tabel) do
		KeyCount += 1
	end

	for Key, Value in pairs(Tabel) do
		Processed += 1
		local VType = type(Value)
		if VType == "table" and Recursive then
			Stringified[#Stringified+1] = string.format("%s[\"%s\"] = %s%s\n", Indention:rep(CurrentIndention), Key, Stringify(Value, TabSize, InCharacter, true, Cache, CurrentIndention), (Processed < KeyCount and ",") or "")
		else
			Key = "[" .. ((type(Key) == "number" and Key) or ("\"".. tostring(Key) .."\"")) .. "]"
			Value = ((VType == "string" and "\"".. Value .."\"") or tostring(Value))
			Stringified[#Stringified+1] = string.format("%s%s = %s%s\n", Indention:rep(CurrentIndention), Key, Value, (Processed < KeyCount and ",") or "")
		end
	end
	return string.format("%s%s%s", table.concat(Stringified), (CurrentIndention > 1 and Indention:rep(CurrentIndention * 0.8)) or "", "}")
end

----------------
return Stringify