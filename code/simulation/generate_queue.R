setwd("~/Documents/projects/s22_877/scRNA_int/code/simulation/")
library(dplyr)
q1 <- data.frame(
  raw_data = "human_pancreas_norm_complexBatch.h5ad",
  c_type = rep(c("acinar", "activated_stellate", "alpha", "beta",
                 "delta", "ductal",
                 "endothelial", "epsilon"), each =  9),
  n_cell = "0",
  cell_times = rep(c("0", "2", "5"), 24),
  seq_depth = rep(rep(c(1000, 5000, 1e4), 3), each = 8)
)


q2 <- data.frame(
  raw_data = "human_pancreas_norm_complexBatch.h5ad",
  c_type = "multiple",
  n_cell = rep(c("2", "2", "2", "5","5","5", "10", "10", "10"), 3),
  cell_times = rep(c("0", "2", "5"), 9),
  seq_depth = rep(rep(c(1000, 5000, 1e4), 3), each = 9)
)



rbind(q1, q2) %>%
  write.table(file = "params.txt", quote = FALSE, row.names = FALSE, col.names = FALSE, sep = ",")

rbind(q1[1:2, ], q2[1:2, ]) %>%
  write.table(file = "test_params.txt", quote = FALSE, row.names = FALSE, col.names = FALSE, sep = ",")
