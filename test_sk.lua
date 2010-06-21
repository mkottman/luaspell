require 'spell'

-- dictionaries from http://sk-spell.sk.cx/hunspell-sk
local sp = spell('/usr/share/hunspell/sk_SK.aff', '/usr/share/hunspell/sk_SK.dic')

-- text from http://sk.wikipedia.org/wiki/Slovensko , mistakes by me :)
local text = [[
Prezident Slovenskej republiky je spolu s premiérom a predsedom parlamentu najvyšším ústavným činiteľom v krajine (Z tohto dôvodu, napríklad, nemvôžu títo páni nikdaj letieť spolu v jednom lietadle). Jeho funkcia je však skôr formálna. Medzi jeho právomoci patrí napríklad poverovanie budúzeho premiéra zostavením vlády, ktorú následne vymenuje. Ďaľej disponuje tzv. malým vetom, to značí, že môže vrátiť zákon na opätovné posúdenie Národnou radou. Na prehlasovanie tohto malého veta treba Národnej rade nadpolovičnú väčinu všetkých poslancov, t.j. minimálne 76. Pred malým prezidentským vetom stačila nadpolovičná väčšina prítomných poslancov, v prípade, že bol parlament uznášaniaschopný, t.j. bolo potrebných minimálne 38 poslaneckých hlasov. Prezident okrem toho vyberá ústavných sudcov spomedzi dvojnásobného počtu kanditátov schválených Národnou radou či udeľuje vyznamenania. Prezident je hlavou štátu.
]]

for w in text:gmatch('[%w\194-\244\128-\191]+') do
	local ok = sp:spell(w)
	print(ok, w)
	if ok then
		local analysis = sp:analyze(w)
		local stems = sp:stem(w)
		print('@', unpack(analysis))
		print('#', unpack(stems))
	else
		local suggest = sp:suggest(w)
		print('$', unpack(suggest))
	end
	print()
end


