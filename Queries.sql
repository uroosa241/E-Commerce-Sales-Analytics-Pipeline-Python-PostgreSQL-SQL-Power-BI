SElECT * from customers 
SElECT * from employees
SElECT * from products 
SElECT * from orders 
SElECT * from campaigns

--How many unique customers placed orders?

select 
	count(distinct customerid)
	from orders;

--latest order date
	select
	max(orderdate)
	from orders

--earliest signupdate
	select
	min(signupdate)
	from customers


--Top 10 Customers by Orders


select 
	customerid,
	count(*) AS total_orders
	from orders
	group by customerid
	order by total_orders desc
	limit 10;

--Customer with Highest Orders
select
	customerid,
	count(*) as total_orders
	from orders 
	group by customerid
	order by total_orders desc
	limit 1;


--Average Order Quantity

select
	avg(quantity) AS avg_qty
	from orders


--total units sold

select
	sum(quantity) as total_units_sold
	from orders 


--Customers Who Never Ordered

select 
	c.customerid,
	o.orderid
	from customers as c
	left join orders as o
	on o.customerid=c.customerid
	where o.customerid is null;


--Find customers who placed more than 10 orders

SELECT customerid,
       COUNT(*) AS total_orders
FROM orders
GROUP BY customerid
HAVING COUNT(*) > 10
ORDER BY total_orders DESC;


SELECT o.orderid,
       c.name,
       o.orderdate
FROM orders o
JOIN customers c
ON o.customerid = c.customerid;

SELECT o.orderid,
       p.productname,
       o.quantity
FROM orders o
JOIN products p
ON o.productid = p.productid;

--monthly orders trnd
SELECT DATE_TRUNC('month', orderdate) AS month,
       COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

--mthly revenue

SELECT DATE_TRUNC('month', o.orderdate) AS month,
       SUM(o.quantity*p.unitprice) AS revenue
FROM orders o
JOIN products p
ON o.productid=p.productid
GROUP BY month
ORDER BY month;









	