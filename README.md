# R-Programming---Data-Visualization-of-CSV-file
This R script demonstrates the visualization of data using various statistical and graphical techniques. It uses real-world exam data to uncover patterns, distributions, and relationships between variables. The key visualizations included in this script are- Box Plots, Pie Charts, Bar Graphs, Scatter Plot, Linear Regression Analysis.


____________________________________________________________________________________________

# Experiment 10: Mini Project

##### Title/Aim: Analysis of Mid-Sem Examination Scores Data

##### (Application of R-Programming Knowledge)

____________________________________________________________________________________________

 

## Mini-Project Overview:

The project delves into the application of R programming, a subject explored during our second year of engineering in the third semester. Focusing on this programminglanguage, our team undertook a mini-project centred on Mid Semester Examination-I and Mid Semester Examination-II of CSE- A Division Students, held in our Institute in our Semester-III.

### Mini-Project Methodology:

 1. Step 1: Acquisition of Mid-Sem (Took as Sample) Data CSV file. (Named as: “exam_marks.csv” )
 2. Step 2: Importing the Excel file into RStudio for analysis.
 3. Step 3: Use R Programming to Output various Plots for Analysis.

### Project Tasks:

 By utilizing the “exam_marks.csv” (Sample) Data, we executed the following tasks:
 1. Pie Diagrams: Visual representation depicting the distribution of dataset things e.g. Exam 1 Marks Frequency Distribution. (Mid-Sem I)
 2. Covariance and Correlation: Analysis of the relationship between different variables within the dataset.
 3. Histogram: Histogram illustrating the frequency distribution in our Dataset
 4. Other Plots: Plots illustrating the various distributions in our Dataset.


### Mini-Project Explanation

 The below is the “ exam_marks.csv” sample data which is taken for the project. As we can see it contains data having columns for various details viz., serial_no,roll_no, student_name, algebra_exam1, data_structure_exam1, maths_exam1, electronics_exam1, architecture_exam1, algebra_exam2, data_structure_exam2, maths_exam2, electronics_exam2, architecture_exam2, total_marks. Now, we will be Implementing Scatter Plot, Graph Plot, Pie Chart, etc. for this “exam_marks.csv” dataset.

 Let’s see one by one!

### R-Program, Output Screenshots with Data Analysis:

 Reading Scores data CSV File and Loading Required Libraries:

 Reading our CSV Students Internal Scores data file named “exam_marks.csv” and Loading Library- tidyverse. Let’s look at data of First Few Students’ Scores in our csv File!.

 ( heading to first few rows of our file.)

 So, this one will hit Some of the Rows and all Columns printed on our R-Studio

 Console.


 We Can have Summary of Our Dataset by Using summary().

 Now, Let’s look at Correlation Matrix:


 The correlation matrix represents the pairwise correlation coefficients between

 different numeric variables in our dataset.

 Boxplot For Exam Scores:

 The boxplot for exam scores represents the distribution of overall marks for Exam 1

 and Exam 2 across all subjects for a group of students.

 Let’s Look at Descending Ordered Dataset :

 We can see in our output console, the Students with Maximum marks obtained are at

 the Printed Descending Ordered.


 Distribution of Total Marks By Student:

 (Pie Chart)

 Plotting a Pie Chart to Analyze Distribution of Total Marks obtained by Students

 Percentage wise Frequency will be a great deal.


 Scatterplot of Comparison of Two Exams:

 Let’s look at Scores obtained by All Students in Linear Algebra & Transform Exam

 (x-axis) Vs Discrete Mathematics Exam (y-axis). A scatter plot will be great way to

 do so. It is a graphical representation that is particularly useful for comparing two

 continuous variables, such as scores on two different exams.

 Bar Graphs to Analyze Obtained Scores Frequency For Exam I and Exam II:

 To analyze the Obtained Scores frequency for Mid Semester Examination I and Mid

 Semester Examination II Plotting Bar Graphs will be Simplest way.

 We found The Code Input and Plot output as follows:


 From these outputs we can say that the Number of Students in Data Structure Exam

 2 having marks in range of 10-15 are more.


 Looking at Median for Most Scored Subject:

 This code first calculates the median score for each subject and then creates a bar

 plot where the x-axis represents subject names and the y-axis represents the median

 score. Each bar is colored differently for each subject.


Pie Chart for Exam1 Scores Distribution:

This show frequency of students who scored a particular score for Data Structure Exam From this, we Conclude that there are Maximum Students scorring 11 Marks in Data Structure Exam 1. Linear Regression: This Fits a simple linear regression model using the lm function to predict "total_marks" based on "data_structure_exam1" scores.

Exam 1 vs Exam 2 Overall Marks Comparison:
We Compared the Overall Performance of Students in Exam 1 and Exam 2. From this We can tell if Students are Improving their Performance This Creates a scatter plot comparing the overall marks in Exam 1 with Exam Serial numbers are added to the y-axis for each student.

 Boxplot for Overall Exam1 and Exam2 Marks Comparison: 
 Box Plot is Best Way for comparing the distribution of overall marks in Exam 1 and Exam 2. Serial numbers are added to the y-axis for each student.

### Program:
```
# Load the necessary libraries
library(tidyverse)
library(scales)

# Load the dataset
file_path <- "exam_marks.csv"
exam_data <- read.csv(file_path)

#Display the first few rows of the dataset
head(exam_data)
install.packages("tidyverse")
# Display summary statistics
summary(exam_data)

# Correlation Matrix:

# Calculate the correlation matrix


cor_matrix <- cor(exam_data[, c("algebra_exam1", "data_structure_exam1",
"maths_exam1", "electronics_exam1", "architecture_exam1",
"algebra_exam2", "data_structure_exam2",
"maths_exam2", "electronics_exam2", "architecture_exam2")])
# Print the correlation matrix
print(cor_matrix)

#Boxplot for exam scores:

exam_data %>%
gather(key = "subject", value = "score", -c(serial_no, roll_no,
student_name,total_marks)) %>%
ggplot(aes(x = subject, y = score, fill = subject)) +
geom_boxplot() +
labs(title = "Boxplot of Exam Scores by Subject")

# Printing Toppers:

# Order the dataset by total_marks in descending order and then by student_name
sorted_data <- exam_data %>%
arrange(desc(total_marks), student_name)
# Print the sorted dataset
print(sorted_data[, c("student_name", "total_marks")])

# Pie Chart with Percentage Labels:

# Calculate total marks for each student
exam_data$total_marks <- rowSums(select(exam_data, contains("_exam")))
# Create a pie chart with percentage labels
pie_data <- exam_data %>%
summarise(across(contains("_exam"), sum)) %>%
gather(key = "subject", value = "total_marks") %>%
arrange(desc(total_marks))
# Calculate percentages
pie_data$percentage <- scales::percent(pie_data$total_marks /
sum(pie_data$total_marks))
# Create the pie chart with percentage labels
pie(pie_data$total_marks, labels = paste(pie_data$subject, "\n",
pie_data$percentage), main = "Distribution of Total Marks by Subject")

# Bar Graph for data_structure_exam1 and data_structure_exam2:

# Create a bar graph for data_structure_exam
ggplot(exam_data, aes(x = data_structure_exam1)) +


geom_bar(stat = "count", fill = "purple", color = "white") +
labs(title = "Bar Graph for Data Structure Exam 1",
x = "Data Structure Exam 1 Scores",
y = "Frequency")
# Create a bar graph for data_structure_exam
ggplot(exam_data, aes(x = data_structure_exam2)) +
geom_bar(stat = "count", fill = "green", color = "white") +
labs(title = "Bar Graph for Data Structure Exam 2",
x = "Data Structure Exam 2 Scores",
y = "Frequency")

# Bar Plot with Medians on one Axis:

# Select only the columns related to exams (excluding total_marks)
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
theme(axis.text.x = element_text(angle = 45 , hjust = 1 ))

# Pie Chart for Data Structure 1 Exam:

# Extract data for data_structure_exam
data_structure_scores <- exam_data$data_structure_exam
# Count the frequency of each score
score_counts <- table(data_structure_scores)
# Create a data frame for the pie chart
pie_data <- data.frame(score = as.numeric(names(score_counts)),
frequency = as.numeric(score_counts))
# Create a pie chart


ggplot(pie_data, aes(x = "", y = frequency, fill = factor(score))) +
geom_bar(stat = "identity", width = 1 ) +
coord_polar("y", start = 0 ) +
labs(title = "Pie Chart for Data Structure Exam 1 Scores",
fill = "Score") +
theme_void()

# Linear Regression Model Summary:

# Fit a linear regression model
linear_model <- lm(total_marks ~ data_structure_exam1, data = exam_data)
# Print the summary of the regression model
summary(linear_model)

# Scatter Plot Exam 1 vs Exam 2:

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

# Box Plot Exam 1 vs Exam 2:

# Calculate the overall marks for Exam 1 and Exam 2
exam_data <- exam_data %>%
mutate(overall_exam1 = rowSums(select(., ends_with("_exam1")), na.rm = TRUE),
overall_exam2 = rowSums(select(., ends_with("_exam2")), na.rm = TRUE))
# Combine overall marks into a single column for plotting
overall_marks <- gather(exam_data, key = "exam_type", value = "overall_marks",
overall_exam1, overall_exam2)
# Create a box plot for overall Exam 1 and Exam 2 marks
ggplot(overall_marks, aes(x = exam_type, y = overall_marks, fill = exam_type)) +
geom_boxplot() +
labs(title = "Boxplot of Overall Exam 1 and Exam 2 Marks Comparison",
x = "Exam Type",
y = "Overall Marks") +
theme_minimal()
```

Conclusion : In this R programming Mini-Project Experiment, we have applied our R-Programming Knowledge on Real-World Scenario. The Mid-Semester Exams  Marks Data Excel Sheet Shared with us, We converted it to an CSV useful Dataset, We imported that CSV data into RStudio, based on which we outputted plots such as Pie Diagram,Histogram,Covariance,etc based on Students’ Mid-Semester Exams

 Performances.


____________________________________________________
Submitted By Ajay Dombale, Sachin Ganjare and Sujata Dhoni at Maharashtra Institute of Technology as a Part of Data Analytics Lab in Third Semester of B.Tech Computer Science and Engineering Programme.

