
if [ -z "$1" ]; then
    echo "Nutzt: $0 dateiname.md"
    exit
fi

INPUT_FILE="$1"

OUTPUT_FILE="${INPUT_FILE%.md}.csv"


grep "^| " "$INPUT_FILE" | \
grep -v "\-|" | \
sed 's/^|//; s/|$//; s/|/,/g; s/s *, */,/g; s/^ *//; s/ *$//' > "$OUTPUT_FILE"

echo "Datei erfolgreich erstellt: $OUTPUT_FILE"

#Idee in einem Script wie es aussehen könnte. wurde mit G mini erstellt, wird nicht gebraucht. Joshua wird dieses File nicht löschen, da er alles gelesen hat.