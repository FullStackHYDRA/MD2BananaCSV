source .env.banana

CSV_CONTENT=$(awk -F':: ' '/^- / {gsub(/[[:space:]]*#card.*/, ""); gsub(/^- /, ""); q=$0; next} /card-/ {next} /^[[:space:]]+-/ {gsub(/^[[:space:]]+-\s*/, ""); print "\"" q "\",\"" $0 "\""}' "$MARKDOWN_SOURCE")
TAG_PATH=$(awk '/^- .*#card/ {sub(/.*#card /, ""); print; exit}' "$MARKDOWN_SOURCE" | sed 's/#//g; s/[[:space:]][[:space:]]*/\//g')

TARGET_PATH="$CSV_TARGET/$TAG_PATH"
mkdir -p "$TARGET_PATH"
echo "$CSV_CONTENT" > "$TARGET_PATH/output.csv"