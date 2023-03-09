---
title: The Main Module
description: The Documentation Page for The Main Module.
hide:
  - navigation
---

# The Main Module Documentation { #the-main-module }
<hr/>

## Overview
The Main Module, also referred to as the Root Module, contains most of the functions in the library.

## Configurable Variables { #configurable-variables}

### {{ FormatVariableHeader("MockupStandardLibrary", "boolean") }}

:material-cog: Default: `false`

The MockupStandardLibrary boolean determines whether or not to include the standard string library functions in the StringPlus library. This can be useful if you want to use the StringPlus library as your main string manipulation library, but still want access to the functions provided by the standard string library.

By default, this boolean is set to `false`, meaning that the standard string library functions are not included as mockups in the StringPlus library. If you set the boolean to `true`, the standard string library functions will be included in the library and will behave similarly to their counterparts in the standard string library.

!!! note
    Using the mockup functions in the StringPlus library *may* have performance implications, as they are implemented as wrappers around the corresponding functions in the standard string library. It is recommended to only enable the inclusion of the mockup functions if you need to use them in your code.

### {{ FormatVariableHeader("FunctionNamesCase", "string") }}

:material-cog: Default: `"PascalCase"`

:material-cog-transfer: Possible Values: `"PascalCase"`, `"LowerCase"`, `"CamelCase"`, `"SnakeCase"`

The FunctionNamesCase variable allows you to change the naming style of the functions in the StringPlus library.
By default, the functions are named in PascalCase style (e.g. "TransformString"), but this variable does allow to change the naming style to camelCase (e.g. "transformString"), snake_case (e.g. "transform_string"), or lower (e.g. "transformstring").

To change the naming style of the functions, simply set the variable to one of the possible values listed above. The new naming style will be applied to all functions in the StringPlus library, including both the main functions and the mockup functions (if enabled).

!!! info
    Changing the FunctionNamesCase variable will not affect the behavior of the functions. It will only change their names, so developers should be careful not to confuse the functions with their previous names when using a new/different naming style.

### {{ FormatVariableHeader("IncludeSubLibrariesFunctions", "boolean") }}

:material-cog: Default: `true`

This boolean variable determines whether to include the functions from the sub-modules of the StringPlus library directly in the main module. When set to `true`, the functions from the sub-modules will be included in the main module and can be called directly, just like any other function in the module.

By default, this variable is set to `true`, meaning that the functions from the sub-modules are included directly in the main module. If you set the variable to `false`, the functions from the sub-modules will still be available in the main module, but they will be accessed as tables rather than functions.

!!! info
    Enabling or disabling the inclusion of the sub-module functions will not affect the behavior of the functions. It will only change the way they are accessed.

!!! note
    For sub-modules that returns a function, this function will be included as is and the name of it will be the same name of the sub-module[^1]. Also, they will be still included and integrated into the main module even if this variable is set to `false`.
    [^1]: Excluding the "[Extended] - " part of it

### {{ FormatVariableHeader("SolveIndexing", "boolean") }}

:material-cog: Default: `false`

The SolveIndexing variable determines whether the StringPlus library should attempt to solve incorrect indexing when accessing functions in the library. This can be useful if the developer has changed the naming style of the functions using the [FunctionNamesCase](#FunctionNamesCase) variable (e.g. from PascalCase to CamelCase) and wants to ensure that the functions can still be accessed without any issues.

By default, this variable is set to `false`, meaning that the library will not attempt to solve incorrect indexing when accessing functions. If you set the variable to `true`, the library will attempt to solve incorrect indexing and will return functions that match the specified name if they exist, regardless of the naming style set by the [FunctionNamesCase](#FunctionNamesCase) variable.

!!! note
    Enabling the SolveIncorrectIndexing variable *may* have performance implications, as it requires the library to perform additional processing when accessing functions. It is recommended to only enable this variable if there was a necessity.


<hr>

## Functions

### Escape

#### Purpose { #escape-purpose }
Escapes any character in the given string that is considered a magic character by adding an additional percent sign "%" before them.

#### Syntax { #escape-syntax }
`Escape(Str: string): string`

#### Parameters { #escape-parameters }
- `Str: string` <br/>
The string to be escaped.

#### Returns { #escape-returns }
- {{FormatType("string")}} <br/>
The escaped version of the given string.

#### Examples { #escape-examples }
=== "Code Sample"
    ```lua
    local Escaped = StringPlus.Escape("Hello + World")
    print(Escaped)

    local Escaped = StringPlus.Escape("Those are escaped brackets: ()")
    print(Escaped)
    ```
=== "Expected Output"
    ```
    Hello %+ World
    Those are escaped brackets: %(%)
    ```

<hr/>



### EqualsIgnoreCase

#### Purpose { #equalsignorecase-purpose }
Compares two strings and returns true if they are equal, ignoring the case of the characters in the strings.

#### Syntax { #equalsignorecase-syntax }
`EqualsIgnoreCase(Str_1: string, Str_2: string): boolean`

#### Parameters { #equalsignorecase-parameters }
- `Str_1: string` <br/> The first string to be compared.
- `Str_1: string` <br/> The second string to be compared.

#### Returns { #equalsignorecase-returns }
- {{FormatType("boolean")}} <br/>
`true` if the given strings are equal, ignoring the case of the characters; `false` otherwise.

#### Examples { #equalsignorecase-examples }
=== "Code Sample"
    ```lua
    local Equal = StringPlus.EqualsIgnoreCase("Hello", "hello")
    print(Equal)

    local Equal = StringPlus.EqualsIgnoreCase("Hello", "hellooo")
    print(Equal)
    ```

=== "Expected Output"
    ```lua
    true
    false
    ```

<hr/>


### RemoveVowels

#### Purpose { #removevowels-purpose }
Removes all vowels from a string and replaces them with a specified replacement string if it was provided.

#### Syntax { #removevowels-syntax }
`RemoveVowels(Str: string, Replacement: string?): string`

#### Parameters { #removevowels-parameters }
- `Str: string` <br/>The input string from which to remove the vowels.
- `Replacement: string` {{Optional}} <br/>
The replacement string to use in place of the removed vowels. If not provided, the vowels are simply removed without being replaced.

#### Returns { #removevowels-returns }
- {{FormatType("string")}}: The input string with all vowels removed and replaced, if specified.

#### Examples { #removevowels-examples }
=== "Code Sample"
    ```lua
    local NoVowels = StringPlus.RemoveVowels("Hello, World!")
    print(NoVowels)

    local NoVowels = StringPlus.RemoveVowels("Hello, World!", "-")
    print(NoVowels)
    ```
=== "Expected Output"
    ```
    Hll, Wrld!
    H-ll-, W-rld!
    ```

<hr/>


### RemoveConsonants

#### Purpose { #removeconsonants-purpose }
Removes all consonants from a string and replaces them with a specified replacement string if provided.

#### Syntax { #removeconsonants-syntax }
`RemoveConsonants(Str: string, Replacement: string?): string`

#### Parameters { #removeconsonants-parameters }
- `Str: string` <br/>
The input string from which to remove the consonants.
- `Replacement: string` {{Optional}} <br/>
The replacement string to use in place of the removed consonants. <br/> If not provided, the consonants are simply removed without being replaced.

#### Returns { #removeconsonants-returns }
- {{FormatType("string")}} <br/>
The input string with all consonants removed and replaced, if specified.

#### Examples { #removeconsonants-examples }
=== "Code Sample"
    ```lua
    local NoConsonants = StringPlus.RemoveConsonants("Hello, World!")
    print(NoConsonants)

    local NoConsonants = StringPlus.RemoveConsonants("Hello, World!", "-")
    print(NoConsonants)
    ```
=== "Expected Output"
    ```
    eo, o!
    -e--o, -o---!
    ```

<hr/>


### RemovePunctuation

#### Purpose { #removepunctuation-purpose }
Removes all punctuation from a string and replaces them with a specified replacement string, if provided.

#### Syntax { #removepunctuation-syntax }
`RemovePunctuation(Str: string, Replacement: string?): string`

#### Parameters { #removepunctuation-parameters }
- `Str: string` <br/> The input string from which to remove the punctuation.
- `Replacement: string` {{ Optional }} <br/> The replacement string to use in place of the removed punctuation. <br/>
If not provided, the punctuation is simply removed without being replaced.

#### Returns { #removepunctuation-returns }
- {{FormatType("string")}} <br/> The input string with all punctuation removed and replaced, if specified..

#### Examples { #removepunctuation-examples }
=== "Code Sample"
    ```lua
    local NoPunctuation = StringPlus.RemovePunctuation("Hello, World!")
    print(NoPunctuation)

    local NoPunctuation = StringPlus.RemovePunctuation("Hello, World!", "-")
    print(NoPunctuation)
    ```

=== "Expected Output"
    ```
    Hello World
    Hello- World-
    ```

<hr/>


### RemoveExtraSpaces

#### Purpose { #removeextraspaces-purpose }
Removes all leading, trailing, and extra spaces from a given string.

#### Syntax { #removeextraspaces-syntax }
`RemoveExtraSpaces(Str: string): string`

#### Parameters { #removeextraspaces-parameters }
- `Str: string` <br/> The string from which to remove extra spaces.

#### Returns { #removeextraspaces-returns }
- {{FormatType("string")}} <br/> A string with all leading, trailing, and extra spaces removed.

#### Examples { #removeextraspaces-examples }
=== "Code Sample"
    ```lua
    local Str = "   This string   has extra   spaces   "
    local NewStr = StringPlus.RemoveExtraSpaces(Str)
    print(NewStr)
    ```

=== "Expected Output"
    ```
    This string has extra spaces
    ```

<hr/>


### MatchIgnoreCase

#### Purpose { #matchignorecase-purpose }
Searches for a pattern within a string and returns the first occurrence of the pattern, ignoring the case of the characters in the string and pattern.

#### Syntax { #matchignorecase-syntax }
`MatchIgnoreCase(Str: string, Pattern: string, Init: number?): string?`

#### Parameters { #matchignorecase-parameters }
- `Str: string` <br/> The string to be searched.
- `Pattern: string` <br/> The pattern to be searched for.
- `Init: number` {{ Optional }} <br/> The starting index for the search.

#### Returns { #matchignorecase-returns }
- {{FormatType("string")}} <br/> A string containing the first occurrence of the pattern within the string, or `nil` if the pattern is not found.

#### Examples { #matchignorecase-examples }
=== "Code Sample"
    ```lua
    local Match = StringPlus.MatchIgnoreCase("Hello, World!", "WORLD")
    print(Match)
    ```

=== "Expected Output"
    ```
    World
    ```

<hr/>


### Truncate

#### Purpose { #truncate-purpose }
Truncates the given string to the specified length and adds an optional omission suffix if specified. If the string is already shorter than the Length, the original Str is returned.

#### Syntax { #truncate-syntax }
`Truncate(Str: string, Length: number, OmissionSuffix: string?): string?`

#### Parameters { #truncate-parameters }
- `Str: string` <br/> The string to be truncated.
- `Length: number` <br/> The maximum length of the string or the minimum length to truncate it.
- `OmissionSuffix: string` {{ Optional }} <br/> The string to be added to the end of the truncated string. Default is `"…​"`.

#### Returns { #truncate-returns }
- {{FormatType("string")}} <br/> The truncated string.

#### Examples { #truncate-examples }
=== "Code Sample"
    ```lua
    local Truncated = StringPlus.Truncate("Hello World", 5)
    print(Truncated)

    local Truncated = StringPlus.Truncate("Hello World", 5, "!!!")
    print(Truncated)

    local Truncated = StringPlus.Truncate("Hello", 5)
    print(Truncated)
    ```

=== "Expected Output"
    ```
    Hello...
    Hello!!!
    Hello
    ```

<hr/>


### SwapCase

#### Purpose { #swapcase-purpose }
Swaps the case of all the letters in the given string.

#### Syntax { #swapcase-syntax }
`SwapCase(Str: string): string`

#### Parameters { #swapcase-parameters }
- `Str: string` <br/> The string to be modified.

#### Returns { #swapcase-returns }
- {{FormatType("string")}} <br/> A new string with the case of all the letters swapped.

#### Examples { #swapcase-examples }
=== "Code Sample"
    ```lua
    local Swapped = StringPlus.SwapCase("Hello World")
    print(Swapped)

    local Swapped = StringPlus.SwapCase("tHis Is A TeSt")
    print(Swapped)
    ```

=== "Expected Output"
    ```
    hELLO wORLD
    ThIs iS a tEsT
    ```

<hr/>


### Strip

#### Purpose { #strip-purpose }
Removes leading and trailing characters from a string.

#### Syntax { #strip-syntax }
`Strip(Str: string, Characters: string?): string`

#### Parameters { #strip-parameters }
- `Str: string` <br/> The string to be stripped.
- `Characters : string` {{ Optional }} <br/> A string of characters to be stripped from the start and end of the string. <br/> If not provided, default is to strip white-space characters[^2].

[^2]: Equivalent to ( \t\n\v\f\r).

#### Returns { #strip-returns }
- {{FormatType("string")}} <br/> A new string with leading and trailing characters removed.

#### Examples { #strip-examples }
=== "Code Sample"
    ```lua
    local StrippedString = StringPlus.Strip("  hello  ", " ")
    print(StrippedString)

    local StrippedString = StringPlus.Strip("!+!+!he!llo!!", "!+-")
    print(StrippedString)
    ```

=== "Expected Output"
    ```
    hello
    he!llo
    ```

<hr/>


### RStrip

#### Purpose { #rstrip-purpose }
Removes the specified characters from the end of the string or in other words, the right side of it.

#### Syntax { #rstrip-syntax }
`RStrip(Str: string, Characters: string?): string`

#### Parameters { #rstrip-parameters }
- `Str: string` <br/> The string to be stripped.
- `Characters : string` {{ Optional }} <br/> A string containing the characters to be removed. <br/> If not specified, the function will remove white-space characters[^2].

#### Returns { #rstrip-returns }
- {{FormatType("string")}} <br/> A new string with trailing characters removed.

#### Examples { #rstrip-examples }
=== "Code Sample"
    ```lua
    local Str = "Hello World \n"
    local StrippedStr = StringPlus.RStrip(Str, "\n")
    print(StrippedStr)

    local Str = "Hello World!!!"
    local StrippedStr = StringPlus.RStrip(Str, "!")
    print(StrippedStr)
    ```

=== "Expected Output"
    ```
    Hello World
    Hello World
    ```

<hr/>



### LStrip

#### Purpose { #lstrip-purpose }
Removes leading characters from a given string i.e. left side characters.

#### Syntax { #lstrip-syntax }
`LStrip(Str: string, Characters: string?): string`

#### Parameters { #lstrip-parameters }
- `Str: string` <br/> The input string to be modified.
- `Characters : string` {{ Optional }} <br/> The characters to be removed from the beginning of the string. If no characters are specified, the function will remove leading white-space characters[^2] by default.

#### Returns { #lstrip-returns }
- {{FormatType("string")}} <br/> A new string with leading characters removed.

#### Examples { #lstrip-examples }
=== "Code Sample"
    ```lua
    local Str = "   Hello World"
    local StrippedStr = StringPlus.LStrip(Str)
    print(StrippedStr)

    local Str = "123456Hello World"
    local StrippedStr = StringPlus.LStrip(Str, "%d")
    print(StrippedStr)

    local Str = "\t  Hello World"
    local StrippedStr = StringPlus.LStrip(Str, " ")
    print(StrippedStr)
    ```

=== "Expected Output"
    ```lua
    Hello World
    Hello World
    \t  Hello World
    ```

<hr/>



### Center

#### Purpose { #center-purpose }
Takes a string as input and centers it within a specified length, using a fill character to fill in the remaining spaces. <br/>
The fill character is optional and defaults to a space if not provided.

#### Syntax { #center-syntax }
`Center(Str: string, Length: number, FillChar: string?): string`

#### Parameters { #center-parameters }
- `Str: string` <br/> The string to be centered.
- `Length: number`<br/> The desired length of the resulting string.
- `FillChar: string` {{ Optional }} <br/> The character to use to fill in the remaining spaces. <br/> Defaults to a space if not provided.

#### Returns { #center-returns }
- {{FormatType("string")}} <br/> The input string centered within the specified length, using the fill character to fill in the remaining spaces.

#### Examples { #center-examples }
=== "Code Sample"
    ```lua
    local Centered = StringPlus.Center("Hello", 10)
    print(Centered)

    local Centered = StringPlus.Center("Hello", 9, "+")
    print(Centered)
    ```

=== "Expected Output"
    ```
      Hello   
    ++Hello++
    ```

<hr/>



### RJust

#### Purpose { #rjust-purpose }
Tight-justifies the given string by padding it with the specified filling character up to the given length. <br/>
If the length of the given string is already equal to or greater than the given length, the original string is returned without any performed padding.

#### Syntax { #rjust-syntax }
`RJust(Str: string, Length: number, FillChar: string?): string`

#### Parameters { #rjust-parameters }
- `Str: string` <br/> The string to be right-justified.
- `Length: number`<br/> The desired length of the returned string.
- `FillChar: string` {{ Optional }} <br/> The character to be used for padding. Defaults to a space character.

#### Returns { #rjust-returns }
- {{FormatType("string")}} <br/> The modified string of the original one aligned to the right, padded with the specified fill character if specified or a space character by default.

#### Examples { #rjust-examples }
=== "Code Sample"
    ```lua
    local Str = "Hello"
    local JustifiedString = StringPlus.RJust(Str, 10)
    print(JustifiedString)

    local Str = "Hello"
    local JustifiedString = StringPlus.RJust(Str, 10, "*")
    print(JustifiedString)

    local Str = "Hello"
    local JustifiedString = StringPlus.RJust(Str, 4)
    print(JustifiedString)
    ```

=== "Expected Output"
    ```
    Hello     
    Hello*****
    Hello
    ```

<hr/>



### LJust

#### Purpose { #ljust-purpose }
Aligns the given string to the left by padding it with the given fill character until it reaches the desired length. <br/>
If the length of the string is already equal to or greater than the provided length, the original string is returned as is.

#### Syntax { #ljust-syntax }
`LJust(Str: string, Length: number, FillChar: string?): string`

#### Parameters { #ljust-parameters }
- `Str: string` <br/> The string to be left-aligned.
- `Length: number`<br/> The desired length of the left-aligned string.
- `FillChar: string` {{ Optional }} <br/> The character to use for padding. Defaults to a space character.

#### Returns { #ljust-returns }
- {{FormatType("string")}} <br/> The left-aligned string with the desired length.

#### Examples { #ljust-examples }
=== "Code Sample"
    ```lua
    local JustifiedString = StringPlus.LJust("Hello", 10)
    print(JustifiedString)

    local JustifiedString = StringPlus.LJust("Hello", 10, "*")
    print(JustifiedString)
    ```

=== "Expected Output"
    ```
         Hello
    *****Hello
    ```

<hr/>



### ExpandTabs

#### Purpose { #expandtabs-purpose }
Expands all tab characters in the given string to the specified number of spaces, as defined by the optional `TabSize` parameter. <br/>
If `TabSize` is not provided, it defaults to 4 space characters.

#### Syntax { #expandtabs-syntax }
`ExpandTabs(Str: string, TabSize: number?): string`

#### Parameters { #expandtabs-parameters }
- `Str: string` <br/> The string in which to expand all tab characters.
- `TabSize: number` {{ Optional }} <br/> The number of spaces to use to replace each tab character. If not provided, defaults to 4 spaces.

#### Returns { #expandtabs-returns }
- {{FormatType("string")}} <br/> A string with all tab characters expanded to the specified number of spaces.

#### Examples { #expandtabs-examples }
=== "Code Sample"
    ```lua
    local Str = "Hello\tWorld"
    local Expanded = StringPlus.ExpandTabs(Str)
    print(Expanded)

    local Str = "Hello\t\tWorld"
    local Expanded = StringPlus.ExpandTabs(Str)
    warn(Expanded)

    local Str = "Hello\t\tWorld"
    local Expanded = StringPlus.ExpandTabs(Str, 0)
    print(Expanded)
    ```

=== "Expected Output"
    ```
    Hello   World
    Hello       World
    HelloWorld
    ```

<hr/>



### Translate

#### Purpose { #translate-purpose }
Replaces all occurrences of specified characters in the given string with new characters as defined in the mapping table. <br/>
The mapping table should contain a mapping of old characters (numbers representing the ASCII codes of the characters) to new characters which are also represented as numbers.

#### Syntax { #translate-syntax }
`Translate(Str: string, MappingTable: {[number]: number}): string`

#### Parameters { #translate-parameters }
- `Str: string` <br/> The string to perform the translation on.
- `MappingTable: table` <br/> A table that specifies the mapping of characters to be replaced. <br/> The keys of the table should be the characters to be replaced, and the values should be the characters that the keys should be replaced with.

#### Returns { #translate-returns }
- {{FormatType("string")}} <br/> The modified string with all specified characters replaced with their corresponding values in the `MappingTable`.

#### Examples { #translate-examples }
=== "Code Sample"
    ```lua
    local MappingTable = {[65] = 97, [66] = 98} -- This table maps capital A (ASCII code 65) to lowercase a (ASCII code 97), and capital B (ASCII code 66) to lowercase b (ASCII code 98).
    local OriginalStr = "AB"
    local TranslatedStr = StringPlus.Translate(OriginalStr, MappingTable)
    print(TranslatedStr)

    local MappingTable = {[72] = 104, [87] = 119}
    local OriginalStr = "Hello World!"
    local TranslatedStr = StringPlus.Translate(OriginalStr, MappingTable)
    print(TranslatedStr)
    ```

=== "Expected Output"
    ```
    ab
    hello world!
    ```

<hr/>



### Count

#### Purpose { #count-purpose }
Counts the number of occurrences of the given pattern/substring in the given string. <br/>
The `Start` and `End` parameters can be used to specify a range within the `Str` string to search for the pattern.

#### Syntax { #count-syntax }
`Count(Str: string, Pattern: string, Start: number?, End: number?): number`

#### Parameters { #count-parameters }
- `Str: string` <br/> The input string to search for the Pattern.
- `Pattern: string` <br/> The pattern to search for within the string. <br/> This can be a lua pattern, word, or character.
- `Start: number` {{ Optional }} <br/> The index within the string to start the search. <br/> Defaults to `1`.
- `End: number` {{ Optional }} <br/> The index within the string to end the search. <br/> Defaults to the length of the `Str` string.

#### Returns { #count-returns }
- {{FormatType("number")}} <br/> The number of occurrences of the Pattern in the Str string within the specified range.

#### Examples { #count-examples }
=== "Code Sample"
    ```lua
    local Count = StringPlus.Count("Hello, World!", "l")
    print(Count)

    local Count = StringPlus.Count("Hello, World!", "l", 6)
    print(Count)

    local Count = StringPlus.Count("Hello, World!", "l", 6, 8)
    print(Count)

    local Count = StringPlus.Count("the quick brown fox jumps over the lazy dog", "the")
    print(Count)
    ```

=== "Expected Output"
    ```lua
    3
    1
    0
    2
    ```

<hr/>




### SortWords

#### Purpose { #sortwords-purpose }
Sorts the words in a string alphabetically in ascending or descending order.

#### Syntax { #sortwords-syntax }
`SortWords(Str: string, Order: Enum.SortDirection?, ReturnArray: boolean?): (string | {string})`

#### Parameters { #sortwords-parameters }
- `Str: string` <br/> The string to be sorted.
- `Order: string` {{ Optional }} <br/> The sort direction, either ascending or descending. Default is ascending (`Enum.SortDirection.Ascending`).
- `ReturnArray: boolean` {{ Optional }} <br/> If `true`, returns the sorted words as an array of strings. <br/> If `false`, returns a string with the sorted words separated by a space. Default is `false`.

#### Returns { #sortwords-returns }
- {{FormatType("string")}} | {{FormatType("table")}} <br/> If `ReturnArray` is `true`, the function will return an array of the sorted words; Otherwise, the function would return a string with the sorted words separated by spaces.

#### Examples { #sortwords-examples }
=== "Code Sample"
    ```lua
    local SortedWords = StringPlus.SortWords("apple banana cherry", Enum.SortDirection.Descending, true)
    print(SortedWords)

    local SortedString = StringPlus.SortWords("apple banana cherry", Enum.SortDirection.Ascending)
    print(SortedString)

    local SortedString = StringPlus.SortWords("apple banana cherry")
    print(SortedString)
    ```

=== "Expected Output"
    ```lua
    {"cherry", "banana", "apple"}
    apple banana cherry
    apple banana cherry
    ```

<hr/>




### SortByLength

#### Purpose { #sortbylength-purpose }
Sorts an array of strings by their length, in ascending or descending order.

#### Syntax { #sortbylength-syntax }
`SortByLength(StringArray: {string}, Order: Enum.SortDirection?): {string}`

#### Parameters { #sortbylength-parameters }
- `StringArray: table` <br/> The array of strings to be sorted.
- `Order: string` {{ Optional }} <br/> The sort direction. Acceptable values are `Enum.SortDirection.Ascending` and `Enum.SortDirection.Descending`. <br/>
Default is the ascending order.

#### Returns { #sortbylength-returns }
- {{FormatType("table")}} <br/> The sorted array of strings.

#### Examples { #sortbylength-examples }
=== "Code Sample"
    ```lua
    local Array = {"apple", "banana", "cherry", "date", "elderberry", "fig"}

    print(StringPlus.SortByLength(Array))
    print(StringPlus.SortByLength(Array, Enum.SortDirection.Descending))
    ```

=== "Expected Output"
    ```lua
    {"fig", "date", "apple", "cherry", "banana", "elderberry"}
    {"elderberry", "banana", "cherry", "apple", "date", "fig"}
    ```

<hr/>





### FilterByLength

#### Purpose { #filterbylength-purpose }
Filters a given array of strings, removing all strings that do not have a specified length.

#### Syntax { #filterbylength-syntax }
`FilterByLength(StringArray: {string}, Length: number): {string}`

#### Parameters { #filterbylength-parameters }
- `StringArray: table` <br/> The array of strings to be filtered.
- `Length: number` <br/> The desired length of the strings to be kept in the array.

#### Returns { #filterbylength-returns }
- {{FormatType("table")}} <br/> An array containing only the strings from the input array that have the specified length.

#### Examples { #filterbylength-examples }
=== "Code Sample"
    ```lua
    local FilteredArray = StringPlus.FilterByLength({"Hello", "Hi", "Goodbye"}, 5)
    print(FilteredArray)

    local FilteredArray = StringPlus.FilterByLength({"Hello", "Goodbye", "Hi!", "Bye"}, 3)
    print(FilteredArray)
    ```

=== "Expected Output"
    ```lua
    {"Hello"}
    {"Hi!", "Bye"}
    ```

<hr/>





### Segments

#### Purpose { #segments-purpose }
Returns an array of strings containing the segments of the input string each one with the specified length except for the last segment that could be less than the specified length number.

#### Syntax { #segments-syntax }
`Segments(Str: string, Length: number): {string}`

#### Parameters { #segments-parameters }
- `Str: string` <br/> The input string to split it into chunks.
- `Length: number` <br/> The desired length for each segment of the input string in the returned array.

#### Returns { #segments-returns }
- {{FormatType("table")}} <br/> An array containing the segments of the given string.

#### Examples { #segments-examples }
=== "Code Sample"
    ```lua
    -- In the next prints the input string "Hello World!" is divided into segments of length 3 and 5
    local Str = "Hello World!"
    print(StringPlus.Segments(Str, 3))
    print(StringPlus.Segments(Str, 5))

    -- In the next few lines, we are dividing the Str variable into segements of length 4 and iterating over the returned array to print it's indexes and values using string interpolation
    local Str = "This is a test string"
    local StrSegments = StringPlus.Segments(Str, 4)
    for Index, Segment in ipairs(StrSegments) do
        print(`{Index}: "{Segment}"`)
    end
    ```

=== "Expected Output"
    ```lua
    {
       [1] = "Hel",
       [2] = "lo ",
       [3] = "Wor",
       [4] = "ld!"
    }
    {
       [1] = "Hello",
       [2] = " Worl",
       [3] = "d!"
    }
    1: "This"
    2: " is "
    3: "a te"
    4: "st s"
    5: "trin"
    6: "g"
    ```

??? note "Notice"
    The last element (segment) of the returned array could be less than the desired segment length. This could happend because of a short input string.

<hr/>





### LongestWord

#### Purpose { #longestword-purpose }
Returns the longest word in the input string, along with the number of characters in that word.

#### Syntax { #longestword-syntax }
`LongestWord(Str: string): (string, number)`

#### Parameters { #longestword-parameters }
- `Str: string` <br/> The input string to get the longest word from.

#### Returns { #longestword-returns }
- {{FormatType("string")}} <br/> The longest word found in the string.
- {{FormatType("number")}} <br/> The total number of characters in the found word.

#### Examples { #longestword-examples }
=== "Code Sample"
    ```lua
    local LongestWord, Characters = StringPlus.LongestWord("The quick brown fox jumps over the lazy dog")
    print(LongestWord, Characters

    local LongestWord, Characters = StringPlus.LongestWord("Some text to check for the longest word...")
    print(LongestWord, Characters)
    ```

=== "Expected Output"
    ```lua
    jumps 5
    longest 7
    ```

<hr/>






### ReverseWords

#### Purpose { #reversewords-purpose }
This function takes a string as input and returns a new string where all the words in the original string are reversed. <br/>
The order of the words in the returned string is the same as in the original string.

#### Syntax { #reversewords-syntax }
`ReverseWords(Str: string): string`

#### Parameters { #reversewords-parameters }
- `Str: string` <br/> The string to be processed.

#### Returns { #reversewords-returns }
- {{FormatType("string")}} <br/> The string with reversed words.

#### Examples { #reversewords-examples }
=== "Code Sample"
    ```lua
    local Reversed = StringPlus.ReverseWords("Hello world")
    print(Reversed)

    local Reversed = StringPlus.ReverseWords("A string for testing!")
    print(Reversed)

    local Reversed = StringPlus.ReverseWords("Loren ipsun dolor")
    print(Reversed)
    ```

=== "Expected Output"
    ```
    olleH dlrow
    A gnirts rof !gnitset
    neroL nuspi rolod
    ```

<hr/>






### CamelCase

#### Purpose { #camelcase-purpose }
Converts a string or words separated by underscores into a string in camel case format.

#### Syntax { #camelcase-syntax }
`CamelCase(Str: string): string`

#### Parameters { #camelcase-parameters }
- `Str: string` <br/> The input string to be converted to camel case format.

#### Returns { #camelcase-returns }
- {{FormatType("string")}} <br/> The input string in camel case format.

#### Examples { #camelcase-examples }
=== "Code Sample"
    ```lua
    local Str = "hello_world"
    print(StringPlus.CamelCase(Str))

    local Str = "HelloWorld"
    print(StringPlus.CamelCase(Str))

    local Str = "Hello_world"
    print(StringPlus.CamelCase(Str))
    ```

=== "Expected Output"
    ```
    helloWorld
    helloWorld
    helloWorld
    ```

<hr/>






### SnakeCase

#### Purpose { #snakecase-purpose }
This function converts a given string to snake case, a naming convention where all spaces and punctuation are replaced with underscores, and all letters are lowercase. <br/>
If the input string is all uppercase, it will be converted to lowercase.

#### Syntax { #snakecase-syntax }
`SnakeCase(Str: string): string`

#### Parameters { #snakecase-parameters }
- `Str: string` <br/> The input string to be converted to snake case.

#### Returns { #snakecase-returns }
- {{FormatType("string")}} <br/> The input string in snake case.

#### Examples { #snakecase-examples }
=== "Code Sample"
    ```lua
    local SnakeCase = StringPlus.SnakeCase("ThisIsASentence")
    print(SnakeCase)

    local SnakeCase = StringPlus.SnakeCase("thisIsASentence")
    print(SnakeCase)

    local SnakeCase = StringPlus.SnakeCase("ThisIsASentence123")
    print(SnakeCase)

    local SnakeCase = StringPlus.SnakeCase("This_Is_A_Sentence")
    print(SnakeCase)

    local SnakeCase = StringPlus.SnakeCase("this_is_a_sentence")
    print(SnakeCase)
    ```

=== "Expected Output"
    ```
    this_is_a_sentence
    this_is_a_sentence
    this_is_a_sentence123
    this_is_a_sentence
    this_is_a_sentence
    ```

??? note
    This function does not handle any input string that its characters are all lowercased and will return it as is.

<hr/>





### UniqueWords

#### Purpose { #uniquewords-purpose }
Returns an array or string of unique words in a given input string.

#### Syntax { #uniquewords-syntax }
`UniqueWords(Str: string, ReturnString: boolean?): (string | {string})`

#### Parameters { #uniquewords-parameters }
- `Str: string` <br/> The input string.
- `ReturnString: boolean` {{ Optional }} <br/> A boolean value indicating whether to return the unique words as a single string value or as an array of strings. <br/> If this parameter is not provided, the default value is `false`.

#### Returns { #uniquewords-returns }
- {{FormatType("string")}} | {{FormatType("table")}} <br/> If ReturnString is `true`, the function returns a string of unique words separated by a single space character; otherwise, the function returns an array of the found unique words.

#### Examples { #uniquewords-examples }
=== "Code Sample"
    ```lua
    local UniqueWords = StringPlus.UniqueWords("This is a string. This is also a text.")
    print(UniqueWords)

    local UniqueWords = StringPlus.UniqueWords("This is a string. This is also a text.", true)
    print(UniqueWords)
    ```

=== "Expected Output"
    ```lua
    {"string", "also", "text"}
    string also text
    ```

<hr/>





### Analyze

#### Purpose { #analyze-purpose }
Takes a string as an input and returns a dictionary containing various statistics about the string. <br/>

The statistics does include the number of all characters, alphabetical characters, words, unique words, common words, shortest and longest words, average word length, vowels, consonants, digits, punctuation marks, and lines in the string.

#### Syntax { #analyze-syntax }
`Analyze(Str: string): table`

#### Parameters { #analyze-parameters }
- `Str: string` <br/> A string to be analyzed.

#### Returns { #analyze-returns }
- {{FormatType("table")}} <br/> A dictionary containing the following key-value pairs:
    * `AllCharacterCount`: The number of all characters in the string
    * `AlphaCharacterCount`: The number of alphabetical characters in the string
    * `WordCount`: The number of words in the string
    * `WordAppearCount`: A dictionary containing the frequency of each word in the string where:
        + Each key represents the word string value
        + Each key value represents a number (integer) that specifies how many times the word has appeared
    * `UniqueWordCount`: The number of unique words in the string
    * `CommonWordCount`: The number of common words in the string
    * `ShortestWord`: A dictionary containing the shortest word in the string and its length where keys are:
        + `Word`: The shortest word string value
        + `Length`: The length of the shortest word represented as a number value
    * `LongestWord`: A dictionary containing the longest word in the string and its length where keys are:
        + `Word`: The longest word string value
        + `Length`: The length of the longest word represented as a number value
    * `AvgWordLength`: The average length of words in the string
    * `VowelCount`: The number of vowels in the string
    * `ConsonantCount`: The number of consonants in the string
    * `DigitCount`: The number of digits in the string
    * `PunctuationCount`: The number of punctuation marks in the string
    * `LineCount`: The number of lines in the string

#### Examples { #analyze-examples }
=== "Code Sample"
    ```lua
    local Str = "Hello, world! This is a test string."
    local Stats = StringPlus.Analyze(Str)

    print(Stats.WordCount)
    print(Stats.ShortestWord.Word)
    print(Stats.LongestWord.Word)

    local Str = "Luau comes with a set of linting passes, that help make sure that the code is correct and consistent. Unlike the type checker, that models the behavior of the code thoroughly and points toward type mismatches that are likely to result in runtime errors, the linter is more opinionated and produces warnings that can often be safely ignored, although it’s recommended to keep the code clean of the warnings."
    print("Statics:", StringPlus.Analyze(Str))
    ```

=== "Expected Output"
    ```lua
    7
    a
    string
    Statics: {
        ["AllCharacterCount"] = 408,
        ["AlphaCharacterCount"] = 331,
        ["AvgWordLength"] = 4.782608695652174,
        ["CommonWordCount"] = 9,
        ["ConsonantCount"] = 208,
        ["DigitCount"] = 0,
        ["LineCount"] = 1,
        ["LongestWord"] = {...},
        ["PunctuationCount"] = 6,
        ["ShortestWord"] = {...},
        ["UniqueWordCount"] = 40,
        ["VowelCount"] = 123,
        ["WordAppearCount"] = {...},
        ["WordCount"] = 69
    }
    ```

<hr/>






### Expand

#### Purpose { #expand-purpose }
The StringPlus.Expand function takes in a string and a table of replacements (called `Subset`) and returns a new string with the specified replacements made. <br/>
The function uses the pattern `"%${([%w_ %.%(#%)]+)"` which is similar to javascript string interpolation syntax to identify which substrings in the input string should be replaced. <br/>

The Subset table should contain keys that match the substrings to be replaced and values that are the desired replacements. In addition to simple string replacements, the function also supports nested table keys and table numeric indices (TNI) in the Subset table.

#### Syntax { #expand-syntax }
`Expand(Str: string, Subset: table): string`

#### Parameters { #expand-parameters }
- `Str: string` <br/> The string to expand.
- `Subset: table` <br/> A table containing the values that will be used to expand the string.

#### Returns { #expand-returns }
- {{FormatType("string")}} <br/> The expanded string.

#### Examples { #expand-examples }
=== "Code Sample"
    ```lua
    local Subset = {
        Name = "John",
        Mood = "good",
        [1] = "apple",
        [2] = "banana",
        [3] = "orange"
    }

    local Str = "Hello ${Name}, how are you? I hope you're having a ${Mood} day. Here's a list of items: ${(#1)}, ${(#2)}, ${(#3)}."
    local ExpandedStr, Replacements = StringPlus.Expand(Str, Subset)
    print(ExpandedStr)
    
    local Subset = {
        ["Name"] = "John",
        ["Age"] = 25,
        ["Achievements"] = {
            "Graduated with honors",
            "Won a medal in a science fair",
            "Became a black belt in karate"
        },
        ["Hobbies"] = {
            "Swimming",
            "Running",
            "Reading"
        },
        ["Location"] = "New York"
    }

    local StringToExpand = "My name is ${Name} and I am ${Age} years old. I am from ${Location} and I enjoy ${Hobbies.1} and ${Hobbies.3}. Some of my achievements include: ${Achievements.1}, ${Achievements.2}, and ${Achievements.3}. I have also completed the marathon in 3 hours!"
    local ExpandedString = StringPlus.Expand(StringToExpand, Subset)
    print(ExpandedString)
    ```

=== "Expected Output"
    ```
    Hello John, how are you? I hope you're having a good day. Here's a list of items: apple, banana, orange.
    My name is John and I am 25 years old. I am from New York and I enjoy Swimming and Reading. Some of my achievements include: Graduated with honors, Won a medal in a science fair, and Became a black belt in karate. I have also completed the marathon in 3 hours!
    ```

!!! info "String Interpolation"
    String interpolation has been supported in Luau release <a href="https://github.com/Roblox/luau/releases/tag/0.542">0.542</a> and has been implemented on the Roblox platform on <a href="https://devforum.roblox.com/t/2127058">January 5 2023</a>. <br/>
    It is strongly recommended to use string interpolation instead of this function.

!!! note
    Anything is not found in the given `Subset` table would be replaced with the `-nil-` text.

!!! failure
    This function does not support any mathematical operation in the given string and will return them without any calculations. <br/>
    Also, the function does not support execution of functions.

<hr/>






### Distort

#### Purpose { #distort-purpose }
The `Distort` function takes a string, a percentage, and an optional set of replacement characters and returns the distorted string by replacing characters in the original string with characters from the array of replacement characters. <br/>

This function could be useful for simulating low signal transmission for games that has radio chats.

#### Syntax { #distort-syntax }
`Distort(Str: string, Percentage: number, ReplacementChars: {string}?): string`

#### Parameters { #distort-parameters }
- `Str: string` <br/> The string to be distorted.
- `Percentage: boolean` <br/> The percentage of characters to replace in the string. Must be between `0` and `100`.
- `ReplacementChars: table` {{ Optional }} <br/> An array of characters/strings to replace the characters in the original string with. The default value is `{"#", "$", "@", "&"}`.

#### Returns { #distort-returns }
- {{FormatType("string")}} <br/> A modified version of the original string, where a specified percentage of characters are substituted with characters from a designated array of replacement characters.

#### Examples { #distort-examples }
=== "Code Sample"
    ```lua
    local DistortedString = StringPlus.Distort("Hello", 85)
    print(DistortedString)

    local DistortedString = StringPlus.Distort("Hello Luau", 38, {"#", "*"})
    print(DistortedString)

    local DistortedString = StringPlus.Distort("E", 20)
    print(DistortedString)

    local DistortedString = StringPlus.Distort("Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua.", 12)
    print(DistortedString)
    ```

=== "Example Output 1"
    ```
    &#l&&
    He#l* ##au
    E
    Lorem@ipsum d@lor sit amet,@consect#$ur adipis#i e&i&, sed eiusmod tempor inc#du#t u&&labor# et dolore mag@a aliqua.
    ```

=== "Example Output 2"
    ```
    ###l#
    He*lo *u*#
    #
    Lore$ ipsum d@l#r sit ame#,&co&&e#tetur adipisci elit, sed eiusmod $empor incidu#t #t labore et $@lor& magna aliqua.
    ```

<hr/>





### TitleCase

#### Purpose { #titlecase-purpose }
Converts the input string to title case, following the English title case rules. <br/>
The first character of the first word and the first character of any word after a space are always capitalized. <br/>
Any character after a hyphen (-) is always lower-cased.

If the `Strict` parameter is set to true, the function will lower-case any word that is not considered a proper noun. <br/>
If the `Strict` parameter is set to false or not provided, the function will apply title case to all words in the input string.

#### Syntax { #titlecase-syntax }
`TitleCase(Str: string, Strict: boolean?): string`

#### Parameters { #titlecase-parameters }
- `Str: string` <br/> The input string to be converted to title case.
- `Strict: boolean` <br/> A boolean value indicating whether the function should strictly follow the English title case rules or not. <br/> If set to true, the function will lower-case any word that is not considered a proper noun. <br/> If set to false or not provided, the function will apply title case to all words in the input string.

#### Returns { #titlecase-returns }
- {{FormatType("string")}} <br/> The input string in title case.

#### Examples { #titlecase-examples }
=== "Code Sample"
    ```lua
    local Str = "this is an example title"
    local AppliedTitleCase = StringPlus.TitleCase(Str, true)
    print(AppliedTitleCase)

    local AppliedTitleCase = StringPlus.TitleCase(Str, false)
    print(AppliedTitleCase)

    local AppliedTitleCase = StringPlus.TitleCase("the quick BROWN fox")
    print(AppliedTitleCase)
    ```

=== "Expected Output"
    ```
    This Is an Example Title
    This Is An Example Title
    The Quick Brown Fox
    ```

<hr/>






### Lines

#### Purpose { #lines-purpose }
Used to split a given string into a list of lines, where each element in the returned array or each returned tuple element is a string representing a single line.

If the `Strict` parameter is set to true, the function will lower-case any word that is not considered a proper noun. <br/>
If the `Strict` parameter is set to false or not provided, the function will apply title case to all words in the input string.

#### Syntax { #lines-syntax }
`Lines(Str: string, KeepEnds: boolean?, ReturnAsATuple: boolean?): (...string | {string}))`

#### Parameters { #lines-parameters }
- `Str: string` <br/> The input string to return its lines.
- `KeepEnds: boolean` {{ Optional }}: A boolean value indicating whether to keep the line endings[^3] in the returned strings. <br/> The default value is `false`.
- `ReturnAsATuple: boolean` {{ Optional }} <br/> A boolean value indicating whether to return the lines as a tuple. <br/> The default value is `false`.

[^3]: Line endings are the `\n` and `\r` characters.

#### Returns { #lines-returns }
- {{FormatType("table")}} | {{FormatType("tuple")}} <br/> An array of strings representing the lines in the input string, or a tuple of strings representing the lines if the `ReturnAsATuple` parameter is set to `true`. Each element in the array/tuple represents a single line in the input string, and includes the line ending characters if the `KeepEnds` parameter is set to `true`. <br/> If the input string does not contain more than one line, the function will return a array/tuple with a single element representing the input string.

#### Examples { #lines-examples }
=== "Code Sample"
    ```lua
    local Text = "This is a multi-line string\r\nThis is the second line\nThis is the third line\rThis is the fourth line"
    
    print(StringPlus.Lines(Text))
    print(StringPlus.Lines(Text, true))
    print(StringPlus.Lines(Text, false, true))
    ```

=== "Expected Output"
    ```lua
    {"This is a multi-line string", "This is the second line", "This is the third line", "This is the fourth line"}
    {"This is a multi-line string\r\n", "This is the second line\n", "This is the third line\r", "This is the fourth line"}
    This is a multi-line string, This is the second line, This is the third line, This is the fourth line
    ```

<hr/>





### RFind

#### Purpose { #rfind-purpose }
Returns the starting and ending indices of the last occurrence of the `Sub` string within the input string, searching backwards from the optional `End` index to the optional `Start` index. If `Sub` is not found within the specified range, the function returns `nil` for both indices.

#### Syntax { #rfind-syntax }
`RFind(Str: string, Sub: string, Start: number?, End: number?): (number?, number?))`

#### Parameters { #rfind-parameters }
- `Str: string` <br/> The string in which the search will take place.
- `Sub: string` <br/> The substring to be searched for.
- `Start: number` {{Optional}} <br/> The starting position of the search. <br/> Defaults to the first character in the string from backwards.
- `End: number` {{Optional}} <br/> The ending position of the search. <br/> Defaults to the length of the string.

#### Returns { #rfind-returns }
- {{FormatType("number")}} <br/> The starting position of the found substring, or `nil` if not found.
- {{FormatType("number")}} <br/> The ending position of the found substring, or `nil` if not found.

#### Examples { #rfind-examples }
=== "Code Sample"
    ```lua
    local Str = "The quick brown fox jumps over the lazy dog."
    local Sub = "the"

    -- Find the last occurrence of "the" within the string:
    local Start, End = StringPlus.RFind(Str, Sub)
    print(Start, End)

    -- Find the last occurrence of "the" within the first half of the string (not found):
    local Start, End = StringPlus.RFind(Str, Sub, 1, #Str / 2)
    print(Start, End)

    -- Find the last occurrence of "fox" within the string:
    local Start, End = StringPlus.RFind(Str, "fox")
    print(Start, End)

    -- Find the last occurrence of "cat" within the string (not found):
    local Start, End = StringPlus.RFind(Str, "cat")
    print(Start, End)
    ```

=== "Expected Output"
    ```lua
    32 34
    nil nil
    17 19
    nil nil
    ```

<hr/>





### Partition

#### Purpose { #partition-purpose }
Takes in an input string, a separator string, and returns a tuple or an array (depending on the value of `ReturnAsArray`) representing the three partitioned parts of the input string.

#### Syntax { #partition-syntax }
`Partition(Str: string, Separator: string, ReturnAsArray: boolean?): (...string | {string})`

#### Parameters { #partition-parameters }
- `Str: string` <br/> The input string to be partitioned.
- `Sub: string` <br/> The separator string used to partition Str.
- `ReturnAsArray: boolean` {{Optional}} <br/> A boolean value that specifies whether the function should return the resulting partition as an array or as a tuple. <br/> If it is not provided or is `nil`, the function returns a tuple.

#### Returns { #partition-returns }
- {{FormatType("string")}} <br/> The first element is the substring of Str before the first occurrence of `Separator` or `nil` if it doesn't exist.
- {{FormatType("string")}} <br/> The second element is the substring of Str between the first occurrence of `Separator` and the last occurrence of `Separator` or `nil` if it doesn't exist.
- {{FormatType("string")}} <br/> The third element is the substring of Str after the last occurrence of `Separator` or `nil` if it doesn't exist.

#### Examples { #partition-examples }
=== "Code Sample"
    ```lua
    local Str = "Hello, World!"
    local p1, p2, p3 = StringPlus.Partition(Str, "|")
    print(p1)
    print(p2)
    print(p3)
    print("-----")

    local Part = StringPlus.Partition(Str, "|", true)
    print(Part)
    print("-----")


    local Str = "Hello, World! How are you doing today?"
    local p1, p2, p3 = StringPlus.Partition(Str, ", ")
    print(p1)
    print(p2)
    print(p3)
    print("-----")

    local Parts = StringPlus.Partition(Str, ", ", true)
    print(Parts)
    ```

=== "Expected Output"
    ```lua
    Hello, World!
    nil
    nil
    -----
    Hello, World!
    -----
    Hello
    , 
    World! How are you doing today?
    -----
    {"Hello", ", ", "World! How are you doing today?"}
    ```

<hr/>






### RPartition

#### Purpose { #rpartition-purpose }
Returns a tuple or an array containing three strings; The part of the string before the first occurrence of the separator, the separator string itself, and the part of the string after the separator. <br/>
If the separator is not found in the string, the entire string is returned.

#### Syntax
`RPartition(Str: string, Separator: string, ReturnAsArray: boolean?): (...string | {string})`

#### Parameters { #rpartition-parameters }
- `Str: string` <br/> The original string that needs to be partitioned.
- `Sub: string` <br/> A string value that represents the boundary between the first and second substrings.
- `ReturnAsArray: boolean` {{Optional}} <br/> A boolean value that determines whether the function should return the three substrings as an array or as a tuple. The default value for this input is `false` which mean that the function will return a tuple containing three string values.

#### Returns { #rpartition-returns }
- {{FormatType("string")}} <br/> The first substring of `Str` before the first occurrence of `Separator` or `nil` if it doesn't exist.
- {{FormatType("string")}} <br/> The second substring of `Str` if it exist.
- {{FormatType("string")}} <br/> The third substring of `Str` after the last occurrence of `Separator` or `nil` if it doesn't exist.

#### Examples { #rpartition-examples }
=== "Code Sample"
    ```lua
    local Str = "Hello, World!"

    -- Separate the Str into three parts, using the space character as the separator
    local left, separator, right = StringPlus.RPartition(Str, " ")
    print(left)
    print(separator)
    print(right)
    print("------")

    -- Separate the Str into three parts, using the comma character as the separator, and get an array of parts
    local parts =  StringPlus.RPartition(Str, ",", true)
    print(parts[1])
    print(parts[2])
    print(parts[3])
    print("------")

    -- If the separator is not found, the original Str is returned as the left part and the right part is an empty Str
    local left, separator, right =  StringPlus.RPartition(Str, "?")
    print(left)
    print(separator)
    print(right)
    print("------")

    -- Separate the Str into three parts, using the word "bananas" as the separator.
    local Str = "I could eat bananas all day, bananas are my favorite fruit."
    local left, separator, right =  StringPlus.RPartition(Str, "bananas")
    print(left)
    print(separator)
    print(right)
    ```

=== "Expected Output"
    ```lua
    Hello,
     
    World!
    ------
    Hello
    ,
     World!
    ------
    Hello, World!
    nil
    nil
    ------
    I could eat bananas all day, 
    bananas
     are my favorite fruit.
    ```

<hr/>







### BinaryEncode

#### Purpose { #binaryencode-purpose }
Takes in a string and returns its binary encoding, where each character is represented as an 8-bit binary string, separated by a space as a default.

#### Syntax { #binaryencode-syntax }
`BinaryEncode(Str: string, Delimiter: string?): string`

#### Parameters { #binaryencode-parameters }
- `Str: string` <br/> The string to be encoded.
- `Delimiter: string` {{ Optional }} <br/> A string represents the separator to be used between every Byte of the output binary. Default value is a space.

#### Returns { #binaryencode-returns }
- {{FormatType("string")}} <br/> The binary encoded string, with each Byte being separated by a `Delimiter`.

#### Examples { #binaryencode-examples }
=== "Code Sample"
    ```lua
    local BinaryEncodedString = StringPlus.BinaryEncode("Hello, World!")
    print(BinaryEncodedString)

    local BinaryEncodedString = StringPlus.BinaryEncode("Test!", "-")
    print(BinaryEncodedString)

    local BinaryEncodedString = StringPlus.BinaryEncode("Hello, 世界!")
    print(BinaryEncodedString)

    local BinaryEncodedString = StringPlus.BinaryEncode("")
    print(BinaryEncodedString)
    ```

=== "Expected Output"
    ```lua
    01001000 01100101 01101100 01101100 01101111 00101100 00100000 01010111 01101111 01110010 01101100 01100100 00100001
    01010100-01100101-01110011-01110100-00100001
    01001000 01100101 01101100 01101100 01101111 00101100 00100000 11100111 10111010 11100111 11101111 11100111 01100001
    
    ```

<hr/>







### BinaryDecode

#### Purpose { #binarydecode-purpose }
This function takes in a single parameter Encoded which is a string. <br/>
It converts this value to a string, removes any non-binary character from it, and processes each 8-bit binary sequence. <br/>
It converts each sequence to a number and then converts this number to its corresponding ASCII character. The resulting string is returned.

#### Syntax { #binarydecode-syntax }
`BinaryDecode(Encoded: string): string`

#### Parameters { #binarydecode-parameters }
- `Encoded: string` <br/> The binary string to be decoded.

#### Returns { #binarydecode-returns }
- {{FormatType("string")}} <br/> A string representing the decoded binary.

#### Examples { #binarydecode-examples }
=== "Code Sample"
    ```lua
    local Encoded = "01001000 01100101 01101100 01101100 01101111"
    local DecodedStr = StringPlus.BinaryDecode(Encoded)
    print(DecodedStr)
    
    local Encoded = "01001000-5-01100101-5-01101100-5-01101100-5-01101111-5-00100001-5-00100000-5-01010100-5-01101000-5-01101001-5-01110011-5-00100000-5-01110111-5-01100001-5-01110011-5-00100000-5-01100001-5-00100000-5-01100111-5-01110010-5-01100101-5-01100101-5-01110100-5-01101001-5-01101110-5-01100111"
    local DecodedStr = StringPlus.BinaryDecode(Encoded)
    print(DecodedStr)
    ```

=== "Expected Output"
    ```
    Hello
    Hello! This was a greeting
    ```

<hr/>





### HexEncode

#### Purpose { #hexencode-purpose }
This function takes a string as an input and returns a string of hexadecimal characters representing the input string. <br/>
If the input string is empty, the function simply returns nil.

#### Syntax { #hexencode-syntax }
`HexEncode(Str: string): string`

#### Parameters { #hexencode-parameters }
- `Str: string` <br/> A string value to be encoded in hexadecimal.

#### Returns { #hexencode-returns }
- {{FormatType("string")}} <br/> A string of hexadecimal characters representing the input string.

#### Examples { #hexencode-examples }
=== "Code Sample"
    ```lua
    print(StringPlus.HexEncode("Hello, World!"))
    print(StringPlus.HexEncode("abc123"))
    print(StringPlus.HexEncode(""))
    ```

=== "Expected Output"
    ```lua
    48656c6c6f2c20576f726c6421
    616263313233
    nil
    ```

<hr/>






### HexDecode

#### Purpose { #hexdecode-purpose }
This function takes a single string argument HexStr which represents a string of hexadecimal digits. If HexStr does not contain only hexadecimal digits (i.e. it contains any characters other than 0-9, a-f, and A-F), the function returns nil. Otherwise, it returns a string containing the decoded version of HexStr.

The decoding is done by replacing each pair of hexadecimal digits with the corresponding ASCII character. For example, the string `"41 42 43"` (which represents the hexadecimal digits "ABC") would be decoded as the string "ABC".

#### Syntax { #hexdecode-syntax }
`HexDecode(HexStr: string): string?`

#### Parameters { #hexdecode-parameters }
- `HexStr: string` <br/> The input string containing hexadecimal characters/digits (0-9, a-f, A-F).

#### Returns { #hexdecode-returns }
- {{FormatType("string")}} <br/> The decoded string if the `HexStr` parameter is a valid string of hexadecimal characters/digits.

#### Examples { #hexdecode-examples }
=== "Code Sample"
    ```lua
    local Decoded = StringPlus.HexDecode("48656c6c6f20576f726c64")
    print(Decoded)

    local UpperCaseHex = StringPlus.HexDecode("48656C6C6F20576F726C64")
    print(UpperCaseHex)

    local UpperCaseHex = StringPlus.HexDecode("48656c6c6f20526f626c6f7821")
    print(UpperCaseHex)

    local InvalidHex = StringPlus.HexDecode("48656c6c6f207$726c64")
    print(InvalidHex)
    ```

=== "Expected Output"
    ```lua
    Hello World
    Hello World
    Hello Roblox!
    nil
    ```

