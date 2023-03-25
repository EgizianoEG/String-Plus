---
title: Change Log
description: The change log and history of the StringPlus Luau library
---

<!-- macro (function) to convert version and date headings into proper format along with proper table of contents element -->
{% macro VerTitle(Version, Date) -%}
  <a href="https://github.com/EgizianoEG/String-Plus/releases/tag/{{ Version }}" target="_blank"><small>:octicons-tag-24:</small>{{ Version }}</a> <small>{{ Date }}</small> { #{{ Version }} data-toc-label='{{ Version }} {{ Date }}'}
{%- endmacro %}


# Change Log

## {{ VerTitle("1.2.0", "February 3 2023") }}

### Added { #1.2.0#Added }

- Documentation site for the StringPlus library
- `Segments` function for the main module which does return an array of the original string cutten into parts with specific lengths {{ FormatPL(16, "#") }}
- `Distort` function for the library's root module {{ FormatPL(22, "#") }}
- `RandomFromString` function for the Random sub-module
- `IsValidUsername` function for the Validator sub-module {{ FormatPL(3, "#") }}
- `PasswordValidate` function for the Validator sub-module {{ FormatPL(15, "#") }}

### Improvements { #1.2.0#Improved }

- Improved `BinaryDecode` function for the main module {{ FormatPL(7, "#") }}
- Improved `UTF-8Reverese` function (properly handle trailing punctuation) {{ FormatPL(23, "#") }}

### Fixed { #1.2.0#Fixed }

- Validating functions: `IsAlpha` and `IsAlphaNum` {{ FormatPL(9, "#") }}
- `Analyze` or previously known `AnalyzeText` function. Was not getting all the statics {{ FormatPL(18, "#") }}

### Changes { #1.2.0#Changes }

- Restructured `Generate` function (last known as `GenerateKey`) to be able to accept a single `Options` parameter which does include all of the rules of how the function structure the output random string {{ FormatPL(11, "#") }}
- Moved `Starts`, `Ends`, and `Contains` functions from the main module to the validator sub module {{ FormatPL(2, "#") }}
- Renamed three parameters of `Stringify` function and replaced some string concatenations into strings made with interpolation {{ FormatPL(17, "#") }}
- Renamed `AnalyzeText` and `ApplyTitleCase` functions to `Analyze` and `TitleCase` in order {{ FormatPL(19, "#") }}
- Renamed the second parameter of `BinaryEncode` function from `ByteSeparator` to `Delimiter` {{ FormatPL(6, "#") }}
- Renamed `GenerateKey` function to be `Generate` {{ FormatPL(11, "#") }}
- Renamed `MockupStringLibrary` variable into `MockupStandardLibrary` {{ FormatPL(1, "#") }}
- Renamed `SolveIncorrectIndexing` variable into `SolveIndexing` {{ FormatPL(1, "#") }}
- Renamed `IncludeSubLibraryFunctions` variable into `IncludeSubLibrariesFunctions` {{ FormatPL(1, "#") }}

### Removed { #1.0.2#Removed }

- Removed `AlphabeticalOrder` function from the library for no useful use of it and the existence of the alternative `SortWords` {{ FormatPL(4, "#", True) }}


## {{ VerTitle("1.1.0", "January 19 2023") }}

### Added { #1.1.0#Added }

- Support for camel case function names and typechecking {{ FormatCommit("f3a505c") }} {{ FormatCommit("a110bd2") }}
- Support for converting standard string library function names into pascal case {{ FormatCommit("f4a663a") }}

### Improvements { #1.0.2#Improved }

- Improved `Stringify` function {{ FormatCommit("4d7652d") }}
- Improved `GenerateKey` function {{ FormatCommit("1e0fe0d") }} {{ FormatCommit("64e1f8d") }}
- Improved `BinaryEncode` function {{ FormatCommit("e8f318d") }}
- Improved `BinaryDecode` function {{ FormatCommit("1962354") }}
- Code cleanup {{ FormatCommit("b0da4c6") }}


## {{ VerTitle("1.0.3", "January 6 2023") }}

## {{ VerTitle("1.0.2", "January 3 2023") }}

### Improvements { #1.0.2#Improved }

- Improved `CamelCase` function
- Improved `SnakeCase` function
- Improved `AnalyzeText` function

### Fixed { #1.0.2#Fixed }

- `RemoveConsonants` function is now behaving correctly and only removes consonants from the input string ignoring any other character
- `RemoveExtraSpaces` function has been fixed (was deleting all the spaces)
- `FilterByLength` function
- `Expand` function has been fixed so that it does now recognize the numeric indexing to tables
- `Lines` function has been fixed (was returning the first line only from table.unpack)
- `Partition` and `RPartition` functions has been fixed (Same `Lines` function issue)

### Changes { #1.0.2#Changes }

- `MatchIgnoreCase` function is now lowering the given pattern along with the given string
- `UniqueWords` function is now returning *only* words which are without any punctuation, digits, or any other non-alphabetic character
- `BinaryDecode` function does now support numbers as an input parameter

### Removed { #1.0.2#Removed }

- `Words` function has been removed due to better equivalent `IWords` in the iterators module


## {{ VerTitle("1.0.1", "January 1 2023") }}

### Added { #1.0.1#Added }

- Extended TypeChecking Support {{ FormatCommit("90c1fcc") }}

## {{ VerTitle("1.0.0", "January 1 2023") }}

The first release and version of the library.
