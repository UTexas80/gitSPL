# Install Packages  --------------------------------------------------------------------------------
# install.packages('caTools')
# install.packages('ggplot2')
# install.packages("ggthemes") # Install 
# install.packages('plotly')
# install.packages('reshape')
# install.packages("reshape2")
# Load library  ------------------------------------------------------------------------------------
library(caTools)
library(ggplot2) 
library(ggthemes) # Load
library(reshape)
library(quantmod)                                                               # Load quantmod
library(tidyquant)                                                              # Loads tidyquant, tidyverse, lubridate, quantmod, TTR, and xts
library(TTR)   
# Max and Min Price for Each Quarter  --------------------------------------------------------------
SPL_max_by_qtr <- SPL %>%                                                       # Max for Each Quarter
  tq_transmute(select     = adjusted, 
               mutate_fun = apply.quarterly, 
               FUN        = max, 
               col_rename = "max.close") %>%
  mutate(year.qtr = paste0(year(date), "-Q", quarter(date))) %>%
  select(-date)
SPL_max_by_qtr
# --------------------------------------------------------------------------------------------------
SPL_min_by_qtr <- SPL %>%                                                       # Min for Each Quarter
  tq_transmute(select     = adjusted, 
               mutate_fun = apply.quarterly, 
               FUN        = min, 
               col_rename = "min.close") %>%
  mutate(year.qtr = paste0(year(date), "-Q", quarter(date))) %>%
  select(-date)
SPL_min_by_qtr
# --------------------------------------------------------------------------------------------------
SPL_by_qtr <- left_join(SPL_max_by_qtr, SPL_min_by_qtr,                         # Left Join Min/Max By Quarter
                        by = c("year.qtr" = "year.qtr"))
SPL_by_qtr
# Chart  -------------------------------------------------------------------------------------------
SPL_by_qtr %>%
ggplot(aes(x = year.qtr,  color = "SPL")) +                                     # ggplot
  geom_segment(aes( xend = year.qtr,y = min.close, yend = max.close),
               size = 1) +
  geom_point(aes(y = max.close), size = 2) +
  geom_point(aes(y = min.close), size = 2) +
  theme(plot.background = element_rect(fill = "white")) +
  theme(panel.background = element_rect(fill = 'grey')) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_y_continuous(labels = scales::dollar) +
  scale_color_economist() +
  ggtitle("SPL: Min/Max Price By Quarter")
# redacted ggplot code------------------------------------------------------------------------------
  # labs(title = "SPL: Min/Max Price By Quarter",
  #     y = "Stock Price", color = "") +
  # theme_tq() +
  # theme(panel.background = element_rect(fill = 'green') +
  # theme_tq_green() + scale_color_tq(theme = "green") + scale_fill_tq(theme = "green")  +   #Theme:Green    
  # scale_color_tq()  +
  # theme_economist() +  
  # theme(axis.title.x = element_text(face="bold", colour="#990000", size=20),
  #     axis.text.x  = element_text(angle=45, vjust=0.5, size=16))