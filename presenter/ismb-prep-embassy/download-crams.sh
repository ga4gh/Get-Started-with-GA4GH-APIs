#!/bin/bash
#SBATCH --job-name=JobName
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=jeremy.adams@ga4gh.org
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:59:00
#SBATCH --output=JobName.%j.log
#SBATCH --error=JobName.%J.err

echo "CRAM download script started"
N_TOTAL="200"
START="$1"
LENGTH="$2"
TAIL=`expr ${N_TOTAL} - ${START}`
echo "Start: ${START}, Length: ${LENGTH}"

cut -f1 1000genomes.low_coverage.GRCh38DH.alignment.index | tail -${TAIL} | head -${LENGTH} | while read f; do wget $f -P ./cram/; wget $f.crai -P ./cram/; echo $f; done
