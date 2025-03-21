#!/bin/bash
# VIM_TEST_SETUP highlight link shArrayValue Identifier
# VIM_TEST_SETUP highlight link shBracketExprDelim Structure
# VIM_TEST_SETUP highlight link shCharClass Todo
# VIM_TEST_SETUP highlight link shRange CursorLine




[[ ( "$1" == ?(-)+([0-9]) && "$1" =~ ^-?[[:digit:]]+$ &&
'^?(-)+([[:digit:]])$' == "$2" && ! "^-?[0-9]+$" =~ "$2" ) ]] || :

[ \( "$1" != "?(-)+([0-9])" -a "$1" != '?(-)+([[:digit:]])' \) ] &&
[ \( "?(-)+([[:digit:]])" != "$2" -a '?(-)+([0-9])' != "$2" \) ] || :

# Match "\[0\]\[0\]", "{0}{0}", etc.
: [[{][0-9]*[]}][[{][[:digit:]]*[]}]
: [\
[{][0-9]*[]}][[{][[:digit:]]*[]}]
: [[\
{][0-9]*[]}][[{][[:digit:]]*[]}]
: [[{\
][0-9]*[]}][[{][[:digit:]]*[]}]
: [[{]\
[0-9]*[]}][[{][[:digit:]]*[]}]
: [[{][\
0-9]*[]}][[{][[:digit:]]*[]}]
: [[{][0-9\
]*[]}][[{][[:digit:]]*[]}]
: [[{][0-9]\
*[]}][[{][[:digit:]]*[]}]
: [[{][0-9]*\
[]}][[{][[:digit:]]*[]}]
: [[{][0-9]*[]\
}][[{][[:digit:]]*[]}]
: [[{][0-9]*[]}\
][[{][[:digit:]]*[]}]
: [[{][0-9]*[]}]\
[[{][[:digit:]]*[]}]
: [[{][0-9]*[]}][\
[{][[:digit:]]*[]}]
: [[{][0-9]*[]}][[\
{][[:digit:]]*[]}]
: [[{][0-9]*[]}][[{\
][[:digit:]]*[]}]
: [[{][0-9]*[]}][[{]\
[[:digit:]]*[]}]
: [[{][0-9]*[]}][[{][\
[:digit:]]*[]}]
: [[{][0-9]*[]}][[{][[:digit:]\
]*[]}]
: [[{][0-9]*[]}][[{][[:digit:]]\
*[]}]
: [[{][0-9]*[]}][[{][[:digit:]]*\
[]}]
: [[{][0-9]*[]}][[{][[:digit:]]*[]\
}]
: [[{][0-9]*[]}][[{][[:digit:]]*[]}\
]
: [[{][0-9]*[]}][[{][[:digit:]]*[[.].]}]
: [[{][0-9]*[]}][[{][[:digit:]]*[\
[.].]}]
: [[{][0-9]*[]}][[{][[:digit:]]*[[.].]\
}]
: [[{][0-9]*[]}][[{][[:digit:]]*[[.].]}\
]

# Match "\[0\]\[0\]", "{0}{0}", etc.
case "$1" in
[[{][0-9]*[]}][[{][[:digit:]]*[]}]*) : [0-9]; : [!0-9]; : [^0-9];;
[\
[{][0-9]*[]}][[{][[:digit:]]*[]}]*) : [0123]; : [!0123]; : [^0123];;
[[\
{][0-9]*[]}][[{][[:digit:]]*[]}]*) : [1[.0.]]; : [![.0.]]; : [^[.0.]^];;
[[{\
][0-9]*[]}][[{][[:digit:]]*[]}]*) : [1[=0=]]; : [![=0=]!]; : [^[=0=]];;
[[{]\
[0-9]*[]}][[{][[:digit:]]*[]}]*) ;;
[[{][\
0-9]*[]}][[{][[:digit:]]*[]}]*) ;;
[[{][0-9\
]*[]}][[{][[:digit:]]*[]}]*) : ?[[:foo:]]?; : [![:foo:]]?; : ?[^[:foo:]];;
[[{][0-9]\
*[]}][[{][[:digit:]]*[]}]*) : [[:digit:]]; : [![:digit:]]; : [^[:digit:]];;
[[{][0-9]*\
[]}][[{][[:digit:]]*[]}]*) : "${1^[[:lower:]]}"; : "${1^^[a-z]}";;
[[{][0-9]*[]\
}][[{][[:digit:]]*[]}]*) : "${1,[[:upper:]]}"; : "${1,,[A-Z]}";;
[[{][0-9]*[]}\
][[{][[:digit:]]*[]}]*) ;;
[[{][0-9]*[]}]\
[[{][[:digit:]]*[]}]*) ;;
[[{][0-9]*[]}][\
[{][[:digit:]]*[]}]*) : "${1#[[:digit:]]}"; : "${1##[0-9]}";;
[[{][0-9]*[]}][[\
{][[:digit:]]*[]}]*) : "${1%[[:digit:]]}"; : "${1%%[0-9]}";;
[[{][0-9]*[]}][[{\
][[:digit:]]*[]}]*) : "${1/[][:digit:][]/[0-9]}"; : "${1//[]0-9[]/[0-9]}";;
[[{][0-9]*[]}][[{]\
[[:digit:]]*[]}]*) : "${1/#[][:digit:][]/[0-9]}"; : "${1/%[]0-9[]/[0-9]}";;
[[{][0-9]*[]}][[{][\
[:digit:]]*[]}]*) ;;
[[{][0-9]*[]}][[{][[:digit:]\
]*[]}]*) ;;
[[{][0-9]*[]}][[{][[:digit:]]\
*[]}]*) : "${1#*[[.[.][.].]]}"; : "${1%[[.].][.[.]]*}"; : "${1#*" "[][]}";;
[[{][0-9]*[]}][[{][[:digit:]]*\
[]}]*) : "${1#*[[=[=][=]=]]}"; : "${1%[[=]=][=[=]]*}"; : "${1#*\ [!][]}";;
[[{][0-9]*[]}][[{][[:digit:]]*[]\
}]*) : "${1#*[!]]}"; : "${1#*[^]]}"; : "${1%[![]*}"; : "${1%[^[]*}";;
[[{][0-9]*[]}][[{][[:digit:]]*[]}\
]*) : "${1#*[!\]]}"; : "${1#*[^\]]}"; : "${1%[!\[]*}"; : "${1%[^\[]*}";;
[[{][0-9]*[]}][[{][[:digit:]]*[]}]\
*) ;;
[[{][0-9]*[]}][[{][[:digit:]]*[[.].]}]\
*) ;;
[[{][0-9]*[]}][[{][[:digit:]]*[\
[.].]}]*) ;;
[[{][0-9]*[]}][[{][[:digit:]]*[[.].]\
}]*) ;;
[[{][0-9]*[]}][[{][[:digit:]]*[[.].]}\
]*) ;;
[!][:digit:][:xdigit:]\ [^[:lower:]![:upper:]]*) ;;
[^][:digit:]0-9a-fA-F\ [![:lower:]^[:upper:]]*) ;;
[!!] | [!![] | [!]!] | [!^] | [!^[] | [!]^]) ;;
[^!] | [^![] | [^]!] | [^^] | [^^[] | [^]^]) ;;
esac

# Match "\[0\]\[0\]", "{0}{0}", etc.
: "${1#*[[{][0-9]*[]}][[{][[:digit:]]*[]}]}"
: "${1#*\
[[{][0-9]*[]}][[{][[:digit:]]*[]}]}"
: "${1#*[\
[{][0-9]*[]}][[{][[:digit:]]*[]}]}"
: "${1#*[[\
{][0-9]*[]}][[{][[:digit:]]*[]}]}"
: "${1#*[[{\
][0-9]*[]}][[{][[:digit:]]*[]}]}"
: "${1#*[[{]\
[0-9]*[]}][[{][[:digit:]]*[]}]}"
: "${1#*[[{][\
0-9]*[]}][[{][[:digit:]]*[]}]}"
: "${1#*[[{][0-9\
]*[]}][[{][[:digit:]]*[]}]}"
: "${1#*[[{][0-9]\
*[]}][[{][[:digit:]]*[]}]}"
: "${1#*[[{][0-9]*\
[]}][[{][[:digit:]]*[]}]}"
: "${1#*[[{][0-9]*[]\
}][[{][[:digit:]]*[]}]}"
: "${1#*[[{][0-9]*[]}\
][[{][[:digit:]]*[]}]}"
: "${1#*[[{][0-9]*[]}]\
[[{][[:digit:]]*[]}]}"
: "${1#*[[{][0-9]*[]}][\
[{][[:digit:]]*[]}]}"
: "${1#*[[{][0-9]*[]}][[\
{][[:digit:]]*[]}]}"
: "${1#*[[{][0-9]*[]}][[{\
][[:digit:]]*[]}]}"
: "${1#*[[{][0-9]*[]}][[{]\
[[:digit:]]*[]}]}"
: "${1#*[[{][0-9]*[]}][[{][\
[:digit:]]*[]}]}"
: "${1#*[[{][0-9]*[]}][[{][[:digit:]\
]*[]}]}"
: "${1#*[[{][0-9]*[]}][[{][[:digit:]]\
*[]}]}"
: "${1#*[[{][0-9]*[]}][[{][[:digit:]]*\
[]}]}"
: "${1#*[[{][0-9]*[]}][[{][[:digit:]]*[]\
}]}"
: "${1#*[[{][0-9]*[]}][[{][[:digit:]]*[]}\
]}"
: "${1#*[[{][0-9]*[]}][[{][[:digit:]]*[]}]\
}"
: "${1#*[[{][0-9]*[]}][[{][[:digit:]]*[[.].]}]}"
: "${1#*[[{][0-9]*[]}][[{][[:digit:]]*[\
[.].]}]}"
: "${1#*[[{][0-9]*[]}][[{][[:digit:]]*[[.].]\
}]}"
: "${1#*[[{][0-9]*[]}][[{][[:digit:]]*[[.].]}]\
}"

: *[x[=[=][=]=]]; : [x[=]=][=[=]]*; : *[x[.[.][.].]]; : [x[.].][.[.]]*
: *[[=[=]x[=]=]]; : [[=]=]x[=[=]]*; : *[[.[.]x[.].]]; : [[.].]x[.[.]]*
: *[[=[=][=]=]x]; : [[=]=][=[=]x]*; : *[[.[.][.].]x]; : [[.].][.[.]x]*
: [!]]; : [^]]; : [![]; : [^[]; : [!\]]; : [^\]]; : [!\[]; : [^\[]
: [$'\x5b']; : [$'\x5d']; : []]; : [[]; : [\]]; : [\[]
: [$'\x20'[]; : [" "[]; : [' '[]; : [\ []; : [\ \[]; : "${1#[ 	]}"
: [[$'\x20']; : [[" "]; : [[' ']; : [[\ ]; : [\[\ ]; : "${1#[	 ]}"
: [^$'\x20'[]; : [!" "[]; : [^' '[]; : [!\ []; : "${1#[^ 	]}"
: [![$'\x20']; : [^[" "]; : [![' ']; : [^[\ ]; : "${1#[!	 ]}"

nl='
'
echo "${1#${1%%[!"${nl}"]*}}"; echo "${1#${1%%[!'${nl}']*}}"
echo "${1#${1%%[!\"${nl}]*}}"; echo "${1#${1%%[!\'${nl}]*}}"
echo "${1#${1%%[!${nl}\"]*}}"; echo "${1#${1%%[!${nl}\']*}}"

bins=(); bins=(0 1); eval bins+=({0..1})
bins[0]=0; bins[1]=1; eval bins+=(\${bins[{1..0}]}); unset bins[3] bins[2]
bins=([8#0]=$((2#100)) [$((8#1))]=$((2#10)) [3]=${bins[2#1]} ${bins[0]})
(echo sum[$((bins[16#3] + bins[8#2] + bins[2#1] + bins[0]))])
eval unset bins[{0..$((${#bins[*]} - 1))}]
:
