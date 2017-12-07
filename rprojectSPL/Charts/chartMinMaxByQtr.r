#Example 4: Max and Min Price for Each Quarter
SPL_max_by_qtr <- SPL %>%
  tq_transmute(select     = adjusted, 
               mutate_fun = apply.quarterly, 
               FUN        = max, 
               col_rename = "max.close") %>%
  mutate(year.qtr = paste0(year(date), "-Q", quarter(date))) %>%
  select(-date)
SPL_max_by_qtr

SPL_min_by_qtr <- SPL %>%
  tq_transmute(select     = adjusted, 
               mutate_fun = apply.quarterly, 
               FUN        = min, 
               col_rename = "min.close") %>%
  mutate(year.qtr = paste0(year(date), "-Q", quarter(date))) %>%
  select(-date)
SPL_min_by_qtr

SPL_by_qtr <- left_join(SPL_max_by_qtr, SPL_min_by_qtr,
                        by = c("year.qtr" = "year.qtr"))
SPL_by_qtr

SPL_by_qtr %>%
ggplot(aes(x = year.qtr,  color = "SPL")) +  
  geom_segment(aes( xend = year.qtr,y = min.close, yend = max.close),
               size = 1) +
  geom_point(aes(y = max.close), size = 2) +
  geom_point(aes(y = min.close), size = 2) +
  # labs(title = "SPL: Min/Max Price By Quarter",
  #     y = "Stock Price", color = "") +
  # theme_tq() +
  theme(plot.background = element_rect(fill = "white")) +
  theme(panel.background = element_rect(fill = 'grey')) +
  # theme(panel.background = element_rect(fill = 'green') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  #theme_tq_green() + scale_color_tq(theme = "green") + scale_fill_tq(theme = "green")  +   #Theme:Green    
  # scale_color_tq()  +
  scale_y_continuous(labels = scales::dollar) +
  # theme_economist() + 
  scale_color_economist() +
  ggtitle("SPL: Min/Max Price By Quarter")