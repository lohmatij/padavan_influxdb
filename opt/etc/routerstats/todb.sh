#!/bin/sh

DIR=$(dirname "$0")

#should set TOKEN, SERVER, BUCKET and ORG variables
. "$DIR"/secrets 

# function join { local IFS="$1"; shift; echo "$*"; }

if [ $# -lt 3 ]; then
    echo "Usage: $0 \"series name\" \"columns\" \"points\""
    exit
fi

i=1
payload=''

for c in $2
do
	value=$( echo "$3" | cut -d' ' -f$i )
	payload="$payload $1"
	if [ -n  "$4" ] && [ "$4" != " " ]
	then
		payload="$payload,$4"
	fi
	payload="$payload $c=$value"$'\n'
	i=$((i+1))
done

curl --request POST "https://$SERVER/api/v2/write?org=$ORG&bucket=$BUCKET&precision=s" \
  --header "Authorization: Token $TOKEN" \
  --data-raw "$payload"

#curl -i -XPOST "http://$dbhost/write?db=$dbname" --data-binary "$payload"
