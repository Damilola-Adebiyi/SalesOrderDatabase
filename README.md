# SalesOrderDatabase
The SalesOrder database was created using Data Definition Languages using CREATE, ALTER and DROP statements
The database consists of 8 tables. Customer, Products, Categories, Employees, Order_Details, Orders, Product_Vendors, Vendors tables.
I learnt during the creation of this database that you can't create a foreign key referencing a table that has not yet been created.
I also learnt that there are different syntaxes for altering tables in My SQL and SQL Server, i will reference the syntax for renaming columns to show this difference
MySQL Syntax: ALTER TABLE RENAME COLUMN oldcolumnname TO newcolumnname;
SQL Server: sp_rename 'tablename.columnname', 'newcolumnname', 'COLUMN';
All in all, it was an amazing experience creating my first database.
