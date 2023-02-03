---
title: UTF8Reverse
description: The Documentation Page for The UTF8Reverse Sub-Module
---

# UTF8Reverse Sub-Module Documentation
<hr class="md-page-heading-separator">

## Overview
A sub-module that contains a single function for reversing non-ASCII strings.


## Functions

### UTF8Reveres

#### Purpose { #utf8reveres-purpose }
This function takes a string `Str` as input and returns a new string with the words in the original string reversed in place. <br/>
The function is designed to handle unicode strings and uses the utf8 library to iterate through the graphemes[^1] in the input string.

#### Syntax { #utf8reveres-syntax }
`UTF8Reverse(Str: string): string`

#### Parameters { #utf8reveres-parameters }
- `Str: string` <br/> The utf-8 string to reverse its words.

#### Returns { #utf8reveres-returns }
- {{FormatType("string")}} <br/> The reversed input string.

#### Examples { #utf8reveres-examples }
=== "Code Sample"
    ```lua linenums="1"
    print(String.UTF8Reverse("Hello, World!"))
    print(String.UTF8Reverse("ومرحباً! أهلاً"))
    print(String.UTF8Reverse("Ābāc ꜜ"))
    print(String.UTF8Reverse("🌍🌏🌎"))
    print(String.UTF8Reverse("こんにちは！ 世界。 これはテスト文字列です。"))
    print(String.UTF8Reverse("す。れべデンタセット れ わせ 世界。 ！はちにんこ"))
    ```

=== "Expected Output"
    ```lua linenums="1"
    !World Hello,
    أهلاً ومرحباً!        -- "!" Character should be at the end and not like that.
    ꜜ Ābāc
    🌍🌏🌎
    これはテスト文字列です。 世界。 こんにちは！
    す。れべデンタセット れ わせ 世界。 ！はちにんこ
    ```

[^1]: A combination of one or more characters that form a single visual entity.
