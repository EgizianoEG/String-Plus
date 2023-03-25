---
title: Random
description: The Documentation Page for The Random Sub-Module
---

# Random Sub-Module Documentation
<hr/>

## Overview
The Random sub-library is a collection of functions structured and designed to generate random strings. <br/>

!!! warning "Filtering Results"
    It is strongely recommended to filter any outputs from the library’s Random and GenerateKey  functions as they can return a string that contains inappropriate words. For additional info: <a href="https://create.roblox.com/docs/building-and-visuals/ui/text-filtering#types-of-text-to-filter">here</a> or <a href="https://devforum.roblox.com/t/376408">here</a>.


<!-------------------------------------------------------------------------------------------------------------->
<!-- Functions Section -->

## Functions

### Random { #random }

#### Purpose { #random-purpose }
Generates a random string of a specified length and an optional character set.

The function uses the `math.random` function to generate random characters from the specified character set, and returns the generated string as the final result. <br/>
The function also caches the characters from a specific character set for faster generation in future calls.

#### Syntax { #random-syntax }
`Random(Length: number?, CharSet: string?): string`

#### Parameters { #random-parameters }
- `Length: number` {{ Optional }} <br/> The length of the string to generate. <br/> If not specified or `nil`, the default value is `20` characters.
- `CharSet: string` {{ Optional }} <br/> The character set to use for generating the string which could be a Lua string pattern. <br/> If not specified or `nil`, the default value is `"[%w]"`, which represents any alphanumeric character[^1].

[^1]: Alphanumeric characters are: a-z, A-Z, 0-9

#### Returns { #random-returns }
- {{FormatType("string")}} <br/> The generated random string.

#### Examples { #random-examples }
=== "Code Sample"
    ```lua linenums="1"
    local RandomString = String.Random(10, "[%d]")     -- Generate a random string of length 10 with only digits
    print(RandomString)

    local RandomString2 = String.Random(15)            -- Generate a random string of length 15 with any alphanumeric character
    print(RandomString2)

    local RandomString3 = String.Random(5, "[%l%u]")   -- Generate a random string of length 5 with only lowercase and uppercase letters (equivalent to "%a")
    print(RandomString3)

    local RandomString4 = String.Random(12, "[Aabcd01]")   -- Generate a random string of length 12 that only contains any of characters: A,a,b,c,d,0,1
    print(RandomString4)
    ```

=== "Example Output"
    ```linenums="1"
    2785220038
    4q3m8z9k1p7c6t5
    FjKpZ
    10AbbbAdb1db
    ```

<hr>


### RandomFromString { #randomfromstring }

#### Purpose { #randomfromstring-purpose }
Used to create a randomized string based on an input one's characters.

#### Syntax { #randomfromstring-syntax }
`RandomFromString(Str: string, Length: number?, SameCharacterChances: boolean?): string`

#### Parameters { #randomfromstring-parameters }
- `Str: string` <br/> The input string.
- `Length: number` {{ Optional }} <br/> The number of characters of the output random string. <br/> :material-cog: Default: `10`
- `SameCharacterChances: boolean` {{ Optional }} <br/> A boolean determines whether the function should not allow for the repeated characters (higher chances) to exist based on that, but to make the chance of every character to appear the same. <br/> :material-cog: Default: `true`.

#### Returns { #randomfromstring-returns }
- {{FormatType("string")}} <br/> The output random string.

#### Examples { #randomfromstring-examples }
=== "Code Sample"
    ```lua linenums="1"
    local Str = "A string"
    print(String.RandomFromString(Str))

    local Str = "Hello World!"
    print(String.RandomFromString(Str, 10))

    local Str = "This string for testing"
    print(String.RandomFromString(Str, 15, false))

    local Str = "-StringPlus-"
    print(String.RandomFromString(Str, 6))

    local Str = "123abc"
    print(String.RandomFromString(Str, 18))
    ```

=== "Example Output"
    ```linenums="1"
    stsAnAtnrg
    Weedld !W 
    hTTgshTneesrhtf
    ilrn-l
    3aac1a11ba32112a2a
    ```

<hr>




### Generate { #generate }

#### Purpose { #generate-purpose }
Generates a randomized string key with a specified number of sections, each with a specified length. It takes in a table which can contain several options.

#### Syntax { #generate-syntax }
`GenerateKey(Options: {CharSet: (string | {string})?, TotalSections: number?, SectionLength: number?, Delimiter: string?, Prefix: string?, Suffix: string?}): string`

#### Parameters { #generate-parameters }
- `Options: table` {{ Optional }} <br/> A table of options that specifies how would the returned string is structured. <br/> These options are:
    * `CharSet: (string | {string})` {{ Optional }} <br/>  The character set to use for generating the string which could be a Lua string pattern. <br/> If not specified or `nil`, the default value is `"[%w]"`, which represents any alphanumeric character[^1].
        + If a table is provided, each element of the table corresponds to a section of the key and specifies the character set for that section.
        + If a single string is provided, all sections of the key will use the same character set.
        + If the number of sets in the table is less than the `TotalSections`, they will be repeated until the table length matches the `TotalSections`. <br/> Also, if CharSet is not provided or is `nil`, all sections of the key will use any alphanumeric character as the character set.
    * `TotalSections: number` {{ Optional }} <br/> The total number of sections in the returned random string. <br/> :material-cog: Default value is `4`.
    * `SectionLength: number` {{ Optional }} <br/> The length of each section in the key. <br/> :material-cog: Default: `4`.
    * `Delimiter: string` {{ Optional }} <br/> The delimiter used to separate the sections. <br/> :material-cog: Default: `"-"`.
    * `Prefix: string` {{ Optional }} <br/> The prefix to use for the key. <br/> :material-cog:  Default: `nil` <br/> <br/> If the prefix length is less than the specified section length, it will be padded with random characters from the character set. <br/> Also, if the prefix length is greater than the section length, it will be truncated.
    * `Suffix: string` {{ Optional }} <br/> The suffix to use for the key. <br/> :material-cog:  Default: `nil` <br/> <br/> If the suffix length is less than the specified section length, it will be padded with random characters from the character set. <br/> If the suffix length is greater than the section length, it will be truncated.

#### Returns { #generate-returns }
- {{FormatType("string")}} <br/> The generated random string with the applied options.
- {{FormatType("table")}} <br/> The orignally generated sections of the returned string in an array.

#### Examples { #generate-examples }
=== "Code Sample"
    ```lua linenums="1"
    -- Generate a random string whith default settings
    local Generated, Sections = String.Generate()
    print(Generated, Sections)

    -- Generate a random license plate string where it has to be two sections with the length of three characters
    -- where also, the first section should only consist upper case characters and the second one only digits
    local Generated, Sections = String.Generate({
        CharSet = {[1] = "%u", [2] = "%d"}, 
        SectionLength = 3,
        TotalSections = 2,
    })
    print(Generated, Sections)

    -- Generate a key with 5 sections, each of length 8, using any alphanumeric character as the character set, with a prefix and suffix
    local Generated, Sections = String.Generate({
        TotalSections = 5,
        SectionLength = 8,
        Prefix = "PREFIX",
        Suffix = "SUFFIX"
    })
    print(Generated, Sections)

    -- Generate a random phone number string with 4 sections, each of length 4, using any numeric character as the character set, and with a prefix
    local Generated, Sections = String.Generate({
        SectionLength = 3,
        Delimiter = " ",
        CharSet = "%d", 
        Prefix = "+15",
    })
    print(Generated, Sections)

    -- Generate a random string with 3 sections of 4 characters each, using a different character set using pattern classes for each section
    local Generated = String.Generate({
        CharSet = {"[%d]", "[%l]", "[%u]"},
        TotalSections = 3,
        SectionLength = 4
    })
    print(Generated)

    -- Generate a random string of binary representation with 6 sections of 8 characters each, using a character set consisting of zeros and ones for each section and with a delimiter space character
    local Generated = String.Generate({
        Delimiter = " ",
        CharSet = "[01]",
        TotalSections = 6,
        SectionLength = 8
    })
    print(Generated)
    ```

=== "Example Output"
    ```lua linenums="1"
    vdbx-X4Jq-mbDQ-XwRZ {
                    [1] = "vdbx",
                    [2] = "X4Jq",
                    [3] = "mbDQ",
                    [4] = "XwRZ"
                 }
    STE-526 {
               [1] = "STE",
               [2] = "526"
            }
    PREFIXcD-kQo67EgZ-ZOQjfP67-eM4RziCb-u8SUFFIX {
                    [1] = "Mccx76cD",
                    [2] = "kQo67EgZ",
                    [3] = "ZOQjfP67",
                    [4] = "eM4RziCb",
                    [5] = "NLBhAAXN"
                 }
    +15 757 229 515 {
                    [1] = "145",
                    [2] = "757",
                    [3] = "229",
                    [4] = "515"
                 }
    1148-zbms-CKTK
    01110101 00000000 11000110 10111010 10110111 11011100
    ```

??? info "A Second Return?! Why?"
    The main purpose of the second return, also known as the generated sections is to make the function flexible and easily interactable with its output string. <br/> An example for its usage, you can filter a specific alphabetic section, such as the text portion of a generated license plate to display to others and to prevent the display of inappropriate content.
