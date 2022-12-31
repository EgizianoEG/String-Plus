--!strict
---------
--[[ Information:
		○ Author: @EgizianoEG
		○ About:
			- UTF8Reverse is a part of the StringPlus library provides the ability to reverse UTF-8 encoded text.
]]
--------------------------------------------------------------------------------------------------------------------------|

--[[ UTF8Reverse - Reverses the order of words in a UTF-8 encoded string while preserving the order of characters within each word.
-| @param	Str: The input string to be reversed.
-| @return	string The reversed string.]]
local function UTF8Reverse(Str: string)
	local Words = {}
	local CurrentWord = ""

	for Start, End in utf8.graphemes(Str) do
		local Grapheme = string.sub(Str, Start, End)
		if not string.match(Grapheme, "%s+") then
			CurrentWord ..= Grapheme
		else
			Words[#Words+1] = CurrentWord
			CurrentWord = ""
		end
	end

	Words[#Words+1] = CurrentWord
	local Middle, End = math.floor(#Words * 0.5), #Words
	for i = 1, Middle do
		Words[i], Words[End - i + 1] = Words[End - i + 1], Words[i]
	end
	return table.concat(Words, " ")
end

------------------
return UTF8Reverse