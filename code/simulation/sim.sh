#!/bin/bash
echo "here" 1>&2
git clone https://github.com/XinranMiao/scRNA_int
mkdir scRNA_int/data/derived_data/human_pancreas_norm_complexBatch

mv dat.RData scRNA_int/code/simulation/
cd scRNA_int/code/simulation
#wget https://figshare.com/ndownloader/files/24539828  -O  ../../data/raw_data/human_pancreas_norm_complexBatch.h5ad
#wget https://figshare.com/ndownloader/files/25721792 -O ../../data/raw_data/small_atac_peaks.h5ad
#wget https://figshare.com/ndownloader/files/25721789 -O ../../data/raw_data/small_atac_gene_activity.h5ad
ls -l . 1>&2

Rscript -e "rmarkdown::render('simulate.Rmd', 
                  params = list(raw_data = '$raw_data',
                                c_type = '$c_type',
                                n_cell = '$n_cell',
                                cell_times = '$cell_times',
                                seq_depth = '$seq_depth'),
                  output_file = 'simulate_human_pancreas_"$c_type"_"$n_cell"_"$cell_times"_"$seq_depth".html')"

cd ../../data
rm -r raw_data/*
ls -l 1>&2
tar -czf derived_$(c_type)_$(n_cell)_$(cell_times)_$(seq_depth).tar.gz derived_data
mv derived_data/*rds ../..
mv derived_$(c_type)_$(n_cell)_$(cell_times)_$(seq_depth).tar.gz ../..
ls -l ../.. 1>&2
cd ../..