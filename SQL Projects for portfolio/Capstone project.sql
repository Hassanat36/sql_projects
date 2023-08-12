CREATE DATABASE CAPSTONE

--1. Write a Query that display the individual tables.
SELECT * FROM [dbo].[CustomerN]

SELECT * FROM [dbo].[OrderN]

SELECT * FROM [dbo].[ProductN]

SELECT * FROM [dbo].[RegionN]

--2. Write a statement that list all customers along with their ID, Name & Segment.
SELECT * FROM [dbo].[CustomerN]

--3. Write a statement that lists the Name, Product ID, Category & SubCategory of each product.

SELECT [Product_Name],[Product_ID],[Category],[Sub_Category]
FROM [dbo].[ProductN]

--4. Write a query that displays all the columns of all product who have the category “Furniture”.

SELECT * FROM [dbo].[ProductN]
WHERE [Category]='furniture'

--5. Write a query that displays the Product name, and ID of each product with the Name starting with “Boston”.SELECT [Product_Name],[Product_ID]FROM [dbo].[ProductN]WHERE [Product_Name] LIKE 'boston%'--6. Write a query that displays the Product name, and ID of each product with the Name having “Collection”.SELECT [Product_Name],[Product_ID]FROM [dbo].[ProductN]WHERE [Product_Name] LIKE '%Collection%'--7. Write the query that displays all orders made during the month of March 2014.SELECT * FROM [dbo].[OrderN]WHERE [Order_Date] BETWEEN '2014-03-01' AND '2014-03-31'SELECT * FROM [dbo].[OrderN]WHERE [Ship_Date] BETWEEN '2014-03-01' AND '2014-03-31'/*8. Write the query that displays all orders the were not made during the 
month of March 2014 but shipped between 5th and 30th of March 2014.*/SELECT * FROM [dbo].[OrderN]WHERE  [Ship_Date]  BETWEEN '2014-03-05' AND '2014-03-25' AND [Order_Date] NOT BETWEEN '2014-03-01' AND '2014-03-31'--9. Join the Order table to the Customer table on the Customer ID column. Display all columns from both tables.SELECT* FROM [dbo].[OrderN]FULL JOIN [dbo].[CustomerN]ON [dbo].[OrderN].Customer_ID=[dbo].[CustomerN].Customer_ID/*10.Join the Order table to the Customer, Product, & Region tables on the 
basis that the CustomerID column in the Order table matches the 
CustomerID column in the Customer table, the ProductID column in the 
Product table matches the ProductID column in the Order table, the 
Postalcode column in the Region table matches the Postalcode column in 
the Order Table.*/

SELECT * FROM [dbo].[OrderN]
LEFT JOIN [dbo].[CustomerN] ON [dbo].[OrderN].Customer_ID=[dbo].[CustomerN].Customer_ID
LEFT JOIN [dbo].[ProductN] ON [dbo].[OrderN].Product_ID=[dbo].[ProductN].Product_ID
LEFT JOIN [dbo].[RegionN] ON [dbo].[OrderN].Postal_Code=[dbo].[RegionN].Postal_Code

.
