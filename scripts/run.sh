#!/bin/bash
set -euo pipefail

# Creating directories
mkdir -p ./{data/$(date +%F),analysis/$(date +%F)}

# Downloading data
wget -nv -P data/ \
 ftp://ftp.patricbrc.org/patric2/genomes_by_species/_Clostridium_sordellii/1172204.3/1172204.3.fna \
 ftp://ftp.patricbrc.org/patric2/genomes_by_species/_Clostridium_sordellii/1292035.3/1292035.3.fna \
 ftp://ftp.patricbrc.org/patric2/genomes_by_species/_Clostridium_sordellii/1292036.3/1292036.3.fna \
 ftp://ftp.patricbrc.org/patric2/genomes_by_species/Peptoclostridium_difficile/272563.8/272563.8.fna

# Running BLAST script
DB=data/272563.8.fna

QUERY=data/1172204.3.fna
bash scripts/run_blast.sh $QUERY $DB

QUERY=data/1292035.3.fna
bash scripts/run_blast.sh $QUERY $DB

QUERY=data/1292036.3.fna
bash scripts/run_blast.sh $QUERY $DB

# Inspecting data and results
head -n 1 data/*.fna
grep -c '>' data/*.fna
grep -vc '#' analysis/*.out

# Print operating system characteristics
uname -a

echo "[$(date)] $0 has been successfully completed."
