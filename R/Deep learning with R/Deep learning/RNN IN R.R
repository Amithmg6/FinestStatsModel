
library(keras)
install_keras()

## Real data in the book
dir.create("~/Downloads/jena_climate", recursive = TRUE)

download.file(
  "https://s3.amazonaws.com/keras-datasets/jena_climate_2009_2016.csv.zip",
  "~/jena_climate/jena_climate_2009_2016.csv.zip"
)
unzip(
  "~/Downloads/jena_climate/jena_climate_2009_2016.csv.zip",
  exdir = "~/Downloads/jena_climate"
)

## input data

demo=openxlsx::read.xlsx("C:/Users/kotre/Desktop/Data_for_Modeling.xlsx",sheet="modeling_data_days")
head(demo)

# Data columns
date=lubridate::as_date(demo$Dates,origin = "1899-12-30")
exit=demo$Exits
demo_new=as.data.frame(cbind(date, exit))
colnames(demo_new) = c("Date","Exit")

## USING THE JENA DATASET
start.time <- Sys.time()
jena_data <- readr::read_csv("~/Deep learning with R/Deep learning/jena_climate_2009_2016.csv")
dplyr::glimpse(jena_data)

## plot the data
library(ggplot2) 
ggplot(jena_data, aes(x = 1:nrow(jena_data), y = `T (degC)`)) + geom_line()

## plotting a smaller plot
ggplot(jena_data[1:1440,], aes(x=1:1440, y = `T (degC)` ))+geom_line()

# demo_ts object
# demo_ts = ts(demo_new)
# 
# library(TSstudio)
# 
# TSstudio::ts_plot(demo_ts)

# RNN MODEL IN R STUDIO

# RNN MODEL IN R STUDIO on JENA DATASET ####

## converting the data to floating point matrix

data = data.matrix(jena_data[,-1])

## Normaliz the data

train_data <- data[1:200000,]
mean_data <- apply(train_data, 2, mean)
std_data <- apply(train_data, 2, sd)

data <- scale(data,center = mean_data, scale = std_data)
psych::describe(data)

## Time series samples and their targets

generator <- function(data, lookback, delay, min_index, max_index,
                      shuffle = FALSE, batch_size = 128, step = 6) {  
  if (is.null(max_index))    
    max_index <- nrow(data) - delay - 1  
  i <- min_index + lookback  
  function() {    
    if (shuffle) {
      rows <- sample(c((min_index+lookback):max_index), size = batch_size)    } 
    else {      if (i + batch_size >= max_index)        
      i <<- min_index + lookback      
    rows <- c(i:min(i+batch_size, max_index))      
    i <<- i + length(rows)    
    }
    samples <- array(0, dim = c(length(rows),   
                                lookback / step,
                                dim(data)[[-1]])) 
    targets <- array(0, dim = c(length(rows)))
    for (j in 1:length(rows)) {      
      indices <- seq(rows[[j]] - lookback, 
                     rows[[j]],
                     length.out = dim(samples)[[2]])
      samples[j,,] <- data[indices,]
      targets[[j]] <- data[rows[[j]] + delay,2] 
    }
    list(samples, targets)  
  }
}

## feeding the data to generator

lookback <- 1440
step <- 6
delay <- 144
batch_size <- 128

# Training generator
train_gen <- generator(  
  data,  
  lookback = lookback,
  delay = delay,
  min_index = 1,  
  max_index = 200000, 
  shuffle = TRUE,
  step = step,
  batch_size = batch_size )

# Validation generator
val_gen = generator(  
  data,  
  lookback = lookback,  
  delay = delay,
  min_index = 200001, 
  max_index = 300000,
  step = step,
  batch_size = batch_size )

# Test generator
test_gen <- generator(  
  data, 
  lookback = lookback,
  delay = delay,
  min_index = 300001, 
  max_index = NULL,
  step = step,
  batch_size = batch_size )

# Val steps
val_steps <- (300000-200001)/batch_size
val_steps

# Test steps
test_steps <- (nrow(data)-300001-lookback)/batch_size
test_steps

## computing common sense baselines

evaluate_naive_method <- function() {  
  batch_maes <- c()  
  for (step in 1:val_steps) {    
    c(samples, targets) %<-% val_gen()  
    preds <- samples[,dim(samples)[[2]],2]
    mae <- mean(abs(preds - targets)) 
    batch_maes <- c(batch_maes, mae)  
  }  
  print(mean(batch_maes))
}

evaluate_naive_method()

## 
library(keras)

model <- keras_model_sequential() %>%  
  layer_flatten(input_shape = c(lookback / step, dim(data)[-1])) %>%  
  layer_dense(units = 32, activation = "relu") %>%  
  layer_dense(units = 1)

model %>% 
  compile(  optimizer = optimizer_rmsprop(),  loss = "mae" )

history <- model %>% 
  fit_generator(  train_gen,  
                  steps_per_epoch = 100,  
                  epochs = 20,  
                  validation_data = val_gen,  
                  validation_steps = val_steps )


plot(history)

end.time1 <- Sys.time()

time1 = end.time1-start.time
time1

### Building with GRU layer ####
start.time.gru = Sys.time()

model_gru <- keras_model_sequential() %>%  
  layer_gru(units = 32, input_shape = list(NULL, dim(data)[[-1]])) %>%  
  layer_dense(units = 1)

model_gru %>% 
  compile(  optimizer = optimizer_rmsprop(),  loss = "mae" )

history_gru <- model_gru %>%
  fit_generator(  train_gen,  
                  steps_per_epoch = 100,  
                  epochs = 20,  
                  validation_data = val_gen,  
                  validation_steps = val_steps )


plot(history_gru)

end.time.gru = Sys.time()

time_gru = end.time.gru-start.time.gru
time_gru

## Making predictions 

pred_generator <- function(gen) {
  function() { # wrap it in a function to make it callable
    gen()[1]  # call the given generator and get the first element (i.e. samples)
  }
}

preds <- model_gru() %>% 
  predict_generator(
    generator = pred_generator(test_gen), # pass test_gen directly to pred_generator without calling it
    steps = test_steps
  )

evaluate_generator(model, test_gen, test_steps)



## on my dataset ####


## converting the data to floating point matrix

data = data.matrix(demo_new[,-1])

## Normaliz the data

train_data <- data[1:500,]
mean_data <- apply(train_data, 2, mean)
std_data <- sd(train_data)

data <- scale(data,center = mean_data, scale = std_data)
psych::describe(data)

## Time series samples and their targets

generator <- function(data, lookback, delay, min_index, max_index,
                      shuffle = FALSE, batch_size = 30, step = 6) {  
  if (is.null(max_index))    
    max_index <- nrow(data) - delay - 1  
  i <- min_index + lookback  
  function() {    
    if (shuffle) {
      rows <- sample(c((min_index+lookback):max_index), size = batch_size)    } 
    else {      if (i + batch_size >= max_index)        
      i <<- min_index + lookback      
    rows <- c(i:min(i+batch_size, max_index))      
    i <<- i + length(rows)    
    }
  samples <- array(0, dim = c(length(rows),   
                              lookback / step,
                              dim(data)[[-1]])) 
  targets <- array(0, dim = c(length(rows)))
  for (j in 1:length(rows)) {      
    indices <- seq(rows[[j]] - lookback, 
                   rows[[j]],
                   length.out = dim(samples)[[2]])
    samples[j,,] <- data[indices,]
    targets[[j]] <- data[rows[[j]] + delay,2] 
    }
  list(samples, targets)  
  }
}

## feeding the data to generator

lookback <- 10
step <- 3
delay <- 1
batch_size <- 30

# Training generator
train_gen <- generator(  
  data,  
  lookback = lookback,
  delay = delay,
  min_index = 1,  
  max_index = 600, 
  shuffle = TRUE,
  step = step,
  batch_size = batch_size )

# Validation generator
val_gen = generator(  
  data,  
  lookback = lookback,  
  delay = delay,
  min_index = 601, 
  max_index = 670,
  step = step,
  batch_size = batch_size )

# Test generator
test_gen <- generator(  
  data, 
  lookback = lookback,
  delay = delay,
  min_index = 671, 
  max_index = NULL,
  step = step,
  batch_size = batch_size )

# Val steps
val_steps <- (670-601)/batch_size
val_steps

# Test steps
test_steps <- (nrow(data)-671-lookback)/batch_size
test_steps

## computing common sense baselines

evaluate_naive_method <- function() {  
  batch_maes <- c()  
  for (step in 1:val_steps) {    
    c(samples, targets) %<-% val_gen()  
    preds <- samples[,dim(samples)[[2]],2]
    mae <- mean(abs(preds - targets)) 
    batch_maes <- c(batch_maes, mae)  
  }  
  print(mean(batch_maes))
  }

evaluate_naive_method(data)

## 
library(keras)

model <- keras_model_sequential() %>%  
  layer_flatten(input_shape = c(lookback / step, dim(data)[-1])) %>%  
  layer_dense(units = 32, activation = "relu") %>%  
  layer_dense(units = 1)

model %>% 
  compile(  optimizer = optimizer_rmsprop(),  loss = "mae" )

history <- model %>% 
  fit_generator(  train_gen,  
                  steps_per_epoch = 100,  
                  epochs = 20,  
                  validation_data = val_gen,  
                  validation_steps = val_steps )












