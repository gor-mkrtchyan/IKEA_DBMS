--Workers In Gyumri

SELECT 
    CONCAT(e.firstname, ' ', e.lastname) AS 'Full Name' , b.PhoneNumber
FROM
    employees AS e,
    branches AS b
WHERE
    e.branchcode = b.branchcode
        AND jobtitle = 'Sales Rep'
        AND city = 'Gyumri'
        
        
--Generous Discount

SELECT 
    CONCAT(c.firstName, ' ', c.lastName) AS FullName,
    COUNT(ordernumber) AS OrderCount
FROM
    customers AS c,
    orders AS o
WHERE
    c.customerID = o.customerID
GROUP BY FullName
ORDER BY OrderCount DESC
LIMIT 5;


--International Customers

SELECT *
FROM customers
WHERE lastName NOT IN(SELECT lastname FROM customers where lastName like "%yan" or "%ian")


--Bad Customers
SELECT 
    count(c.customerID) as badcustomers
FROM
    customers AS c
        LEFT JOIN
    orders AS o ON c.customerID = o.customerID
WHERE
    o.customerID IS NULL;
    
--Double Supplier

SELECT 
    s.supplierID, s.SupplierCompanyName
FROM
    suppliers AS s,
    materialproduction AS m
WHERE
    s.supplierID = m.supplierID
group by  s.supplierID having count(*)=2;


--Production Cost for Sofas

select sum(p.productioncost) from products as p, productlines as pl
where p.productline = pl.productline
and pl.productline = "Sofa"

--Most Popular Product

select p.productname, count(od.orderNumber) as ordercount
from products as p, orderdetails as od
where p.productcode = od.productcode
group by p.productname
order by ordercount desc limit 1


--Least Ordered Product

select productcode
from orderdetails
group by productCode
order by count(*) asc 
limit 1