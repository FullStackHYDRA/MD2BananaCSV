ENV=.env.banana

if [[ -f $ENV ]]; then
    echo "It looks like you've already done your setup great job AiKi."
    exit 1
fi

touch $ENV

read -rp "Enter your source markdown path: " md_source
echo "MARKDOWN_SOURCE=$md_source" >> $ENV

read -rp "Enter your output directory: " csv_target
while [[ -d $csv_target ]]; do
    echo "This directory already exists."
    read -rp "Try again: " csv_target
done
mkdir "$csv_target"
echo "CSV_TARGET=$csv_target" >> $ENV

read -p "Enter your CSV separator (| , ;): " csv_separator
echo "CSV_SEPARATOR=\"$csv_separator\"" >> $ENV

echo "Successfully set up MD2BananaCSV!"