if DB_ID('AmazonCompetitorDatabase') is not null
	drop database AmazonCompetitorDatabase
go

create database AmazonCompetitorDatabase
go

use AmazonCompetitorDatabase
go

create table Customers(
CustomerID bigint not null identity(1,1),
CustomerName varchar(40) not null,
CustomerUserName varchar(40) not null,
EmailAddress varchar(40),
PhoneNumber varchar(40) not null,
OrderID bigint not null,
WishList varchar(40),
constraint CustomerID primary key clustered(CustomerID asc)
)
go

create table CustomerToAddress(
CustomerID bigint not null,
AddressID bigint not null,
AddressType varchar(40) not null,
primary key (CustomerID, AddressID)
)
go

create table AddressBook(
AddressID bigint not null identity(1,1),
City varchar(40) not null,
States varchar(40) not null,
Street varchar(40) not null,
constraint AddressID primary key clustered(AddressID asc)
)
go

create table Products(
ProductID bigint not null identity(1,1),
ProductName varchar(40) not null,
Descriptions varchar(40),
Price money not null,
constraint ProductID primary key clustered(ProductID asc)
)
go

create table ProductRatings(
ProductID bigint not null,
CustomerID bigint not null,
OrderID bigint not null,
Score int not null,
Texts varchar(40),
RatingDate datetime not null,
primary key (ProductID, CustomerID, OrderID)
)
go

create table Orders(
OrderID bigint not null identity(1,1),
OrderStatus varchar(40) not null,
OrderDate datetime not null,
TotalPrice money not null,
ShippingService varchar(40) not null,
ShippingAddressID bigint not null,
ShippingFare money not null,
Texts varchar(40),
ExpectedShippingDate date,
ActualShippingDate date,
ShippingInformation varchar(40),
constraint OrderID primary key clustered(OrderID asc)
)
go

create table OrderItems(
OrderID bigint not null,
ProductID bigint not null,
Quantity int not null,
UnitPrice money not null,
primary key (OrderID, ProductID)
)
go

create table Suppliers(
SupplierID bigint not null identity(1,1),
SupplierName varchar(40) not null,
SupplierAddress varchar(40) not null,
PhoneNumber varchar(40) not null,
EmailAddress varchar(40) not null,
constraint SupplierID primary key clustered(SupplierID asc)
)
go

create table SupplierProducts(
ProductID bigint not null,
SupplierID bigint not null,
Quantity int not null,
primary key (SupplierID, ProductID)
)
go

create table Warehouses(
WarehouseID bigint not null identity(1,1),
AddressID varchar(40) not null,
constraint WarehouseID primary key clustered(WarehouseID asc)
)
go

create table WarehouseStorage(
WarehouseID bigint not null,
ProductID bigint not null,
SupplierID bigint not null,
NumberInStock int,
NumberOnTheWay int,
NumberInReturn int,
primary key (WarehouseID, SupplierID, ProductID)
)
go