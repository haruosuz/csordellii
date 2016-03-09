#!/bin/bash
set -euo pipefail

# Variables
QUERY=$1; DB=$2

DBTYPE=prot; PROGRAM=blastp
DBTYPE=nucl; PROGRAM=blastn

# Building a BLAST database with local sequences
makeblastdb -in $DB -dbtype $DBTYPE -hash_index -parse_seqids

# Running BLAST
EVALUE=1e-150
OUTPUT=analysis/${PROGRAM}-$(basename $QUERY)-$(basename $DB).out

$PROGRAM -db $DB -query $QUERY -evalue $EVALUE \
 -max_hsps 1 -outfmt 7 > $OUTPUT
# -max_target_seqs $(grep -c '^>' $DB)

# Inspecting and Manipulating $OUTPUT
grep -v '#' $OUTPUT | sort -k4,4nr > $OUTPUT.sorted