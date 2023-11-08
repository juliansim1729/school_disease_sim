progress <- function(dat, at, from, to) {
    
    active <- get_attr(dat, "active")
    status <- get_attr(dat, "status")
    rate <- get_param(dat, paste0(from, to, ".rate"))
    
    ids_elig <- which(active == 1 & status == from)
    n_elig <- length(ids_elig)
    
    if (n_elig > 0) {
        # determines which of the eligible nodes progress to the next stage
        vec <- which(rbinom(n_elig, 1, rate) == 1)
        if (length(vec) > 0) {
            status[ids_elig[vec]] <- "i"
        }
    }
    
    dat <- set_attr(dat, "status", status)
    
    return(dat)
}

