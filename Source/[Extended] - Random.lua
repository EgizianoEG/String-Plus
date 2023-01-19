--!strict
---------
--[[ Information:
	○ Author: @EgizianoEG
	○ About:
		- An extention to the string library makes it possible to randomize strings, and generate randomized keys based on patterns and character sets.
]]
------------------------------------------------------------------------------------------------------------------------------------------------------|
local String = {}
local Cache = {["."] = {}}

for Charcter = 0, 255 do
	Cache["."][Charcter+1] = string.char(Charcter)
end

--| Returns an array containing all possible characters that are under a specific class.
local function CharactersFromSet(CharSet: string)
	local Characters = {}
	for _, Character in ipairs(Cache["."]) do
		if string.match(Character, CharSet) then
			Characters[#Characters+1] = Character
		end
	end
	Cache[CharSet] = Characters
	return Characters
end

--[[ Random - Generates a random string of the specified length and character set.
-| @param	Length: The length of the string to generate. Default: 20.
-| @param	CharSet: The character set to use for generating the string. The default is any alphanumeric character.
-| @return  string - The generated random string.
-| @usage:
	local RandomString = Random(10, "[%d]") -- Generate a random string of length 10 with only digits
    print(RandomString) -- Outputs a string of 10 random digits, e.g. "3485097320"
    --
    local RandomString2 = Random(15) -- Generate a random string of length 15 with any alphanumeric character
    print(RandomString2) -- Outputs a string of 15 random alphanumeric characters, e.g. "4q3m8z9k1p7c6t5"
    --
    local RandomString3 = Random(5, "[%l%u]") -- Generate a random string of length 5 with only lowercase and uppercase letters
    print(RandomString3) -- Outputs a string of 5 random lowercase and uppercase letters, e.g. "FjKpZ"
	--
	local RandomString4 = Random(12, "[Aabcd01]") -- Generate a random string of length 12 that only contains any of characters: A,a,b,c,d,0,1
	print(RandomString4) -- example output: 10AbbbAdb1db
]]
function String.Random(Length: number?, CharSet: string?)
	local Length = ((Length and Length > 0 and Length) or 20)
	local CharSet = ((CharSet and CharSet ~= "" and CharSet) or "[%w]")
	local CharPattern = (Cache[CharSet] or CharactersFromSet(CharSet))
	local MaxRange = #CharPattern
	local Randomized = {}
	for CharIndex = 1, Length do
		Randomized[CharIndex] = CharPattern[math.random(MaxRange)]
	end
	return table.concat(Randomized)
end

--[[ GenerateKey - Generates a randomized key of the specified character sets, sections, section length, prefix, and suffix.
-| @param   CharSet: A table of strings or a single string containing the character set(s) to use for generating each section of the key.
---|			* If a table is provided, each element of the table corresponds to a section of the key and specifies the character set for that section.
---|			* If a single string is provided, all sections of the key will use the same character set.
---|			* If the number of sets in the table is less than the TotalSections, they will be repeated until the table length match the TotalSections.
---|			* If CharSet is not provided or is nil, all sections of the key will use any alphanumeric character as the character set.
-| @param   TotalSections: The total number of sections in the key. Default: 4.
-| @param   SectionLength: The length of each section in the key. Default: 4.
-| @param   Delimiter: The delimiter used to separate the sections. Default: "-".
-| @param   Prefix: The prefix to use for the key. If the prefix length is less than the specified section length, it will be padded with random characters from the character set. If the prefix length is greater than the section length, it will be truncated.
-| @param   Suffix: The suffix to use for the key. If the suffix length is less than the specified section length, it will be padded with random characters from the character set. If the suffix length is greater than the section length, it will be truncated.
-| @return  string - The generated key.
-| @usage:
	local Key = String.GenerateKey() -- Generate a random key with the default options
	print(Key) -- Outputs a string like "A1B2-C3D4-E5F6-G7H8"
	--
	local Key2 = String.GenerateKey("[%d]", 5, 5, "-", "AA", "ZZ") -- Generate a random key with 5 sections of 5 digits each, delimited by "-", and with a prefix and suffix
	print(Key2) -- Outputs a string like "AA821-76914-05026-71996-284ZZ"
    --
	local Key3 = String.GenerateKey("[%a]", 4, 8, ":", "100", "001") -- Generate a random key with 4 sections of 8 alphabetic characters each, delimited by ":", and with a prefix and suffix
	print(Key3) -- Outputs a string like "100MYzy:jswtGIJl:JLDmPcrR:yfCqz001"
    --
	local Key4 = String.GenerateKey({"%u", "[01]", "%u", "%l"}, 4, 8, "][", "[", "]") -- Generate a random key with 4 sections of 8 alphabetic characters each, delimited by ":", and with a prefix and suffix
	print(Key4) -- Outputs a string like "[POTWCAI][10111010][HLLHICYR][ylsgikm]"
]]
function String.GenerateKey(CharSet: ({string} | string?), TotalSections: number?, SectionLength: number?, Delimiter: string?, Prefix: string?, Suffix: string?)
	local Delimiter = (type(Delimiter) == "string" and Delimiter) or ("-")
	local SectionLength = ((type(SectionLength) == "number" and SectionLength > 0 and SectionLength) or 4)
	local TotalSections = ((type(TotalSections) == "number" and TotalSections > 0 and TotalSections) or 4)
	local GeneratedKey = {}
	local MaxCharRange: any
	local SPatterns

	if type(CharSet) == "table" then
		SPatterns = {}
		MaxCharRange = {}
		for SectionNum, Set in ipairs(CharSet) do
			SPatterns[SectionNum] = (Cache[Set] or CharactersFromSet(Set))
			MaxCharRange[SectionNum] = #SPatterns[SectionNum]
		end
		if TotalSections > #SPatterns then
			repeat
				local Clone = table.clone(SPatterns)
				for _, Set in ipairs(Clone) do
					SPatterns[#SPatterns+1] = Set
					MaxCharRange[#MaxCharRange+1] = #Set
					if #SPatterns == TotalSections then break end
				end
			until #SPatterns == TotalSections
		end
	else
		if type(CharSet) == "string" then
			CharSet = CharSet
			SPatterns = (Cache[CharSet] or CharactersFromSet(CharSet))::any
		else
			SPatterns = (Cache["[%w]"] or CharactersFromSet("[%w]"))::any
		end
		MaxCharRange = #SPatterns
	end

	for Section = 1, TotalSections do
		for _ = 1, SectionLength do
			if type(SPatterns[Section]) == "table" and type(MaxCharRange) == "table" then
				GeneratedKey[#GeneratedKey+1] = SPatterns[Section][math.random(MaxCharRange[Section])]
			else
				GeneratedKey[#GeneratedKey+1] = SPatterns[math.random(MaxCharRange)]::any
			end
		end
		GeneratedKey[#GeneratedKey+1] = (Section ~= TotalSections and Delimiter) or ("")
	end

	if type(Prefix) == "string" then
		if #Prefix > SectionLength then
			Prefix = string.sub(Prefix, 1, SectionLength)
		elseif #Prefix < SectionLength then
			Prefix = (Prefix) .. (table.concat(GeneratedKey, (""), #Prefix+1, SectionLength))
		end
		for CIndex = 1, #Prefix do
			GeneratedKey[CIndex] = string.sub(Prefix, CIndex, CIndex)
		end
	end

	if type(Suffix) == "string" then
		if #Suffix > SectionLength then
			Suffix = string.sub(Suffix, 1, SectionLength)
		elseif #Suffix < SectionLength then
			local Set = (type(CharSet) == "string" and CharSet)
				or (type(CharSet) == "table" and CharSet[TotalSections])
				or ("[%w]")
			Suffix = String.Random(SectionLength - #Suffix, Set) .. Suffix
		end
		local CCount = #GeneratedKey
		for CIndex = 1, #Suffix do
			GeneratedKey[CCount - SectionLength + CIndex - 1] = string.sub(Suffix, CIndex, CIndex)
		end
	end
	return table.concat(GeneratedKey)
end

-------------
return String