use AmazonCompetitorDatabase;
go
begin tran
declare @errorcnt int
set @errorcnt = 0
insert into Warehouses(WarehouseID, AddressID)
values (1234, 4567)
select @errorcnt = @@ERROR
if(@errorcnt <> 0) goto error
commit tran;
error:
	print 'Record not available'
	rollback tran;
begin tran
update Products
set Price = Price * 0.9
where Price >= 10
commit tran
begin tran
update ShippingPriceList 
set ShippingPrice = ShippingPrice * 0.8 
where ShippingCompany = 'UPS'
update ShippingPriceList
set ShippingPrice = ShippingPrice * 1.1
where ShippingCompany = 'FedEx'
commit tran
begin tran
select OrderID, -datediff(day, ActualShippingDate, ExpectedShippingDate) as DateLate
from Orders
where ActualShippingDate > ExpectedShippingDate
select OrderID, datediff(day, ActualShippingDate, ExpectedShippingDate) as DateEarly
from Orders
where ActualShippingDate < ExpectedShippingDate
commit tran