#Create a data frame called sales_data with the following columns: Date (date), Product (character), Units_Sold (numeric), Price_Per_Unit (numeric).
# Add a new column called Total_Sales to the sales_data data frame, which calculates the total sales for each row (Units_Sold * Price_Per_Unit).
# Calculate the total sales for each product in the sales_data data frame.
# Calculate the average price per unit for each product in the sales_data data frame.
# Filter the sales_data data frame to include only rows where the total sales are greater than 1000.
# Create a summary table that shows the total sales and average price per unit for each product.
# Sort the sales_data data frame by total sales in descending order.
# Add a new column to the sales_data data frame called Month, which extracts the month from the Date column.
# Calculate the total sales for each month in the sales_data data frame.
# Create a new data frame called monthly_sales_summary that summarizes the total sales and average price per unit for each month.


# Create dataframe
sales_data <- data.frame( Date = as.Date(c("2022-3-3","2021-1-18","2000-2-7","1999-4-30","2023-4-6","1994-3-5")),
                          Product = c("A","B","C","D","E","A"),
                          Unit_sold = c(23, 45, 55, 100, 10,5),
                          Price_per_unit = c(500, 1000, 5500, 50, 4000, 529))
print(sales_data)
class(sales_data)

# Add new column
sales_data$Total_sales <- sales_data$Unit_sold * sales_data$Price_per_unit

# calculate total sales for each product
aggregate(Total_sales ~ Product, data = sales_data, FUN = sum)

# Calculate the average price per unit
aggregate(Price_per_unit ~ Product, data = sales_data, FUN = mean)

# Filter the sales_data

sales_data_filter <- sales_data[sales_data$Total_sales > 1000,]
sales_data_filter

#Create a summary table

aggregate(cbind(Total_sales, Price_per_unit) ~ Product , data = sales_data, FUN = function(x) c(sum(x), mean(x)))

# Sort

sales_data[order(sales_data$Total_sales, decreasing = T),]

# Add a new column

sales_data$Month <- format(sales_data$Date, "%m")
sales_data

# Calculate total sales
aggregate(Total_sales ~ Month, data = sales_data, FUN = sum)

#Create a new data frame
monthly_sales_summary <- aggregate(cbind(Total_sales, Price_per_unit) ~ Month , data = sales_data, FUN = function(x) c(sum(x), mean(x)))
monthly_sales_summary

