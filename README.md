# MD2BananaCSV

An automated Bash script tailored for Application Developers to effortlessly convert structured Markdown files into CSV files, optimized for quick Anki flashcard imports. Developed as part of the M122 and M431 modules.

## About the Project

As application developers, we face a lot of theoretical knowledge. Anki is a powerful tool for active recall, but creating flashcards manually via the Anki UI is tedious. **MD2BananaCSV** allows you to write your study notes directly in Markdown and use the CLI to instantly generate Anki-ready CSV imports.

* ** M122 Focus:** End-to-end automation via Bash, strict error handling, and robust CLI parameter parsing.
* ** M431 Focus: ** Plan and set up a project with a method IPERKA and also includes documentation (Markdown-to-CSV transformation).

## Features

* **Automated Parsing:** Splits Markdown headers or list items into clear Front/Back question pairs.
* **Data Sanitization:** Cleans up special characters and ensures the CSV delimiter, that you pick with the setup.sh script (e.g., semicolon `;` or pipes `|`) doesn't break your Anki import.
* **Input Validation:** Pre-checks if files exist and validates data integrity before processing.

##  Prerequisites

This script runs natively on Linux. Windows users can run it via Git Bash or WSL (Windows Subsystem for Linux).
* Bash (v4.0 or higher)
* Core utilities: `sed`, `awk`, `grep`

## Installation & Setup

1. Clone the repository or download the script
2. Run setup.sh
3. Run md2csv.sh
  