#'
#' @inheritParams get_max_infected
#'
#' @examples
#' compute_dilution_effect_strength(
#'   m = 10, nmax = 10, N = 10e5,
#'   tau = 0.5, phi_intra = 1/2, phi_inter = 1/4,
#'   b = 0.5, d = 0.5,
#'   sigma = 0.5, alpha = 0.5
#' )

compute_dilution_effect_strength <- function(m, nmax, ...) {

  res <- setNames(
    data.frame(matrix(NA_real_, ncol = 2, nrow = nmax)),
    c("nspecies", "Imax")
  )

  for (i in seq_len(nmax)) {

    res$nspecies[i] <- nmax - i+1
    res$Imax[i] <- get_max_infected(m, nmax - i+1, ...)

  }

  return(res)

}
