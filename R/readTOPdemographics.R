#' Import TOP demographic data
#'
#' Imports the TOP demographics as a data frame, i.e. the CLEANFILES. It 
#' automatically assigns the correct attributes to some key variables, other 
#' variables need to be set manually afterwards, e.g. via the `mutate()` 
#' function.
#' This function defaults to the setup of TSD, but can be used locally too. In 
#' that case it will give warnings if the column names are different from what 
#' it expects. It will detect whether you're working on a Linux, Windows, or
#' Mac machine and adapt accordingly.
#' This function as default will import all variables (of which 
#' there are more than 1000), if you're interested in the key demographic 
#' variables only, such as age, diagnosis, date of interview, etc., then set the 
#' `demogr_only` option to `TRUE`. This will then import only about 20 key 
#' demographic variables.
#' 
#' @param file file path if different from default cleanfiles
#' @param demogr_only TRUE/FALSE whether only key variables should be imported
#'
#' @usage 
#' TOPdata <- readTOPdemographics()
#' TOPdata <- readTOPdemographics(file = "<path to file>", demogr_only = TRUE)
#'
#' @import dplyr readr
#' @export

readTOPdemographics <- function(file = NULL, demogr_only = FALSE) {
  
  library(dplyr)
  library(readr)
  
  if (is.null(file) & Sys.info()[['sysname']] != "Darwin"){
    message("No file path supplied, assuming you're working on TSD")
    if (Sys.info()[['sysname']] == "Linux") {
      file <- "/tsd/p33/data/durable/groups/clinical/projects/top/CLEANFILES/CLEAN1800.csv"
    } else if (Sys.info()[['sysname']] == "Windows") {
      file <- "N:\\data\\durable\\groups\\clinical\\projects\\top\\CLEANFILES\\CLEAN1800.csv"
    } else {
      message("Unknown operating system, quitting")
      return()
    }
  } else {
    message("It seems you're working on a Mac, no default file path exists, please supply a path in the `file` option, quitting")
    return()
  }
  
  # Specify column types
  col_specifcations <- cols(
    Pasient_Kontroll = col_factor(),
    Gender = col_factor(),
    Ethnicity = col_factor(),
    Ethnicity_other = col_factor(),
    Origin_subject_country = col_factor(),
    Origin_father_country = col_factor(),
    Origin_mother_country = col_factor(),
    Session = col_factor(),
    Diag_category = col_factor(),
    Category = col_factor(),
    Marital_staus = col_factor(),
    Housing = col_factor(),
    Living_condition = col_factor(),
    Education = col_factor(),
    Current_occupation = col_factor(),
    Occupation_category = col_factor(),
    Current_treatment = col_factor(),
    Current_treatment_other = col_factor()
  )
  
  # Load data
  suppressWarnings(
    load_data <- read_delim(file, 
                            delim = ";", 
                            col_types = col_specifcations, 
                            trim_ws = TRUE,
                            na = c("777","888","999"))
  )
  
  # Format columns
  data <- load_data %>%
    mutate(
      Marital_status = Marital_staus,
      Date = as.Date(Date, "%m/%d/%Y"),
      Interview_date = as.Date(Interview_date, "%m/%d/%Y"),
      DoB = as.Date(paste(fodtdag, Born_month, Born_year, sep = "/"), "%d/%m/%Y")
    )
  
  # Select basic demographics columns
  demogr_columns <- c("Subj_ID", "nnid", "Gender", "DoB", "Age", 
                      "Pasient_Kontroll", "Diag_category", "DSM_IV_code", "Diagnosis_description",
                      "Session", "Interview_date",
                      "Education", "Education_total_years", 
                      "Ethnicity", "Ethnicity_other", 
                      "Marital_status", "Bio_children",
                      "Housing", "Housing_other", "Current_treatment", "Current_treatment_other",
                      "Demographics_comment")
  
  if (demogr_only) {
    data <- data %>%
      select(one_of(demogr_columns)
      )
  }
  
  # Return data frame
  return(data)
  
}
