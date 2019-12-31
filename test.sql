use AmazonCompetitorDatabase;
go
exec FindMostExpensiveOrder 
go
exec FindSameCityExpressOrder
go
exec FindMostRecentOrderedCustomer
go
exec CalculateShippingFee 1000005, 'Colorado', 'Connecticut', 'FedEx'
go
 --Products rating score average higher than 3 points: 
select * from GoodProducts
 --Supplier to be eliminated since its small production:
select * from SmallestScaleSupplier
 --Total sell amount:
select * from SumOfBusiness
--Top 10 recommend items in wishlist of all customers: 
select * from Top10CustomerRecommends
--Top 5 largest storage warhouses
select * from Top5LargeWarehouse
declare @testres1 money
select @testres1 = dbo.InquireShippingFare('Colorado', 'Connecticut', 'FedEx')
print @testres1
go
declare @testres2 bigint
select @testres2 = dbo.MostExpensiveProduct()
print @testres2
go
declare @testres3 int
select @testres3 = dbo.ProductAvgRatingScore(100003)
print @testres3
go
select * from dbo.CustomerHistoryItems(10004)