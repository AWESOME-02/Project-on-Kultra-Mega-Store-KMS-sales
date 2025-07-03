# DATA ANALYSIS PROJECT USING SQL
## Overview
This project presents a structured SQL-based analysis of KMS Company’s sales data. The goal is to analyze the data from 2009 to 2012 and present key insights and findings to support the Abuja division management decisions on profitability, shipping efficiency, customer value, and returns.
Using my analytical thinking and all that I have learned from Digital SkillUp Africa, I was able to analyze that data using structured Query Language (SQL). 
Structuring SQL queries to extract insights (like identifying returned items by segment or aligning shipping cost with order priority) challenged my logic and taught me how to think more like a business analyst.
## SQL commands/clauses used include:
- Sum
- And/Or
- Count 
- Group by 
- Order by 
- Join
- Create view
## Key Business Questions Answered
1. Which product category had the highest sales? 
2. What are the Top 3 and Bottom 3 regions in terms of sales? 
3. What were the total sales of appliances in Ontario? 
4. Advise the management of KMS on what to do to increase the revenue from the bottom 
10 customers 
5. KMS incurred the most shipping cost using which shipping method? 
6. Who are the most valuable customers, and what products or services do they typically 
purchase? 
7. Which small business customer had the highest sales? 
8. Which Corporate Customer placed the most number of orders in 2009 – 2012? 
9. Which consumer customer was the most profitable one? 
10. Which customer returned items, and what segment do they belong to? 
11. If the delivery truck is the most economical but the slowest shipping method and 
Express Air is the fastest but the most expensive one, do you think the company 
appropriately spent shipping costs based on the Order Priority? Explain your answer
## All queries used to analyse the data
```
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
```
## Files
[REPORT OF ANALYSIS FOR KULTRA MEGA STORES ABUJA DIVISION.docx](https://github.com/user-attachments/files/21008445/REPORT.OF.ANALYSIS.FOR.KULTRA.MEGA.STORES.ABUJA.DIVISION.docx) : All questions and answers.

[KMS Sql Case Study.csv](https://github.com/user-attachments/files/21008526/KMS.Sql.Case.Study.csv) : Sample data

[Order_Status.csv](https://github.com/user-attachments/files/21047620/Order_Status.csv) : Sample data


