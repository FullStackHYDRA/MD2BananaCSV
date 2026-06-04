# MD2BananaCSV

An automated Bash script tailored for Application Developers to effortlessly convert structured Markdown files into CSV files, optimized for quick Anki flashcard imports. Developed as part of the M122 and M431 modules.

## About the Project

As application developers, we face a lot of theoretical knowledge. Anki is a powerful tool for active recall, but creating flashcards manually via the Anki UI is tedious. **MD2BananaCSV** allows you to write your study notes directly in Markdown and use the CLI to instantly generate Anki-ready CSV imports.

* **M122 Focus:** End-to-end automation via Bash, strict error handling, and robust CLI parameter parsing.
* **M431 Focus:** Planning and setting up a project using the method IPERKA as well as documenting the process (Markdown-to-CSV transformation).

## Features

* **Automated Parsing:** Splits Markdown headers or list items into clear Front/Back question pairs.
* **Data Sanitization:** Cleans up special characters and ensures the CSV delimiter, that you pick with the `setup.sh` script (e.g., semicolon `;` or pipes `|`) doesn't break your Anki import.
* **Input Validation:** Pre-checks if files exist and validates data integrity before processing.

## Autosync

This project additionally features an automatic sync of your specified `.md` files with the auto-generated `.csv` files.
Please note that this feature only works on Linux and requires elevated rights.

## Prerequisites

This script runs natively on Linux. Windows users must run it via Git Bash or WSL (Windows Subsystem for Linux).

Note that if any of the following utilities marked by "(*)" are automatically installed if they don't exist on your system. They are only required for autosync.

* Bash (v4.0 or higher)
* Core utilities: `sed`, `awk`, `grep`
* Node.js (v26.3.0 or higher) (*)
* chokidar (*)

## Installation & Setup

### Manual installation

1. Clone the repository
2. Run setup.sh
3. If autosync wasn't enabled: Run md2csv.sh

### Automatic installation

Copy the following command and paste it into your terminal:

```bash
curl -fsSl https://raw.githubusercontent.com/FullStackHYDRA/MD2BananaCSV/refs/heads/main/installer.sh | sh
```