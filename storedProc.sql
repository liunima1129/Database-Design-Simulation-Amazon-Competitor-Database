use AmazonCompetitorDatabase;
go
create proc FindMostExpensiveOrder as
select top 1 OrderID, TotalPrice
from Orders 
order by TotalPrice desc;
go
create proc FindSameCityExpressOrder as
select o.OrderID, spl.StartState
from Orders o join AddressBook ab
	on o.ShippingAddressID = ab.AddressID 
	join ShippingPriceList spl on ab.States = spl.StartState
where spl.StartState = spl.DestinationState;
go
create proc FindMostRecentOrderedCustomer as
select c.CustomerID, MAX(o.OrderDate)
from Customers c join Orders o 
	on c.OrderID = o.OrderID
group by o.OrderDate, c.CustomerID;
go
create proc CalculateShippingFee 
@orderid bigint,
@Start varchar(40),
@Destination varchar(40),
@Company varchar(40)
as
declare @fee money;
select @fee = ShippingPrice
from ShippingPriceList
where (ShippingCompany = @Company and
	StartState = @Start and
	DestinationState = @Destination);
update Orders 
set ShippingFare = @fee
where @orderid = OrderID;
go
	

