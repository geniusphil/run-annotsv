#!/bin/bash
set -e

if [[ $# -ne 1 ]]; then
    echo "USAGE: $0 <BED FILE>"
    exit 1
fi

BED_FILE=$1
BED_FILE_NAME=${BED_FILE%.*}
OUTPUT_PATH="$HOME/SV_CNV/"
ANNOTSV_PATH="/home/NGS_tools/AnnotSV_2.2/bin/AnnotSV/AnnotSV.tcl"

echo "## - $BED_FILE_NAME"

for line in $(cat $BED_FILE)
do
    SAMPLE_NAME=${line%.*}
    echo "########## $SAMPLE_NAME"
    $ANNOTSV_PATH -SVinputFile $line -genomeBuild GRCh38 -outputDir $OUTPUT_PATH -outputFile $SAMPLE_NAME
done
