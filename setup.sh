ENV=.env.banana

rm "$ENV" 2> /dev/null
touch "$ENV"

read -e -rp "Enter your source markdown path: " md_source
echo "MARKDOWN_SOURCE=\"$md_source\"" >> $ENV

read -e -rp "Enter your output directory: " csv_target
mkdir -p "$csv_target"
echo "CSV_TARGET=\"$csv_target\"" >> $ENV

read -e -p "Enter your CSV separator (| , ;): " csv_separator
echo "CSV_SEPARATOR=\"$csv_separator\"" >> $ENV

read -e -p "Enable autosync (y/n): " askyesno_autosync
if [ "$askyesno_autosync" == "y" ]; then
    echo && echo "Installing npm..."
    sudo apt-get install -y npm > /dev/null

    echo "Installing chokidar..."
    sudo npm install -g chokidar-cli > /dev/null

    nohup bash autosync.sh >/dev/null 2>&1 &

    echo "Enabled autosync." && echo
fi

echo "Successfully set up MD2BananaCSV!"