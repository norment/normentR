# SETUP

.onLoad <- function(...) {
  
  version <- packageVersion("normentR")
  date <- packageDate("normentR")
  
  ## Print on Screen
  packageStartupMessage("-----------------------------------------------------------------")
  packageStartupMessage("Welcome to the {normentR} package!")
  packageStartupMessage("Version: ", version)
  #packageStartupMessage("Last update : ", date)
  #packageStartupMessage("Developer   : Daniel Roelfs (B48)")
  packageStartupMessage("If there's any questions about how to use this package,")
  packageStartupMessage("  please ask Daniel in B48!")
  packageStartupMessage("The default ggplot theme has been replaced with theme_norment()")
  packageStartupMessage("-----------------------------------------------------------------")
  
  ggplot2::theme_set(theme_norment())
  
}
