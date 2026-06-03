ENV=.env.banana

if [[ -f $ENV ]]; then
    echo "It looks like you've already done your setup great job AiKi."
    exit 1
fi

touch $ENV

read -rp "Enter your source markdown path: " md_source
echo "MARKDOWN_SOURCE=$md_source" >> $ENV

read -rp "Enter your output directory: " csv_target
mkdir -p "$csv_target"
echo "CSV_TARGET=$csv_target" >> $ENV

read -p "Enter your CSV separator (| , ;): " csv_separator
echo "CSV_SEPARATOR=\"$csv_separator\"" >> $ENV

read -p "Enable autosync (y/n): " askyesno_autosync
if [ "$askyesno_autosync" -eq "y" ]; then
    npm install -g chokidar-cli
    bash autosync.sh > autosync.log 2>&1 &
fi
echo "Enabled autosync."

echo "Successfully set up MD2BananaCSV!"