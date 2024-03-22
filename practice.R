# Create a data frame called students with the following columns: Name (character), Age (numeric), Grade (numeric).
# Add a new column called Gender to the students data frame with values "M" for male and "F" for female.
# Extract the first 5 rows of the students data frame.
# Calculate the average age of students in the students data frame.
# Filter the students data frame to include only male students.
# Create a new data frame called top_students by selecting students with a grade greater than 90 from the students data frame.
# Sort the students data frame by age in descending order.
# Rename the Grade column in the students data frame to Score.
# Add a new row to the students data frame for a student named "John" with age 20, grade 85, and gender "M".
# Calculate the number of students in the students data frame.


# create students Data frame:
students <- data.frame( Name = c(" Ram", "Shyam"," Krishna","Bharat","Sita","Durga"), 
                        Age = c("23","18","45","67","40","30"), 
                        Grade = c(65,88,89,99,45,76))
print(students)

# Add new columns
students <- cbind(students, Gender = c("M","M","M","M","F","F"))
print(students)

# Extract / see top 5 data vales from Data frame
head(students,5) 


#average
mean(as.numeric(students$Age))

# filter
male_students <- students[students$Gender == "M",]
print(male_students)

# create new data_frame
top_students <- students[students$Grade > 90,]
top_students

# sorting
 students[order(students$Age, decreasing = TRUE),]

# Rename column
 
colnames(students)[colnames(students) == "Grade"] <- "Score"

print(students)

# Add new row
new_row <- c("John","20","85", "M")

students <-rbind(students,new_row)


print(students)


# number of students
nrow(students)




