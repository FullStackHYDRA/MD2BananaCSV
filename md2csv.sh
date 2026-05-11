source .env.banana

MD_BUFFER=$(cat $MARKDOWN_SOURCE)

mkdir -p $MARKDOWN_TARGET && cd $CSV_TARGET
echo $MD_BUFFER > "output.csv"