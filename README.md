LuaSpell
--------

A Lua binding to the Hunspell spell checking engine. It is a thin wrapper over `libhunspell`.

Compiling
---------

To compile the binding, you need the `libhunspell-dev` package (Ubuntu), or compile libhunspell yourself. You can use the included CMake file to automatically find Lua and libhunspell and generate a Unix Makefile (or you can do it manually, it's very simple).

Usage
-----

    local spell = require 'spell' 

`spell` is a function that opens a dictionary and creates a spelling context.

    local sc = spell('/usr/share/hunspell/en_US.aff', '/usr/share/hunspell/en_US.dic')

`sc` is a hunspell context bound to an affix and dictionary file. It's methods closely follow the methods in include/hunspell/hunspell.cxx:

* `sc:add_dic(dic_path:string [, key:string])` - load extra dictionaries (only dic files)
* `sc:spell(word:string) -> boolean`  - returns true, if the word is spelled correctly
* `sc:suggest(word:string) -> table` - returns a table of suggestions for the word (or empty table)
* `sc:analyze(word:string) -> table` - returns a table with morphological analysis of word
* `sc:stem(word:string) -> table` - returns a table of stems of word
* `sc:generate(word:string, example:string) -> table` - generate word(s) by example
* `sc:generate(word:table, desc:table) -> table` - generate word(s) by description (dictionary dependent)
* `sc:add_word(word:string) -> nothing` - adds a word to the main dictionary (in memory)
* `sc:get_dic_encoding() -> string` - returns the current encoding (dictionary dependent)

License
-------

Copyright (c) 2010 Michal Kottman

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

