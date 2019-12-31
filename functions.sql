use AmazonCompetitorDatabase;
go
create function InquireShippingFare
(
	@Start		  varchar(40),
	@Destination  varchar(40),
	@Company	  varchar(40)
)
returns money
as
begin
	declare @fee money;
	select @fee = ShippingPrice
	from ShippingPriceList
	where 
	(
		@Start = StartState and
		@Destination = DestinationState and
		@Company = ShippingCompany
	);
	return @fee;
end
go
create function MostExpensiveProduct()
returns bigint
as
begin
	declare @res bigint;
	select @res = p.ProductID
	from Products p join OrderItems oi
		on p.ProductID = oi.ProductID
	where oi.UnitPrice = (select MAX(UnitPrice) from OrderItems
		group by UnitPrice);
	return @res;
end
go
create function ProductAvgRatingScore 
(
	@productid bigint
)
returns int
as 
begin
	declare @avgScore int;
	select @avgScore = AVG(Score)
	from ProductRatings
	where ProductID = @productid
	return @avgScore;
end
go
create function CustomerHistoryItems 
(
	@customerid bigint
)
returns table
as
return
(
	select oi.ProductID
	from Customers c join Orders o
	on c.OrderID = o.OrderID 
	join OrderItems oi on o.OrderID = oi.OrderID
)
go