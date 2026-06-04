source .env.banana

chokidar -p "$MARKDOWN_SOURCE/**/*.md" -c "bash ./md2csv.sh"