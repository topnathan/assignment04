library(tidyverse)
library(haven)

library(readxl)
SDOH_2020_COUNTY <- read_excel("E:/Graduate-2024fall/intro_to_data_science/assignment04/sdoh-data/SDOH_2020_COUNTY_1_0.xlsx", 
                               sheet = "Data")

sdoh_2020_cl <- SDOH_2020_COUNTY |>
  rename(year = YEAR, 
         state = STATE,
         county = COUNTY,
         county_fips = COUNTYFIPS,
         state_fips = STATEFIPS,
         urindex = AHRF_USDA_RUCC_2013,
         med_inc = ACS_MEDIAN_HH_INC,
         inc_ai = ACS_MEDIAN_HH_INC_AIAN,
         inc_as = ACS_MEDIAN_HH_INC_ASIAN,
         inc_bl = ACS_MEDIAN_HH_INC_BLACK,
         inc_his = ACS_MEDIAN_HH_INC_HISP,
         inc_mul = ACS_MEDIAN_HH_INC_MULTI,
         inc_nh = ACS_MEDIAN_HH_INC_NHPI,
         inc_ot = ACS_MEDIAN_HH_INC_OTHER,
         inc_wh = ACS_MEDIAN_HH_INC_WHITE
  ) |>
  select(year, state, county, county_fips, state_fips, 
       urindex, med_inc,
       inc_ai, inc_as, inc_bl,
       inc_his, inc_mul, inc_nh,
       inc_ot, inc_wh)

sdoh_2020_cl |>
  count(urindex) 
  ggplot() +
  geom_bar(
    mapping = aes(x = urindex,
                  y = n)
  )

