select * from worksadventure.union;
select * from dimcustomer;
select * from	dimdate;
select * from dimprodcategory;
select * from dimprodsubcategory;
select * from dimproduct;
select * from	dimsalesterritor;
-- Total sales_amount
use crm;
select sum(salesamount) from worksadventure.union; 

-- extract year
select year(orderdatekey) as Years from worksadventure.union;

-- Extract Monthno
select month(orderdatekey) as Month_number from worksadventure.union;

-- Extract Monthfullname
select monthname(orderdatekey) as monthfullname from worksadventure.union;

-- Extract Quarter
select 
concat('Q', Quarter(orderdatekey)) as Quarterno from worksadventure.union;

-- Extract yearmonth
SELECT ORDERDATEKEY,
 year(ORDERDATEKEY) AS ORDER_YEAR,
 monthname(ORDERDATEKEY) AS ORDER_MONTH_NAME,
 concat(YEAR(ORDERDATEKEY), ' ', MONTHNAME(ORDERDATEKEY)) AS YEAR_MONTH_COMBINED
 FROM worksadventure.union;
 
 -- Extract weekdaynuber
 select weekday(orderdatekey) as weekdaynumber from worksadventure.union;
 
 -- Extract weekdayname
 select dayname(orderdatekey) as weekdayname from worksadventure.union;
 
 -- Extract finacialMonth
 SELECT ORDERDATEKEY,
 CASE 
 WHEN month(ORDERDATEKEY)>= 7 THEN month(ORDERDATEKEY) - 6
 ELSE month(ORDERDATE) + 6
 END AS FINACIAL_MONTH
 FROM worksadventure.union;
 
 
 -- Extract FinacialQuarter
 SELECT ORDERDATEKEY,
 quarter(ORDERDATEKEY) AS FINACIAL_QUARTER
 FROM worksadventure.union;
 
 -- Question 12
 select 
 s.salesID,
 concat(firstname, ' ', Lastname) as customerFullname,
 p.unitprice
 from worksadventure.union f
inner join dimproduct p 
 on f.productkey = p.productkey
 inner join dimcustomer c 
 on s.customerkey = c.customerkey;
 

 
 -- find sales amount
select 
unitprice,
OrderQuantity,
DiscountAmount,
(unitprice * orderquantity) * (1-DiscountAmount) as salesamount
from worksadventure.union;

-- Find Production_cost
select 
UnitPrice,
OrderQuantity,
(UnitPrice * OrderQuantity) as production_cost
from worksadventure.union;


-- Total sales by year
select year(orderdatekey) as year,
sum(salesamount) as totalsales
from worksadventure.union
group by year(orderdatekey)
order by year(orderdatekey) desc;

-- Total Order Quantity
select 
sum(orderquantity) as total_orders
from worksadventure.union;

-- Top 10 customers
select 
 concat(firstname,' ',lastname) as customerfullname,
sum(salesamount) as total_sales
from worksadventure.union F
inner join dimcustomer D 
on F. customerkey = D.customerkey
group by concat(firstname,' ',lastname)
order by total_sales desc limit 10;

-- Total number of product by category
select 
count(englishproductname) as total_product_by_catgeory
from dimproduct;

-- Region wise sales
SELECT D.SalesTerritoryRegion AS Region, SUM(F.SalesAmount) AS Total_Sales
FROM  worksadventure.union F
inner JOIN DimSalesTerritory D
ON F.SalesTerritoryKey = D.SalesTerritoryKey
GROUP BY D.SalesTerritoryRegion;

-- Top 3 profitable region
select d.salesterritoryregion as region,
sum(profit) as Total_profit
from worksadventure.union f 
inner join dimsalesterritory d 
on f. SalesTerritoryKey = d.SalesTerritoryKey
group by SalesTerritoryregion 
order by Total_profit desc limit 3;

-- Top 5 salling product
select 
d.englishproductname,
sum(salesamount) AS Total_sales
from worksadventure.union f 
inner join dimproduct d 
on f.ProductKey =d. ProductKey
group by EnglishProductName
order by total_sales desc limit 5;

-- Total sales by Year
select
year(orderdatekey) as Year,
sum(salesamount) as Totalyearsales
from worksadventure.union 
group by year(orderdatekey)
order by year(orderdatekey) desc;

-- Year wise profit
select
year(orderdatekey) as Year,
sum(profit) as Totalyearpofit
from worksadventure.union 
group by year(orderdatekey)
order by year(orderdatekey) desc;

-- Monthwise sales & Profit
select
d.englishmonthname,
sum(salesamount) as Total_sales,
sum(profit) as Total_profit
from worksadventure.union f
join dimdate d
on f.OrderDateKey= d.datekey
group by EnglishMonthName;

select 
Gender,
count(orderQuantity) as Total_orders  from dimcustomer d
Join worksadventure.union f
on d.customerkey = f.CustomerKey
group by Gender
order by Total_orders desc;

select crm;

