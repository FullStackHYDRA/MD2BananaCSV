source .env.banana
shopt -s globstar

rm -rf "$CSV_TARGET"/* 2>/dev/null

echo "Syncing CSV files with MD files from $MARKDOWN_SOURCE..."

for file in "$MARKDOWN_SOURCE"/**/*.md; do
    [ -f "$file" ] || continue
    
    echo "Found file at $file"
    grep -q '#card' "$file" || continue

    while IFS= read -r line; do
        line=$(echo "$line" | tr -d '\r')

        if [[ "$line" =~ ^[[:blank:]]*-.*#card ]]; then
            question=$(echo "$line" | sed -E 's/^[[:blank:]]*-//; s/[[:blank:]]*#card.*//')
            question=$(echo "$question" | sed -E 's/^[[:blank:]]*//;s/[[:blank:]]*$//')
            
            clean_tags=$(echo "$line" | sed -E 's/.*#card[[:blank:]]*//; s/#//g')
            tag_path=$(echo $clean_tags | tr ' ' '/')
            
            mkdir -p "$CSV_TARGET/$tag_path"
            
            IFS= read -r next_line
            next_line=$(echo "$next_line" | tr -d '\r')
            
            if [[ "$next_line" =~ ^[[:blank:]]+-[[:blank:]]+ ]]; then
                answer=$(echo "$next_line" | sed -E 's/^[[:blank:]]*-//')
                answer=$(echo "$answer" | sed -E 's/^[[:blank:]]*//;s/[[:blank:]]*$//')
                
                target_file="$CSV_TARGET/$tag_path/$(basename "${file%.*}").csv"
                echo "\"$question\"$CSV_SEPARATOR\"$answer\"" >> "$target_file"
            fi
        fi
    done < "$file"
    echo "    Contains flashcards: CSV written"
done

echo "Successfully synced all .md files!"