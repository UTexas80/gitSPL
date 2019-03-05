SPL_key_stats <- tq_get("SPL.AX", get = "key.stats")
colnames(SPL_key_stats)[1:10]
