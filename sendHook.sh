#!/usr/bin/env bash

counter=0
info=()
WEBHOOK=""
URL=$(curl -s localhost:4040/api/tunnels | jq -r  )
echo $URL

while [ $counter -le 20 ]
    do

       NAME=`echo "$URL" | jq -r .tunnels[$counter].name`
       PUBLIC=`echo "$URL" | jq -r .tunnels[$counter].public_url`

        if [ $PUBLIC == null ]
        then
            :
        else
            info+=("\n $NAME: $PUBLIC")
        fi
        ((counter++))

done
var="$( echo ${info[@]} )"

JSON='{
   "username":"NGROK URL WEBHOOK",
   "embeds":[
      {
         "title":"NGrok URLS",
         "description": "'$var'"
      }
   ]
}'


curl -H "Content-Type: application/json" -X POST -d "$JSON" $WEBHOOK