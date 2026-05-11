source .env.banana

MD_BUFFER=$(cat $MARKDOWN_SOURCE)

mkdir -p $MARKDOWN_TARGET && cd $MARKDOWN_TARGET
echo $MD_BUFFER > "output.csv"