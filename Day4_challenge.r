##------------------------------------------------
## 本日小挑戰
##------------------------------------------------
#請試著改變randomforest與XGBoost模型的參數，重新訓練模型並輸出各自的rmse

# randomforest(ntree: 100-->500-->900)
regressor_100 <- randomForest(formula = SalePrice_log ~ .,
                          data = training_set,
                          ntree = 100)
y_pred_100 <- predict(regressor_100, newdata = val_set)
rmse(val_set$SalePrice_log, y_pred_100)   #0.1460021

regressor_500 <- randomForest(formula = SalePrice_log ~ .,
                          data = training_set,
                          ntree = 500)
y_pred_500 <- predict(regressor_500, newdata = val_set)
rmse(val_set$SalePrice_log, y_pred_500)  #0.1436514

regressor_900 <- randomForest(formula = SalePrice_log ~ .,
                          data = training_set,
                          ntree = 900)
y_pred_900 <- predict(regressor_900, newdata = val_set)
rmse(val_set$SalePrice_log, y_pred_900)  #0.1442118

# XGBoost(nrounds:100--->1000--->3000)
set.seed(100)
regressor_XGB100 <- xgb.train(params = param, data = dtrain, nrounds = 100)
y_pred_XGB100 <- predict(regressor_XGB100, dval)
rmse(val_set$SalePrice_log, y_pred_XGB100) #4.162636

regressor_XGB1000 <- xgb.train(params = param, data = dtrain, nrounds = 1000)
y_pred_XGB1000 <- predict(regressor_XGB1000, dval)
rmse(val_set$SalePrice_log, y_pred_XGB1000) #0.1493493

regressor_XGB3000 <- xgb.train(params = param, data = dtrain, nrounds = 3000)
y_pred_XGB3000 <- predict(regressor_XGB3000, dval)
rmse(val_set$SalePrice_log, y_pred_XGB3000) #0.1442952


