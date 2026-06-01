source .env.banana
shopt -s globstar

for file in "$MARKDOWN_SOURCE"/**/*.md; do
    grep -q '#card' "$file" || continue
    CSV_CONTENT=$(awk -v sep="$CSV_SEPARATOR" -F':: ' '/^- / {gsub(/[[:space:]]*#card.*/, ""); gsub(/^- /, ""); q=$0; next} /card-/ {next} /^[[:space:]]+-/ {gsub(/^[[:space:]]+-\s*/, ""); print "\"" q "\"" sep "\"" $0 "\""}' "$file")

    TAG_PATH=$(awk '/^- .*#card/ {sub(/.*#card /, ""); print; exit}' "$file" | sed 's/#//g; s/[[:space:]][[:space:]]*/\//g')
    TARGET_PATH="$CSV_TARGET/$TAG_PATH"
    mkdir -p "$TARGET_PATH"

    echo "$CSV_CONTENT" > "$TARGET_PATH/$(basename "${file%.*}").csv"
done
