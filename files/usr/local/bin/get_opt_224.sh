#!/usr/bin/env bash

hex2ascii () {
        I=0
        while [ $I -lt ${#1} ]
        do                echo -en "\x"${1:$I:2}
                let "I += 2"
        done
}

jq_parse () {
        jq -r 'map(select(."result-option-no"?)) | map(select(any(."result-option-no"; contains("224")))) | .[1]."result-data"' | tr -d ' '
}

hex_str=$(dhtest -c 97,hex,'52706934' -V -i eth0 -j 2>/dev/null | jq_parse)
hex2ascii "${hex_str}"
