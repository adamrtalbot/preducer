##############################################################################
## Function that takes a dataframe and reduces p-values by Fisher's method  ##
##############################################################################
#' Fishers method for reducing p-values
#' This function reduces p-values across a data table, per a grouping variable provided as a single column
#' @param data Data frame of p-values, including one column for grouping variable, one column of p-values
#' @param p_value Column name for p-values. Accepts string as column name
#' @param group Column name for grouping variable. Accepts string as column name.
#' @return Named numeric vector. Names are grouping variable, value is p-value reduced by Fisher's method.
#' @export

fishers_method <- function(data, p_value, group){
  
  # Split data into groups:
  data <- split(x = data, f = data[,group])
  
  # Load metap library
  if(!require(metap)){
    stop("This function requires package 'metap' (install.packages('metap')")
  }
  
  # Function for reducing p-value (if n > 1)
  
  sumlog_fun <- function(data){
    if(nrow(data) < 2){
      new_p <- data[1,"Adjusted.p.value..BH."]
    } else {
      new_p <- as.numeric(sumlog(data[,"Adjusted.p.value..BH."])[3])
    }
    new_p
  }
  
  # Apply to all tables in data
  
  p_values <- sapply(X = data, sumlog_fun)
  
  # Return p-values
  p_values
  
}