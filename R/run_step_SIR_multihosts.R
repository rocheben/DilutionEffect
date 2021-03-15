#' Compute the change of the SIR multihosts system in one time-step
#'
#' @param t Current time
#' @param state Current state of the SEIR system
#' @param parameters Value of the epidemiological parameters:
#' - tau Competences
#' - b Birth rate
#' - d Death rate
#' - sigma Infectiosity period
#' - alpha virulence
#' - phi Number of contacts
#'
#' @return A list with a single element containing the derivative for the
#' SEIR system, as needed for [deSolve::ode()]
#'
#' @export
run_step_SIR_multihosts <- function(t, state, parameters) {

  with(as.list(parameters), {
    ### create state matrices
    S <- matrix(state[grepl("^S_", names(state))], nrow = 1)
    I <- matrix(state[grepl("^I_", names(state))], nrow = 1)
    R <- matrix(state[grepl("^R_", names(state))], nrow = 1)

    N <- S + I + R

    lambda <- drop(tau * tcrossprod(phi, I / N))

    dS <- b * N - (lambda + d) * S
    dI <- lambda * S - (sigma + d + alpha) * I
    dR <- sigma * I - d * R

    return(list(c(dS, dI, dR)))
  })
}
