FROM rocker/tidyverse

# Update apt-get
RUN apt-get update \
    &&  apt-get install -y libgsl-dev vim libxml2-dev libxt6 \
    &&  apt-get install -y libssl-dev libcurl4-gnutls-dev \ 
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*



RUN Rscript -e "install.packages('scDesign2')"
RUN Rscript -e "install.packages('copula')"
RUN Rscript -e "install.packages('Rtsne')"
RUN Rscript -e "install.packages('plyr')"
RUN Rscript -e "install.packages('reshape2')"
RUN Rscript -e "install.packages('gridExtra')"
RUN Rscript -e "install.packages('ggpubr')"
RUN Rscript -e "install.packages('cowplot')"
RUN Rscript -e "install.packages('anndata')"
RUN Rscript -e "devtools::install_github('JSB-UCLA/scDesign2')"

RUN Rscript -e "install.packages('rmarkdown',dependencies=TRUE)"

