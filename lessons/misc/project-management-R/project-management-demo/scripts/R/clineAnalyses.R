# Script to analyse population means data across cities
#
# Author: James S. Santangelo

# Load required packages
library(tidyverse)

# Load data with population-level data for all cities
datPops <- read_csv("data-clean/AllCities_AllPopulations.csv")

###################
#### FUNCTIONS ####
###################

#' Writes linear cline model output for HCN, Ac, and Li to table
#'
#' @param dataframe_list A list containing individual dataframes with
#' the frequency of HCN, Ac (if present), and Li (if present), and
#' standardized distance to the urban centre and distance squared
#' (for quadratic cline model)
#' @return None: Writes dataframe to disk and assigns to global environment
linearClineModelOnly <- function(dataframe_list){

  # Initialize dataset that will hold model outputs
  modelOutputData <- data.frame(
    City = character(),
    betaHCN = numeric(),
    pvalHCN = numeric(),
    betaAc = numeric(),
    pvalAc = numeric(),
    betaLi = numeric(),
    pvalLi = numeric(),
    stringsAsFactors = FALSE
  )
  
  
  for (i in 1:length(dataframe_list)) {
    
    # Retrieve dataframe from list
    dataframe = dataframe_list[[i]]
    
    # Extract city as character
    city = as.character(unique(dataframe$City))
    
    # Initialize vector to hold results
    cline_results <- c()
    
    # Run linear model
    clineModel <- lm(freqHCN ~ std_distance, data = dataframe)
    
    #Extract relavent coeficient
    betaHCN <- round(summary(clineModel)$coefficients["std_distance", "Estimate"], 4)
    pvalHCN <- round(summary(clineModel)$coefficients["std_distance", "Pr(>|t|)"], 4)

    cline_results <- append(cline_results,
                            c(betaHCN, pvalHCN),
                            after = length(cline_results))
    
    ## Ac and Li, IF PRESENT ##
    
    # If no values for inferred Ac and Li HWE allele frequencies
    if (any(!is.na(dataframe[dataframe$City == city, c("AcHWE", "LiHWE")])) == FALSE) {
      cline_results <- append(cline_results,
                              c("NA", "NA", "NA", "NA"),
                              after = length(cline_results)
      )
    }else{
      
      # AC
      
      clineModelAc <- lm(AcHWE ~ std_distance, data = dataframe)
      betaAc <- round(summary(clineModelAc)$coefficients["std_distance", "Estimate"], 4)
      pvalAc <- round(summary(clineModelAc)$coefficients["std_distance", "Pr(>|t|)"], 4)
      
      clineModelLi <- lm(LiHWE ~ std_distance, data = dataframe)
      betaLi <- round(summary(clineModelLi)$coefficients["std_distance", "Estimate"], 4)
      pvalLi <- round(summary(clineModelLi)$coefficients["std_distance", "Pr(>|t|)"], 4)
      
      cline_results <- append(cline_results,
                              c(betaAc, pvalAc, betaLi, pvalLi),
                              after = length(cline_results))
    }
    # print(city)
    # print(cline_results)
    modelOutputData[i, ] <- c(city, cline_results)
  }  
  return(modelOutputData)
}

#' Plots HCN, Ac, or Li against distance to core
#' 
#' @param df Dataframe with population-means for city
#' @param response_var One of `freqHCN`, `AcHWE`, or `LiHWE`
#' @param outpath Path to which plots should be written
#'     
#' @return None: Writes figure to disk
clineBiplot <- function(df, response_var, outpath){
  
  # Get city name
  city_name <- df$City[1]
  # print(city_name)

    plot <- df %>%
      ggplot(., aes_string(x = "std_distance", y = response_var)) +
      geom_point(colour = "black", size = 3.5) +
      geom_smooth(method = "lm", se = FALSE, colour = "black", size = 2) + 
      ylab("Frequency of HCN") + xlab("Standardized distance") +
      ng1
    
    # Full path to which data frame will be written
    path <- paste0(outpath, city_name, ".pdf")
    # print(path)
    
    # Write dataframe
    ggsave(filename = path, plot = plot, device = "pdf", 
           width = 5, height = 5, dpi = 300)
  
}

##################
#### ANALYSES ####
##################

### Output table with results from linear models

# Split cities into different dataframes stored as list
city_dataframes <- split(datPops, datPops$City)

# Linear cline models only.
linearClines <- linearClineModelOnly(city_dataframes)

# Extract number of populations and plants per city. 
# Merge with linear clines model output above
# Write to analysis/tables
table1 <- read.csv("data-raw/AllCities_AllPlants.csv") %>%
  group_by(City) %>%
  summarize(numPops = n_distinct(Population),
            numPlants = n()) %>%
  merge(., linearClines, by = "City") %>% 
  write_csv(., "analysis/tables/Table1_cityClineSummary.csv")

### Output figures of HCN clines

ng1 = theme(
  aspect.ratio = 0.7,
  panel.background = element_blank(),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  panel.border = element_blank(),
  axis.line.x = element_line(color = "black", size = 1),
  axis.line.y = element_line(color = "black", size = 1),
  axis.ticks = element_line(color = "black"),
  axis.text = element_text(color = "black", size = 15),
  axis.title = element_text(color = "black", size = 1),
  axis.title.y = element_text(vjust = 2, face = "bold", size = 18),
  axis.title.x = element_text(vjust = 0.1, face = "bold", size = 18),
  axis.text.x = element_text(size = 16),
  axis.text.y = element_text(size = 16),
  legend.position = "none",
  legend.direction = "vertical",
  legend.text = element_text(size = 13),
  legend.key = element_rect(fill = "white"),
  legend.title = element_text(size = 15, face = "bold"),
  legend.key.size = unit(1.0, "cm")
)

# Create list with city dataframes as elements
city_df_list <- datPops %>% split(.$City)

# Create biplot for all cities with HCN as response
outpath <- "analysis/figures/"
purrr::walk(city_df_list, clineBiplot, 
            response_var = "freqHCN", 
            outpath = outpath)
