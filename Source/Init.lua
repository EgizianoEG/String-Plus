--!strict
---------
--[[ Information:
		○ Author: @EgizianoEG
		○ About:
			- StringPlus is a module that provides extended string-related functions beyond those in the standard library.
			- It is made based on Python's string methods, Penlight's stringx library, and other open-sourced resources.

		○ Note:
			- This library is not designed to handle errors caused by incorrect input parameters provided by the user.
]]
---------------------------------------------------------------------------------------------------------------------|
local StringPlus = {}
local MockupStandardLibrary = false		--| string.sub, string.upper, and etc are integrated...
local FunctionNamesCase = "PascalCase"	--| LowerCase: "testfunction()", PascalCase: Default, CamelCase: "testFunction()", SnakeCase: "test_function()".
local IncludeSubLibrarariesFunctions = true	--| Integrate its functions? (Not as tables)
local SolvetIndexing = false			--| Should the library try to find the indexed function if not found? (like if you indexed a function name that in snake_case while its name is in PascalCase the module will try to return it)
local Typechecking = require(script.TypeChecking)
local Append =  function(t, v)			--| table.insert alternative with better performance.
	t[#t+1] = v
end
-----------------------------------------------------------------------------------------------|

--| Escapes magic characters in a string.
function StringPlus.Escape(Str: string)
	return string.gsub(Str, "([%-%.%+%[%]%(%)%$%^%%%?%*])", "%%%1")
end

--| EqualsIgnoreCase - simple function that returns a boolean indicating if two strings are equal with case ignored.
function StringPlus.EqualsIgnoreCase(Str_1: string, Str_2: string)
	return string.lower(Str_1) == string.lower(Str_2)
end

--| RemoveVowels - removes all vowels from a given string and replaces them with a specified replacement string or "".
function StringPlus.RemoveVowels(Str: string, Replacement: string?)
	return string.gsub(Str, "[AEIOUaeiou]", Replacement or "")
end

--| RemoveConsonants - removes all consonants from a given string and replaces them with a specified replacement string or "".
function StringPlus.RemoveConsonants(Str: string, Replacement: string?)
	return string.gsub(Str, "[^AEIOUaeiou%p%s%d%c%z]", Replacement or "")
end

--| RemovePunctuation - removes all punctuation characters from a given string and replaces them with a specified replacement string or "".
function StringPlus.RemovePunctuation(Str: string, Replacement: string?)
	return string.gsub(Str, "[%p]", Replacement or "")
end

--| RemoveExtraSpace - removes leading and trailing whitespace from a given string, as well as any extra whitespace between words.
function StringPlus.RemoveExtraSpaces(Str: string)
	return string.gsub(Str, "^%s*(.-)%s*$", "%1"):gsub("%s+", " ")
end

--| MatchIgnoreCase - Simple match function with no case sensitivity.
function StringPlus.MatchIgnoreCase(Str: string, Pattern: string, Init: number?)
	return (string.lower(Str)):match(string.lower(Pattern), Init)
end

--| Returns a new string that is a truncated version of the original string, with a maximum length of `Length` characters.
--|  * If the string is longer than `Length`, it is truncated and has an optional `OmissionSuffix` added to the end.
--|  * If `OmissionSuffix` is not provided, the default suffix is an ellipsis (`...`).
function StringPlus.Truncate(Str: string, Length: number, OmissionSuffix: string?)
	if #Str > Length then
		if type(OmissionSuffix) == "string" then
			Str = string.sub(Str, 1, Length) .. OmissionSuffix
		else
			Str = string.sub(Str, 1, Length) .. ("...")
		end
	end
	return Str
end

--| SwapCase - swaps the case of all alphabetical characters in a given string.
function StringPlus.SwapCase(Str: string)
	return string.gsub(Str, "%a", function(Char)
		return (string.lower(Char) == Char and string.upper(Char)) or string.lower(Char)
	end)
end

--[[ Strip - removes leading and trailing characters from a given string.
-| @param   Str: The string from which to remove the characters.
-| @param   Characters: The characters to remove. If not provided, whitespace characters are removed.
-| @return  The modified string with the leading and trailing characters removed.]]
function StringPlus.Strip(Str: string, Characters: string?)
	local Characters = (Characters and Characters ~= "" and Characters) or "%s"
	local Pattern = string.format("^[%s]*(.-)[%s]*$", Characters, Characters)
	return string.gsub(Str, Pattern, "%1")
end

--[[ RStrip - removes leading characters from a given string.
-| @param   Str: The string from which to remove the characters.
-| @param   Characters: The characters to remove. If not provided, whitespace characters are removed.
-| @return  The modified string with the leading characters removed.]]
function StringPlus.RStrip(Str: string, Characters: string?)
	local Characters = (Characters and Characters ~= "" and Characters) or "%s"
	return string.gsub(Str, "[".. Characters .."]*$", "")
end

--[[ LStrip - removes leading characters from a given string.
-| @param   Str: The string from which to remove the characters.
-| @param   Characters: The characters to remove. If not provided, whitespace characters are removed.
-| @return  The modified string with the leading characters removed.]]
function StringPlus.LStrip(Str: string, Characters: string?)
	local Characters = (Characters and Characters ~= "" and Characters) or "%s"
	return string.gsub(Str, "^[".. Characters .."]*", "")
end

--[[ Center - centers a given string within a specified length, using a specified fill character to pad the string on either side.
-| @param	Str: The string to center.
-| @param	Length: The length of the resulting string.
-| @param	FillChar: The character to use for padding. If not provided, the default fill character is a space.
-| @return	The modified string with the original string centered within the specified length.]]
function StringPlus.Center(Str: string, Length: number, FillChar: string?)
	local CharCount = #Str
	local FillChar = FillChar or (" ")
	local LeftFill = math.floor((Length - CharCount) * 0.5)
	local RightFill = (Length - CharCount - LeftFill)
	return (string.rep(FillChar, LeftFill) .. (Str) .. string.rep(FillChar, RightFill))
end

--[[ RJust - right-justifies a given string within a specified length, using a specified fill character to pad the string on the left side.
-| @param	Str: The string to right-justify.
-| @param	Length: The length of the resulting string.
-| @param	FillChar: The character to use for padding. If not provided, the default fill character is a space.
-| @return	The modified string with the original string right-justified within the specified length.]]
function StringPlus.RJust(Str: string, Length: number, FillChar: string?)
	local FillChar = FillChar or (" ")
	local CharCount = #Str
	if Length > CharCount then
		return Str .. string.rep(FillChar, (Length - CharCount))
	end
	return Str
end

--[[ LJust - left-justifies a given string within a specified length, using a specified fill character to pad the string on the right side.
-| @param	Str: The string to left-justify.
-| @param	Length: The length of the resulting string.
-| @param	FillChar: The character to use for padding. If not provided, the default fill character is a space.
-| @return	The modified string with the original string left-justified within the specified length.]]
function StringPlus.LJust(Str: string, Length: number, FillChar: string?)
	local FillChar = FillChar or (" ")
	local CharCount = #Str
	if Length > CharCount then
		return string.rep(FillChar, (Length - CharCount)) .. (Str)
	end
	return Str
end

--[[ ExpandTabs - expands tab characters in a given string into a specified number of spaces.
-| @param	 Str: The string in which to expand the tab characters.
-| @param	 TabSize: The number of spaces to use for each tab character. If not provided, the default tab size is 4.
-| @return	 The modified string with the tab characters expanded.]]
function StringPlus.ExpandTabs(Str: string, TabSize: number?)
	local TabSize = (TabSize and math.floor(TabSize)) or 4
	return string.gsub(Str, "([^\t\r\n]*)\t", function(Capture)
		if TabSize == 0 then
			return Capture
		else
			return Capture .. string.rep(" ", (TabSize - (#Capture % TabSize)))
		end
	end)
end

--[[ Translate - translates the characters in a given string using a specified mapping table.
-| @param	Str: The string to translate.
-| @param	MappingTable: A table that maps the ASCII codes of the characters to be replaced to their replacement ASCII codes.
-| @return	The modified string with the characters translated according to the mapping table.]]
function StringPlus.Translate(Str: string, MappingTable: {[number]: number})
	for Old, New in pairs(MappingTable) do
		Str = string.gsub(Str, string.char(Old), string.char(New))
	end
	return Str
end

--[[ Count - counts the number of occurrences of a specified value within a given string.
-| @param	Str: The string in which to count the value.
-| @param	Value: The value to count.
-| @param	Start: The index at which to start searching for the value. If not provided, the search begins at the start of the string.
-| @param	End: The index at which to end searching for the value. If not provided, the search ends at the end of the string.
-| @return	The number of occurrences of the value in the string.	]]
function StringPlus.Count(Str: string, Pattern: string, Start: number?, End: number?)
	Str = (Start and string.sub(Str, Start, End)) or Str
	local Count = 0
	for _ in string.gmatch(Str, Pattern) do
		Count += 1
	end
	return Count
end

--[[ StartsWith - checks if a given string starts with one or more specified prefixes.
-| @param	Str: The string to check.
-| @param	Prefixes: The prefix or prefixes to check for. Can be a string or an array of strings.
-| @return	True if the string starts with any of the specified prefixes, false otherwise.]]
function StringPlus.Starts(Str: string, Prefixes: (string | {string}))
	if type(Prefixes) == "table" then
		for _, Prefix in ipairs(Prefixes) do
			if #Str >= #Prefix and string.match(Str, ("^")..Prefix) then
				return true
			end
		end
	elseif type(Prefixes) == "string" then
		return ((#Str >= #Prefixes) and (string.match(Str, ("^")..Prefixes)) and true) or false
	end
	return false
end

--[[ EndsWith - checks if a given string ends with one or more specified suffixes.
-| @param	Str: The string to check.
-| @param	Suffixes: The suffix or suffixes to check for. Can be a string or an array of strings.
-| @return	True if the string ends with any of the specified suffixes, false otherwise.]]
function StringPlus.Ends(Str: string, Suffixes: (string | {string}))
	if type(Suffixes) == "table" then
		for _, Suffix in ipairs(Suffixes) do
			if #Str >= #Suffix and string.match(Str, Suffix.."$") then
				return true
			end
		end
	elseif type(Suffixes) == "string" then
		return ((#Str >= #Suffixes) and (string.match(Str, Suffixes.."$")) and true) or false
	end
	return false
end

--[[ Contains - Determines if a string contains any of the given substrings.
-| @param	Str: The string to search in.
-| @param	SubStrings: A single string or a table of strings to search for.
-| @return	true if the string contains any of the given substrings, false otherwise.
-| @return	The first matching substring, or empty string if no match was found.
-| @return	The start index of the first matching substring, or 0 if no match was found.
-| @return	The end index of the first matching substring, or 0 if no match was found.]]
function StringPlus.Contains(Str: string, SubStrings: (string | {string}))
	if type(SubStrings) == "table" then
		for _, SubString in ipairs(SubStrings) do
			local Start, End = string.find(Str, SubString, 1, true)
			if Start and End then
				return true, SubString, Start, End
			end
		end
	elseif type(SubStrings) == "string" then
		local Start, End = string.find(Str, SubStrings, 1, true)
		if Start and End then
			return true, SubStrings, Start, End
		end
	end
	return false, "", 0, 0
end

--[[ SortWords - sorts the words in a given string in a specified order.
-| @param	Str: The string to sort.
-| @param	Order: The sort order to use. Can be Enum.SortDirection.Ascending (ascending alphabetical order) or Enum.SortDirection.Descending (descending alphabetical order). If not provided, the default sort order is ascending.
-| @param	ReturnArray: the desired return of the function wether an array or a concated string.
-| @return	An array of the string words or the modified string with the words sorted in the specified order.]]
function StringPlus.SortWords(Str: string, Order: Enum.SortDirection?, ReturnArray: boolean?)
	local StrTable = string.split(Str, " ")
	if Order == Enum.SortDirection.Ascending or Order == nil then
		table.sort(StrTable, function(a, b)
			return string.lower(a) < string.lower(b)
		end)
	else
		table.sort(StrTable, function(a, b)
			return string.lower(a) > string.lower(b)
		end)
	end
	return (ReturnArray and StrTable) or table.concat(StrTable, " ")
end

--[[ AlphabeticalOrder - sorts an array of strings in alphabetical order.
-| @param	Array: The array of strings to sort.
-| @param	Order: The sort order to use. Can be Enum.SortDirection.Ascending (ascending alphabetical order) or Enum.SortDirection.Descending (descending alphabetical order). If not provided, the default sort order is ascending.
-| @return	The modified array with the strings sorted in the specified order.]]
function StringPlus.AlphabeticalOrder(StringArray: {string}, Order: Enum.SortDirection?)
	table.sort(StringArray, function(Str1, Str2)
		if Order == Enum.SortDirection.Ascending or Order == nil then
			return Str1 < Str2
		else
			return Str2 < Str1
		end
	end)
	return StringArray
end

--[[ SortByLength - sorts an array of strings by their length.
-| @param	Array: The array of strings to sort.
-| @param	Order: The sort order to use. Can be Enum.SortDirection.Ascending (ascending length order) or Enum.SortDirection.Descending (descending length order). If not provided, the default sort order is ascending.
-| @return	The modified array with the strings sorted by their length in the specified order.]]
function StringPlus.SortByLength(StringArray: {string}, Order: Enum.SortDirection?)
	table.sort(StringArray, function(Str1, Str2)
		if Order == Enum.SortDirection.Ascending or Order == nil then
			return #Str1 < #Str2
		else
			return #Str1 > #Str2
		end
	end)
	return StringArray
end

--[[ FilterByLength - filters an array of strings by their length.
-| @param	StringArray: The array of strings to filter.
-| @param	Length: The length of the strings to keep.
-| @return	The modified array containing only the strings with the specified length.]]
function StringPlus.FilterByLength(StringArray: {string}, Length: number)
	local Filtered = {}
	for _, String in ipairs(StringArray) do
		if #String == Length then
			Append(Filtered, String)
		end
	end
	return Filtered
end

--[[ GetLongestWord - returns the longest word in a string.
-| @param	Str: The string to search for the longest word.
-| @return	The longest word in the string along with its length (character count).]]
function StringPlus.LongestWord(Str: string)
	local LongestWord, Characters = "", 0
	for Word in string.gmatch(Str, "[%a]+") do
		if #Word > Characters then
			LongestWord = Word
			Characters = #Word
		end
	end
	return LongestWord, Characters
end

--[[ ReverseWordCharacters - Reverses the characters of the words in a string.
-| @param	Str: The input string.
-| @return	The input string with the characters' order reversed.]]
function StringPlus.ReverseWords(Str: string)
	return string.gsub(Str, "%S+", function(Word)
		return string.reverse(Word)
	end)
end

--[[ CamelCase - Converts a string from snake_case or PascalCase to camelCase.
-| @param	Str: The string to convert.
-| @return	The converted string in CamelCase.]]
function StringPlus.CamelCase(Str: string)
	local FirstCharacter = string.sub(Str, 1, 1)
	if string.lower(Str) == Str then
		Str = string.gsub(Str, "_(%l?)", function(Cap)
			return string.upper(Cap)
		end)
	elseif string.lower(FirstCharacter) ~= FirstCharacter then
		Str = string.lower(FirstCharacter) .. string.gsub(string.sub(Str, 2), "_(%a?)", function(Cap)
			return string.upper(Cap)
		end)
	end
	return Str
end

--[[ SnakeCase - Converts a string from camelCase or PascalCase to snake_case.
-| @param	Str: The string to convert.
-| @return	The converted string in snake_case.]]
function StringPlus.SnakeCase(Str: string)
	if string.match(Str, "^%u+$") or string.match(Str, "^[%l_]+$") then
		return string.lower(Str)
	end
	Str = string.sub(Str, 1, 1):lower() .. string.sub(Str, 2):gsub("[%p]+", ""):gsub("(%l)(%u)", function(Cap1, Cap2: any)
		return Cap1 .. ("_") .. string.lower(Cap2)
	end)
	Str = string.gsub(Str, "(%l)(%u)", function(Cap1, Cap2: any)
		return Cap1 .. ("_") .. string.lower(Cap2)
	end)
	return Str
end

--[[ UniqueWords - Extracts the unique words from a string.
-| @param	Str: The input string.
-| @param	ReturnString (optional): Specifies whether to return the unique words as a string.
	If this parameter is not provided, or is set to false, the unique words will be returned as an array.
	If ReturnAsString is set to true, the unique words will be returned as a string separated by spaces.
-| @return table|string The unique words in the input string. If ReturnAsString is not provided or is set to false, the unique words will be returned as an array. Otherwise, they will be returned as a string.]]
function StringPlus.UniqueWords(Str: string, ReturnString: boolean?)
	local UniqueWords = {}
	for Word in string.gmatch(Str, "[^%s%c%p%d]+") do
		local Added = table.find(UniqueWords, Word)
		if not Added then
			Append(UniqueWords, Word)
		else
			table.remove(UniqueWords, Added)
		end
	end
	return (not ReturnString and UniqueWords) or table.concat(UniqueWords, (" "))
end

--[[ AnalyzeText - Calculates statistical information about a string.
-| @param	Str: The input string.
-| @return	A table containing statistical information about the input string, including the number of characters, words, unique words, vowels, consonants, and lines in the string, as well as a count of the number of times each word appears in the string.]]
function StringPlus.AnalyzeText(Str: string)
	local Num_Chars, Num_Alpha = #Str, 0
	local Num_Lines, Num_Words = 0, 0
	local Num_Digits, Num_Punctuation = 0, 0
	local Num_Vowels, Num_Consonants = 0, 0
	local Num_UniqueWords, Num_CommonWords = 0, 0
	local WordAppearCount = {}::{[string]: number}
	local ShortestWord = {Length = 0, Word = ""}
	local LongestWord = {Length = 0, Word = ""}
	local WordLenghts = {}
	local WordLengthSum = 0

	for Line in string.gmatch(Str, "[^\r\n]+") do
		for Word in string.gmatch(Line, "[%a]+") do
			for Char in string.gmatch(Word, "[.]") do
				if string.match(Char, "[%a]") then
					if string.match(Char, "[aeiouAEIOU]") then
						Num_Vowels += 1
					else
						Num_Consonants += 1
					end
					Num_Alpha += 1
				end
			end

			if WordAppearCount[Word] then
				WordAppearCount[Word] += 1
			else
				WordAppearCount[Word] = 1
			end

			if #Word > LongestWord.Length then
				LongestWord.Word = Word
				LongestWord.Length = #Word
			end

			if ShortestWord.Length == 0 or #Word < ShortestWord.Length then
				ShortestWord.Word = Word
				ShortestWord.Length = #Word
			end
			Num_Words += 1
			Append(WordLenghts, #Word)
		end
		for Capture in string.gmatch(Line, "[%S]") do
			if string.match(Capture, "[%d]") then
				Num_Digits += 1
			elseif string.match(Capture, "[%p]") then
				Num_Punctuation += 1
			end
		end
		Num_Lines += 1
	end

	for _, Length in ipairs(WordLenghts) do
		WordLengthSum += Length
	end

	for _, Repetations in pairs(WordAppearCount) do
		if Repetations == 1 then
			Num_UniqueWords += 1
		else
			Num_CommonWords += 1
		end
	end

	return {
		["AllCharacterCount"] = Num_Chars,
		["AlphaCharacterCount"] = Num_Alpha,
		["WordCount"] = Num_Words,
		["WordAppearCount"] = WordAppearCount,
		["UniqueWordCount"] = Num_UniqueWords,
		["CommonWordCount"] = Num_CommonWords,
		["ShortestWord"] = ShortestWord,
		["LongestWord"] = LongestWord,
		["AvgWordLength"] = (WordLengthSum / #WordLenghts),
		["VowelCount"] = Num_Vowels,
		["ConsonantCount"] = Num_Consonants,
		["DigitCount"] = Num_Digits,
		["PunctuationCount"] = Num_Punctuation,
		["LineCount"] = Num_Lines
	}
end

--[[ Expand - Expands a string by replacing stringified indexes and table numeric indexes or keys with their corresponding values from a given table (allows you to substitute values from a table into a string and similar to PHP syntax).
-| @param	Str: The string to expand.
-| @param	Subset: The table containing the values to use for expansion.
-| @return	The expanded string (Mathematical operations aren't supported).
-| @Note	This function is not needed anymore, luau does now support a similar approach (string interpolation)]]
function StringPlus.Expand(Str: string, Subset: {[string | number]: any})
	local SubsetPattern = "%${([%w_ %.%(#%)]+)}"      --| The preferred expansion pattern (default: ${}).
	local TNIPattern = "%(#(%d+)%)"                   --| Table Numeric Index pattern e.g. "(#20)" will be the value of the 20th item in the subset table.

	Str = string.gsub(Str, SubsetPattern, function(Capture)
		if Subset[Capture] then return Subset[Capture] end
		local Modified = string.gsub(Capture, "%S+", function(SubCap)
			if string.match(SubCap, "%.+") then
				local Keys = string.split(SubCap, ".")
				local LatestIndex = ""
				for _, Key in ipairs(Keys) do
					Key = (tonumber(Key) and tonumber(Key)) or Key::any
					if LatestIndex == "" then
						LatestIndex = Subset[Key]
					else
						if type(LatestIndex) == "table" then
							LatestIndex = LatestIndex[Key]::any
						else
							break
						end
					end
					if LatestIndex == nil then
						break
					end
				end
				return (type(LatestIndex) == "string" and LatestIndex) or ("-nil-")
			end
			if string.match(SubCap, TNIPattern) then
				SubCap = string.gsub(SubCap, TNIPattern, function(SubSubCap)
					return Subset[tonumber(SubSubCap::string)::any] or Subset[SubSubCap] or ("-nil-")
				end)
			end
			return SubCap
		end)
		return Modified
	end)
	return Str
end

--[[ ApplyTitleCase - Converts a string to title case, with optional strict adherence to title case rules.
-| @param	Str: The input string.
-| @param	Strict (optional): Specifies whether to strictly adhere to title case rules. If this parameter is not provided, or is set to false, words that are exempt from title casing its first character will be upper-cased. If Strict is set to true, exempt words would be lower-cased.
-| @return	The input string in title case.]]
function StringPlus.ApplyTitleCase(Str: string, Strict: boolean?): string
	local StrArray = {}
	local TitleCasePreservations = {
		"a", "an", "and", "or", "the", "but", "in", "on", "for", "up",
		"at", "by", "for", "from", "with", "under", "until", "atop", "to",
		"not", "over", "as", "down", "yet", "so", "into", "near", "off", "over",
		"plus", "past", "out", "nor"
	}

	Str = string.gsub(Str, "^%l+", string.upper)    -- First charachter is uppered.
	Str = string.gsub(Str, "%s+%l", string.upper)   -- Characters after space are uppered.
	Str = string.gsub(Str, "%w%-%u", string.lower)	-- Characters after dash are lowered.

	-- Lowering any needed characters:
	for Index, Word in ipairs(string.split(Str, " ")) do
		Word = string.sub(Word, 1, 1) .. string.lower(string.sub(Word, 2))
		if Strict and Index ~= 1 then
			if table.find(TitleCasePreservations, Word:lower()) then
				Append(StrArray, Word:lower())
			else
				Append(StrArray, Word)
			end
		else
			Append(StrArray, Word)
		end
	end
	return table.concat(StrArray, " ")
end

--[[ Lines - Splits a string into an array of lines, with optional preservation of line endings.
-| @param	Str: The input string.
-| @param	KeepEnds(optional): Specifies whether to include line endings in the split lines. If this parameter is not provided, or is set to false, line endings will not be included in the split lines. If KeepEnds is set to true, line endings will be included.
-| @param	ReturnAsATuple (optional): Specifies whether to return the split lines as a tuple. If this parameter is not provided, or is set to false, the split lines will be returned as an array. If ReturnAsTuple is set to true, the split lines will be returned as a tuple.
-| @return	The split lines, either as an array or a tuple.]]
function StringPlus.Lines(Str: string, KeepEnds: boolean?, ReturnAsATuple: boolean?): (...string | {string})
	local SplittedLines = {}
	local CurrentPos = 1

	while true do
		local LineEndPos = string.find(Str, "[\r\n]", CurrentPos)::number
		if not LineEndPos then break end

		local Line = string.sub(Str, CurrentPos, LineEndPos - 1)
		local LineEnd = string.sub(Str, LineEndPos, LineEndPos)

		if LineEnd == "\r" and string.sub(Str, LineEndPos + 1, LineEndPos + 1) == '\n' then
			LineEnd = "\r\n"
		end
		if KeepEnds then
			Line = Line .. LineEnd
		end

		Append(SplittedLines, Line)
		CurrentPos = LineEndPos + #LineEnd
	end

	if CurrentPos <= #Str then
		Append(SplittedLines, string.sub(Str, CurrentPos))
	end

	if ReturnAsATuple then
		return table.unpack(SplittedLines)
	end
	return SplittedLines
end

--[[ RFind - Finds the last occurrence of a substring within a string, and returns its start and end indices.
-| @param	Str: The input string.
-| @param	Sub: The substring to find.
-| @param	Start: The start index to begin searching from. If this parameter is not provided, the search will start at the beginning of the string.
-| @param	End: The end index to stop searching at. If this parameter is not provided, the search will end at the end of the string.
-| @return	The start and end indices of the last occurrence of the substring, or nil if the substring was not found.]]
function StringPlus.RFind(Str: string, Sub: string, Start: number?, End: number?): (number?, number?)
	Start = (Start or 1)
	End = (End or #Str)
	for i = End:: number, Start:: number, -1 do
		if string.sub(Str, i, i + #Sub - 1) == Sub then
			return i, i + (#Sub - 1)
		end
	end
	return nil, nil
end

--[[ Partition - Splits a string into three parts around a separator string, and returns the parts as an array or tuple.
-| @param	Str: The input string.
-| @param	Separator: The separator string to split the input string around.
-| @param	ReturnAsATuple: (optional) Specifies whether to return the split parts as a tuple. If this parameter is not provided, or is set to false, the split parts will be returned as an array. If ReturnAsTuple is set to true, the split parts will be returned as a tuple.
-| @return	The split parts, either as an array or a tuple or the original string if the separator ain't found.]]
function StringPlus.Partition(Str: string, Separator: string, ReturnAsArray: boolean?): (...string | {string})
	local Start, End = string.find(Str, Separator)
	if Start and End then
		local p1, p2, p3 = string.sub(Str, 1, Start - 1), string.sub(Str, Start, End), string.sub(Str, End + 1)
		if ReturnAsArray then
			return {p1, p2, p3}
		else
			return p1, p2, p3
		end
	end
	return Str
end

--[[ RPartition - Splits a string into three parts around the last occurrence of a separator string, and returns the parts as an array or tuple.
-| @param	Str: The input string.
-| @param	Separator: The separator string to split the input string around.
-| @param	ReturnAsTuple (optional): Specifies whether to return the split parts as a tuple. If this parameter is not provided, or is set to false, the split parts will be returned as an array. If ReturnAsTuple is set to true, the split parts will be returned as a tuple.
-| @return	The split parts, either as an array or a tuple. If the separator string was not found in the input string, the function returns the input string as-is.]]
function StringPlus.RPartition(Str: string, Separator: string, ReturnAsArray: boolean?): (...string | {string})
	local Start, End = string.find(Str:reverse(), Separator:reverse())
	if Start and End then
		Start, End = #Str - End + 1, #Str - Start + 1
		local p1, p2, p3 = string.sub(Str, 1, Start - 1), string.sub(Str, Start, End), string.sub(Str, End + 1)
		if ReturnAsArray then
			return {p1, p2, p3}
		else
			return p1, p2, p3
		end
	end
	return Str
end

--[[ BinaryEncode - Converts a string to a binary string.
-| @param	Str The input string.
-| @return	A string representing the binary representation of the input string.]]
function StringPlus.BinaryEncode(Str: string, ByteSeparator: string?)
	local BinaryString = {}
	for CharIndex = 1, #Str do
		local Character = string.sub(Str, CharIndex, CharIndex)
		local BinaryChar = ""
		local Byte = string.byte(Character)
		while Byte > 0 do
			BinaryChar = tostring(Byte % 2) .. BinaryChar
			Byte = math.modf(Byte * 0.5)
		end
		Append(BinaryString, string.format("%.8d", BinaryChar::any))
	end
	return table.concat(BinaryString, (ByteSeparator or " "))
end

--[[ BinaryDecode - Converts a binary string to a regular string.
-| @param	Str: The input string.
-| @return	A string representing the regular string representation of the input binary string.]]
function StringPlus.BinaryDecode(Encoded: (string | number))
	Encoded = tostring(Encoded)
	local Decoded = ("")
	for Bit in string.gmatch(string.gsub(Encoded::string, "[%D]", ""), ("."):rep(8)) do
		local Character = tonumber(Bit, 2)::number
		Decoded ..= string.char(Character)
	end
	return Decoded
end

--[[ HexDecode - Converts a hexadecimal string to a regular string.
-| @param	HexStr: The input hexadecimal string. The string must contain only hexadecimal digits (0-9, A-F).
-| @return	A string representing the regular string representation of the input hexadecimal string, or nil if the input string is invalid.]]
function StringPlus.HexDecode(HexStr: string): string?
	if not HexStr:match("^[%x]+$") then return nil end
	return (HexStr:gsub("%x%x", function(Digits) return string.char(tonumber(Digits, 16)::number) end))
end

--[[ HexEncode - Converts a regular string to a hexadecimal string.
-| @param	Str: The input string.
-| @return	A string representing the hexadecimal representation of the input string, or the given string if the input string is empty.]]
function StringPlus.HexEncode(Str: string): string
	if Str == ("") then return Str end
	return (Str:gsub(".", function(Char) return string.format("%2x", string.byte(Char)) end))
end

--------------------------------------------------|
--| Extended:
-------------
--| Extended libraries integrating (Name Format: "[Extended] - <any>").
for _, Library in ipairs(script:GetChildren()) do
	local Match = string.match(Library.Name, "%[Extended%]%s%-%s(.+)")
	if Library:IsA("ModuleScript") and Match then
		local Lib = require(Library)::any
		if IncludeSubLibrarariesFunctions then
			if type(Lib) == "function" then
				StringPlus[Match] = Lib
			else
				for name, func in pairs(Lib) do
					StringPlus[name] = func
				end
			end
		else
			StringPlus[Match] = Lib
		end
	end
end

--| Rename function names to be all lowercased if desired.
if FunctionNamesCase ~= "PascalCase" then
	local ConvFunction
	if FunctionNamesCase == "CamelCase" then ConvFunction = StringPlus.CamelCase
	elseif FunctionNamesCase == "SnakeCase" then ConvFunction = StringPlus.SnakeCase
	elseif FunctionNamesCase == "LowerCase" then ConvFunction = string.lower
	else ConvFunction = function(str)
			return str
		end
	end

	local IndexingSolver = function(t, k)
		return rawget(t, ConvFunction(k))
	end

	local Temp = {}
	for n, f in pairs(StringPlus) do
		Temp[ConvFunction(n)] = f
		StringPlus[n] = nil
		if type(f) == "table" then
			local TT = {}
			for nn, ff in pairs(f) do
				TT[nn:lower()] = ff
				f[nn] = nil
			end
			Temp[ConvFunction(n)] = TT
		end
	end
	StringPlus = (SolvetIndexing and setmetatable(Temp, {__index = IndexingSolver})::any) or Temp
end

--| Integrates the standard string library functions into the module.
if MockupStandardLibrary then
	for Name, Func in pairs(string) do
		if FunctionNamesCase == "PascalCase" then
			Name = string.sub(Name, 1, 1):upper() .. string.sub(Name, 2)
		end
		StringPlus[Name] = Func
	end
end

--------------------------------------------------
return StringPlus :: Typechecking.StringPlusPascal