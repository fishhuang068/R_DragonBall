##------------------------------------------------
## 本日小挑戰
##------------------------------------------------
#請挑選training data中1-3個你覺得重要的欄位，或好幾個性質類似的欄位，進行轉換，拆解，或合併（自由發揮）。

summary(as.factor(train0$MSSubClass))
 # 20  30  40  45  50  60  70  75  80  85  90 120 160 180 190 
# 536  69   4  12 144 299  60  16  58  20  52  87  63  10  30 
summary(as.factor(train0$MSZoning))
# C (all)      FV      RH      RL      RM 
     # 10      65      16    1151     218
	 
table(train0$MSZoning,train0$MSSubClass)	 
                    # 20  30  40  45  50  60  70  75  80  85  90 120 160 180 190
  # C (all)   2   2   0   0   4   0   1   0   0   0   0   0   0   0   1
  # FV       13   0   0   0   0  25   0   0   0   0   0   5  22   0   0
  # RH        3   1   0   1   1   0   3   0   0   0   3   2   0   0   2
  # RL      508  33   2   4  88 273  30   6  58  20  43  59  11   0  16
  # RM       10  33   2   7  51   1  26  10   0   0   6  21  30  10  11	 
  
summary(train0$YearBuilt)
   # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   # 1872    1954    1973    1971    2000    2010  
summary(test0$YearBuilt) 
  # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   # 1879    1953    1973    1971    2001    2010
 
fish_dat0<- train0%>%
	mutate(house_age_type=case_when(max(YearBuilt)-YearBuilt<=5~1,
			max(YearBuilt)-YearBuilt<=10~2,
			max(YearBuilt)-YearBuilt<=15~3,
			max(YearBuilt)-YearBuilt<=20~4,
			TRUE~5),
		houseRemod_age_type=case_when(max(YearBuilt)-YearRemodAdd<=5~1,
			max(YearBuilt)-YearRemodAdd<=10~2,
			max(YearBuilt)-YearRemodAdd<=15~3,
			max(YearBuilt)-YearRemodAdd<=20~4,
			TRUE~5),
		Remod=case_when(house_age_type!=houseRemod_age_type~1,TRUE~0))%>%
	select(Id,MSSubClass,MSZoning,YearBuilt,YearRemodAdd,house_age_type,houseRemod_age_type,Remod)
head(fish_dat0)

fish_dat1<-fish_dat0%>%
	group_by(MSZoning,MSSubClass)%>%
	summarise(RemoCount = sum(Remod))%>%
	arrange(-RemoCount)	
head(fish_dat1)

table(fish_dat0$MSZoning,fish_dat0$MSSubClass,fish_dat0$Remod)	
 