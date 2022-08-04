#!/bin/bash

URL="wttr.in"

OUTPUT=$(curl -s $URL)

OUT=$(echo "$OUTPUT" | ~/bin/remove_vt100.sh) 

CURRENT_TEMP=$(echo "$OUT" | head -4 | tail -1 | grep -oE "\+[0-9]+\([0-9]+\) °C|[0-9]+ °C")
CONDITION=$(echo "$OUT" | head -3 | tail -1 | grep -oE "[A-Za-z]+([,]* [A-Za-z]+)*")
WEATHER_SYMBOL=$(~/bin/weather_code_description.sh "$CONDITION")

echo "${WEATHER_SYMBOL}  ${CURRENT_TEMP}"
