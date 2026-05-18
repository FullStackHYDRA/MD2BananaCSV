source .env.banana

CSV_CONTENT=$(sed -n '/\[csv\]/,/\[\/csv\]/p' "$MARKDOWN_SOURCE" | sed '1d;$d')

mkdir -p "$CSV_TARGET" && cd $CSV_TARGET
echo "$CSV_CONTENT" > "output.csv"