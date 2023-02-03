---
title: Iterators
description: The Documentation Page for The Iterators Sub-Module
---

# Iterators Sub-Module Documentation
<hr/>

## Overview
The StringIterators Sub-Library provides a set of functions for iterating through various components of a string. <br/>

These functions return an iterator function that can be used to iterate through each character, word, sentence, or line in a string.


## Functions

### ICharacters

#### Purpose { #icharacters-purpose }
Returns an iterator function that returns each character in the string `Str` one at a time.

#### Syntax { #icharacters-syntax }
`ICharacters(Str: string): ((string, number) -> (number, string), string, number)`

#### Parameters { #icharacters-parameters }
- `Str: string` <br/> The input string to iterate over its characters.

#### Returns { #icharacters-returns }
- {{FormatType("function")}} <br/> An iterator function that returns the next character in the string on each call.
- {{FormatType("number")}} <br/> The index of the character in the input string.
- {{FormatType("string")}} <br/> The character.

#### Examples { #icharacters-examples }
=== "Code Sample"
    ```lua linenums="1"
    local Str = "Hello!"
    for Index, Character in String.ICharacters(Str) do
        print(Index .. (":"), Character)
    end
    ```

=== "Expected Output"
    ```lua linenums="1"
    1: H
    2: e
    3: l
    4: l
    5: o
    6: !
    ```

<hr/>



### IWords

#### Purpose { #iwords-purpose }
This function returns an iterator function that returns each word in the string `Str` one at a time. <br/>
Words are defined as sequences of non-whitespace characters separated by one or more whitespace characters.

#### Syntax { #iwords-syntax }
`IWords(Str: string): ((string, number): ((string, number) -> (number, number, string), string, number)`

#### Parameters { #iwords-parameters }
- `Str: string` <br/> The input string to iterate over its words.

#### Returns { #iwords-returns }
- {{FormatType("function")}} <br/> An iterator function that returns the next word in the string on each call.
- {{FormatType("number")}} <br/> The start index of the word in the input string.
- {{FormatType("number")}} <br/> The end index of the word in the input string.
- {{FormatType("string")}} <br/> The word itself.

#### Examples { #iwords-examples }
=== "Code Sample"
    ```lua linenums="1"
    local Str = "This is a test string."
    for Start, End, Word in String.IWords(Str) do
        print(string.format("[%d-%d] - \"%s\"", Start, End, Word))
    end
    ```

=== "Expected Output"
    ```lua linenums="1"
    [1-4] - "This"
    [6-7] - "is"
    [9-9] - "a"
    [11-14] - "test"
    [16-21] - "string"
    ```

<hr/>



### ISentences

#### Purpose { #iwords-purpose }
Returns an iterator function that returns each sentence in the input string one at a time. <br/>
Sentences are defined as sequences of characters separated by one or more sentence-ending punctuation characters (e.g. `.`, `?`, `!`).

#### Syntax { #iwords-syntax }
`ISentences(Str: string): ((string) -> (number, number, string, string), string, number)`

#### Parameters { #iwords-parameters }
- `Str: string` <br/> The input string to iterate over its words.

#### Returns { #iwords-returns }
- {{FormatType("function")}} <br/>  An iterator function that returns the next sentence in the string on each call.
- {{FormatType("number")}} <br/> The start index of the sentence in the input string.
- {{FormatType("number")}} <br/> The end index of the sentence in the input string.
- {{FormatType("string")}} <br/> The sentence.
- {{FormatType("string")}} <br/>  The ending punctuation of the sentence (e.g. `.`, `?`, `!`).

#### Examples { #iwords-examples }
=== "Code Sample"
    ```lua linenums="1"
    local Sentences = {}
    local Str = "This is the first sentence. This is the second sentence! This is the third sentence?"

    for Start, End, Sentence, Ending in String.ISentences(Str) do
        table.insert(Sentences, {Start = Start, End = End, Sentence = Sentence, Ending = Ending})
    end

    print(table.unpack(Sentences))
    ```

=== "Expected Output"
    ```lua linenums="1"
    { Start = 1, End = 26, Sentence = "This is the first sentence", Ending = "." },
    { Start = 29, End = 55, Sentence = "This is the second sentence", Ending = "!" },
    { Start = 58, End = 83, Sentence = "This is the third sentence", Ending = "?" }
    ```
