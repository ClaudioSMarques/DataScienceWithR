# R4DS: Data visualization with ggplot2 exercices 

# prerequisite

library(tidyverse)

# Dataset: 
data(mpg)


# Exercices: 

# 1) execute ggplot(data = mpg), whats do you see?

ggplot( data = mpg)

# just a white screen

# 2) How many rows in mtcars? And how many columns?

View(mtcars)

# In mtcars there are 32 rows and 11 columns.

# 3)What does the drv variable describe? Read the help for ?mpg to find out.

?mpg

# The drv variable describes the type of drive train.

# 4) Create a scatter plot of hwy versus cyl

ggplot(data = mpg, mapping = aes(x = cyl, y = hwy)) + geom_point()

# 5) What happens if you create a scatter plot of class versus drv? 
# Why is this plot not useful?

ggplot(data = mpg, mapping = aes(x = cyl, y = class)) + geom_point()

# Both variables are categorical, so they won't plot a relationship,
# but rather classify the variables into distinct categories.

# 6) What is wrong with this code? Why are the points not blue? 

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, colour = 'blue'))

# This happens because the argument colour = 'blue' is inside aes(), 
# which is the function used for aesthetic mapping. To apply the color, 
# it should be done inside geom_point()

# 7) Which variables in mpg are categorical? Which are continuous?

# categorical: manufacturer, model, class, drv, fl, cyl.
# continuous : year, trans, cty, hwy, displ.
