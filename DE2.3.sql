--№1
select CustomerId, FirstName, LastName
from Customers
where CustomerId in (SELECT CustomerId FROM Orders GROUP BY CustomerId ORDER BY SUM(TotalAmount) DESC limit 5);

--№2
select Customers.CustomerId, Customers.FirstName, Customers.LastName, Orders.OrderId, Orders.TotalAmount
from Orders inner join Customers
on Orders.CustomerId = Customers.CustomerId
where Customers.CustomerId in (SELECT CustomerId FROM orders GROUP BY CustomerId ORDER BY SUM(TotalAmount) DESC limit 5) order by TotalAmount desc;

--№3
select CustomerId, FirstName, LastName from Customers where CustomerId IN (select CustomerId from orders where TotalAmount > (SELECT AVG(TotalAmount) FROM Orders));