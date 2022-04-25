def path2para(path):
    split_str = path.split("/")[-2].split("_")
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
    return c_type, n_cell, cell_times, seq_depth
