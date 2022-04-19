#!/bin/bash
echo "here" 1>&2
ls -l . > return.txt
git clone https://github.com/XinranMiao/scRNA_int
mkdir scRNA_int/data/derived_data/human_pancreas_norm_complexBatch

mv dat.RData scRNA_int/code/simulation/
cd scRNA_int/code/simulation
#wget https://figshare.com/ndownloader/files/24539828  -O  ../../data/raw_data/human_pancreas_norm_complexBatch.h5ad
#wget https://figshare.com/ndownloader/files/25721792 -O ../../data/raw_data/small_atac_peaks.h5ad
#wget https://figshare.com/ndownloader/files/25721789 -O ../../data/raw_data/small_atac_gene_activity.h5ad


Rscript -e "rmarkdown::render('simulate.Rmd', 
                  params = list(raw_data = '$1',
                                c_type = '$2',
                                n_cell = '$3',
                                cell_times = '$4',
                                seq_depth = '$5'),
                  output_file = 'simulate_human_pancreas_"$1"_"$2"_"$3"_"$4".html')"

cd ../../data
rm -r raw_data/*
ls -l derived_data/ 1>&2
#tar -czf derived_$(c_type)_$(n_cell)_$(cell_times)_$(seq_depth).tar.gz derived_data
tar -czf derived_$1_$2_$3_$4.tar.gz derived_data

mv derived_data/*rds ../..
mv derived_$1_$2_$3_$4.tar.gz ../..
ls -l ../.. 1>&2
cd ../..