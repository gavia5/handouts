## Editor

vals <- seq(1, 100)

vals <- seq(from = 1, 
            to = 100)

## Load Data

storm <- read.csv('data/StormEvents.csv')


storm <- read.csv('data/StormEvents.csv', na.strings = c('NA', "UNKNOWN"))

## Lists

x <- list('abc', 1:3, sin)
x

str(x)

## Factors

education <- factor(
  c('college', 'highschool', 'college', 'middle', 'middle'),
  levels = c('middle', 'highschool','college'))

## Data Frames

income <- c(32000, 28000, 89000, 0, 0)
df <- data.frame(education, income)

## Names

names(df) <- c('ed', 'in')


## Subsetting ranges

days <- c(
  'Sunday', 'Monday', 'Tuesday',
  'Wednesday', 'Thursday', 'Friday',
  'Saturday')
weekdays <- ...
...

## Functions

first <- function(a) {
 result <- a[1, ]
  return(result)
 }


## Flow Control

first <- function(dat) {
  ... {
    result <- dat[[1]]
  } ... {
    result <- dat[1, ]
  }
  return(result)
}

## Distributions and Statistics

rnorm(n = 10)
x <- rnorm(n = 100, mean = 15, sd = 7)
y <- rbinom(n = 100, size = 20, prob = .85)