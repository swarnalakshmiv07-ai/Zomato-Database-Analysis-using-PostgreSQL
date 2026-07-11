# Zomato-Database-Analysis-using-PostgreSQL

# **Project Overview**

This project demonstrates the end-to-end process of designing, implementing, and analyzing a relational database using PostgreSQL.

Instead of working with an already created database, the complete database schema was implemented from an ER Diagram by creating tables, defining relationships, importing datasets, and performing SQL-based business analysis.

The project simulates a real-world food delivery platform similar to Zomato.

# **Project Workflow**

**Step 1: Database Design**
Created a new PostgreSQL database in pgAdmin.
Designed all database tables based on the provided ER Diagram.
**Defined:**
Primary Keys
Foreign Keys
Appropriate Data Types
Table Relationships
Constraints

**Step 2: Entity Relationship Modeling**

Created an ER Diagram representing the complete database structure, including relationships among:

Users
Restaurants
Dishes
Orders
Order Details
Payments
Delivery Partners
Order Delivery
Reviews
Coupons
Order Coupons

**Step 3: Data Import**

After creating the schema:

Imported CSV datasets into PostgreSQL tables.
Verified data consistency.
Resolved foreign key dependency issues.
Cleaned invalid records where necessary.
Ensured successful data loading across all tables.

**Step 4: SQL Analysis**

Performed business-oriented SQL analysis to answer real-world questions such as:

Total revenue generated
Top-performing restaurants
Most ordered dishes
Restaurant ratings
Coupon usage analysis
Payment method analysis
Monthly order trends

# **Database Schema**

The database consists of 11 relational tables.

| Table             | Description                       |
| ----------------- | --------------------------------- |
| Users             | Customer information              |
| Restaurants       | Restaurant details                |
| Dishes            | Restaurant menu items             |
| Orders            | Customer orders                   |
| Order_Details     | Individual dishes within an order |
| Payments          | Payment transactions              |
| Delivery_Partners | Delivery partner information      |
| Order_Delivery    | Delivery tracking details         |
| Reviews           | Customer ratings and reviews      |
| Coupons           | Discount coupons                  |
| Order_Coupons     | Coupon usage per order            |


# **Technologies Used**
PostgreSQL
pgAdmin 4
SQL
CSV Dataset
ER Modeling

# **Learning Outcomes**

Through this project, I gained practical experience in:

Designing a normalized relational database
Implementing database schemas from an ER Diagram
Managing relationships using Primary and Foreign Keys
Importing and validating large CSV datasets
Writing optimized SQL queries for business insights
