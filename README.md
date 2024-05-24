# E-commerce Data Management and Visualization System

This project involves constructing a data management and visualization system for an e-commerce brand. The project includes generating simulated data, creating a database, and developing a Power BI dashboard to visualize key metrics.

## Table of Contents
- [Data Generation](#data-generation)
- [Database Creation](#database-creation)
- [Data Dictionary](#data-dictionary)
- [Power BI Dashboard](#power-bi-dashboard)
- [Installation and Usage](#installation-and-usage)
- [Conclusion](#conclusion)

## Data Generation

We used the Faker library to generate simulated data for the following tables:
- Products
- Customers
- Sales
- Suppliers
- Reviews
- Shipping
- Inventory
- Promotions

## Database Creation

The generated data is stored in a MySQL database. We defined the schema using SQLAlchemy and inserted the data using pandas. The tables are linked by appropriate foreign key constraints to maintain referential integrity.

## Data Dictionary

### Products Table
| Column Name      | Data Type  | Description                                 |
|------------------|------------|---------------------------------------------|
| product_id       | Integer    | Unique identifier for each product          |
| product_name     | String     | Name of the product                         |
| category         | String     | Category to which the product belongs       |
| price            | Float      | Price of the product                        |
| stock_quantity   | Integer    | Quantity of the product in stock            |

### Customers Table
| Column Name      | Data Type  | Description                                 |
|------------------|------------|---------------------------------------------|
| customer_id      | Integer    | Unique identifier for each customer         |
| customer_name    | String     | Name of the customer                        |
| email            | String     | Email address of the customer               |
| address          | String     | Address of the customer                     |

### Sales Table
| Column Name      | Data Type  | Description                                 |
|------------------|------------|---------------------------------------------|
| sales_id         | Integer    | Unique identifier for each sales transaction|
| product_id       | Integer    | Identifier of the product sold              |
| customer_id      | Integer    | Identifier of the customer who made the purchase|
| date             | Date       | Date of the sales transaction               |
| quantity         | Integer    | Quantity of the product sold                |
| total_price      | Float      | Total price of the sales transaction        |
| payment_method   | String     | Payment method used for the transaction     |

### Suppliers Table
| Column Name      | Data Type  | Description                                 |
|------------------|------------|---------------------------------------------|
| supplier_id      | Integer    | Unique identifier for each supplier         |
| supplier_name    | String     | Name of the supplier                        |
| contact_name     | String     | Name of the contact person at the supplier  |
| contact_email    | String     | Email address of the contact person         |
| contact_phone    | String     | Phone number of the contact person          |

### Reviews Table
| Column Name      | Data Type  | Description                                 |
|------------------|------------|---------------------------------------------|
| review_id        | Integer    | Unique identifier for each review           |
| product_id       | Integer    | Identifier of the reviewed product          |
| customer_id      | Integer    | Identifier of the customer who wrote the review|
| rating           | Integer    | Rating given by the customer (1-5)          |
| review_text      | String     | Text of the review                          |
| review_date      | Date       | Date when the review was written            |

### Shipping Table
| Column Name      | Data Type  | Description                                 |
|------------------|------------|---------------------------------------------|
| shipping_id      | Integer    | Unique identifier for each shipping record  |
| sales_id         | Integer    | Identifier of the related sales transaction |
| shipping_date    | Date       | Date when the item was shipped              |
| shipping_method  | String     | Method of shipping (e.g., standard, express)|
| shipping_cost    | Float      | Cost of shipping                            |
| tracking_number  | String     | Tracking number of the shipment             |

### Inventory Table
| Column Name      | Data Type  | Description                                 |
|------------------|------------|---------------------------------------------|
| inventory_id     | Integer    | Unique identifier for each inventory record |
| product_id       | Integer    | Identifier of the product in inventory      |
| supplier_id      | Integer    | Identifier of the supplier                  |
| quantity_received| Integer    | Quantity of the product received            |
| date_received    | Date       | Date when the product was received          |

### Promotions Table
| Column Name      | Data Type  | Description                                 |
|------------------|------------|---------------------------------------------|
| promotion_id     | Integer    | Unique identifier for each promotion        |
| product_id       | Integer    | Identifier of the product on promotion      |
| promotion_description | String | Description of the promotion                |
| discount_percentage  | Float  | Discount percentage offered                 |
| start_date       | Date       | Start date of the promotion                 |
| end_date         | Date       | End date of the promotion                   |

## Power BI Dashboard


![ECommerce_page-0001](https://github.com/IVikas17/E-commerce-Data-Management-and-Visualization-System/assets/116329070/643e35bf-41bc-46b0-ace0-4eeb43d86d5c)


The Power BI dashboard includes the following KPIs and visualizations:

### KPIs
- **Top Selling Product**: Displays the product with the highest sales.
- **Average Order Value (AOV)**: Calculates the average value of an order.
- **Average Customer Lifetime Value (CLV)**: Calculates the average total revenue generated by a customer.
- **Total Sales per Product**: Displays the total sales for each product.
- **Total Quantities**: Displays the total quantities sold.

### Filters
- **Categories**: Allows users to filter the data by product categories.

### Visualizations
- **Line Chart**: Shows the daily trends of AOV, Quantity, and Total Price.
- **Line and Stacked Column Chart**: Displays categories on the x-axis with quantity as columns and quantity received as a line.
- **Pie Chart**: Shows the distribution of payment methods based on the count of sales.
- **Table**: Includes columns such as product name, sum of quantities, total sales per product, AOV, average rating, and average discount percentage.

### Steps to Implement Visualizations

1. **Top Selling Product**:
   - Used a Card visualization.
   - Created a measure to find the top-selling product.
   ```DAX
   Top Selling Product = 
   FIRSTNONBLANK(
      TOPN(
         1, 
         SUMMARIZE(Sales, Products[product_name], "TotalSales", SUM(Sales[total_price])), 
         [TotalSales], 
         DESC
      ), 
      Products[product_name]
   )
   )

2. **Average Order Value (AOV)**:
   - Used a Card visualization.
   - Created a measure for AOV.
   ```DAX
   AOV = DIVIDE(SUM(Sales[total_price]), COUNT(Sales[sales_id]))

3. **Average Customer Lifetime Value (CLV)**:

    - Used a Card visualization.
    - Created a measure for AOV.
    ```DAX
    Total Purchase Amount = SUM(Sales[total_price])
    Average CLV = AVERAGEX(VALUES(Customers[customer_id]), [Total Purchase Amount])

4. **Total Sales per Product:**:

    - Used a Bar or Column chart.
    - Created a measure for total sales per product.
    ```DAX
    Total Sales per Product = SUM(Sales[total_price])

5. **Total Quantities:**:

    - Used a Card visualizationt.
    - Created a measure for total quantities.
    ```DAX
    Total Quantities = SUM(Sales[quantity])

### Filters
- **Categories**: Allows users to filter the data by product categories.

### Visualizations
1. **Line Chart for Daily Trends**:
   - Add a Line chart.
   - Set the x-axis to the date.
   - Add AOV, Quantity, and Total Price as values.

2. **Line and Stacked Column Chart**:
   - Add a Line and Stacked Column chart.
   - Set the x-axis to categories.
   - Add quantity for columns and quantity received for the line.

3. **Pie Chart for Payment Methods**:
   - Add a Pie chart.
   - Set the legend to payment method.
   - Set values to the count of sales.

4. **Table with Various Columns**:
   - Add a Table.
   - Include columns like product name, sum of quantities, total sales per product, AOV, average rating, and average discount percentage.

## Installation and Usage

### Data Generation:
- Ensure you have Python installed.
- Install necessary packages:
  ```bash
  pip install pandas numpy faker sqlalchemy mysql-connector-python
- Run the data generation script to create the data and insert it into the MySQL database.

### Database Setup:
- Ensure you have MySQL installed and running.
- Create a database named `Ecommerce`.
- Insert the generated data into the database.

### Power BI Dashboard:
- Open Power BI Desktop.
- Import data from the MySQL database.
- Create relationships between tables as needed.
- Implement the visualizations and KPIs as described.

### Conclusion
This project demonstrates the creation of a comprehensive data management and visualization system for an e-commerce brand, utilizing simulated data, a MySQL database, and Power BI for interactive dashboards. The steps provided should guide you through replicating and expanding upon this system.










    


