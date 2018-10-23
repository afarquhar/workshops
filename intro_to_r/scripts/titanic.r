library(tidyverse)

titanic_df = read.csv('./data/titanic.csv')

passengers = read_csv('./data/titanic.csv')

summary(passengers)

passengers %>% summary

print(passengers %>% filter(Sex == "male"))
print(passengers %>% filter(Sex == "female"))

print(passengers %>% arrange(Fare))

print(passengers %>%arrange(desc(Fare)))

passengers_with_famsize = passengers %>% mutate(FamSize = Parch + SibSp)

passengers %>%
  mutate(FamSize = Parch + SibSp) %>%
  arrange(desc(FamSize))


passengers1 <- passengers %>%
  mutate(Survived = ifelse(Survived == 0, "No", "Yes"))



  # Plot barplot of passenger Sex
sex_barplot = ggplot(passengers, aes(x = Sex)) + geom_bar()


# Scatter plot of Age vs Fare
age_fare_scatterplot = ggplot(passengers, aes(x = Age, y = Fare, colour = Sex)) +
  geom_point()


# Scatter plot of Age vs Fare colored by Sex faceted by Survived
age_fare_sex_survived_plot = ggplot(passengers1, aes(x = Age, y = Fare, color = Sex)) +
  geom_point() +
  facet_grid(~Survived)


ggsave('./output/age_fare_sex_survived_plot.png', age_fare_sex_survived_plot)


# Plot barplot of passenger Sex & fill according to Survival
sex_survived_plot = ggplot(passengers1, aes(x = Sex, fill = Survived)) +
  geom_bar()



# Check out mean Fare
passengers %>%
  summarise(meanFare = mean(Fare))

# Check out mean Fare
passengers %>%
  summarise(medianFare = median(Fare))

# Check out mean Fare for men
passengers %>%
  filter(Sex == "male") %>%
  summarise(meanFare = mean(Fare))


passengers %>%
  filter(Sex == "female") %>%
  summarise(meanFare = mean(Fare))



# Check out mean Fare & number of survivors grouped by Sex
passengers %>%
  group_by(Sex) %>%
  summarise(meanFare = mean(Fare), numSurv = sum(Survived))

# Check out mean Fare & proportion of survivors grouped by Sex
passengers %>%
  group_by(Sex) %>%
  summarise(meanFare = mean(Fare), numSurv = sum(Survived)/n())
