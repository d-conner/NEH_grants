################################################################################
# GOAL
################################################################################

# The goal of this script is to indicate the functions used for analysis

# peek at fields - distinct entries, number of NAs, number of "unknown"
peek_NEH <- function(field){
   # assemble counts
   field_class <- as.character(class(field))
   num_distinct <- as.numeric(length(unique(field)))
   num_NA <- sum(is.na(field))
   num_unknown <- length(which(str_detect(field, 
                                          pattern = "[Uu]nknown")))
   # call data frame output
   data.frame(class = field_class,
              n_distinct = num_distinct,
              n_NA = num_NA,
              n_unknown = num_unknown)
}

# create histogram plot of all fields input
create_hist <- function(df, .x){
   df  %>%
      ggplot(aes(x = .data[[.x]])) +   
      geom_histogram(bins = 50) +
      labs(x = .x,
           y = "") +
      theme_minimal()
}

# create histogram plot of all fields input
create_hist_log <- function(df, .x){
   df  %>%
      filter(! .data[[.x]] == 0) %>%   # elim 0 values which provoke error msg
      ggplot(aes(x = .data[[.x]])) +   
      geom_histogram(bins = 50) +
      scale_x_log10() +
      labs(x = .x,
           y = "") +
      theme_minimal()
}

# create faceted histogram plot of all fields input
create_hist_log_facet <- function(df, .x, facet){
   df  %>%
      filter(! .data[[.x]] == 0) %>%   # elim 0 values which provoke error msg
      ggplot(aes(x = .data[[.x]])) +   
      geom_histogram(bins = 50) +
      scale_x_log10() +
      labs(x = .x,
           y = "") +
      theme_minimal()+
      facet_wrap(facet)
}

# create a bar plot of input items with labels (blank by default)
create_barplot <-function(df, .x, .y, xlabel = "", ylabel = ""){
   df %>%
      ggplot(aes(x = .data[[.x]])) +
      geom_col(aes(y = .data[[.y]])) +
      labs(x = xlabel,
           y = ylabel) +
      theme_minimal()
}

# create a bar plot of input items with labels (blank by default)
create_barplot_grouped <-function(df, .x, .y, group, xlabel = .x, ylabel = ""){
   df %>%
      ggplot(aes(x = .data[[.x]])) +
      geom_col(aes(y = .data[[.y]],
                   fill = .data[[group]]),
                   position = "dodge") +
      labs(x = xlabel,
           y = ylabel) +
      theme_minimal()
}

# create a line plot of input items with labels (blank by default)
create_yearplot <-function(df, .x, ylabel = "", toptitle = ""){
   df %>%
      ggplot(aes(x = YearAwarded,
                  y = .data[[.x]])) +
      geom_line() + 
      labs(x = "Year",
           y = ylabel,
           title = toptitle) +
      theme_minimal()
}
