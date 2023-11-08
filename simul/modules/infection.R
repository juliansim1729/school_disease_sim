infection <- function(dat, at, from, to, by) {
    
    active <- get_attr(dat, "active")
    status <- get_attr(dat, "status")
    
    rate <- get_param(dat, paste0(from, to, by, ".rate"))
    
    ids_elig <- which(active == 1 & status == from)
    n_elig <- length(ids_elig)
    
    if (n_elig > 0) {
        # get a list of dyads where one is "from" and the other is "by"
        del <- discordant_edgelist(dat, at, from, by)
        
        if (!(is.null(del))) {
            # note that a "from" node can show up in multiple dyads
            del <- del[which(rbinom(nrow(del), 1, rate) == 1), ]
            
            # get unique "from" ids of the successfully infected nodes
            ids_to <- unique(del[,1])
            
            if (length(ids_to)) {
                status[ids_to] <- to
            }
        }
    }
    
    dat <- set_attr(dat, "status", status)
    
    return(dat)
}