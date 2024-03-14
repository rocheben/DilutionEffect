library(targets)
# This is an example _targets.R file. Every
# {targets} pipeline needs one.
# Use tar_script() to create _targets.R and tar_edit()
# to open it again for editing.
# Then, run tar_make() to run the pipeline
# and tar_read(summary) to view the results.

# Define custom functions and other global objects.
for (f in list.files("R", full.names = TRUE)) {
  source(f)
}

# Set target-specific options such as packages.
tar_option_set(packages = "dplyr")

# End this file with a list of target objects.
list(
  tar_target(parms, generate_params(100)),
  tar_target(eff, do.call(compute_dilution_effect_strength, parms), pattern = map(parms))
)

