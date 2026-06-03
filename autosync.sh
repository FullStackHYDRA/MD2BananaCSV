source .env.banana

chokidar "$MARKDOWN_SOURCE/**/*.md" -c "./md2csv.sh"