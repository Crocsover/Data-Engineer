This personal project is about creating ETL PIPELINE from different sources csv,excel,database(postgres) and transform data and load it into a single database.

data set from link :

I separate csv files into different file sources to demonstrate extracting from different file sources. 

please see below:

- january to april sales as excel (Sales_January_April_2019)
- may to august sales as csv(sales_csv folder)
- september to december as database (sales_db)

## extract:
The code defines a series of functions to extract sales data from different sources (Excel file, CSV files, and a PostgreSQL database) and consolidate them into a single Pandas DataFrame. Here's an overview of each function:
### consolidated_sales_excel Function:
- Reads sales data from an Excel file specified by the path 'filepath.xlsx'.
- Concatenates the sheets from the Excel file into a single Pandas DataFrame.
- Returns the concatenated DataFrame.
### consolidated_sales_csv Function:
- Reads sales data from multiple CSV files located in a folder specified by the path 'filepath'.
- Concatenates the individual CSV DataFrames into a single Pandas DataFrame.
- Returns the concatenated DataFrame.
### consolidated_sales_db Function:
- Connects to a PostgreSQL database using the provided credentials (username, password, host, port, and database name).
- Executes a SQL query to select all columns from the 'sales_db' table.
- Reads the query result into a Pandas DataFrame.
- Returns the DataFrame containing data from the database.
### consolidated_data Function:
- Calls the three functions mentioned above to extract sales data from Excel, CSV files, and the database.
- Concatenates the three DataFrames vertically.
- Renames columns in the consolidated DataFrame to have consistent column names.
- Concatenates the consolidated DataFrame with the data from the database.
- Returns the final consolidated DataFrame.
### Note:
Ensure that the file paths and database connection details are correctly specified in the code.

Make sure the column names used for renaming in the consolidated_data function match the actual column names in your data sources.

This code provides a flexible way to consolidate sales data from different sources into a unified format using Pandas DataFrames.

## transform
The transform_sales function takes a Pandas DataFrame (staging_table) as input and performs various transformations on the data. The docstring provides documentation for the function:
- Parameters Section: Describes that the function expects a parameter named staging_table, which should be of type pd.DataFrame.
-  Returns Section: Indicates that the function returns a Pandas DataFrame containing the transformed and cleaned sales data.
## The transform_sales function implementation includes the following steps:
- Drop Rows with Missing Values: Removes rows with any missing values from the DataFrame.
- Filter out Invalid Dates: Filters out rows where the 'order_date' is equal to 'Order Date'.
- Convert 'order_id' to Numeric: Converts the 'order_id' column to numeric values, dropping rows with non-numeric values, and then casts the column to integer.
- Ensure 'product' Column is String: Ensures that the 'product' column is of string type.
- Convert Numeric Columns: Converts 'quantity_ordered' and 'price_each' columns to numeric values.
- Ensure 'address' Column is String: Ensures that the 'address' column is of string type.
- Convert 'order_date' to Datetime: Converts the 'order_date' column to datetime format.
- Extract Year, Month, and Day: Extracts the year, month, and day from the 'order_date' column.
- Split 'address' and 'state' Columns: Splits the 'address' column into 'street', 'city', and 'state'. Also, splits the 'state' column into 'state' and 'zip'.
- Add 'country' Column: Adds a 'country' column with the value "United States".
- Reorder Columns: Rearranges the columns in a specific order.
- Remove Duplicates: Removes duplicate rows based on the 'order_id' column.
- The function returns the transformed DataFrame with cleaned and processed sales data.


# Load:

The provided code defines two functions related to loading data into a PostgreSQL database:
## get_engine Function:
- Constructs a PostgreSQL connection string using the provided credentials (username, password, host, port, and database name).
- Creates and returns a SQLAlchemy engine using the connection string.
## load_to_db Function:
-  Takes two parameters: transformed_table (a Pandas DataFrame containing transformed sales data) and table_name (the name of the PostgreSQL table to which the data should be loaded).
- Calls the get_engine function to get the SQLAlchemy engine.
- Uses a try-except block to attempt to load the DataFrame into the specified PostgreSQL table using the to_sql method.
- If the operation is successful, it prints a success message; otherwise, it catches any SQLAlchemy errors and prints an error message.
## Note:
Ensure that the PostgreSQL connection details in the get_engine function are accurate.
Make sure that the column names and data types in the DataFrame (transformed_table) match the structure of the PostgreSQL table.

The if_exists="append" parameter in to_sql indicates that the data should be appended to the table if it already exists.

If there are any issues during the data loading process, the except block captures SQLAlchemy errors and prints an error message.

You can use these functions to load transformed sales data into a PostgreSQL database by calling load_to_db(transformed_table, table_name), where transformed_table is your DataFrame and table_name is the desired PostgreSQL table name.

## EXECUTION CODE:


## consolidated_data Function:
- Creates a staging table by consolidating sales data from Excel, CSV files, and a PostgreSQL database.
- Renames columns for consistency.
- Returns the consolidated DataFrame.
## transform_sales Function:
- Takes the staging table as input.
- Performs various data cleaning and transformation operations on the input DataFrame.
- Returns a transformed DataFrame.
## load_to_db Function:
- Takes the transformed DataFrame and a table name as input.
- Loads the transformed data into a PostgreSQL table using the specified table name.
- Prints a success message if the loading is successful; otherwise, prints an error message.
## Execution Code:
- Calls consolidated_data to get the staging table.
- Calls transform_sales with the staging table to get the transformed table.
- Calls load_to_db with the transformed table and the desired table name ('annual_sales_2019').


