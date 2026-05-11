source .env.banana
OUTPUT_DIR=csv_output

MD_BUFFER=$(cat $MARKDOWN_SOURCE)

mkdir -p $OUTPUT_DIR && cd $OUTPUT_DIR
echo $MD_BUFFER > "output.csv"