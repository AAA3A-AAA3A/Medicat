Hybrid attack rules.

:	Do nothing to the input word
	Example: password

{ 	Rotate left.
	Example: asswordp

} 	Rotate right
	Example: dpasswor

[ 	Delete first character
	Example:assword

] 	Delete last character
	Example: passwor

c 	Capitalize
	Example: Password

C 	Lowercase the first character, uppercase the rest
	Example: pASSWORD

d 	Duplicate word
	Example: password -> passwordpassword

f 	Reflect word
	Example: password -> passworddrowssap

k	Convert word using alternative (first after default) keyboard layout. The rule works in both directions. For example, if there's Russian keyboard layout installed previously in the system, the rule should convert word 'password' to Russian 'çôûûöùêâ', and Russian word 'ïàðîëü' to 'gfhjkm'. This is very helpful when looking for non-English passwords. If only one language is installed in the system, the rule does nothing.
	Example: password -> çôûûöùêâ

K	Swap last two characters
	Example: password -> passwodr

l 	Convert all characters to lowercase

q 	Duplicate all symbols
	Example: password -> ppaasssswwoorrdd

r 	Reverse word
	Example: password -> drowssap

t 	Toggle case of all characters
	Example: PassWord -> pASSwORD

u 	Convert to uppercase
	Example: password -> PASSWORD

U 	Capitalize all words delimited with space (upper-case the first character and every character after a space)
	Example: very good password -> Very Good Password

V 	Vowels elite
	Example: password -> PaSSWoRD

v 	Vowels noelite
	Example: password -> pASSWoRD


============================================================
'N 	Truncate the word to N character(s) length
	Example: '4 -> password -> pass

+N	Increment character at position N by 1 ASCII value
	Example: +1 -> password -> pbssword

-N	Decrement character at position N by 1
	Example: -0 -> password -> oassword

.N	Replace character at position N with character at position N+1
	Example: .4 -> password -> passoord

,N	Replace character at position N with character at position N-1. Where N > 0.
	Example: ,1 -> password -> ppssword

<N 	Reject the word if it is greater than N characters long

>N 	Reject the word if it is less than N characters long

_N	Reject the word if it's length is not equal to N

aN 	Check all possible symbol cases for the word. N is a maximal length of the word to apply this rule for. Be careful, this rule generates 2^N variants for each word (where N is the word's length).

DN 	Delete the character at position N
	Example: D2D2 -> password -> paword

pN 	Copy word N times. N = 3 .. 9
	Example: p3 -> password -> passwordpasswordpassword

SLN	Bitwise shift left character at position N
	Example: SL2 -> 012345678 -> 01d345678

SRN	Bitwise shift right character at position N
	Example: SR2 -> password -> pa9sword

TN 	Toggle case of the character at position N
	Example: T1T5 -> password -> pAsswOrd

yN	Duplicate first N characters
	Example: y3 -> password -> paspasword

YN	Duplicate last N characters
	Example: Y3 -> password -> paswordord

zN 	Duplicate the first character of the word N times
	Example: z3 -> password -> ppppassword

ZN 	Duplicate the last character of the word N times
	Example: Z3 -> password -> passwordddd


============================================================
$X 	Add character X to the end of the word
	Example: $0$0$7 -> password -> password007

^X 	Insert character X at the beginning of the word
	Example: ^3^2^1 -> password -> 123password

@X 	Remove all characters X from the word
	Example: @s -> password -> paword

!X 	Reject the word if it contains at least one character X

/X 	Reject the word if it does not contain character X

(X 	Reject the word if the first character is not X

)X 	Reject the word if the last character is not X

eX	Extract a substring starting at position 0 and ending up before first occurrence of X character (do nothing if X is not found)
	Example: e@ -> username@domain.com -> username

EX	Extract a substring starting right after first found X character and till the end of the string (do nothing if X is not found)
	Example: E@e. -> username@domain.com -> domain


============================================================
%MX 	Reject the word if it does not contain at least M instances of the character X

*MN	Swap character at position M with character at position N
	Example: *15 -> password -> possward

=NX 	Reject the word if the character at position N is not equal to the X

iNX 	Insert the character X in position N
	Example: i4ai5bi6c -> password -> passabcword

oNX 	Overwrite a character in position N with the character X
	Example: o4Ao5Bo6C -> password -> passABCd

sXY 	Replace all characters X with Y
	Example: ss$so0 -> password -> pa$$w0rd

xNM 	Extract a substring of up to M characters length, starting from position N.
	Example: x4Z -> password -> word


============================================================
INX-Y	Insert the character X at position N if previous character at position N is not Y
	Example: rI0/-/r -> google.com -> google.com/
		rI0/-/r -> google.com/ -> google.com/

INX+Y	Insert the character X at position N if previous character at position N is Y
	Example: rI0.+.r -> password. -> password..

ONX-Y	If the character at position N is not Y, overwrite it with X character
	Example: O0-+p -> password -> -assword

ONX+Y	If the character at position N is Y, overwrite it with X character
	Example: O0P+p -> password -> Password

RNM+Y	Remove character at position N if character at position M is Y
	Example: R01+a -> password -> assword

RNM-Y	Remove character at position N if character at position M is not Y
	Example: R40-b -> password -> passord


============================================================
?iN[C]	Insert a character from a charset [C] into position N of the word. Where C should be either a predefined charset name or a custom character set itself.
	Example: ?i0[digits]	-> password -> 0password, 1password ... 9password

?iZ[C]	Insert a character from a charset [C] into last position of the word. Where C should be either a predefined charset name or a custom character set itself.
	Example: ?iZ[digits]	-> password -> password0, password1 ... password9

?i[C]	Insert a character from a charset [C] into every position of the word. Where C should be either a predefined charset name or a custom character set itself.
	Example: ?i[special]	-> password -> ~password, !password ... password_, password+

?oN[C]	Overwrite a character at position N with a character taken from a charset [C]. Where C should be either a predefined charset name or a custom character set itself.
	Example: ?o1[upperalpha] -> password -> pAssword, pBssword ... pZssword

?oZ[C]	Overwrite a character at last position with a character taken from a charset [C]. Where C should be either a predefined charset name or a custom character set itself.
	Example: ?oZ[upperalpha] -> password -> passworA, passworB ... passworZ

?o[C]	Overwrite a character at every position of the word with a character taken from a charset [C]. Where C should be either a predefined charset name or a custom character set itself.
	Example: ?o[-=.]	 -> password -> -assword, =assword ... passwor.


============================================================
Rules are processed from the left to the right.
Several rules at a line are allowed.
Maximal line length is limited to 256 characters.
Maximal output word length is limited to 256 characters.
White space is ignored as long as it is not used as a parameter.
A line started with # character considered as a comment
All text before the [Rules] line is considered as a comment.
N and M always start at 0. For values greater than 9 use A..Z (A=10, B=11, etc.)
The following rules should be at the last position of a line: aN, ?iN[C], ?i[C], ?oN[C], ?o[C], ?iZ[C], ?oZ[C]
Don't change the names of the standard rule files. Some ones are used by the program.
?iN[C], ?i[C], ?oN[C], ?o[C]  ?iZ[C], ?oZ[C] rules use the following predefined charsets:
hex		  - 0123456789abcdefABCDEF
digits		  - 0123456789
loweralpha 	  - abcdefghijklmnopqrstuvwxyz
upperalpha	  - ABCDEFGHIJKLMNOPQRSTUVWXYZ
alpha		  - abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
special		  - !@#$%^&*()-_+=~`[]{}|\:;"'<>,.?/ "
loweralphanumeric - abcdefghijklmnopqrstuvwxyz0123456789
upperalphanumeric - ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
alphanumeric	  - abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
printable	  - abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_+=~`[]{}|\:;"'<>,.? /


============================================================
= The rules below can be used as a lifehack. For example, when processing/creating/wiping dictionaries in wordlist tools.
= They are not supported by GPU attacks!
============================================================
?r[C]	Reject the word if all characters correspond to [C] charset
	Example: ?r[hex]	 -> the following words will be rejected: 827ccb0eea8a706c4c34a16891f84e7b, 1287cc923d9883518618321480f02ba5.
	Be careful setting [hex]. 123, 123456, 87654321 (numeric), 1bca8ef49 (odd), 1AD40FB (odd), 1AD40FF874CD (les than 16 chars) etc. are not considered by the program to be a hex.
	To overwrite the default behaviour for the ?r[hex], just change it to ?r[0123456789abcdefABCDEF]

?r-[C]	Reject the word if all characters do not correspond to [C] charset
	Example: ?r[digits]	 -> the following words will be rejected: sample, doitnow, !@#$%.

?r+[C]	Reject the word if at least one character corresponds to [C] charset
	Example: ?r![alpha]	 -> the following words will be rejected: 12345a, 1qaz2wsx, -mnbvcxz-

?p[C]	Remove a pattern at any position of input word. This rule is case insensitive.
	Example: ?p[ass]	 -> passmyass -> pmy

?pN[C]	Remove a pattern at position N of the word. This rule is case insensitive.
	Example: ?p1[ass]	 -> passmyass -> pmyass

?pZ[C]	Remove a pattern at the last position of the word. This rule is case insensitive.
	Example: ?pZ[ass]	 -> passmyass -> passmy

?p>[C]	Remove the given pattern and all characters after it
	Example: ?p>[ | ]	 -> 'name | mail' -> name

?p<[C]	Remove the given pattern and all characters before it
	Example: ?p<[ | ]	 -> 'name | mail' -> mail


============================================================
= The rules below are optional when running GPU hybrid attack on Domain Cached Credentials type 2.
= You can turn them on/off in general options. The option affects DCC2 hashes only.
= When set off, the rules will be skipped when running a GPU  Hybrid attack for DCC2 hashes.
= Setting them on may cause the GPU to hang or pop up with a error, depending on GPU execution timeout settings.
============================================================
aN
INX-Y
INX+Y
ONX-Y
ONX+Y
RNM+Y
RNM-Y
