library(tidyverse)
library(NHANES)

# Briefly glimpse  contents of dataset
glimpse(NHANES)

# Select one column by its name, without quotes
select(NHANES, Age)

# Select two ore more columns by name, without quotes
select(NHANES, Age, Weight, BMI)

# To exclude a column, use minus (-)
select(NHANES, -HeadCirc)

# All columns that starts with letters "BP" (blood pressure)
select(NHANES, starts_with("BP"))

# All columns ending in letters "Day"
select(NHANES, ends_with("Day"))

# All columns containing letters "Age"
select(NHANES, contains("Age"))

# Save the selected columns as a new data frame
# Recall the style guide for naming objects
nhanes_small <- select(NHANES, Age, Gender, BMI, Diabetes, PhysActive, BPSysAve, BPDiaAve, Education)
nhanes_small

# Rename all columns to snake case
nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)
nhanes_small

# Rename gender column to sex
nhanes_small <- rename(nhanes_small, sex = gender)
nhanes_small

# Rename in a pipe
nhanes_small %>%
  select(phys_active) %>%
  rename(physically_active = phys_active)

# Now practice
nhanes_small %>%
  select(bp_sys_ave, education)

nhanes_small %>%
  rename(
    bp_sys = bp_sys_ave,
    bp_dia = bp_dia_ave
  )

nhanes_small %>%
  select(bmi, contains("age"))

nhanes_small %>%
  select(bmi, contains("bp"))

nhanes_small %>%
  select(starts_with("bp_")) %>%
  rename(bp_systolic = bp_sys_ave)



# Practicing with filter function

# Participants who are physically active
nhanes_small %>%
  filter(phys_active != "No") %>%
  select(phys_active)

# BMI = 25
nhanes_small %>%
  filter(bmi == 25) %>%
  select(bmi)

# BMI >= 25
nhanes_small %>%
  filter(bmi >= 25) %>%
  select(bmi)

# BMI is 25 and phys_active is No
nhanes_small %>%
  filter(bmi == 25 & phys_active == "No") %>%
  select(bmi, phys_active)

# When BMI is 25 OR phys_active is No
nhanes_small %>%
  filter(bmi == 25 | phys_active == "No") %>%
  select(bmi, phys_active)

# Modifying or adding columns

nhanes_small %>%
  mutate(age = age * 12)

nhanes_small %>%
  mutate(
    age = age * 12,
    logged_bmi = log(bmi)
  )
nhanes_small %>%
  mutate(old = if_else(age >= 30, "Yes", "No"))


