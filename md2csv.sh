source .env.banana

CSV_CONTENT=$(awk -F':: ' '/^- / {gsub(/[[:space:]]*#card.*/, ""); gsub(/^- /, ""); q=$0; next} /card-/ {next} /^[[:space:]]+-/ {gsub(/^[[:space:]]+-\s*/, ""); print "\"" q "\",\"" $0 "\""}' "$MARKDOWN_SOURCE")
TAG=$(awk -F' ' '/^- .*#card/ {print $NF; exit}' "$MARKDOWN_SOURCE" | sed 's/#//')

mkdir -p "$CSV_TARGET" && cd $CSV_TARGET
mkdir -p "$TAG" && cd $TAG
echo "$CSV_CONTENT" > "output.csv"