if [[ -f .env.banana ]]; then
    echo "It looks like you've already done your setup."
    exit 1
fi

ENV=.env.banana

touch $ENV

read -p "Enter your source markdown path: " md_source
echo "MARKDOWN_SOURCE=$md_source" >> $ENV

read -p "Enter your output directory: " csv_target
while [[ -d $csv_target ]]; do
    echo "This directory already exists."
    read -p "Try again: " csv_target
done
mkdir "$csv_target"
echo "CSV_TARGET=$csv_target" >> $ENV

echo "Successfully set up MD2BananaCSV!"