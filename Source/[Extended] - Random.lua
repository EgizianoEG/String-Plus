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
type GenerateOptions = {
	["CharSet"]: (string | {string})?,
	["TotalSections"]: number?,
	["SectionLength"]: number?,
	["Delimiter"]: string?,
	["Prefix"]: string?,
	["Suffix"]: string?,
}

for Charcter = 0, 255 do
	Cache["."][Charcter+1] = string.char(Charcter)
end

--| Will be used to insert new strings into tables.
local function Append(Array: {any}, Item: any)
	Array[#Array+1] = Item
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

--[[ Generate - Generates a randomized string of the specified character sets, sections, section length, prefix, and suffix.
-| @param
Options: A table of options used by the function to structure the generated string which can contain:
	- CharSet: A table of strings or a single string containing the character set(s) to use for generating each section of the key.
		* If a table is provided, each element of the table corresponds to a section of the key and specifies the character set for that section.
		* If a single string is provided, all sections of the key will use the same character set.
		* If the number of sets in the table is less than the TotalSections, they will be repeated until the table length match the TotalSections.
		* If CharSet is not provided or is nil, all sections of the key will use any alphanumeric character as the character set. 
	- TotalSections: The total number of sections in the key. Default: 4.
	- SectionLength: The length of each section in the key. Default: 4.
	- Delimiter: The delimiter used to separate the sections. Default: "-".
	- Prefix: The prefix to use for the key. If the prefix length is less than the specified section length, it will be padded with random characters from the character set. If the prefix length is greater than the section length, it will be truncated.
	- Suffix: The suffix to use for the key. If the suffix length is less than the specified section length, it will be padded with random characters from the character set. If the suffix length is greater than the section length, it will be truncated.
-| @return  string - The generated string.
-| @return	table - The generated sections of the string without any additions.]]
function String.Generate(Options: GenerateOptions?)
	local Options = (Options or {})::GenerateOptions
	local CharSet = Options.CharSet
	local SectionLength = ((type(Options.SectionLength) == "number" and Options.SectionLength > 0 and math.ceil(Options.SectionLength)) or 4)
	local TotalSections = ((type(Options.TotalSections) == "number" and Options.TotalSections > 0 and math.ceil(Options.TotalSections)) or 4)
	local Delimiter = (type(Options.Delimiter) == "string" and Options.Delimiter) or ("-")
	local Prefix = Options.Prefix
	local Suffix = Options.Suffix

	local SPatterns
	local MaxCharRange: any
	local GeneratedChars = {}
	local GeneratedSections = {}

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
				Append(GeneratedChars, SPatterns[Section][math.random(MaxCharRange[Section])])
			else
				Append(GeneratedChars, SPatterns[math.random(MaxCharRange)])
			end
		end
		Append(GeneratedSections, table.concat(GeneratedChars, "", (#GeneratedChars - SectionLength + 1)))
		Append(GeneratedChars, (Section ~= TotalSections and Delimiter) or (""))
	end

	if type(Prefix) == "string" then
		if #Prefix > SectionLength then
			Prefix = string.sub(Prefix, 1, SectionLength)
		elseif #Prefix < SectionLength then
			Prefix = (Prefix) .. (table.concat(GeneratedChars, (""), #Prefix+1, SectionLength))
		end
		for CIndex = 1, #Prefix do
			GeneratedChars[CIndex] = string.sub(Prefix, CIndex, CIndex)
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
		local CCount = #GeneratedChars
		for CIndex = 1, #Suffix do
			GeneratedChars[CCount - SectionLength + CIndex - 1] = string.sub(Suffix, CIndex, CIndex)
		end
	end
	return table.concat(GeneratedChars), GeneratedSections
end

-------------
return String
