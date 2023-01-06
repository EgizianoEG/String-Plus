--!strict
---------
--[[ Information:
	○ Author: @EgizianoEG
	○ About:
		-  The Validator Sub-Library is a collection of functions designed to check and validate strings.
]]
--------------------------------------------------------------------------------------------------------|
local String = {}

--[[ IsNumeric - Returns a boolean value indicating whether the given string contains only numeric characters along with spaces (+,-,0-9,., ).
---| @examples:	"100": true, "-100": true, "+100": true, "10.0": true, "  .568": true, ".10": true, "10.0": true, "10.  ": true
-| @param	Str: The string to check if it contains numeric characters.
-| @return	True if the string contains only numeric characters, false otherwise.]]
function String.IsNumeric(Str: string)
	return (tonumber(Str) ~= nil or string.match(Str, "^%s*[+-]?%d*%.?%d+%s*$") ~= nil)
end

--[[ IsNumeric - Returns a boolean value indicating whether the given string contains only integer characters (+,-,0-9).
---| @examples:	100: true, -100: true, +100: true, 10.0: false, "  .568": false,"  1": false
-| @param	Str: The string to check if it contains numeric characters.
-| @return	boolean: True if the string contains only numeric characters, false otherwise.]]
function String.IsInteger(Str: string)
	return (string.match(Str, "^[+-]?%d+$") ~= nil)
end

--[[ Determines whether the given string contains only alphabetic characters.
-| @param	Str: The string to check.
-| @return	True: if the string contains only alphabetic characters, false otherwise.]]
function String.IsAlpha(Str: string)
	return (string.match(Str, "^[%a%s]+$") ~= nil)
end

--[[ IsAlphaNum - Returns a boolean indicating whether the input string contains only alphanumeric characters.
-| @param	Str: The string to check.
-| @return	A boolean value indicating whether the input string contains only alphanumeric characters.]]
function String.IsAlphaNum(Str: string)
	return (string.match(Str, "^[%w%s]+$") ~= nil)
end

--[[ IsBlank - Determine whether a string consists solely of whitespace characters.
-| @param	Str: The string to check.
-| @return	`true` if the string consists solely of whitespace characters, `false` otherwise.]]
function String.IsBlank(Str: string)
	return (Str == "" or string.match(Str, "^%s+$") ~= nil)
end

--[[ IsUpper - Determine whether a string consists solely of uppercase letters or whitespace characters.
-| @param	Str: The string to check.
-| @return	`true` if the string consists solely of uppercase letters or whitespace characters, `false` otherwise.]]
function String.IsUpper(Str: string)
	return (Str ~= "" and string.upper(Str) == Str and string.match(Str, "^[%d%s%p]+$") == nil)
end

--[[ IsLower - Returns true if the given string consists only of lowercase letters and spaces, false otherwise.
-| @param	Str: The string to check.
-| @return	A boolean indicating whether the string consists only of lowercase letters and spaces.]]
function String.IsLower(Str: string)
	return (Str ~= "" and string.lower(Str) == Str and string.match(Str, "^[%d%s%p]+$") == nil)
end

--[[ IsTagged - Returns true if the given string is tagged, false otherwise. A string is considered tagged if it consists only of `#` characters.
---| If the `FullMatch` parameter is set to true, the string must consist entirely of `#` characters to be considered tagged. If `FullMatch` is false or not specified, the string may contain other characters as long as it begins and ends with `#` characters.
-| @param	Str: The string to check.
-| @param	FullMatch: An optional boolean indicating whether the string must consist entirely of `#` characters to be considered tagged.
-| @return	A boolean indicating whether the string is tagged.]]
function String.IsTagged(Str: string, FullMatch: boolean?)
	return (FullMatch == true or FullMatch == nil and (string.match(Str, "^#+$")) and true)
		or (FullMatch == false and string.match(Str, "###+") and true) or false
end

--[[ IsASCII - Returns true if the given string contains only ASCII characters, false otherwise.
-| @param	Str: The string to check.
-| @return	A boolean indicating whether the string contains only ASCII characters.]]
function String.IsASCII(Str: string)
	for Char = 1, #Str do
		if string.byte(Str, Char) > 127 then
			return false
		end
	end
	return true
end

--[[ IsPalindrome - Returns true if the given string is a palindrome, false otherwise. A palindrome is a word or phrase that is spelled the same way forwards and backwards.
---| By default, the function is case-insensitive, meaning that it treats uppercase and lowercase letters as the same. If the `CaseSensitive` parameter is set to true, the function will treat uppercase and lowercase letters as distinct.
-| @param	Str: The string to check.
-| @param	CaseSensitive: An optional boolean indicating whether the function should be case-sensitive.
-| @return	A boolean indicating whether the string is a palindrome.]]
function String.IsPalindrome(Str: string, CaseSensitive: boolean?)
	CaseSensitive = CaseSensitive or false
	if not CaseSensitive then
		local Lowercase = string.lower(Str)
		if string.reverse(Lowercase) == Lowercase then
			return true
		end
	else
		if string.reverse(Str) == Str then
			return true
		end
	end
	return false
end

--[[ IsTitle - Returns true if the given string is a title, false otherwise. A title is a string that follows a specific format, typically consisting of one or more words with the first letter of each word capitalized except for certain lowercase words (e.g. "a", "an", "and", etc.).
---| By default, the function is lenient, meaning that it will allow some deviations from the standard title format (e.g. words that contain hyphens or numbers). If the `Strict` parameter is set to true, the function will enforce strict adherence to the title format.
-| @param	Str: The string to check.
-| @param	Strict: An optional boolean indicating whether the function should enforce strict adherence to the title format.
-| @return	A boolean indicating whether the string is a title.]]
function String.IsTitle(Str: string, Strict: boolean?)
	if type(Str) ~= "string" or #Str == 0 then return false end
	if string.match(Str, "^%l") then return false end

	local FirstCharChecked = false
	local Lowered = {
		"a", "an", "and", "or", "the", "but", "in", "on", "for", "up",
		"at", "by", "for", "from", "with", "under", "until", "atop", "to",
		"not", "over", "as", "down", "yet", "so", "into", "near", "off", "over",
		"plus", "past", "out", "nor"
	}

	for Word in string.gmatch(Str, "[^%s%d%%%.%$%+%?!;]+") do
		local FirstChar = string.sub(Word, 1, 1)
		local RestChars = string.sub(Word, 2, #Word)
		local SecondHPW = select(-1, string.gsub(Word, "%w%-%u", string.upper))

		if FirstChar ~= string.upper(FirstChar) and not table.find(Lowered, Word) then return false end
		if RestChars ~= string.lower(RestChars) then return false end
		if SecondHPW > 0 then return false end

		if Strict and FirstCharChecked then
			local Found = table.find(Lowered, Word:lower())
			if Found and Lowered[Found] ~= Word then
				return false
			end
		end
		if not FirstCharChecked then
			FirstCharChecked = true
		end
	end
	return true
end

-------------
return String