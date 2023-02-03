---
title: Validator
description: The Documentation Page for The Validator Sub-Module
---

# Validator Sub-Module Documentation
<hr class="md-page-heading-separator">

## Overview
The Validator sub-library is a collection of functions designed to check and validate strings. <br/>
It provides a range of checks for various characteristics. <br/>
These functions are useful for verifying the correctness and suitability of strings in various contexts.

!!! note "Notice"
    There could be boolean outputs that be grouped and be separated by a single line for better appearance without an additional print between.



## Functions

### IsNumeric

#### Purpose { #isnumeric-purpose }
This function checks if the given string represents a numeric value. <br/> It returns `true` if the string is a numeric value, `false` otherwise. <br/>

This function considers a numeric value as a string that can be converted to a number type, such as integer, float, or double.

#### Syntax { #isnumeric-syntax }
`IsNumeric(Str: string): boolean`

#### Parameters { #isnumeric-parameters }
- `Str: string` <br/> The input string to check.

#### Returns { #isnumeric-returns }
- {{FormatType("boolean")}} <br/> `true` if the input string represents a numeric value, `false` otherwise.

#### Examples { #isnumeric-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.IsNumeric("123"))
    print(String.IsNumeric("-123"))
    print(String.IsNumeric("1.23"))
    print(String.IsNumeric("5e9"))

    print(String.IsNumeric("12 3"))
    print(String.IsNumeric("a123"))
    print(String.IsNumeric("123a"))
    print(String.IsNumeric(""))
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    true
    true
    true
    
    false
    false
    false
    false
    ```

<hr/>




### IsInteger

#### Purpose { #isinteger-purpose }
This function checks if the given string represents an integer value.

#### Syntax { #isinteger-syntax }
`IsInteger(Str: string): boolean`

#### Parameters { #isinteger-parameters }
- `Str: string` <br/> The string to be checked.

#### Returns { #isinteger-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating whether the given string represents an integer value or not. <br/> If the string represents an integer value, the function returns `true`, otherwise it returns `false`.

#### Examples { #isinteger-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.IsInteger("123"))
    print(String.IsInteger("-456"))
    print(String.IsInteger("0"))

    print(String.IsInteger(""))
    print(String.IsInteger("123.4"))
    print(String.IsInteger("abc"))
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    true
    true

    false
    false
    false
    ```

<hr/>




### IsAlpha

#### Purpose { #isalpha-purpose }
Checks if a string consists only of alphabetical characters and spaces. <br/> It returns a boolean value indicating whether the string is made up of only alphabetical characters and spaces or not.

#### Syntax { #isalpha-syntax }
`IsAlpha(Str: string): boolean`

#### Parameters { #isalpha-parameters }
- `Str: string` <br/> The string to be checked.

#### Returns { #isalpha-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating whether the string is made up of only alphabetical characters and spaces or not.

#### Examples { #isalpha-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.IsAlpha("Hello"))
    print(String.IsAlpha("HELLO"))
    print(String.IsAlpha("AbCd EfG"))

    print(String.IsAlpha(""))
    print(String.IsAlpha("     "))
    print(String.IsAlpha("12345"))
    print(String.IsAlpha("Hello123!"))
    print(String.IsAlpha("AbCdEfG1"))
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    true
    true

    false
    false
    false
    false
    false
    ```

<hr/>




### IsAlphaNum

#### Purpose { #isalphanum-purpose }
A function that checks if a given string is alphanumeric or not. <br/>
An alphanumeric string is a string that consists of only letters (a-z, A-Z) and digits (0-9) along with spaces if there any.

#### Syntax { #isalphanum-syntax }
`IsAlphaNum(Str: string): boolean`

#### Parameters { #isalphanum-parameters }
- `Str: string` <br/> The string to be checked.

#### Returns { #isalphanum-returns }
- {{FormatType("boolean")}} <br/> A boolean value of `true` if the given string is alphanumeric and `false` if it is not.

#### Examples { #isalphanum-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.IsAlphaNum("Abc123"))
    print(String.IsAlphaNum("Hello123"))
    print(String.IsAlphaNum("1234567890"))
    print(String.IsAlphaNum("Hello World"))

    print(String.IsAlphaNum("    "))          -- Only Consists of Space Characters
    print(String.IsAlphaNum("@#!$"))          -- Contains Punctuation Characters
    print(String.IsAlphaNum("Hello World!"))  -- Contains a Punctuation Character "!"
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    true
    true
    true

    false
    false
    false
    ```

<hr/>




### IsBlank

#### Purpose { #isblank-purpose }
Checks if the given string is blank (only consists of space characters[^1]) or empty.

#### Syntax { #isblank-syntax }
`IsBlank(Str: string): boolean`

#### Parameters { #isblank-parameters }
- `Str: string` <br/> A string to check if it is blank or not.

#### Returns { #isblank-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating whether the given string is blank or not. <br/> A string is considered blank if it consists only of whitespace characters or is empty.

#### Examples { #isblank-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.IsBlank(""))
    print(String.IsBlank("   "))
    print(String.IsBlank("\t\t    \n"))

    print(String.IsBlank("abc"))
    print(String.IsBlank("a b c"))
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    true
    true

    false
    false
    ```

<hr/>




### IsUpper

#### Purpose { #isupper-purpose }
Checks if the provided string is uppercase. <br/>
It returns a boolean value indicating if the string is uppercase or not.

#### Syntax { #isupper-syntax }
`IsUpper(Str: string): boolean`

#### Parameters { #isupper-parameters }
- `Str: string` <br/> A string to check if it is upper-case or not.

#### Returns { #isupper-returns }
- {{FormatType("boolean")}} <br/> `true` if the input string does *not* contain any lower-case characters, otherwise, the returned value is `false`.

#### Examples { #isupper-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.IsUpper("HELLO WORLD!"))
    print(String.IsUpper("HELLO  WORLD"))
    print(String.IsUpper("HELLO WORD! @911"))

    print(String.IsUpper("123"))          -- Conains Only Numbers
    print(String.IsUpper("HELLO World!")) -- The string contains lower-case characters
    print(String.IsUpper("hello world"))  -- The string is all lower-case
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    true
    true

    false
    false
    false
    ```

<hr/>




### IsLower

#### Purpose { #islower-purpose }
Checks if the provided string is lowercase. <br/>
It returns a boolean value indicating if the string is lowercase or not.

#### Syntax { #islower-syntax }
`IsLower(Str: string): boolean`

#### Parameters { #islower-parameters }
- `Str: string` <br/> A string value to be checked.

#### Returns { #islower-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating if the provided string is lower-case or not.

#### Examples { #islower-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.IsLower("hello"))
    print(String.IsLower("hello123"))
    print(String.IsLower("hello, @911"))

    print(String.IsLower(""))
    print(String.IsLower("123"))
    print(String.IsLower("HELLO"))
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    true
    true

    false
    false
    false
    ```

<hr/>




### IsTagged

#### Purpose { #istagged-purpose }
This function checks whether a given string is possibly tagged or not. <br/>
A string is considered tagged if it is only contains hashtags "#" if FullMatch is `true` or `nil`, also, considered tagged if it contains three or more hashtags in sequence `"###"` while FullMatch is `false`.

#### Syntax { #istagged-syntax }
`IsTagged(Str: string, FullMatch: boolean?): boolean`

#### Parameters { #istagged-parameters }
- `Str: string` <br/> The string to check.
- `FullMatch: boolean` {{ Optional }} <br/> A boolean value indicating whether the given string should be entirely tagged or just be a part of it. The default value is `true`.

#### Returns { #istagged-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating whether the given string is possibly tagged or not.

#### Examples { #istagged-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.IsTagged("Hello World"))
    print(String.IsTagged("### Hello World"))        -- Somewhat tagged but the FullMatch is on
    print(String.IsTagged("##### World ### world"))  -- FullMatch is on

    print(String.IsTagged("############"))
    print(String.IsTagged("Hello ### World", false))
    print(String.IsTagged("Hello World #####", false))
    ```

=== "Expected Output"
    ```lua linenums="1"
    false
    false
    false

    true
    true
    true
    ```

<hr/>




### IsASCII

#### Purpose { #isascii-purpose }
Checks if a given string is an ASCII string or not. <br/>
An ASCII string is a string that only contains ASCII characters, which are a set of 128 characters (0-127) defined in the ASCII standard<sup><a href="https://www.techonthenet.com/ascii/chart.php" target="_blank"><small>:octicons-link-external-16:</a></small></sup>.

#### Syntax { #isascii-syntax }
`IsASCII(Str: string): boolean`

#### Parameters { #isascii-parameters }
- `Str: string` <br/> The string to check.

#### Returns { #isascii-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating whether the input string consists only of ASCII characters (code points 0-127).

#### Examples { #isascii-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.IsASCII(""))
    print(String.IsASCII("Hello, World!"))
    print(String.IsASCII("Hello, World!\n"))
    print(String.IsASCII("Héllo, World!"))   -- é is not an ascii character
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    true
    true
    false
    ```

<hr/>




### IsHexColor

#### Purpose { #ishexcolor-purpose }
Checks if a given string is a valid hexadecimal color representation.

#### Syntax { #ishexcolor-syntax }
`IsHexColor(Str: string, EnforceHash: boolean?): boolean`

#### Parameters { #ishexcolor-parameters }
- `Str: string` <br/> The string to check.
- `EnforceHash: boolea` {{ Optional }} <br/> A boolean value which specifies if the hexadecimal color representation should start with the hashtag symbol `#` or not.

#### Returns { #ishexcolor-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating whether the string is a valid hexadecimal color representation or not. <br/> If the `EnforceHash` argument is `true`, the function requires the `#` symbol to be present in the color representation. <br/> If `EnforceHash` is `false` or `nil`, the presence of the `#` symbol is optional.

#### Examples { #ishexcolor-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.IsHexColor("#FFF"))
    print(String.IsHexColor("#FF9C59"))
    print(String.IsHexColor("#ABCDEF", true))
    print(String.IsHexColor("ABCDEF", false))

    print(String.IsHexColor("FF9C59", true))
    print(String.IsHexColor("#FFA5G"))
    print(String.IsHexColor("#FFA5D5EE"))
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    true
    true
    true

    false
    false
    false
    ```

<hr/>




### IsPalindrome

#### Purpose { #ispalindrome-purpose }
Used to determine if a given string is a palindrome. <br/>
A palindrome is a word, phrase, number, or other sequence of characters that reads the same backward as forward.

#### Syntax { #ispalindrome-syntax }
`IsPalindrome(Str: string, CaseSensitive: boolean?): boolean`

#### Parameters { #ispalindrome-parameters }
- `Str: string` <br/> The input string to check.
- `CaseSensitive: boolean` {{ Optional }} <br/> A boolean value indicating whether the check should be case-sensitive or not. <br/> The default value is `false`.

#### Returns { #ispalindrome-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating whether the string is a palindrome or not.

#### Examples { #ispalindrome-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.IsPalindrome("Level"))
    print(String.IsPalindrome("racecar"))
    print(String.IsPalindrome("racecar", true))
    print(String.IsPalindrome("Madam", false))

    print(String.IsPalindrome("Madam", true))
    print(String.IsPalindrome("hello", true))
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    true
    true
    true

    false
    false
    ```

<hr/>




### IsTitile

#### Purpose { #istitile-purpose }
Used to determine if a given string is in title case format.

#### Syntax { #istitile-syntax }
`IsTitle(Str: string, Strict: boolean?): boolean`

#### Parameters { #istitile-parameters }
- `Str: string` <br/> A string to check if it is a title.
- `Strict: boolean` {{ Optional }} <br/> A boolean value that indicating whether the function should enforce strict adherence to the title format. <br/> If Strict is not provided, it is set to `false` by default.

#### Returns { #istitile-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating whether the input string is in title case format.

#### Examples { #istitile-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.IsTitle("The Quick Brown Fox"))
    print(String.IsTitle("The Quick Brown Fox", true))
    print(String.IsTitle("The Quick Brown Fox", false))
    print(String.IsTitle("The Catcher in the Rye", true))
    print(String.IsTitle("The Catcher in the Rye", false))

    print(String.IsTitle("The Quick brown Fox"))
    print(String.IsTitle("the Quick Brown Fox"))
    print(String.IsTitle("A man, a plan, a canal, Panama!", false))
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    true
    true
    true
    true

    false
    false
    false
    ```

<hr/>




### Starts

#### Purpose { #starts-purpose }
Checks whether a string starts with any of the specified prefixe(s).

#### Syntax { #starts-syntax }
`Starts(Str: string, Prefixes: (string | {string})): boolean`

#### Parameters { #starts-parameters }
- `Str: string` <br/> The string to check.
- `Prefixes: (string | table)` <br/> A single string or an array of strings representing the prefixes to check for.

#### Returns { #starts-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating whether the string starts with any of the specified prefixe(s).

#### Examples { #starts-examples }
=== "Code Sample"
    ```lua linenums="1"
    local Result = String.Starts("Hello", {"H", "He"})
    print(Result)

    Result = String.Starts("Hello", {"h", "he"})
    print(Result)

    Result = String.Starts("Hello", "h")
    print(Result)
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    false
    false
    ```

<hr/>



### Ends

#### Purpose { #ends-purpose }
Determines whether a string ends with one of the specified suffixes. <br/> It returns `true` if the string ends with any of the suffixes, and `false` otherwise.

#### Syntax { #ends-syntax }
`Ends(Str: string, Suffixes: (string | {string})): boolean`

#### Parameters { #ends-parameters }
- `Str: string` <br/> The string to be checked.
- `Suffixes: (string | table)` <br/> The suffix string or an array of suffixes to be checked.

#### Returns { #ends-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating whether the string ends with any of the specified suffixes.

#### Examples { #ends-examples }
=== "Code Sample"
    ```lua linenums="1"
    local Result = String.Ends("hello world", {"world", "rld"})
    print(Result)

    local Result = String.Ends("hello world", {"world", "rld", "foo"})
    print(Result)

    local Result = String.Ends("hello world", {"foo", "bar"})
    print(Result)

    local Result = String.Ends("file.jpeg", {".png", ".jpg", ".jpeg"})
    print(Result)
    ```

=== "Expected Output"
    ```lua linenums="1"
    true
    true
    false
    true
    ```

<hr/>



### Contains

#### Purpose { #contains-purpose }
Returns a boolean value indicating whether the given string contains any of the specified `SubStrings`. <br/>
If the `SubStrings` parameter is a single string, then the function will return `true` if the substring is found within the `Str`. <br/>
If `SubStrings` is an array of strings, then the function will return `true` if any of the strings in the table are found within the given `Str`.

#### Syntax { #contains-syntax }
`#!lua Contains(Str: string, SubStrings: (string | {string})): boolean`

#### Parameters { #contains-parameters }
- `Str: string` <br/> The string to search in.
- `SubStrings: (string | table)` <br/> The substring or substrings to search for. Can be a single string or an array of strings.

#### Returns { #contains-returns }
- {{FormatType("boolean")}} <br/> A boolean indicating whether the string contains the given substring or any of substrings.
- {{FormatType("string")}} <br/> The substring that was found, if any or an empty string.
- {{FormatType("number")}} <br/> The starting index of the substring in the string.
- {{FormatType("number")}} <br/> The ending index of the substring in the string.

#### Examples { #contains-examples }
=== "Code Sample"
    ```lua linenums="1"
    local Found, SubString, Start, End = String.Contains("Hello, world!", "world")
    print(Found, SubString, Start, End)

    local Found, SubString, Start, End = String.Contains("Hello, world!", {"Hello", "world"})
    print(Found, SubString, Start, End)

    local Found, SubString, Start, End = String.Contains("Hello, world!", {"Goodbye", "universe"})
    print(Found, SubString, Start, End)
    ```

=== "Expected Output"
    ```lua linenums="1"
    true world 8 12
    true Hello 1 5
    false   0 0
    ```

??? note "Notice"
    If there isn't any found substring in the given string, the function would simply return an empty string for the second tuple value (a.k.a. the found substring), along with `0` for the rest of the tuple (start and end indexes).

<hr/>




### IsValidUsername

#### Purpose { #isvalidusername-purpose }
Checks whether or not the given string is a valid username for Roblox platform by doing some top-layer validations. <br/>
It checks that the username meets certain criteria such as length, characters allowed, and appropriateness.

#### Syntax { #isvalidusername-syntax }
`IsValidUsername(Str: string): boolean`

#### Parameters { #isvalidusername-parameters }
- `Str: string` <br/> A string to check if it is a valid username.

#### Returns { #isvalidusername-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating whether the input string is actually a valid username by returning `true` or not by returning `false`.
- {{FormatType("string")}} <br/> A string value that provides feedback on why the validation failed if the result is `false`. <br/> This would be an empty string if the username validation has succeeded.

#### Examples { #isvalidusername-examples }
=== "Code Sample"
    ```lua linenums="1"
    local Result, Feedback = String.IsValidUsername("valid_username")
    print(Result, Feedback)

    local Result, Feedback = String.IsValidUsername("eri_5050")
    print(Result, Feedback) 

    local Result, Feedback = String.IsValidUsername("1234567")
    print(Result, Feedback) 

    local IsValid, Feedback = String.IsValidUsername("Test_username_")
    print(IsValid, Feedback)

    local IsValid, Feedback = String.IsValidUsername("Me@4_test")
    print(IsValid, Feedback)

    local IsValid, Feedback = String.IsValidUsername("tempo_82_e")
    print(IsValid, Feedback)
    ```

=== "Expected Output"
    ```lua linenums="1"
    true 
    true 

    false Username might contain private information.
    false Usernames cannot start or end with underscore "_".
    false Usernames may only contain letters, numbers, and a single underscore.
    false Usernames can have at most one underscore character "_".
    ```

!!! warning
    Please note that this function only provides a basic validation for input strings and **does not** check the input text for inappropriate words or filter it. <br/>
    It is important to consider additional filtering for the input text, especially if it will be visible to others.

<hr/>





### PasswordValidate

#### Purpose { #passwordvalidate-purpose }
A basic password validation function that returns if the password is valid, its expected strength score, and a feedback string if it was not valid.

#### Syntax { #passwordvalidate-syntax }
`PasswordValidate(Password: string, EnforceStandardRequirements: boolean?): boolean`

#### Parameters { #passwordvalidate-parameters }
- `Password: string` <br/> A password string to check for its validity and strength.
- `EnforceStandardRequirements: boolean` {{ Optional }} <br/> A boolean that determines whether the standard requirements for a password be enforced on the given string or not[^2]. <br/> :material-cog: Default: `false`.

#### Returns { #passwordvalidate-returns }
- {{FormatType("boolean")}} <br/> A boolean value indicating whether the input string is actually a valid username by returning `true` or not by returning `false`.
- {{FormatType("number")}} <br/> An expected strength for the given string its range is between 0-100.
- {{FormatType("string")}} <br/> If the sthring given is not valide, a feedback string represents the reason of why the password is not valid is returned; Otherwise, a `nil` value is returned.

#### Examples { #passwordvalidate-examples }
=== "Code Sample"
    ```lua linenums="1"
    local Password = "P@ssW0rd"
    local IsValid, Score, Feedback = String.PasswordValidate(Password)
    print(IsValid, Score, Feedback)

    local Password = "AAAaaaAAAAaaaa"
    local IsValid, Score, Feedback = String.PasswordValidate(Password)
    print(IsValid, Score, Feedback)

    local Password = "AsDaSd"
    local IsValid = String.PasswordValidate(Password)
    print(IsValid)

    local Password = "12345"
    local IsValid = String.PasswordValidate(Password)
    print(IsValid)

    local Password = "5555555555555555555"
    print(String.PasswordValidate(Password))

    local Password = "trlxoth6vu"
    print(String.PasswordValidate(Password))

    local Password = "dre9e@#e9u"
    print(String.PasswordValidate(Password, true))

    local Password = "b5A&"
    print(String.PasswordValidate(Password, true))

    local Password = "@ACre9l9E9O@"
    print(String.PasswordValidate(Password, true))

    local Password = "+lHi94Ku3h6$#Wrot?un"
    print(String.PasswordValidate(Password, true))
    ```

=== "Expected Output"
    ```lua linenums="1"
    false 0 Password is weak and is banned from usage.
    false 0 Password consists of only the same alphabetic character.
    false
    false
    false 0 Password consists of only the same or similar integers.
    true 40 nil
    true 100 nil
    false 0 Password length should be between 8 to 64 characters.
    true 100 nil
    true 100 nil
    ```

<hr/>


[^1]: Equivalent to ( \t\n\v\f\r).
[^2]: Minimum of 8 character length and maximum of 64, at least one character of: specials, digits, upper-case characters, lower-case characters and should not match a blacklisted string.
