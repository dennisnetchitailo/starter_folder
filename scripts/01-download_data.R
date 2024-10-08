#### Preamble ####
# Purpose: Downloads and saves the dataset "Toronto  Shelter System Flow"
# from OpenDataToronto.
# Author: Dennis Netchitailo
# Date: 23 September 2024 
# Contact: dennis.netchitailo@utoronto.ca 
# License: MIT
# Pre-requisite: have the following libraries installed: 
"opendatatoronto","tidyverse"


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####

package <- show_package("ac77f532-f18b-427c-905c-4ae87ce69c93")
package

resources <- list_package_resources("ac77f532-f18b-427c-905c-4ae87ce69c93")


datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

data <- filter(datastore_resources, row_number()==1) %>% 
  get_resource()


#### Save data ####

write_csv(data, "data/raw_data/raw_data.csv") 

