--!strict
---------
--[[ Information:
    ○ Author: @EgizianoEG
	○ About:
		- Iterators. An extended library provides the ability to iterat through a string with different functions.
]]
-----------------------------------------------------------------------------------------------------------------|
local StringIterators = {}
--------------------------

--[[ ICharacters - Returns an iterator function that returns each character in the string `Str` one at a time.
-| @param   Str: The input string.
-| @return  function -> An iterator function that returns the next character in the string on each call.
-| @return  number -> The index of the character in the input string.
-| @return  string -> The character.]]
function StringIterators.ICharacters(Str: string): ((string, number) -> (), string, number)
	return function(Str: string, CharIndex: number)
		CharIndex = (CharIndex and CharIndex + 1) or 1
		if CharIndex <= #Str then
			return CharIndex, Str:sub(CharIndex, CharIndex)
		else
			return
		end
	end, Str, 0
end

--[[ IWords - Returns an iterator function that returns each word in the string `Str` one at a time.
--|| Words are defined as sequences of non-whitespace characters separated by one or more whitespace characters.
-| @param   Str: The input string.
-| @return  function -> An iterator function that returns the next word in the string on each call.
-| @return  number -> The start index of the word in the input string.
-| @return  number -> The end index of the word in the input string.
-| @return  string -> The word.]]
function StringIterators.IWords(Str: string): ((string, number) -> (), string, number)
	local LastPosition = 0
	return function(Str: string)
		local Start, End, Word = string.find(Str, "([^%s%.%?;!]+)", LastPosition)
		if Start and End then
			LastPosition = End + 1
			return Start, End, Word
		else
			return
		end
	end, Str, 0
end

--[[ ISentences - Returns an iterator function that returns each sentence in the string `Str` one at a time.
--|| Sentences are defined as sequences of characters separated by one or more sentence-ending punctuation characters (e.g. `.`, `?`, `!`).
-| @param   Str: The input string.
-| @return  function -> An iterator function that returns the next sentence in the string on each call.
-| @return  number -> The start index of the sentence in the input string.
-| @return  number -> The end index of the sentence in the input string.
-| @return  string -> The sentence.
-| @return  string -> The ending punctuation of the sentence (e.g. `.`, `?`, `!`).]]
function StringIterators.ISentences(Str: string): ((string) -> (), string, number)
	local LastPosition = 0
	return function(Str: string)
		local Start, End, Sentence = string.find(Str, "(%u[^%?%.!]+)", LastPosition)
		local _, _, Ending = string.find(Str, "([%?%.!]+)", End)
		if Start and End then
			LastPosition = End + 1
			return Start, End, Sentence, (Ending or "")
		else
			return
		end
	end, Str, 0
end

----------------------
return StringIterators