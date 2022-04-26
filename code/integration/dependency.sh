#!/bin/bash
export CC=/usr/local/Cellar/gcc/8.2.0/bin/gcc-8
pip install mnnpy

conda create -n scvi-env2 python=3.9
conda activate scvi-env2
conda install scvi-tools -c conda-forge
pip install scib
pip install scgen
conda install -c conda-forge leidenalg
pip install trVAE
