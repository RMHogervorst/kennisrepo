#!/bin/bash
set -e

exitstatus=0
find . -type f -printf '%T@ %p\n' | sort -n | tail -1 | cut -f2- -d" "|
for file in *.Rmd
do
    Rscript -e "lintr::lint(\"$file\")"
    outputbytes=`Rscript -e "lintr::lint(\"$file\")" | grep ^ | wc -c`
    if [ $outputbytes -gt 0 ]
    then
        exitstatus=1
    fi
done

exit $exitstatus
