# SQL Server to Azure SQL Database Migration Project

## Project Overview

This project demonstrates a simple data migration workflow from a local SQL Server database to Azure SQL Database.

The goal of this project is to practice database migration, ETL, data validation, and cloud database connectivity using SQL Server, Python, Azure SQL Database, and Power BI.

## Tools Used

- SQL Server
- Azure SQL Database
- Python
- pyodbc
- Visual Studio Code
- Power BI
- GitHub Pages

## Project Workflow

1. Created a local SQL Server database named `RetailMigrationDB`.
2. Created four relational tables:
   - Customers
   - Products
   - Orders
   - OrderDetails
3. Inserted sample retail sales data into the local database.
4. Created an Azure SQL Database named `RetailMigrationAzureDB`.
5. Wrote a Python ETL script to migrate data from local SQL Server to Azure SQL Database.
6. Validated the migration using row counts, total sales, duplicate checks, and relationship checks.
7. Prepared the Azure SQL Database for Power BI reporting.

## Migration Process

The migration script connects to both the local SQL Server database and Azure SQL Database using `pyodbc`.

It extracts data from the local database and loads it into the matching Azure SQL tables.

## Data Validation

After migration, the following validation checks were performed:

- Row count comparison
- Total sales comparison
- Duplicate customer email check
- Missing customer relationship check
- Missing product relationship check

## Sample Validation Result

| Table Name | Row Count |
|---|---:|
| Customers | 5 |
| Products | 5 |
| Orders | 5 |
| OrderDetails | 7 |

Total Sales: 2990.00

Author:Sukhkirandeep Kaur Sidhu,Ph.D.


