---
title: Stringify
description: The Documentation Page for The Stringify Sub-Module
---

# Stringify Sub-Module Documentation
<hr class="md-page-heading-separator">

## Overview
The Stringify sub-module consists of one function that converts a given table into a string value, similar to how tables are printed in Roblox Studio.


## Functions

### Stringify { #stringify }

#### Purpose { #stringify-purpose }
Converts a given table to a good-looking string representation.

#### Syntax { #stringify-syntax }
`Stringify(Table: table, TabSize: number?, IndentionCharacter: string?, IsRecursive: boolean?, Cache: table?, CIndention: number?): boolean`

#### Parameters { #stringify-purpose }
- `Table: string` <br/> The input table to convert.
- `IndentionSize: number` {{ Optional }}<br/> The size of the indentation in spaces/provided character if any. <br/> :material-cog: Default is `4`.
- `IndentionCharacter: string` {{ Optional }} <br/> The character to use for indentation. <br/> :material-cog: Default is a space character `" "`.
- `Recursive: boolean` {{ Optional }} <br/> A boolean indicating whether to recursively process nested tables. <br/> :material-cog: Default is `false`.
- `Cache: table` {{ Optional }} <br/> A table to use as a cache to detect circular references[^1] (Used by the function's recursive calls).
- `CIndention: number` {{ Optional }} <br/> The current level of indentation (Used by the function's recursive calls).

[^1]: Circular reference is a situation in which two tables/values reference each other (e.g. `table.__index = table`).

#### Returns { #stringify-returns }
- {{FormatType("string")}} <br/> The string representation of the given table.

#### Examples { #stringify-examples }
=== "Code Sample"
    ```lua linenums="1"
    local Table = {
        Name = "John",
        Age = 30,
        Hobbies = {"Reading", "Swimming", "Cooking"},
        Address = {
            Street = "123 Main Street",
            City = "New York",
            State = "NY",
            Zip = "10001"
        }
    }
    print(Stringify(Table))    -- Recursive parameter is not on/true

    local Table = {
        ["Item 1"] = 123,
        ["Item 2"] = "Hello, world!",
        ["Item 3"] = true,
        ["Item 4"] = {
            ["Subitem 1"] = "Nested value",
            ["Subitem 2"] = false
        },
        ["Item 5"] = {
            [1] = "Array item 1",
            [2] = "Array item 2",
            [3] = "Array item 3"
        }
    }
    print(Stringify(Table, 4, " ", true))

    local Table = { {1}, {2} }
    print(String.Stringify(Table, nil, "-", true))
    ```

=== "Expected Output"
    ```lua linenums="1"
    {
        ["Address"] = table: 0x8721c752aabb7911,
        ["Age"] = 30,
        ["Name"] = "John",
        ["Hobbies"] = table: 0x497b292a40db2041
    }
    {
        ["Item 1"] = 123,
        ["Item 2"] = "Hello, world!",
        ["Item 5"] = {
            [1] = "Array item 1",
            [2] = "Array item 2",
            [3] = "Array item 3"
        },
        ["Item 4"] = {
            ["Subitem 2"] = false,
            ["Subitem 1"] = "Nested value"
        },
        ["Item 3"] = true
    }
    {
    ----["1"] = {
    --------[1] = 1
    ----},
    ----["2"] = {
    --------[1] = 2
    ----}
    }
    ```
