# Getting Started

library(readr)
person <- read_csv(
  file = 'data/census_pums/sample.csv',
  col_types = cols_only(
    AGEP = 'i',
    WAGP = 'd',
    SCHL = 'c',
    SEX = 'c'))

## Layered Grammar

library(ggplot2)
ggplot(person, aes(x = WAGP)) +
  geom_histogram()

library(dplyr)
person <- filter(
  person,
  WAGP > 0,
  WAGP < max(WAGP, na.rm = TRUE))

ggplot(person,
  aes(x = AGEP, y = WAGP)) +
  geom_point()

ggplot(person,
  aes(x = AGEP, y = WAGP)) +
  geom_boxplot()

## Layer Customization

ggplot(person,
  aes(x = SCHL, y = WAGP)) +
  geom_boxplot() +
  geom_point(colour = 'red') + geom_boxplot()

ggplot(person,
  aes(x = SCHL, y = WAGP)) +
  geom_boxplot() +
  geom_point(
    colour = 'red',
    stat = 'summary',
    fun.y = mean)

## Adding Aesthetics

ggplot(person,
  aes(x = SCHL, y = WAGP, colour = SEX)) +
  geom_boxplot()

person$SEX <- factor(person$SEX, levels = c("2", "1"))

ggplot(person,
  aes(x = SCHL, y = WAGP, color = SEX)) +
  geom_boxplot()

# Storing and Re-plotting



schl_wagp<- ggplot(person,
  aes(x = SCHL, y = WAGP, color = SEX)) +
  geom_point(
    stat = 'summary',
    fun.y = 'mean')

schl_wagp <- schl_wagp +
  scale_color_manual(
    values = c('black', 'red'))

ggsave(filename = 'schl_wagp.pdf',
  plot = schl_wagp,
  width = 4, height = 3)

# Smooth Lines

ggplot(person,
  aes(x = SEX, y = WAGP)) + 
  geom_point() +
  geom_smooth(
    method = lm,
    levell=0.99,
    aes(group = 0))

# Axes, Labels and Themes

sex_wagp <- ggplot(person,
  aes(x = SEX, y = WAGP)) + 
  geom_point() +
  geom_smooth(
    method = 'lm',
    aes(group = 0))

sex_wagp + labs(
  title = 'Wage Gap',
  x = NULL,
  y = 'Wages (Unadjusted USD)')

sex_wagp + scale_y_continuous(
  trans = 'log10')

sex_wagp + theme_dark()

sex_wagp + theme_bw() +
  labs(title = 'Wage Gap') +
  theme(
    plot.title = element_text(
      face = 'bold',
      hjust = 0.5))

# Facets

person$SCHL <- factor(person$SCHL)
levels(person$SCHL) <- list(
  'High School' = '16',
  'Bachelor\'s' = '21',
  'Master\'s' = '22',
  'Doctorate' = '24')

ggplot(na.omit(person),
  aes(x = SEX, y = WAGP)) + 
  geom_point() +
  geom_smooth(
    method = 'lm',
    aes(group = 0)) +
  facet_wrap(vars(SCHL))

ggplot(person, aes(x = AGEP, y = WAGP, colour = SEX)) + 
         geom_point(stat = 'summary', fun.y = 'mean')



       library(dplyr)s
       person <- filter(
         person,
         WAGP > 0,
         WAGP < max(WAGP, na.rm = TRUE))
       