##------------------------------------------------
## 本日小挑戰
##------------------------------------------------
#請挑選 training data 中你覺得其他重要的欄位，和房價有什麼關係。
fish_dat0<- train0%>%
	mutate(house_age_type = case_when(max(YearBuilt)-YearBuilt <= 5~1,
			max(YearBuilt)-YearBuilt <= 10~2,
			max(YearBuilt)-YearBuilt <= 15~3,
			max(YearBuilt)-YearBuilt <= 20~4,
			TRUE~5),
		houseRemod_age_type=case_when(max(YearBuilt)-YearRemodAdd <= 5~1,
			max(YearBuilt)-YearRemodAdd <= 10~2,
			max(YearBuilt)-YearRemodAdd <= 15~3,
			max(YearBuilt)-YearRemodAdd <= 20~4,
			TRUE~5),
		Remod=case_when(house_age_type!=houseRemod_age_type~1, TRUE~0))%>%
	select(Id, MSSubClass, MSZoning, YearBuilt, YearRemodAdd, house_age_type, houseRemod_age_type, Remod,SalePrice)
head(fish_dat0)

fish_dat0 %>%
gather(-SalePrice, key = "var", value = "value") %>%
  ggplot(aes(x = value, y = SalePrice)) +   # Plot the values
    facet_wrap(~ var, scales = "free") +   # In separate panels
    geom_point()