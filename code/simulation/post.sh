#!/bin/bash
scp xmiao27@submit2.chtc.wisc.edu:/home/xmiao27/integration/scRNA_int/code/simulation/*tar.gz ../../results/simulation2/test/
cd ../../results/simulation2/test/
ls  *tar.gz > list_tarball.txt
files="list_tarball.txt"
while IFS= read -r line
do
  tar -xzf "$line"
done < "$files"