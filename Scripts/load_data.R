################################################################################
# GOAL
################################################################################

# The goal of this script is to load text data for analysis

read_data <- function(path) {
   df <- 
      readr::read_csv(path, 
                      col_names = T,
                      col_types = "ccccccccicccicccnnnnnncccccicicic")
                        
   return(df) 
   }
