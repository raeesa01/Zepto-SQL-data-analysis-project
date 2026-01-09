# 🛒 Zepto-E-commerce SQL data analyst project

This project focuses on analyzing Zepto’s e-commerce product data using SQL to derive actionable business insights. The analysis simulates real-world data analyst tasks such as data cleaning, querying, aggregation, and performance analysis.

📌 Project Overview

    The goal is to simulate how actual data analysts in the e-commerce or retail industries work behind the scenes to use SQL to:

    ✅ Set up a messy, real-world e-commerce inventory database

    ✅ Perform Exploratory Data Analysis (EDA) to explore product categories, availability, and pricing inconsistencies

    ✅ Implement Data Cleaning to handle null values, remove invalid entries, and convert pricing from paise to rupees

    ✅ Write business-driven SQL queries to derive insights around pricing, inventory, stock availability, revenue and more

🛠 Tools & Technologies

      SQL (PostgreSQL / MySQL compatible)
      
      DBMS: PostgreSQL / MySQL
      
      IDE: pgAdmin / MySQL Workbench
      
      Version Control: Git & GitHub

📁 Dataset Overview

        The dataset was sourced from Kaggle and was originally scraped from Zepto’s official product listings, making it suitable for practical, industry-relevant analysis.
        
        Each row represents a unique SKU (Stock Keeping Unit) for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or           categories to improve visibility – exactly how real catalog data looks.

🧾 Columns:

          sku_id: Unique identifier for each product entry (Synthetic Primary Key)

          Name: Product name as it appears on the app

          Category: Product category like Fruits, Snacks, Beverages, etc.

          MRP: Maximum Retail Price (originally in paise, converted to ₹)

          DiscountPercent: Discount applied on MRP

          DiscountedSellingPrice: Final price after discount (also converted to ₹)

          AvailableQuantity: Units available in inventory

          WeightInGms: Product weight in grams

          OutOfStock: Boolean flag indicating stock availability

          Quantity: Number of units per package (mixed with grams for loose produce)

🔧 Project Workflow

1. Database & Table Creation

   Started by creating a SQL table with appropriate data types:

             CREATE TABLE zepto (
                          sku_id SERIAL PRIMARY KEY,
                          Category VARCHAR(120),
                          Name VARCHAR(150) NOT NULL,
                          MRP NUMERIC(8,2),
                          DiscountPercent NUMERIC(5,2),
                          AvailableQuantity INTEGER,
                          DiscountedSellingPrice NUMERIC(8,2),
                          WeightInGms INTEGER,
                          OutOfStock BOOLEAN,
                          Quantity INTEGER
                          );

2. Data Import

      Loaded CSV using pgAdmin's import feature.

3. 🔍 Data Exploration
   
         Counted the total number of records in the dataset

         Viewed a sample of the dataset to understand structure and content

         Checked for null values across all columns

         Identified distinct product categories available in the dataset

         Compared in-stock vs out-of-stock product counts

         Detected products present multiple times, representing different SKUs

4. 🧹 Data Cleaning
   
         Identified and removed rows where MRP or discounted selling price was zero

         Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability

5. 📊 Business Insights

          Found top 10 best-value products based on discount percentage
          
          Identified high-MRP products that are currently out of stock
          
          Estimated potential revenue for each product category
          
          Filtered expensive products (MRP > ₹500) with minimal discount
          
          Ranked top 5 categories offering highest average discounts
          
          Calculated price per gram to identify value-for-money products
          
          Grouped products based on weight into Low, Medium, and Bulk categories
          
          Measured total inventory weight per product category


🚀 How to Use This Project

1️⃣ Clone the Repository

          git clone https://github.com/aeesa01/Zepto-SQL-data-analysis-project.git
          cd zepto-SQL-data-analysis-project


2️⃣ Open the SQL File

          Open Zepto_Data_Analysis_SQL.sql in pgAdmin or any PostgreSQL-compatible SQL editor.
          
          This file includes:
          
          Table creation scripts
          
          Initial data exploration queries
          
          Data cleaning operations
          
          SQL-based business analysis


3️⃣ Set Up PostgreSQL Database

          Open pgAdmin (or any PostgreSQL client)
          
          Create a new database (e.g., zepto_db)
          
          Connect to the database
          
          Run the SQL file to create tables and execute analysis queries


4️⃣ Import the Dataset

          Import the dataset into PostgreSQL using Import/Export Data
          
          Ensure the file encoding is UTF-8 (convert if required)
          
          Verify that the data loads correctly into the created tables


5️⃣ Run & Explore Queries

          Execute the SQL queries sequentially
          
          Review the output for insights related to pricing, discounts, categories, and product trends
          
          Modify queries to explore additional business questions
             
