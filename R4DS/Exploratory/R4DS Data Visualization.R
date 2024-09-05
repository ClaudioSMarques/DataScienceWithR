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

ggplot(data = mpg, mapping = aes(x = cyl, y = hwy)) + geom_point() +
  geom_jitter()

# 5) What happens if you create a scatter plot of class versus drv? 
# Why is this plot not useful?

ggplot(data = mpg, mapping = aes(x = cyl, y = class)) + geom_point() +
  geom_jitter()

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

# 8) Map a continuous variable to color, size, and shape. 
# How do these aesthetics behave differently for categorical and continuous variables?

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = year)) + geom_point()

# It depends on the argument. For example, shape only works with categorical variables,
# while size and color can be applied to continuous variables. In this case, 
# they return a gradient scale containing the range of values

# 9) What happens if you map the same variable multiple times?

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = class, size = class,
                                 shape = class, alpha = class)) + geom_point()

# R does not ignore the iteration but applies the variable to each
# aesthetic as appropriate, although some aesthetics, like shape,
# may not work well with continuous variables.

# 10) What does the stroke aesthetic do? Which shapes does it work with?

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = class, stroke = 0.3)) + 
  geom_point()

#The stroke aesthetic controls the thickness of the border around shapes.  


# 11) What happens if you map an aesthetic to something other than a variable name,
# such as aes(colour = displ < 5)?

ggplot(data = mpg, mapping = aes( x = displ, y = hwy, colour = displ <5))  + 
  geom_point()

# The plot will return logical values mapped to the aesthetic, which typically
# results in a plot with only two colors representing TRUE and FALSE.

# 12) What happens when you create facets on a continuous variable?

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = class)) +
  geom_point() + facet_wrap(~ hwy, nrow = 3)

# Although you can plot the graph, the facets become confusing and do not present 
# relevant information.

# 13) What do blank cells mean in a plot with facet_grid(drv ~ cyl)? 
# How do they relate to this plot? 

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid( drv ~ cyl)

# Blank cells represent combinations of variables that are not observed in the data.

# 14) What does the following plot do? What does . do? 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = 'jitter') + 
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = 'jitter') + 
  facet_grid(. ~ cyl)

# Creates a plot that is divided into facets based on the drv variable 
# with no additional division.

# 15) Take the first facet grid from this section:
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# What are the advantages of using faceting instead of color aesthetics?
# What are the disadvantages? How might the balance change if you had a larger dataset

# While the color aesthetic alone allows us to differentiate between car classes, 
# facet_wrap lets us examine the linear relationship for each factor in the dataset. 
# Depending on the size of the dataset and the number of observations for each variable, 
# it might be useful to create a facet plot by the class variable, as this could become 
#more complex to interpret. Instead, it might be more effective to use a simpler factor 
# (such as transmission type) for faceting and use color to indicate car types, 
# making the plot more informative.

# 16) Read ?facet_wrap. What does nrow do? 
# What does ncol do? What other options control the layout of individual panels? 
# Why doesn’t facet_grid() have nrow and ncol variables?

# ncol will determine the number of columns and nrow the number of rows. 
# These arguments, along with space and scales, control the layout.

# 17) When using facet_grid(), you should place the variable with more specific
# levels in the columns. Why?

# because this typically results in a clearer and more compact arrangement of the panels.

# 18) What geom would you use to draw a line plot? A boxplot? A histogram? An area plot

# For that, I would use geom_line, geom_boxplot, geom_histogram, and geom_area

# 19) Execute the code in your head and predict the result. 
# Then run the code in R and check your predictions:

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

# 20) What does show.legend = FALSE do? What happens if you remove it? 
# Why do you think I used this earlier in the chapter?

# show.legend is the argument that controls 
# whether or not the legend is displayed on the plot.

# 21) What is the 'se' argument for geom_smooth?

# The se argument demonstrates the level of confidence in the smoothing of the 
# model chosen for geom_smooth.

# 22) Will these two graphs be different? Why? Why not?

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

# The graphs will not be different; it's just unnecessary to write the mapping inside
# point and smooth when it can be done inside ggplot, which makes the code more readable.

# 23) Recreate the R code necessary to generate the following graphs:

ggplot(data = mpg, 
       mapping = aes(x = displ, y = hwy)) + 
  geom_point() +
  geom_smooth(se = FALSE)

ggplot(data = mpg, 
       mapping = aes(x = displ, y = hwy)) + 
  geom_point() +
  geom_smooth(se = FALSE, mapping = aes(line = drv))


ggplot(data = mpg, 
       mapping = aes(x = displ, y = hwy, colour = drv, line = drv)) + 
  geom_point() +
  geom_smooth(se = FALSE)

ggplot(data = mpg, 
       mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = drv)) +
  geom_smooth(se = FALSE)

ggplot(data = mpg, 
       mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = drv)) +
  geom_smooth(se = FALSE,
              mapping = aes(linetype = drv))

ggplot(data = mpg, 
       mapping = aes(x = displ, y = hwy, colour = drv)) + 
  geom_point() 

# 24) What is the default geom associated with stat_summary()? 
# How could you rewrite the previous plot using this geom function 
# instead of the stat function?

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max, 
    fun.y = median
  )
   
summary_stats <-  diamonds %>% group_by(cut) %>% 
  summarise(
    median_depth = median(depth),
    min_depth = min(depth),
    max_depth = max(depth)
  )

ggplot(data = summary_stats, mapping = aes(x = cut , y = median_depth)) +
  geom_pointrange(aes(ymin = min_depth, ymax = max_depth)) + 
  labs(y = 'Depth', x = 'Cut')

# The geom associated with stat_summary is geom_pointrange. 
# To plot the same graph with it, we first need to use dplyr 
# to calculate the statistics, save them in a variable, and 
# then pass this variable with the arguments into geom_pointrange.


# 25) What does geom_col do? What is the difference between it and geom_bar?

# geom_bar calculates the height of the bars based on the count of data, 
# while geom_col plots the graph using the values provided directly in the dataset.

# 26) Most geoms and stats come in pairs, which are almost always used together.
# Read the documentation and make a list of all the pairs, and what they have in common

# 1 geom_point() and stat_identity():
  
 # geom_point(): Plots points.
# stat_identity(): Passes the data as-is without any transformation.
# Commonality: geom_point() uses stat_identity() by default because
#it directly maps the data to points without additional statistical transformation.

# 2 geom_bar() and stat_count():
  
 # geom_bar(): Creates bar charts with heights representing counts of cases.
# stat_count(): Computes counts of cases at each level of a factor.
# Commonality: geom_bar() uses stat_count() by default to calculate 
# the number of occurrences of each category.

# 3 geom_col() and stat_summary():
  
 #  geom_col(): Plots bars with heights provided directly in the data.
# stat_summary(): Computes summary statistics like mean, median, etc.
# Commonality: geom_col() is often used with stat_summary() when you want to plot 
# summarized values directly provided in the data.

# 4 geom_smooth() and stat_smooth():
  
  # geom_smooth(): Adds a smoothed line to a plot, such as a regression line.
# stat_smooth(): Computes the smoothed values for the line.
# Commonality: geom_smooth() uses stat_smooth() to compute the smoothed line based
# on the data.

# 5 geom_histogram() and stat_bin():
  
  # geom_histogram(): Creates histograms with bars representing counts in bins.
# stat_bin(): Computes the counts in bins.
# Commonality: geom_histogram() uses stat_bin() to calculate the number of occurrences 
# in each bin.

# 6 geom_boxplot() and stat_boxplot():
  
  # geom_boxplot(): Creates boxplots showing the distribution of data.
# stat_boxplot(): Computes the statistics necessary for creating the boxplot.
# Commonality: geom_boxplot() uses stat_boxplot() to calculate the statistics 
# needed for the plot.

# 26) What variables does stat_smooth calculate? What parameters control its behavior?

# stat_smooth() calculates fitted values, confidence intervals, and standard errors, 
# and its behavior is controlled by parameters such as method, formula, se, span, level,
# color, fill, and size

# 27) In our proportion bar chart, we need to set group = 1.
# Why? In other words, what is the problem with these two charts?

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop..))
           
ggplot(data = diamonds) +
             geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))
           
ggplot(data = diamonds) +
             geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1)) 
             
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop.., group = color))

# group = 1 ensures that the entire dataset is used and not just a subset

# 28) What is the problem with this chart? How could you improve it?

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point(position = 'jitter')

# The problem with this chart is the overlap of points. 
# To improve it, you can add position = 'jitter' to see the density of the observations

# 29) Which parameters for geom_jitter() control the amount of jitter?

# The amount of jitter is controlled by width and height:

# width: Defines the amount of horizontal jitter, controlling how much the points 
#spread horizontally.

# height: Defines the amount of vertical jitter, controlling how much the points 
# spread vertically.

# 30) Compare and contrast geom_jitter() with geom_count.

# The difference between geom_jitter() and geom_count() is that geom_jitter()
# uses noise to spread out the points and reduce overlap, allowing you to visualize
# the density of individual observations. On the other hand, geom_count() represents 
# data density by the size of the points, where the size of the points indicates the 
# number of observations at each location.

library(ggplot2)

# 31) What is the default position adjustment for geom_boxplot? 
# Create a visualization of the mpg dataset that demonstrates this.

#  he default position adjustment for boxplot is dodge2.

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = class, y = hwy, fill = class)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

# 32) Transform a stacked bar chart into a pie chart using coord_polar()


ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, fill = drv), position = "stack") +
  coord_polar()

# 33) What does labs() do? Read the documentation.

# labs() allows you to customize the plot by modifying the axis labels,
# title, and adding subtitles.

# 34) What is the difference between coord_quickmap and coord_map?

# coord_quickmap prioritizes speed, while coord_map prioritizes cartographic accuracy.

# 35) What does the following plot tell you about the relationship between city
# and highway mpg? Why is coord_fixed() important? What does geom_abline() do?

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()+
  geom_abline() + 
  coord_fixed()

# coord_fixed() ensures that the proportions are correct, while geom_abline() 
# provides a reference line. The plot shows a positive linear relationship between 
# city and highway mpg.