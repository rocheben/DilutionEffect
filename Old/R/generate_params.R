generate_params <- function(nsamples) {

  list_params <- c("tau", "phi_intra", "phi_inter", "b", "d", "sigma", "alpha")

  setNames(
    as.data.frame(spacefillr::generate_sobol_owen_set(n = nsamples, dim = length(list_params))),
    list_params
  )

}
