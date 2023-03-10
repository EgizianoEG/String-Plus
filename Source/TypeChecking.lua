local TypeChecking = {}

export type StringPlusPascal = {
	IsNumeric: (Str: string) -> boolean,
	IsInteger: (Str: string) -> boolean,
	IsAlpha: (Str: string) -> boolean,
	IsAlphaNum: (Str: string) -> boolean,
	IsBlank: (Str: string) -> boolean,
	IsEmpty: (Str: string) -> boolean,
	IsUpper: (Str: string) -> boolean,
	IsLower: (Str: string) -> boolean,
	IsASCII: (Str: string) -> boolean,
	IsTitle: (Str: string, Strict: boolean?) -> boolean,
	IsTagged: (Str: string, FullMatch: boolean?) -> boolean,
	IsHexColor: (Str: string, EnforceHash: boolean?) -> boolean,
	IsPalindrome: (Str: string, CaseSensitive: boolean?) -> boolean,
	Contains: (Str: string, SubStrings: (string | {string})) -> (boolean, string?, number, number),
	Starts: (Str: string, Prefixes: (string | {string})) -> boolean,
	Ends: (Str: string, Suffixes: (string | {string})) -> boolean,
	IsValidUsername: (Str: string) -> (boolean, string),
	PasswordValidate: (Password: string, EnforceStandardRequirements: boolean?) -> (boolean, number, string?),

	ISentences: (Str: string) -> ((string) -> (number, number, string, string), string, number),
	IWords: (Str: string) -> ((string, number) -> (number, number, string), string, number),
	ICharacters: (Str: string) -> ((string, number) -> (number, string), string, number),

	Random: (Length: number?, CharSetPattern: string?) -> string,
	RandomFromString: (Str: string, Length: number?, SameCharacterChances: boolean?) -> string,
	Generate: (Options: {CharSet: ({string} | string)?, TotalSections: number?, SectionLength: number?, Delimiter: string?, Prefix: string?, Suffix: string?}?) -> (string, {string}),

	UTF8Reverse: (Str: string) -> string,
	Stringify: (Table: {[any]: any}, IndentionSize: number?, IndentionCharacter: string?, IsRecursive: boolean?, Cache: {[any]: any}?, CIndention: number?) -> string,

	Escape: (Str: string) -> string,
	Truncate: (Str: string, Length: number, OmissionSuffix: string?) -> string,
	RemoveExtraSpaces: (Str: string) -> string,
	EqualsIgnoreCase: (Str_1: string, Str_2: string) -> boolean,
	RemoveVowels: (Str: string, Replacement: string?) -> string,
	RemoveConsonants: (Str: string, Replacement: string?) -> string,
	RemovePunctuation: (Str: string, Replacement: string?) -> string,
	MatchIgnoreCase: (Str: string, Pattern: string, Init: number?) -> string?,
	SwapCase: (Str: string) -> string,
	Strip: (Str: string, Characters: string?) -> string,
	RStrip: (Str: string, Characters: string?) -> string,
	LStrip: (Str: string, Characters: string?) -> string,
	Center: (Str: string, Length: number, FillChar: string?) -> string,
	RJust: (Str: string, Length: number, FillChar: string?) -> string,
	LJust: (Str: string, Length: number, FillChar: string?) -> string,
	ExpandTabs: (Str: string, TabSize: number?) -> string,
	Translate: (Str: string, MappingTable: {[number]: number}) -> string,
	Count: (Str: string, Pattern: string, Start: number?, End: number?) -> number,
	SortWords: (Str: string, Order: Enum.SortDirection?, ReturnArray: boolean?) -> ({string} | string),
	SortByLength: (StringArray: {string}, Order: Enum.SortDirection?) -> {string},
	FilterByLength: (StringArray: {string}, Length: number) -> {string},
	Segments: (Str: string, Length: number) -> {string},
	LongestWord: (Str: string) -> (string, number),
	ReverseWords: (Str: string) -> string,
	CamelCase: (Str: string) -> string,
	SnakeCase: (Str: string) -> string,
	UniqueWords: (Str: string, ReturnString: boolean?) -> ({string} | string),
	Expand: (Str: string, Subset: {[string | number]: any}) -> string,
	Distort: (Str: string, Percentage: number, ReplacementChars: {string}?) -> string,
	TitleCase: (Str: string, Strict: boolean?) -> string,
	Lines: (Str: string, KeepEnds: boolean?, ReturnAsATuple: boolean?) -> (...string | {string}),
	RFind: (Str: string, Sub: string, Start: number?, End: number?) -> (number?, number?),
	Partition: (Str: string, Separator: string, ReturnAsATuple: boolean?) -> (...string | {string}),
	RPartition: (Str: string, Separator: string, ReturnAsATuple: boolean?) -> (...string | {string}),
	BinaryEncode: (Str: string, Delimiter: string?) -> string,
	BinaryDecode: (BinaryStr: string) -> string,
	HexEncode: (Str: string) -> string,
	HexDecode: (HexStr: string) -> string?,
	Analyze: (Str: string) -> {
		LineCount: number,
		WordCount: number,
		AvgWordLength: number,
		UniqueWordCount: number,
		CommonWordCount: number,
		WordAppearCount: {[string]: number},
		ShortestWord: {Word: string, Length: number},
		LongestWord: {Word: string, Length: number},
		AllCharacterCount: number,
		AlphaCharacterCount: number,
		VowelCount: number,
		ConsonantCount: number,
		DigitCount: number,
		PunctuationCount: number,
	},

	--| Standard String Library Typechecking:   (Disable this multi-line comment if wanted)
    --[[
    Byte: (s: string, i: number, j: number) -> (...number),
    Char: (byte: number, ...number) -> string,
    Find: (s: string, pattern: string, init: number?, plain: boolean?) -> (number?, number?, ...string?),
    Format: (s: string, ...any) -> string,
    Gmatch: (s: string, pattern: string) -> (() -> string),
    Gsub: (s: string, pattern: string, replacement: string | {[string]: string} | ((...string) -> string), replacements: number?) -> (string, number),
    Len: (s: string) -> number,
    Lower: (s: string) -> string,
    Match: (s: string, pattern: number, init: number?) -> (...string?),
    Pack: (format: string, ... any) -> string,
    Packsize: (format: string) -> number,
    Rep: (s: string, n: number) -> string,
    Reverse: (s: string) -> string,
    Split: (s: string, separator: string?) -> {string},
    Sub: (s: string, i: number, j: number) -> string,
    Unpack: (format: string, data: string, readStart: string?) -> (...any),
    Upper: (s: string) -> string,
    ]]
}

export type StringPlusLowered = {
	isnumeric: (Str: string) -> boolean,
	isinteger: (Str: string) -> boolean,
	isalpha: (Str: string) -> boolean,
	isalphanum: (Str: string) -> boolean,
	isblank: (Str: string) -> boolean,
	isempty: (Str: string) -> boolean,
	isupper: (Str: string) -> boolean,
	islower: (Str: string) -> boolean,
	isascii: (Str: string) -> boolean,
	istitle: (Str: string, Strict: boolean?) -> boolean,
	istagged: (Str: string, FullMatch: boolean?) -> boolean,
	ishexcolor: (Str: string, EnforceHash: boolean?) -> boolean,
	ispalindrome: (Str: string, CaseSensitive: boolean?) -> boolean,
	contains: (Str: string, SubStrings: (string | {string})) -> (boolean, string?, number, number),
	starts: (Str: string, Prefixes: (string | {string})) -> boolean,
	ends: (Str: string, Suffixes: (string | {string})) -> boolean,
	isvalidusername: (Str: string) -> (boolean, string),
	passwordvalidate: (Password: string, EnforceStandardRequirements: boolean?) -> (boolean, number, string?),

	isentences: (Str: string) -> ((string) -> (number, number, string, string), string, number),
	iwords: (Str: string) -> ((string, number) -> (number, number, string), string, number),
	icharacters: (Str: string) -> ((string, number) -> (number, string), string, number),

	random: (Length: number?, CharSetPattern: string?) -> string,
	randomfromstring: (Str: string, Length: number?, SameCharacterChances: boolean?) -> string,
	generate: (Options: {CharSet: ({string} | string)?, TotalSections: number?, SectionLength: number?, Delimiter: string?, Prefix: string?, Suffix: string?}?) -> (string, {string}),

	utf8reverse: (Str: string) -> string,
	stringify: (Table: {[any]: any}, IndentionSize: number?, IndentionCharacter: string?, IsRecursive: boolean?, Cache: {[any]: any}?, CIndention: number?) -> string,

	escape: (Str: string) -> string,
	truncate: (Str: string, Length: number, OmissionSuffix: string?) -> string,
	removeextraspaces: (Str: string) -> string,
	equalsignorecase: (Str_1: string, Str_2: string) -> boolean,
	removevowels: (Str: string, Replacement: string?) -> string,
	removeconsonants: (Str: string, Replacement: string?) -> string,
	removepunctuation: (Str: string, Replacement: string?) -> string,
	matchignorecase: (Str: string, Pattern: string, Init: number?) -> string?,
	swapcase: (Str: string) -> string,
	strip: (Str: string, Characters: string?) -> string,
	rstrip: (Str: string, Characters: string?) -> string,
	lstrip: (Str: string, Characters: string?) -> string,
	center: (Str: string, Length: number, FillChar: string?) -> string,
	rjust: (Str: string, Length: number, FillChar: string?) -> string,
	ljust: (Str: string, Length: number, FillChar: string?) -> string,
	expandtabs: (Str: string, TabSize: number?) -> string,
	translate: (Str: string, MappingTable: {[number]: number}) -> string,
	count: (Str: string, Pattern: string, Start: number?, End: number?) -> number,
	sortwords: (Str: string, Order: Enum.SortDirection?, ReturnArray: boolean?) -> ({string} | string),
	sortbylength: (StringArray: {string}, Order: Enum.SortDirection?) -> {string},
	filterbylength: (StringArray: {string}, Length: number) -> {string},
	segments: (Str: string, Length: number) -> {string},
	longestword: (Str: string) -> (string, number),
	reversewords: (Str: string) -> string,
	camelcase: (Str: string) -> string,
	snakecase: (Str: string) -> string,
	uniquewords: (Str: string, ReturnString: boolean?) -> ({string} | string),
	expand: (Str: string, Subset: {[string | number]: any}) -> string,
	titlecase: (Str: string, Strict: boolean?) -> string,
	distort: (Str: string, Percentage: number, ReplacementChars: {string}?) -> string,
	lines: (Str: string, KeepEnds: boolean?, ReturnAsATuple: boolean?) -> (...string | {string}),
	rfind: (Str: string, Sub: string, Start: number?, End: number?) -> (number?, number?),
	partition: (Str: string, Separator: string, ReturnAsATuple: boolean?) -> (...string | {string}),
	rpartition: (Str: string, Separator: string, ReturnAsATuple: boolean?) -> (...string | {string}),
	binaryencode: (Str: string, Delimiter: string?) -> string,
	binarydecode: (BinaryStr: string) -> string,
	hexencode: (Str: string) -> string,
	hexdecode: (HexStr: string) -> string?,
	analyze: (Str: string) -> {
		LineCount: number,
		WordCount: number,
		AvgWordLength: number,
		UniqueWordCount: number,
		CommonWordCount: number,
		WordAppearCount: {[string]: number},
		ShortestWord: {Word: string, Length: number},
		LongestWord: {Word: string, Length: number},
		AllCharacterCount: number,
		AlphaCharacterCount: number,
		VowelCount: number,
		ConsonantCount: number,
		DigitCount: number,
		PunctuationCount: number,
	},

	--| Standard String Library Typechecking:   (Disable this multi-line comment if wanted)
    --[[
    byte: (s: string, i: number, j: number) -> (...number),
    char: (byte: number, ...number) -> string,
    find: (s: string, pattern: string, init: number?, plain: boolean?) -> (number?, number?, ...string?),
    format: (s: string, ...any) -> string,
    gmatch: (s: string, pattern: string) -> (() -> string),
    gsub: (s: string, pattern: string, replacement: string | {[string]: string} | ((...string) -> string), replacements: number?) -> (string, number),
    len: (s: string) -> number,
    lower: (s: string) -> string,
    match: (s: string, pattern: number, init: number?) -> (...string?),
    pack: (format: string, ... any) -> string,
    packsize: (format: string) -> number,
    rep: (s: string, n: number) -> string,
    reverse: (s: string) -> string,
    split: (s: string, separator: string?) -> {string},
    sub: (s: string, i: number, j: number) -> string,
    unpack: (format: string, data: string, readStart: string?) -> (...any),
    upper: (s: string) -> string,
    ]]
}

export type StringPlusCamel = {
	isNumeric: (Str: string) -> boolean,
	isInteger: (Str: string) -> boolean,
	isAlpha: (Str: string) -> boolean,
	isAlphaNum: (Str: string) -> boolean,
	isBlank: (Str: string) -> boolean,
	isEmpty: (Str: string) -> boolean,
	isUpper: (Str: string) -> boolean,
	isLower: (Str: string) -> boolean,
	isASCII: (Str: string) -> boolean,
	isTitle: (Str: string, Strict: boolean?) -> boolean,
	isTagged: (Str: string, FullMatch: boolean?) -> boolean,
	isHexColor: (Str: string, EnforceHash: boolean?) -> boolean,
	isPalindrome: (Str: string, CaseSensitive: boolean?) -> boolean,
	contains: (Str: string, SubStrings: (string | {string})) -> (boolean, string?, number, number),
	starts: (Str: string, Prefixes: (string | {string})) -> boolean,
	ends: (Str: string, Suffixes: (string | {string})) -> boolean,
	isValidUsername: (Str: string) -> (boolean, string),
	passwordValidate: (Password: string, EnforceStandardRequirements: boolean?) -> (boolean, number, string?),

	iSentences: (Str: string) -> ((string) -> (number, number, string, string), string, number),
	iWords: (Str: string) -> ((string, number) -> (number, number, string), string, number),
	iCharacters: (Str: string) -> ((string, number) -> (number, string), string, number),

	random: (Length: number?, CharSetPattern: string?) -> string,
	randomFromString: (Str: string, Length: number?, SameCharacterChances: boolean?) -> string,
	generate: (Options: {CharSet: ({string} | string)?, TotalSections: number?, SectionLength: number?, Delimiter: string?, Prefix: string?, Suffix: string?}?) -> (string, {string}),

	uTF8Reverse: (Str: string) -> string,
	stringify: (Table: {[any]: any}, IndentionSize: number?, IndentionCharacter: string?, IsRecursive: boolean?, Cache: {[any]: any}?, CIndention: number?) -> string,

	escape: (Str: string) -> string,
	truncate: (Str: string, Length: number, OmissionSuffix: string?) -> string,
	removeExtraSpaces: (Str: string) -> string,
	equalsIgnoreCase: (Str_1: string, Str_2: string) -> boolean,
	removeVowels: (Str: string, Replacement: string?) -> string,
	removeConsonants: (Str: string, Replacement: string?) -> string,
	removePunctuation: (Str: string, Replacement: string?) -> string,
	matchIgnoreCase: (Str: string, Pattern: string, Init: number?) -> string?,
	swapCase: (Str: string) -> string,
	strip: (Str: string, Characters: string?) -> string,
	rStrip: (Str: string, Characters: string?) -> string,
	lStrip: (Str: string, Characters: string?) -> string,
	center: (Str: string, Length: number, FillChar: string?) -> string,
	rJust: (Str: string, Length: number, FillChar: string?) -> string,
	lJust: (Str: string, Length: number, FillChar: string?) -> string,
	expandTabs: (Str: string, TabSize: number?) -> string,
	translate: (Str: string, MappingTable: {[number]: number}) -> string,
	count: (Str: string, Pattern: string, Start: number?, End: number?) -> number,
	sortWords: (Str: string, Order: Enum.SortDirection?, ReturnArray: boolean?) -> ({string} | string),
	sortByLength: (StringArray: {string}, Order: Enum.SortDirection?) -> {string},
	filterByLength: (StringArray: {string}, Length: number) -> {string},
	segments: (Str: string, Length: number) -> {string},
	longestWord: (Str: string) -> (string, number),
	reverseWords: (Str: string) -> string,
	camelCase: (Str: string) -> string,
	snakeCase: (Str: string) -> string,
	uniqueWords: (Str: string, ReturnString: boolean?) -> ({string} | string),
	expand: (Str: string, Subset: {[string | number]: any}) -> string,
	distort: (Str: string, Percentage: number, ReplacementChars: {string}?) -> string,
	titleCase: (Str: string, Strict: boolean?) -> string,
	lines: (Str: string, KeepEnds: boolean?, ReturnAsATuple: boolean?) -> (...string | {string}),
	rFind: (Str: string, Sub: string, Start: number?, End: number?) -> (number?, number?),
	partition: (Str: string, Separator: string, ReturnAsATuple: boolean?) -> (...string | {string}),
	rPartition: (Str: string, Separator: string, ReturnAsATuple: boolean?) -> (...string | {string}),
	binaryEncode: (Str: string, Delimiter: string?) -> string,
	binaryDecode: (BinaryStr: string) -> string,
	hexEncode: (Str: string) -> string,
	hexDecode: (HexStr: string) -> string?,
	analyze: (Str: string) -> {
		LineCount: number,
		WordCount: number,
		AvgWordLength: number,
		UniqueWordCount: number,
		CommonWordCount: number,
		WordAppearCount: {[string]: number},
		ShortestWord: {Word: string, Length: number},
		LongestWord: {Word: string, Length: number},
		AllCharacterCount: number,
		AlphaCharacterCount: number,
		VowelCount: number,
		ConsonantCount: number,
		DigitCount: number,
		PunctuationCount: number,
	},

	--| Standard String Library Typechecking:   (Disable this multi-line comment if wanted)
    --[[
    byte: (s: string, i: number, j: number) -> (...number),
    char: (byte: number, ...number) -> string,
    find: (s: string, pattern: string, init: number?, plain: boolean?) -> (number?, number?, ...string?),
    format: (s: string, ...any) -> string,
    gmatch: (s: string, pattern: string) -> (() -> string),
    gsub: (s: string, pattern: string, replacement: string | {[string]: string} | ((...string) -> string), replacements: number?) -> (string, number),
    len: (s: string) -> number,
    lower: (s: string) -> string,
    match: (s: string, pattern: number, init: number?) -> (...string?),
    pack: (format: string, ... any) -> string,
    packsize: (format: string) -> number,
    rep: (s: string, n: number) -> string,
    reverse: (s: string) -> string,
    split: (s: string, separator: string?) -> {string},
    sub: (s: string, i: number, j: number) -> string,
    unpack: (format: string, data: string, readStart: string?) -> (...any),
    upper: (s: string) -> string,
    ]]
}

return TypeChecking