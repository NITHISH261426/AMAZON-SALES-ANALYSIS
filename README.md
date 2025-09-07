# AMAZON-SALES-ANALYSIS(MS SQL , MS POWER BI)
An analysis of Amazon sales data to understand key factors influencing sales across different branches and presents key insights through an interactive Power BI dashboard.

## Project Objective
The primary goal of this project is to analyze Amazon's sales data to uncover insights into customer behavior and product performance. The final deliverable is an interactive dashboard that allows stakeholders to easily explore sales patterns and make data-driven decisions.

## 🛠️ Technologies Used

*   **Data Analysis:** Microsoft SQL Server (MS SQL)
*   **Data Visualization:** Microsoft Power BI 
*   **Database Management:** SQL Server Management Studio (SSMS)

## ❓ Key Questions Addressed
- How much revenue is generated each month?
- In which month did the cost of goods sold reach its peak?
- Which product line generated the highest revenue?
- Which product line incurred the highest Value Added Tax?
- Identify the branch that exceeded the average number of products sold.
- Determine the time of day with the highest customer ratings for each branch.
- Determine the day of the week with the highest average ratings for each branch.
- Count the sales occurrences for each time of day on every weekday.
etc....



## Dataset 
- The data used for this project is the "Amazon Sales" dataset, which contains transaction-level data for sales across three different branches. The dataset includes information on products, customers, and      payment methods.

- <a href="https://github.com/NITHISH261426/AMAZON-SALES-ANALYSIS/commit/0e3ff38c5bb0f24103e7d7c24d0d010d523d18eb">Dataset</a>

### Data Dictionary

| Column Name             | Data Type        | Description                                                  |
| ----------------------- | ---------------- | ------------------------------------------------------------ |
| `invoice_id`            | `VARCHAR(30)`    | A unique identifier for each sales transaction.              |
| `branch`                | `VARCHAR(5)`     | The branch where the sale occurred (A, B, or C).             |
| `city`                  | `VARCHAR(30)`    | The city where the branch is located.                        |
| `customer_type`         | `VARCHAR(10)`    | The type of customer (e.g., 'Member' for subscribed customers, 'Normal' for walk-in customers). |
| `gender`                | `VARCHAR(10)`    | The gender of the customer.                                  |
| `product_line`          | `VARCHAR(100)`   | The general category of the product sold.                    |
| `unit_price`            | `DECIMAL(10, 2)` | The price of a single unit of the product.                   |
| `quantity`              | `INT`            | The number of units of the product sold in the transaction.  |
| `tax_5_percent`         | `DECIMAL(10, 2)` | The 5% tax applied to the transaction.                       |
| `total`                 | `DECIMAL(10, 2)` | The total cost of the transaction (`unit_price` * `quantity` + `tax_5_percent`). |
| `date`                  | `DATE`           | The date of the transaction.                                 |
| `time`                  | `TIME`           | The time of the transaction.                                 |
| `payment`               | `VARCHAR(20)`    | The payment method used by the customer (e.g., Ewallet, Cash, Credit card). |
| `cogs`                  | `DECIMAL(10, 2)` | "Cost of Goods Sold," representing the wholesale cost of the products. |
| `gross_margin_percentage` | `FLOAT`          | The percentage of gross margin for the transaction.          |
| `gross_income`          | `DECIMAL(10, 2)` | The gross income from the transaction (`total` - `cogs`).    |
| `rating`                | `FLOAT`          | The customer's satisfaction rating for the transaction (out of 10). |





## 🛠️ SQL Analysis & Queries

The core analysis of this project was performed using Microsoft SQL Server. The process involved data cleaning, feature engineering, and running analytical queries to answer key business questions.

- <a href="https://github.com/NITHISH261426/AMAZON-SALES-ANALYSIS/blob/main/AMAZON%20SALES%20ANALYSIS%20NK.sql">sqlfile</a>

## 💡 Key Findings & Insights

Product Analysis: 

- Highest Sales Product Line: Electronic Accessories (Units Sold:971) 
- Highest Revenue Product Line: Food and Beverages ($ 56144.96) 
- Lowest Sales Product Line: Health and Beauty (Unit Sold: 854) 
- Lowest Revenue Product Line: Health and Beauty ($ 49193.84) 

Sales Analysis: 

- Month With Highest Revenue: January ($ 116292.11)
- City & Branch With Highest Revenue: Naypyitaw[C] ($ 110568.86)
- Month With Lowest Revenue: February ($ 97219.58)
- City & Branch With Lowest Revenue: Mandalay[B] ($ 106198.00)
- Peak Sales Time Of Day: Afternoon 

Customer Analysis: 

- Most Predominant Gender: Female
- Most Predominant Customer Type: Member
- Highest Revenue Gender: Female ($ 167883.26)
- Highest Revenue Customer Type: Member ($ 164223.81)
- Most Popular Product Line (Male): Health and Beauty
- Most Popular Product Line (Female): Fashion Accessories
- Distribution Of Members Based On Gender: Male(240) Female(261)
- Sales Male: 2641 units
- Sales Female: 2869 units

## 📊 Power BI Dashboard

To present findings in an accessible and interactive format, a dashboard was created using Microsoft Power BI. This dashboard allows stakeholders to dynamically filter the data and explore sales trends on their own.
- <a href="https://github.com/NITHISH261426/AMAZON-SALES-ANALYSIS/blob/main/AMAZON%20SALES%20ANALYSIS.pdf">view Dashboard</a>

### Key Features of the Dashboard:

*   **KPI Cards:** Displaying total revenue, total quantity sold, and average customer rating.
*   **Sales by Product Line:** A pie chart showing the performance of each product category.
*   **Total no of payment methods  Over Month:** A bar chart illustrating payment method for monthly basis.
*   **Interactive Filters:** Slicers for Gender, City,  that update all visuals on the dashboard.

## 🏁 Conclusion & Recommendations

Based on the analysis, several actionable recommendations can be made:

1.  **Inventory Management:** Increase stock levels for the top-performing product lines especially Electronic Accessories,Food and Beverages in all branches.
2.  **Marketing Strategy:** Launch targeted marketing campaigns in Mandalay[B]  to boost performance and compete with other branches.
3.  **Staffing Optimization:** Ensure maximum staff availability during peak sales periods on Afternoon.


