import scanpy as sc
def path2para(path, type = "sim_immune"):
    split_str = path.split("/")[-2].split("_")
    if type == "sim_immnue": 
        if "activated" in split_str:
            c_type = "activated_stellate"
            n_cell = split_str[2]
            cell_times = split_str[3]
            seq_depth = split_str[4]
        else:
            c_type = split_str[0]
            n_cell = split_str[1]
            cell_times = split_str[2]
            seq_depth = split_str[3]
    elif type == "ATAC":
        split_str = path.split("/")[-1].split(".")[-2]
        c_type = split_str
        n_cell, cell_times, seq_depth = 0, 0, 0
    return c_type, n_cell, cell_times, seq_depth

def scgen_vis(path, adata, res, fig_path):
    # visualize the original data
    adata = sc.read(path)
    sc.pp.neighbors(adata)
    sc.tl.umap(adata)
    sc.pl.umap(adata, color=["tech", "celltype"], wspace=.5, frameon=False, save = fig_path + "_original_umap.png")

    # integrated data
    sc.pp.neighbors(res)
    sc.tl.umap(res)
    sc.pl.umap(res, color=['tech', 'celltype'], wspace=0.4, frameon=False, save = fig_path + "_integrated_umap.png")

    # corrected latent space
    sc.pp.neighbors(res, use_rep="corrected_latent")
    sc.tl.umap(res)
    sc.pl.umap(res, color=['tech', 'celltype'], wspace=0.4, frameon=False, save = fig_path + "_latent_umap.png")
