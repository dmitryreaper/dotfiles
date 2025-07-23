#!/bin/sh
wget -q -O /home/dima/Source/dotfiles/scripts/minsk https://myfin.by/currency/minsk
FILE="/home/dima/Source/dotfiles/scripts/minsk"
PATTERN='<div class="course-brief-info__b"><span class="accent">([0-9.]+)</span>'
COUNT=1
VALUES=""

# Поиск всех совпадений
while IFS= read -r line; do
    if echo "$line" | grep -qE "$PATTERN"; then
        # Извлекаем значение между тегами <span class="accent">...</span>
        VALUE=$(echo "$line" | grep -oE "$PATTERN" | sed -E 's/.*<span class="accent">([0-9.]+)<\/span>.*/\1/')
        
        # Добавляем найденное значение к общей строке
        VALUES="$VALUES $VALUE"
        COUNT=$((COUNT + 1))
        
        if [ "$COUNT" -eq 2 ]; then
            break
        fi
    fi
done < "$FILE"

# Выводим все значения в одну строку
echo $VALUES
