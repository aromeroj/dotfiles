#!/bin/bash

INET_STATUS=$(~/bin/internet_status.sh)

if [[ $INET_STATUS == "DN" ]]; then
   echo "${INET_STATUS}"
   exit 1
fi 

MY_ADDR=$(dig +short myip.opendns.com @resolver1.opendns.com)

URL="http://api.weatherstack.com/current?access_key=<KEY>&query=$MY_ADDR&units=m"

OUTPUT=$(curl -s $URL)

CURR_TEMP=$(echo "$OUTPUT" | jq .current.temperature)
WEATHER_CODE=$(echo "$OUTPUT" | jq .current.weather_code)

WEATHER_SYMBOL=$(~/bin/weather_code_description.sh "$WEATHER_CODE")

echo "${WEATHER_SYMBOL}  ${CURR_TEMP}°C"
