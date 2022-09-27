#! /bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

while read -r LINE
do
    KEY=$(TMP=${LINE:8:19}; echo ${TMP%\'*})
    VALUE=$(TMP=${LINE:28:-3}; echo $TMP|sed -e 's/\\/\\\\/g')
    # echo $KEY;
    # echo $VALUE;
    # php -R 'echo preg_replace("");' $SCRIPT_DIR/../.env
    # echo "s|$KEY=.*|$KEY='${VALUE}'|" $SCRIPT_DIR/../.env
    # sed -i -r "s|${KEY}=.*|${KEY}='${VALUE}'|" $SCRIPT_DIR/../.env
    echo "${KEY}='${VALUE}'" >> $SCRIPT_DIR/../.env
done <<<"$(wget https://api.wordpress.org/secret-key/1.1/salt/ -q -O -)"
