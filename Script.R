# Load the necessary libraries
library(tidyverse)

# Load the dataset
file_path <- "exam_marks.csv"
exam_data <- read.csv(file_path)

# 1.Display the first few rows of the dataset
head(exam_data)
install.packages("tidyverse")

# Display summary statistics
summary(exam_data)

# 2. Correlation Matrix
# Calculate the correlation matrix
cor_matrix <- cor(exam_data[, c("algebra_exam1", "data_structure_exam1", "maths_exam1", "electronics_exam1", "architecture_exam1",
                                "algebra_exam2", "data_structure_exam2", "maths_exam2", "electronics_exam2", "architecture_exam2")])
# Print the correlation matrix
print(cor_matrix)


# 3. Boxplot for exam scores
exam_data %>%
  gather(key = "subject", value = "score", -c(serial_no, roll_no, student_name,total_marks)) %>%
  ggplot(aes(x = subject, y = score, fill = subject)) +
  geom_boxplot() +
  labs(title = "Boxplot of Exam Scores by Subject")

# 4. Order the dataset by total_marks in descending order and then by student_name
sorted_data <- exam_data %>%
  arrange(desc(total_marks), student_name)
print(sorted_data[, c("student_name", "total_marks")])



# Load the necessary libraries
library(tidyverse)
library(scales)

file_path <- "exam_marks.csv"
exam_data <- read.csv(file_path)

# Calculate total marks for each student
exam_data$total_marks <- rowSums(select(exam_data, contains("_exam")))

#5. Create a pie chart with percentage labels
pie_data <- exam_data %>%
  summarise(across(contains("_exam"), sum)) %>%
  gather(key = "subject", value = "total_marks") %>%
  arrange(desc(total_marks))
# Calculate percentages
pie_data$percentage <- scales::percent(pie_data$total_marks / sum(pie_data$total_marks))
# Create the pie chart with percentage labels
pie(pie_data$total_marks, labels = paste(pie_data$subject, "\n", pie_data$percentage), main = "Distribution of Total Marks by Subject")



# Load the necessary libraries
library(tidyverse)

# Load the dataset
file_path <- "exam_marks.csv"
exam_data <- read.csv(file_path)

#6. Create a bar graph for data_structure_exam1
ggplot(exam_data, aes(x = data_structure_exam1)) +
  geom_bar(stat = "count", fill = "purple", color = "white") +
  labs(title = "Bar Graph for Data Structure Exam 1",
       x = "Data Structure Exam 1 Scores",
       y = "Frequency")

# Load the necessary libraries
library(tidyverse)
# Load the dataset
file_path <- "exam_marks.csv"
exam_data <- read.csv(file_path)

#7.Create a bar graph for data_structure_exam2
ggplot(exam_data, aes(x = data_structure_exam2)) +
  geom_bar(stat = "count", fill = "green", color = "white") +
  labs(title = "Bar Graph for Data Structure Exam 2",
       x = "Data Structure Exam 2 Scores",
       y = "Frequency")


# Load the necessary libraries
library(tidyverse)  
# Load the dataset
file_path <- "exam_marks.csv"
exam_data <- read.csv(file_path)

#8. Create a bar plot with medians on the y-axis
#Select only the columns related to exams (excluding total_marks)
exam_columns <- exam_data %>%
  select(-total_marks) %>%
  select(contains("_exam"))
# Reshape the data for plotting
gathered_data <- exam_columns %>%
  gather(key = "subject", value = "score")
# Calculate medians for each subject
medians_data <- gathered_data %>%
  group_by(subject) %>%
  summarise(median_score = median(score))
# Create a bar plot with medians on the y-axis
ggplot(medians_data, aes(x = subject, y = median_score, fill = subject)) +
  geom_bar(stat = "identity", position = "dodge", color = "white") +
  labs(title = "Median Scores by Subject",
       x = "Subject",
       y = "Median Score",
       fill = "Subject") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



# Load the necessary libraries
library(tidyverse)
# Load the dataset
file_path <- "exam_marks.csv"
exam_data <- read.csv(file_path)

#9.Pie Chart for DS Exam 1 Scores:

#Extract data for data_structure_exam1
data_structure_scores <- exam_data$data_structure_exam1
# Count the frequency of each score
score_counts <- table(data_structure_scores)
# Create a data frame for the pie chart
pie_data <- data.frame(score = as.numeric(names(score_counts)),
                       frequency = as.numeric(score_counts))

# Create a pie chart
ggplot(pie_data, aes(x = "", y = frequency, fill = factor(score))) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Pie Chart for Data Structure Exam 1 Scores",
       fill = "Score") +
  theme_void()


# Load the necessary libraries
library(tidyverse)
# Load the dataset
file_path <- "exam_marks.csv"
exam_data <- read.csv(file_path)

#10. Linear Regression Model:

# Fit a linear regression model
linear_model <- lm(total_marks ~ data_structure_exam1, data = exam_data)
# Print the summary of the regression model
summary(linear_model)

#11.Scatter Plot for Exam1 vs Exam2 Marks:

# Calculate the overall marks for Exam 1 and Exam 2
exam_data <- exam_data %>%
  mutate(overall_exam1 = rowSums(select(., ends_with("_exam1")), na.rm = TRUE),
         overall_exam2 = rowSums(select(., ends_with("_exam2")), na.rm = TRUE))

# Create a scatter plot for overall Exam 1 vs Exam 2 marks
ggplot(exam_data, aes(x = overall_exam1, y = overall_exam2)) +
  geom_point(color = "purple", alpha = 0.7) +
  labs(title = "Overall Exam 1 vs Exam 2 Marks Comparison",
       x = "Overall Exam 1 Marks",
       y = "Overall Exam 2 Marks")

#12. Box Plot for Exam 1 and Exam2 Comparison:

# Calculate the overall marks for Exam 1 and Exam 2
exam_data <- exam_data %>%
  mutate(overall_exam1 = rowSums(select(., ends_with("_exam1")), na.rm = TRUE),
         overall_exam2 = rowSums(select(., ends_with("_exam2")), na.rm = TRUE))

# Combine overall marks into a single column for plotting
overall_marks <- gather(exam_data, key = "exam_type", value = "overall_marks", overall_exam1, overall_exam2)

# Create a box plot for overall Exam 1 and Exam 2 marks
ggplot(overall_marks, aes(x = exam_type, y = overall_marks, fill = exam_type)) +
  geom_boxplot() +
  labs(title = "Boxplot of Overall Exam 1 and Exam 2 Marks Comparison",
       x = "Exam Type",
       y = "Overall Marks") +
  theme_minimal()

