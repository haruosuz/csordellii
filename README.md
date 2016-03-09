----------

Haruo Suzuki  
Last Update: 2016-03-09  

----------

# *Clostridium sordellii* Project
Project started 2016-03-09.  

We checked *Clostridium sordellii* genome sequences reported by [Scaria J et al. (2015)](http://www.ncbi.nlm.nih.gov/pubmed/26059449). We performed similarity searches of Clostridium sordellii contigs against Clostridium difficile 630 database using BLASTN (E-value < 1e-150).
- For Clostridium sordellii 8483 (1172204.3.fna), 1174 (74.7%) of the 1570 contigs matched to C.difficile.
- For Clostridium sordellii VPI 9048 (1292035.3.fna), 23 (13.9%) of the 166 contigs matched to C.difficile.
- For Clostridium sordellii ATCC 9714 (1292036.3.fna), 30 (29.1%) of the 103 contigs matched to C.difficile.

## Project directories

    csordellii/
     README.md: project documentation
     data/: contains sequence data in FASTA or BLAST database format
     scripts/: contains shell scripts
     analysis/: contains results of data analyses

## Scripts

The shell script `scripts/run.sh` automatically carries out the entire steps: creating directories, downloading data, and running the shell script `scripts/run_blast.sh` for BLAST analysis.

Let's run the driver script in the project's main directory `csordellii/` with:

    bash scripts/run.sh > log.txt 2>&1 &

## Updates

- 2016-03-09
 - Created the project directory using `mkdir -p csordellii/{data,scripts,analysis}`
 - Created the shell scripts `scripts/run.sh` and `scripts/run_blast.sh`
 - Downloaded DNA sequences from <ftp://ftp.patricbrc.org/patric2/> into `data/`

----------

## References
- [Scaria J et al. (2015) BMC Genomics. 'Comparative genomic and phenomic analysis of Clostridium difficile and Clostridium sordellii, two related pathogens with differing host tissue preference.'](http://www.ncbi.nlm.nih.gov/pubmed/26059449)

----------
