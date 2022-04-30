Rscript -e "rmarkdown::render('pre.Rmd', output_file = 'pre.html')"
Rscript -e "source('https://git.io/xaringan2pdf');xaringan_to_pdf('pre.html')"