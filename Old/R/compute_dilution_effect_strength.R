#' Compute effect of increasing number of reservoir species
#'
#' @inheritParams get_max_infected
#' @param nmax Maximum number of reservoir species
#'
#' @examples
#' eff <- compute_dilution_effect_strength(
#'   m = 10, nmax = 100, N = 1e5,
#'   tau = 0.5, phi_intra = 1/2, phi_inter = 1/4,
#'   b = 0.2, d = 0.2,
#'   sigma = 0.5, alpha = 0.9
#' )
#' plot(eff, type = "l")
#'
#' @export
#'
compute_dilution_effect_strength <- function(m = 10, nmax = 20, ...) {

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
