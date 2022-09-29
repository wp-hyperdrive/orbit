#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

while read -r LINE
do
    KEY=$(TMP=${LINE:8:19}; echo ${TMP%\'*})
    VALUE=${LINE:28:-3}
    echo "${KEY}='${VALUE}'" >> $SCRIPT_DIR/../.env
done <<<"$(wget https://api.wordpress.org/secret-key/1.1/salt/ -q -O -)"
