#' @param m Number of vector species
#' @param n Number of reservoir species
#' @param ... Additional params.
#'
#' @example
#' compute_dilution_effect_strength(
#'   m = 3, n = 3, N = rep_len(100, 6)
#' )

compute_dilution_effect_strength <- function(m, n, N, ...) {

  Nr <- seq(100, 10000, length.out = n)
  Nm <- rep_len(100000, length.out = m)
  Nvec <- c(Nm, Nr)

  tauM <- rep_len(0.9, length.out = m)
  tauvec <- c(tauM, runif(n))
#  tauvec <- c(tauM, seq(0, 1, length.out = n))

  correlation <- cor(tauvec[seq(m+1, m+n)], Nvec[seq(m+1, m+n)])

  res <- setNames(
    data.frame(matrix(NA_real_, ncol = 2, nrow = n)),
    c("nspecies", "Imax")
  )

  for (i in seq_len(n)) {

    N <- c(Nm, Nr[seq(i, n)])
    tau <- c(tauM, tauvec[seq(m+i, m+n)])
    ni <- n - i+1

    res$nspecies[i] <- ni

    b <- c(
      rep_len(365/30, length.out = m),
      rep_len(1/4, length.out = ni)
    )
    d <- b

    sigma <- c(
      rep_len(0, length.out = m),
      rep_len(365/7, length.out = ni)
    )

    phi <- matrix(0, nrow = m+ni, ncol = m+ni)

     for (p in seq_len(m)) {
       for (q in seq_len(ni)) {
         phi[p, m+q] <- 365/20
         phi[m+q, p] <- 365/20
       }
     }

    SInit <- N
    SInit[1] <- N[1]-1
    names(SInit) <- paste0("S_", seq_along(SInit))

    IInit <- rep_len(0, m+ni)
    IInit[1] <- 1
    names(IInit) <- paste0("I_", seq_along(IInit))

    RInit <- rep_len(0, m+ni)
    names(RInit) <- paste0("R_", seq_along(RInit))

    resi <- deSolve::ode(
      c(SInit, RInit, IInit),
      times = seq_len(10),
      func = run_step_SIR_multihosts,
      parms = list("tau" = tau, "b" = b, "d" = d, "sigma" = sigma, "phi" = phi, "Nspecies" = m + ni, "alpha" = 0.1)
    )

    res$Imax[i] <- max(colSums(resi)[grepl("^I_", colnames(resi))])

  }

  slope <- coef(lm(Imax ~ nspecies, data = res))["nspecies"]

  return(c(correlation, slope))

}
