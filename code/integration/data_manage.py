import scanpy as sc
import scvi
import pymde
from scvi.model.utils import mde


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


def scvi_vis(adata, vae, fig_path):
    adata.obsm["X_scVI"] = vae.get_latent_representation()
    sc.pp.neighbors(adata, use_rep="X_scVI")
    sc.tl.leiden(adata)
    adata.obsm["X_mde"] = mde(adata.obsm["X_scVI"])
    sc.pl.embedding(
        adata,
        basis="X_mde",
        color=["tech", "celltype"],
        frameon=False,
        ncols=1,
        save = fig_path + "scvi_corrected_latent"
    )


def scanvi_vis(adata, vae, fig_path):
    adata.obsm["X_scANVI"] = vae.get_latent_representation()
    sc.pp.neighbors(adata, use_rep="X_scANVI")
    sc.tl.leiden(adata)
    adata.obsm["X_mde_scanvi"] = mde(adata.obsm["X_scANVI"])
    sc.pl.embedding(
        adata,
        basis="X_mde_scanvi",
        color=["tech", "celltype"],
        frameon=False,
        ncols=1,
        save = fig_path + "scanvi_corrected_latent"
    )

def scgen_vis(path, adata, res, fig_path, batch = "tech", label = "celltype"):
    # visualize the original data
    adata = sc.read(path)
    sc.pp.neighbors(adata)
    sc.tl.umap(adata)
    sc.pl.umap(adata, color=[batch, label], wspace=.5, frameon=False, save = fig_path + "_original_umap.png")

    # integrated data
    sc.pp.neighbors(res)
    sc.tl.umap(res)
    sc.pl.umap(res, color=[batch, label], wspace=0.4, frameon=False, save = fig_path + "_integrated_umap.png")

    # corrected latent space
    sc.pp.neighbors(res, use_rep ="corrected_latent")
    sc.tl.umap(res)
    sc.pl.umap(res, color=[batch, label], wspace=0.4, frameon=False, save = fig_path + "_latent_umap.png")

