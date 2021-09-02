#!/bin/sh

#should set TOKEN, SERVER, BUCKET and ORG variables
. secrets 

if [ $# -lt 2 ]; then
    echo "Usage: $0 \"series NAME\"  \"line data\""
    exit
fi

NAME=$1
COLUMNS=$2
POINTS=$3

for COLUMN in $COLUMNS; do
  PAYLOAD=${PAYLOAD:+$PAYLOAD,}$COLUMN=${POINTS%% *}
  POINTS=${POINTS#* }
done
PAYLOAD=$NAME' '$PAYLOAD

curl --request POST "https://$SERVER/api/v2/write?org=$ORG&bucket=$BUCKET&precision=s" \
  --header "Authorization: Token $TOKEN" \
  --data-raw "$PAYLOAD"
  # --data-raw "$PAYLOAD $(date +%s)"
