#!/bin/sh

wget -q -O /home/dima/Source/dotfiles/scripts/1.html https://www.gismeteo.by/weather-pinsk-4914/
FILE_PATH="/home/dima/Source/dotfiles/scripts/1.html"

# Поиск строки с "temperatureAir" и извлечение значения
TEMPERATURE=$(grep -oE '"temperatureAir":\[-?[0-9]+\]' "$FILE_PATH" | cut -d '[' -f2 | tr -d ']')
TEMPERATUREHEAT=$(grep -oE '"temperatureHeatIndex":\[-?[0-9]+\]' "$FILE_PATH" | cut -d '[' -f2 | tr -d ']')

# Проверка, найдено ли значение
if [ -n "$TEMPERATURE" ]; then
    echo "󰖐  Pinsk $TEMPERATURE/$TEMPERATUREHEAT"

else
    echo "Значение temperatureAir не найдено."
fi
