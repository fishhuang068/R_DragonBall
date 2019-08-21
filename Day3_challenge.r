##------------------------------------------------
## 本日小挑戰
##------------------------------------------------
#請利用 `TotalBsmtSF`(總地下室面積) 、 `X1stFlrSF`(1樓面積) 、 `X2ndFlrSF`(2樓面積) 
#1.建立出一個總房屋面積 `TotalSF`
#2.將 `TotalSF` 做標準化轉換

summary(train0$TotalBsmtSF)
   # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    # 0.0   795.8   991.5  1057.4  1298.2  6110.0
summary(train0$X1stFlrSF)
  # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    # 334     882    1087    1163    1391    4692
summary(train0$X2ndFlrSF)
 # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
      # 0       0       0     347     728    2065
	  
train0$TotalSF<- train0$TotalBsmtSF + train0$X1stFlrSF + train0$X2ndFlrSF
summary(train0$TotalSF)
  # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    # 334    2010    2474    2567    3004   11752 
	
train0$TotalSF_stand<-scale(train0$TotalSF)
summary(as.numeric(train0$TotalSF_stand))
   # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -2.7175 -0.6785 -0.1132  0.0000  0.5318 11.1778
