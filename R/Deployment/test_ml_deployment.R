library(caret)
library(tidyverse)

df2 = read_csv("ex2data2.txt", col_names = FALSE)
head(df2)

reserved = df2 %>% sample_n(20)
df2_train = df2 %>% setdiff(reserved)

dim(reserved)

write.csv(reserved, 'test_data.csv', row.names = FALSE)

names(df2_train) = c("Test1", "Test2", "Label")

cols <- c("0" = "red","1" = "blue")
df2_train %>% ggplot(aes(x = Test1, y = Test2, color = factor(Label))) + geom_point(size = 4, shape = 19, alpha = 0.6) +
scale_colour_manual(values = cols,labels = c("Failed", "Passed"),name="Test Result")


feature_mapping = function(df){
  new_data = c()
  
  for(i in 1:6){
    for(j in 0:i){
      temp = (df$Test1)^i+(df$Test2)^(i-j)
      new_data = cbind(new_data,temp)
    }
  }
  
  colnames(new_data) = paste0("V",1:ncol(new_data))
  new_data
}


mapped = feature_mapping(df2_train)
head(mapped)

df_final = cbind(df2_train, mapped)
dim(df_final)

df_final$Label = as.factor(df_final$Label )
levels(df_final$Label) <- c("Failed", "Passed")



set.seed(0)

cctrl1 <- trainControl(method = "cv", number = 10,
                       allowParallel = TRUE,
                       summaryFunction = twoClassSummary,
                       classProbs = TRUE
)


rlGrid <- expand.grid( cost = seq(0.001, 1, length.out = 20),
                       loss =  "L2_primal",
                       epsilon = 0.01 )

my_model <- train(Label ~ .,  data = df_final, 
                  method = 'regLogistic',
                  trControl = cctrl1,
                  metric = "ROC", 
                  preProc = c("center", "scale"),
                  tuneGrid = rlGrid)
my_model


save(my_model , file = 'RegularizedLogisticRegression.rda')


