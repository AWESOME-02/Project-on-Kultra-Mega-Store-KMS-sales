CREATE DATABASE PROJECT_DB

SELECT * FROM [dbo].[KMS Sql Case Study]

SELECT * FROM [dbo].Order_Status

------ANALYSIS------
---CASE SCENARIO I
--1
SELECT TOP 1 Product_Category, SUM(Sales) AS [Total Sales]
FROM [dbo].[KMS Sql Case Study]
GROUP BY Product_Category
ORDER BY [Total Sales] DESC

--2
SELECT TOP 3 Region, SUM(Sales) AS [Total Sales]
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region 
ORDER BY [Total Sales] DESC

SELECT TOP 3 Region, SUM(Sales) AS [Total Sales]
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region 
ORDER BY [Total Sales] ASC

--3
SELECT Region, Product_Sub_Category, SUM(Sales) AS [Total Sales]
FROM [dbo].[KMS Sql Case Study]
WHERE Region = 'Ontario' AND Product_Sub_Category = 'Appliances' 
GROUP BY Region, Product_Sub_Category  

--4
SELECT TOP 10 Order_ID, Customer_Name, Discount, Profit, Unit_Price, Province, Region, Customer_Segment, Product_Category, Product_Sub_Category, Product_Base_Margin, SUM(Sales) AS [Total Revenue]
FROM [dbo].[KMS Sql Case Study]
GROUP BY Order_ID, Customer_Name, Discount, Profit, Unit_Price, Province, Region, Customer_Segment, Product_Category, Product_Sub_Category, Product_Base_Margin
ORDER BY [Total Revenue] ASC
--5
SELECT TOP 1 Ship_Mode, SUM(Shipping_Cost) AS [Total Shipping Cost]
FROM [dbo].[KMS Sql Case Study]
GROUP BY Ship_Mode 
ORDER BY [Total Shipping Cost] DESC

---CASE SCENARIO II
--6
SELECT Customer_Name, Product_Name, SUM(Order_Quantity * Product_Base_Margin) AS [Total Margin]
FROM [dbo].[KMS Sql Case Study]
GROUP BY Customer_Name, Product_Name
ORDER BY [Total Margin] DESC

--7
SELECT TOP 1 Customer_Name, Customer_Segment, SUM(Sales) AS [Total Sales]
FROM [dbo].[KMS Sql Case Study]
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name, Customer_Segment
ORDER BY [Total Sales] DESC

--8
SELECT TOP 1 Customer_Name, Customer_Segment, COUNT(ROW_ID) AS [Total Orders]
FROM [dbo].[KMS Sql Case Study]
WHERE Customer_Segment = 'Corporate'
GROUP BY Customer_Segment, Customer_Name
ORDER BY [Total Orders] DESC

--9
SELECT TOP 1Customer_Name, Customer_Segment, SUM(Profit) AS [Total Profit]
FROM [dbo].[KMS Sql Case Study]
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name, Customer_Segment
ORDER BY [Total Profit] DESC

--10
CREATE VIEW KMS_Return_Table
AS
SELECT K.Order_ID,
       K.Customer_Name,
	   K.Customer_Segment,
	   O.[Status]
FROM [dbo].[KMS Sql Case Study] K
INNER JOIN [dbo].[Order_Status] O
ON K.Order_ID = O.Order_ID

SELECT Customer_Name, Customer_Segment, COUNT(Status) AS [Number of Returns]
FROM [dbo].[KMS_Return_Table]
GROUP BY Customer_Name, Customer_Segment
ORDER BY [Number of Returns] DESC
--11
SELECT Order_Priority, Ship_Mode, COUNT(Row_ID) AS [Number of Orders]
FROM [dbo].[KMS Sql Case Study]
WHERE Ship_Mode IN ('Delivery Truck', 'Express Air')
GROUP BY Order_Priority, Ship_Mode
ORDER BY [Number of Orders] 





