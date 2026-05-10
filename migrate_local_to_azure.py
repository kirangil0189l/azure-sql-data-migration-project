import os
import pyodbc
from dotenv import load_dotenv

# Load values from .env file
load_dotenv()

# Local SQL Server connection
local_conn_str = (
    "DRIVER={ODBC Driver 18 for SQL Server};"
    f"SERVER={os.getenv('LOCAL_SERVER')};"
    f"DATABASE={os.getenv('LOCAL_DATABASE')};"
    f"UID={os.getenv('LOCAL_USERNAME')};"
    f"PWD={os.getenv('LOCAL_PASSWORD')};"
    "TrustServerCertificate=yes;"
)

# Azure SQL Database connection
azure_conn_str = (
    "DRIVER={ODBC Driver 18 for SQL Server};"
    f"SERVER={os.getenv('AZURE_SERVER')};"
    f"DATABASE={os.getenv('AZURE_DATABASE')};"
    f"UID={os.getenv('AZURE_USERNAME')};"
    f"PWD={os.getenv('AZURE_PASSWORD')};"
    "Encrypt=yes;"
    "TrustServerCertificate=no;"
)

tables = ["Customers", "Products", "Orders", "OrderDetails"]

try:
    local_conn = pyodbc.connect(local_conn_str)
    azure_conn = pyodbc.connect(azure_conn_str)

    local_cursor = local_conn.cursor()
    azure_cursor = azure_conn.cursor()

    for table in tables:
        print(f"Migrating table: {table}")

        local_cursor.execute(f"SELECT * FROM {table}")
        rows = local_cursor.fetchall()

        columns = [column[0] for column in local_cursor.description]
        column_list = ", ".join(columns)
        placeholders = ", ".join(["?"] * len(columns))

        insert_sql = f"INSERT INTO {table} ({column_list}) VALUES ({placeholders})"

        for row in rows:
            azure_cursor.execute(insert_sql, tuple(row))

        azure_conn.commit()
        print(f"{len(rows)} rows migrated to {table}")

    print("Migration completed successfully.")

except Exception as e:
    print("Migration failed.")
    print(e)

finally:
    try:
        local_conn.close()
        azure_conn.close()
    except:
        pass