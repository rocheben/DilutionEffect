#' Get total number of infected in an epidemic
#'
#' @param m Number of vector species
#' @param n Number of reservoir species
#' @param ... Additional params passed to [run_step_SIR_multihosts()]
#'
#' @examples
#' get_max_infected(
#'   m = 10, n = 10, N = 10e5,
#'   tau = 0.5, phi_intra = 1/2, phi_inter = 1/4,
#'   b = 0.5, d = 0.5,
#'   sigma = 0.5, alpha = 0.5
#' )
#'
get_max_infected <- function(m, n, N, phi_intra, phi_inter, ...) {

  SInit <- rep_len(N, m+n)
  SInit[1] <- SInit[1]-1
  names(SInit) <- paste0("S_", seq_along(SInit))

  IInit <- rep_len(0, m+n)
  IInit[1] <- 1
  names(IInit) <- paste0("I_", seq_along(IInit))

  RInit <- rep_len(0, m+n)
  names(RInit) <- paste0("R_", seq_along(RInit))

  phi <- matrix(
    c(rep(rep(c(phi_intra, phi_inter), times = c(m, n)), m),
      rep(rep(c(phi_inter, phi_intra), times = c(m, n)), n)),
    ncol = m + n,
    nrow = m + n
  )

  res <- deSolve::ode(
    c(SInit, IInit, RInit),
    times = seq_len(100),
    func = run_step_SIR_multihosts,
    parms = list(..., "phi" = phi)
  )

  return(max(colSums(res)[grepl("^I_", colnames(res))]))

}
