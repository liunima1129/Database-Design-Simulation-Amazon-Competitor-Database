use AmazonCompetitorDatabase;
go
create view Top10CustomerRecommends as
select Top 10 c.CustomerID, c.WishList, oi.ProductID
from Customers c join Orders o 
	on c.OrderID = o.OrderID join OrderItems oi 
	on o.OrderID = oi.OrderID
order by c.CustomerID;
go
create view Top5LargeWarehouse as
select Top 5 WarehouseID, NumberInStock
from WarehouseStorage
order by WarehouseStorage.NumberInStock desc;
go
create view SmallestScaleSupplier as
select Top 1 s.SupplierID, sp.Quantity
from Suppliers s join SupplierProducts sp
	on s.SupplierID = sp.SupplierID
order by sp.Quantity;
go
create view SumOfBusiness as
select SUM(TotalPrice) as SumOfBusiness, COUNT(*) as NumberOfOrders
from Orders
go
create view GoodProducts as
select p.ProductID, pr.Score
from ProductRatings pr join Products p
	on pr.ProductID = p.ProductID
where pr.Score >= 4
go