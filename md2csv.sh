source .env.banana

CSV_CONTENT=$(awk -F':: ' '/^- / {gsub(/^- /, ""); q=$0; next} /card-/ {next} /^[[:space:]]+-/ {gsub(/^[[:space:]]+-\s*/, ""); print "\"" q "\",\"" $0 "\""}' "$MARKDOWN_SOURCE")

mkdir -p "$CSV_TARGET" && cd $CSV_TARGET
echo "$CSV_CONTENT" > "output.csv"