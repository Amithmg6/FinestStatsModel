

## cnn in r 
library(keras)
install_keras()

## INstalling 
# install.packages("BiocManager")
# BiocManager::install("EBImage")
library(EBImage)

# Read the images
setwd("C:/Users/kotre/OneDrive/Documents/Deep learning with R/Deep learning/images/")

pic1 = c('a1.jpg','a2.jpg','a3.jpg','a4.jpg','a5.jpg',
         'b1.jpg','b2.jpg','b3.jpg','b4.jpg','b5.jpg')

train = list()

for(i in 1:10) {train[[i]] <- readImage(pic1[i])}

## Test images.

pic2 <- c('atest.jpg','btest.jpg')

test <- list()

for(i in 1:2) {test[[i]] <- readImage(pic2[i])}

# explore the image

print(train[[2]])

summary(train[[2]])

display(train[[2]])

plot(train[[2]])

## plot all

par(mfrow = c(2,5))

for(i in 1:10) plot(train[[i]])

par(mfrow = c(1,1))

#### 

str(train)

## resize & combine 101 X 100

for(i in 1:10) {train[[i]] <- resize(train[[i]], 100, 100)}

for(i in 1:2) {test[[i]] <- resize(test[[i]], 100, 100)}

train <- combine(train)

x <- tile(train, 5)

display(x, title='PICTURE')

test <- combine(test)

y <- tile(test,2)

display(y, title= 'test image')

## Reorder dimention

## 4th dim to be first one.

train = aperm(train, c(4,1,2,3))
test = aperm(test, c(4,1,2,3))
str(train)

## Response

trainy <- c(0,0,0,0,0,1,1,1,1,1)
testy <- c(0,1)

## One HOT encoding
trainlabels <- to_categorical(trainy)

testlabels <- to_categorical(testy)

trainlabels

## Model

model <- keras_model_sequential()

model %>% 
  layer_conv_2d(filters = 32,
                kernel_size = c(3,3),
                activation = 'relu',
                input_shape = c(100,100,3)) %>%
  layer_conv_2d(filters = 32,
                kernel_size = c(3,3),
                activation = 'relu') %>% 
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_dropout(rate = 0.25) %>% 
  layer_conv_2d(filters = 64,
                kernel_size = c(3,3),
                activation = 'relu') %>% 
  layer_conv_2d(filters = 64,
                kernel_size = c(3,3),
                activation = 'relu') %>% 
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_dropout(rate = 0.25) %>% 
  layer_flatten() %>% 
  layer_dense(units = 256, activation = 'relu') %>% 
  layer_dropout(rate = 0.25) %>% 
  layer_dense(units = 2, activation = 'softmax') %>% 
  
  compile(loss = 'categorical_crossentropy',
          optimizer = optimizer_sgd(lr = 0.01,
                                    decay = 1e-6,
                                    momentum = 0.9,
                                    nesterov = T),
          metrics = c('accuracy'))

summary(model)

## Fit model

history <- model %>%
          fit(train,
              trainlabels,
              epochs = 50,
              batch_size = 32,
              validation_split = 0.2)

plot(history)


## Evaluation & prediction - train data.

model %>% evaluate(train, trainlabels)

pred <- model %>% predict_classes(train)

table(Predicted = pred, Actual = trainy)

## Calculate prob

prob <- model %>% predict_proba(train)

cbind(prob, Predicted_Class = pred,Actual = trainy)

