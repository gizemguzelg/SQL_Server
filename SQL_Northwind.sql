

use Northwind

--Select
select * from Products

select CategoryName, Description from Categories

select FirstName, LastName, Title from Employees

select CompanyName, 
	   ContactName, 
	   Address, 
	   City, 
	   Region 
from Suppliers

--Where
select FirstName,
	   LastName, 
	   Title 
from Employees 
where EmployeeID = 1

select ProductID,
	   ProductName,
	   UnitsInStock,
	   UnitPrice 
from Products 
where UnitPrice > 200

select ProductID,
	   ProductName, 
	   UnitPrice, 
	   UnitsInStock 
from Products 
where UnitsInStock > 100 
	and UnitsInStock < 200

select EmployeeID, 
	   FirstName, 
	   LastName, 
	   TitleOfCourtesy 
from Employees
where EmployeeID = 2 
	or EmployeeID = 5

SELECT EmployeeID,
	   FirstName,
	   LastName,
	   TitleOfCourtesy
	   FROM Employees 
	   where TitleOfCourtesy = 'Mr.' or TitleOfCourtesy = 'Dr.'

select ProductID,
	   ProductName,
	   UnitPrice,
	   UnitsInStock from Products 
where UnitPrice > 50 and UnitsInStock > 100

select EmployeeID,
	   FirstName+' '+LastName as [Full Name], 
	   Title 
from Employees 
where YEAR(BirthDate) = 1960

select EmployeeID, 
	   FirstName+SPACE(1)+LastName as [Full Name],
	   Address from Employees 
where YEAR(BirthDate) >= 1950 and YEAR(BirthDate) <= 1961

select EmployeeID, 
	   FirstName+Space(1)+LastName as [Full Name], 
	   Country, 
	   TitleOfCourtesy, 
	   YEAR(BirthDate) as [Birth Date] from Employees
where Country = 'UK' 
AND 
(TitleOfCourtesy = 'Mrs.' Or TitleOfCourtesy = 'Ms.')

--DATEDIFF() 
--GETDATE()

select TitleOfCourtesy+SPACE(1)+FirstName+SPACE(1)+LastName AS Info,
	   Year(Getdate()) - Year(BirthDate) as Age	 from Employees
where TitleOfCourtesy = 'Mr.'
or
(DATEDIFF(YY, BirthDate, GETDATE()) > 60)


--Null Veriler

select * from Employees where Region is null

--Null olmayanlar 
select * from Employees where Region is not null

--Sıralama İşlemleri

select * from Employees 
where EmployeeID > 2
order by FirstName ASC

select EmployeeID,
	   FirstName+' '+LastName as [Full Name],
	   TitleOfCourtesy,
	   DATEDIFF(YY, BirthDate, GETDATE()) as Age 
from Employees
order by age desc

select EmployeeID,
	   FirstName+' '+LastName as [Full Name],
	   TitleOfCourtesy,
	   BirthDate,
	   HireDate
from Employees
order by 3 desc

select EmployeeID, 
	   FirstName+' '+LastName as [Full Name], 
	   TitleOfCourtesy, 
	   DATEDIFF(YY, BirthDate, GETDATE()) as Age from Employees
where TitleOfCourtesy is Not null
order by 3, 4 desc

--Between - And

select FirstName,
	   LastName, 
	   YEAR(BirthDate) as [Birth Date] from Employees
where Year(BirthDate) between 1952 and 1960
order by 3 desc

select FirstName,LastName 
from Employees
where FirstName between 'Janet' and 'Robert'
order by FirstName

--In

select TitleOfCourtesy+' '+FirstName+' '+LastName as [Title of Person] from Employees
where TitleOfCourtesy In ('Mr.', 'Dr.')

select TitleOfCourtesy+' '+FirstName+' '+LastName as [Title of Person], 
	   YEAR(BirthDate) as [Birth Date] from Employees
where Year(BirthDate) in (1950, 1955, 1960)

--Top 

select Top 1 FirstName+' '+LastName as [Full Name], 
       YEAR(BirthDate) as Age
	   from Employees
	   Order by age asc

--Like 
select FirstName,LastName from Employees where FirstName Like 'Robert'

select * from Employees where FirstName Like 'A%' 

select * from Employees where LastName Like '%N'

select * from Employees where FirstName Like '%E%'

select * from Employees where FirstName Like '[AL]%'

select * from Employees where FirstName Like 'A%' or FirstName Like 'L%'

select * from Employees where FirstName Like '%[RT]%'

select * from Employees where FirstName Like '%R__E%' 

select * from Employees where FirstName Not Like '%T'

select * from Employees where FirstName  Like '%[^T]'

--Not: Select sadece tablodan veri çekerken kullanılmaz..

select GetDate() as [O an]

select 5+9 as Toplam

select 5 - 9  as Fark

select 5 % 2 as [Mod]

select 'Gizem Güzel'

--String Fonksiyonlar

select ASCII('A') as [ASCII KODU]

select CHAR(65) as Karakter

select CHARINDEX('@', 'gizemguzelg@gmail.com') as Konum 

select LEFT('Gizem Güzel', 4) as [Soldan Karakter Sayısı]

select Right('Gizem Güzel', 4) as [Sağdan Karakter Sayısı]

select Len('Gizem Güzel') as [Karakter Sayısı]

select lower('GiZem GüZeL') as [Hepsi Küçük]

select upper('GizeM GüzEl') as [Hepsi Büyük]

select LTRIM('          Gizem Güzel') as [Soldaki Boşlukları Siler]

select LTRIM(RTRIM('          Gizem Güzel            ')) as [Tüm Boşlukları Siler]

select RTRIM('Gizem Güzel        ') as [Sağdaki Boşlukları Siler]

select Replace('Birbirbirilerine', 'bir', 'iki') as [Metinlerin yerine yenilerini yazar]

select SUBSTRING('İz Gizem Güzel', 3, 6) as [Alt Metin] 

select REPLICATE('Gizem', 5)

--Aggragate Functions

select COUNT(*) from Products 

select COUNT(ProductID) from Products

select COUNT(Region) from Employees 

select COUNT(City) from Employees

select COUNT(DISTINCT City) from Employees 

select Sum(UnitPrice) as [Total Price] from Products 

select Sum(DATEDIFF(YY, Birthdate, GetDate())) from Employees

--AVG() 

select AVG(UnitPrice) from Products

select AVG(DATEDIFF(YY, Birthdate, GetDate())) from Employees

--Min()
--Max()

select Min(UnitPrice) as [en ucuz] from Products
select Max(UnitPrice) as [en pahal�] from Products

--Group By

select Country, Count(*) as [Çalışan Sayısı] from Employees
where Country is not null
group by Country

select Count(*) as [Total Product], CategoryID from Products
where UnitPrice < 35
group by CategoryID

select Count(*) as [Sipari� Adedi], EmployeeID from Orders
group by EmployeeID
order by [Sipari� Adedi] desc

select CategoryID, Count(*) Adet from Products
where (ProductName Like '[A-K]%')
	  and
	  (UnitsInStock Between 5 and 50)
group by CategoryID

select OrderID, Sum(Quantity) [Sat�lan �r�n] from [Order Details]
group by OrderID

--Her bir siparişin tutarına göre listeleyiniz (UnitPrice * Quantity  * (1-Discount))

select OrderID, 
	   Sum(UnitPrice * Quantity  * (1-Discount)) as Tutar 
from [Order Details]
group by OrderID
order by 2 desc

--Having 

select OrderID as [Sipari� Kodu],
	   Sum(UnitPrice * Quantity  * (1-Discount)) as [Toplam Tutar]
from [Order Details]
group by OrderID
having Sum(UnitPrice * Quantity  * (1-Discount)) between 2500 and 3500
order by 2 desc

select OrderID, SUM(Quantity) as Adet from [Order Details]
group by OrderID
having sum(Quantity) > 200
order by 2 desc

select CategoryID, 
	   Sum(UnitsInStock) as [Stok Mikatar�] 
from Products
group by CategoryID
having SUM(UnitsInStock) < 400
order by 2 desc

--DML (Data Manipulating Language)

--Insert
insert Categories (CategoryName, Description) values ('Baklagiller','Vitamindir bunlar')

insert Shippers (CompanyName, Phone) values ('MNG Kargo','(212)9999999')

--Update

update Shippers
Set
	Phone = '(216)8881288'
where ShipperID = 4 

--Trick
select * into test_env_Calisanlar from Employees

select * from test_env_Calisanlar

--Delete

delete from Shippers where ShipperID = 4

----SQL TabLo Yaratma Güncelleme ve Silme

use LibraryDb

Create Table Books(
	[Id] int Identity(1,1) Not Null,
	[Title] Nvarchar(50) Not Null
);

Create Table Authors(
	[Id] int Identity(1,1) Not Null,
	[Full Name] NVarchar(50) not null
);

Create Table AssignedBooksToAuthor(
	[Id] int Identity(1,1) Not Null,
	[AuthorId] int Not Null,
	[BookId] int Not Null
);

use LibraryDb

Create Table Books(
	[Id] int Identity(1,1) Not Null,
	[Title] Nvarchar(50) Not Null
);

Create Table Authors(
	[Id] int Identity(1,1) Not Null,
	[Full Name] NVarchar(50) not null
);

Create Table AssignedBooksToAuthor(
	[Id] int Identity(1,1) Not Null,
	[AuthorId] int Not Null,
	[BookId] int Not Null
);

--Joins

use Northwind

select c.CategoryID,
	   c.CategoryName,
	   p.ProductID,
	   P.ProductName 
from Categories c join Products p on c.CategoryID = p.CategoryID 

select c.CategoryName,
	    SUM(p.UnitsInStock) as Adet
from Categories c join Products p on C.CategoryID = p.CategoryID
group by c.CategoryName
order by Adet desc

select s.CompanyName,
	   s.ContactName,
	   p.ProductName,
	   p.UnitPrice,
	   c.CategoryName 
from Suppliers s join Products p on s.SupplierID = p.SupplierID
			     join Categories c on c.CategoryID = p.CategoryID
order by 1

select o.OrderID, O.OrderDate, c.CompanyName, c.ContactName, e.FirstName+' '+e.LastName as [Full Name], e.Title
from Customers c join Orders O on c.CustomerID = o.CustomerID
			     join Employees e on e.EmployeeID = o.EmployeeID

select (FirstName+' '+LastName) as [Cal��an],
	   Cast(Sum(UnitPrice * Quantity * (1-Discount)) as decimal) as [Toplam]
	from Employees e
join Orders o on e.EmployeeID = o.EmployeeID
join [Order Details] od on od.OrderID = o.OrderID
group by (FirstName+' '+LastName)
order by 2

select ProductName,
	   Sum(od.Quantity) as Adet,
	   Sum(od.Quantity * od.UnitPrice * (1-od.Discount)) as Gelir
from Products P
join [Order Details] od on p.ProductID = od.ProductID
group by ProductName
order by 3 desc


select c.CategoryName,
	   Sum(od.Quantity * od.UnitPrice * (1-	od.Discount)) as Gelir
from Categories C
join Products P on C.CategoryID = P.CategoryID
join [Order Details] Od on od.ProductID = p.ProductID
group by c.CategoryName
order by 2 desc


select s.CompanyName,
	   SUM(o.Freight) as [�denen �cret] 
from Shippers s
join Orders o on o.ShipVia = s.ShipperID
group by s.CompanyName

select s.CompanyName,
	   p.ProductName,
	   Sum(od.Quantity) As Adet,
	   Sum(od.Quantity * od.UnitPrice * (1- od.Discount)) as Gelir
from Suppliers s
join Products p on s.SupplierID = p.SupplierID
join [Order Details] od on od.ProductID = p.ProductID
group by CompanyName, ProductName
order by 3 desc

select top 1 c.CompanyName,
	   Sum(od.Quantity) as Adet,
	   Sum(od.Quantity * od.UnitPrice * (1- od.Discount)) as Gelir
from Customers C
join Orders O on C.CustomerID = o.CustomerID
join [Order Details] od on Od.OrderID = o.OrderID
group by c.CompanyName
order by 3 desc

select OrderID, 
	   DATEDIFF(Day, RequiredDate, ShippedDate) as Dt 
from Orders
where DATEDIFF(Day, RequiredDate, ShippedDate) > 0

select c.CompanyName,
	   p.ProductName
from Customers c
join Orders o on c.CustomerID = o.CustomerID
join [Order Details] od on od.OrderID = o.OrderID
join Products p on od.ProductID = p.ProductID

select o.OrderID,
	   c.CompanyName,
	   e.FirstName+' '+e.LastName,
	   o.OrderDate,
	   s.CompanyName,
	   p.ProductName,
	   od.Quantity,
	   od.Quantity * od.UnitPrice * (1- od.Discount) as Gelir,
	   ca.CategoryName,
	   su.CompanyName
from Employees e
join Orders o on e.EmployeeID = o.EmployeeID
join Customers c on c.CustomerID = o.CustomerID
join Shippers s on s.ShipperID = o.ShipVia
join [Order Details] od on od.OrderID = o.OrderID
join Products p on p.ProductID = od.ProductID
join Categories ca  on ca.CategoryID = p.CategoryID
join Suppliers su on su.SupplierID = p.SupplierID


--Left Join

select CompanyName,
       Address
	   OrderID from Customers c 
left join Orders o on c.CustomerID = o.CustomerID
where OrderID is null

--User Defined Functions

go
Create Function KDVHesapla(@fiyat money)
returns money 
	begin
		return @fiyat * 1.08
	end;
go

select ProductName,
	   CategoryName,
	   UnitPrice,
	   dbo.KDVHesapla(UnitPrice) as [KDV] from Products
join Categories on Products.CategoryID = Categories.CategoryID

Create Function yasHesapla(@dogumTarihi datetime)
returns int
begin
	return Datediff(YY, @dogumTarihi, GetDate())
end

select FirstName+' '+LastName, dbo.yasHesapla(BirthDate) as [Age] from Employees
order by age desc

create function calisanbilgilerinigetir(@employeeId int)
returns table
	return select * from Employees where EmployeeID = @employeeId


select * from calisanbilgilerinigetir(5)

create function stokDurumu(@baslangic int, @bitis int)
returns table
	return select * from Products where UnitsInStock = @baslangic and UnitsInStock = @bitis


select * from stokDurumu(20,50)

alter function stokDurumu(@baslangic smallint, @bitis smallint)
returns table
	return select * from Products where UnitsInStock > @baslangic and UnitsInStock < @bitis

create function basHarfeGoreGetir(@basHarf varchar(1))
returns table
	return select * from Employees where left(FirstName, 1) = @basHarf


select * from basHarfeGoreGetir('A')

alter function basHarfeGoreGetir(@basHarf varchar(1))
returns table
	return select * from Employees where left(FirstName, 1) = @basHarf

create function satilanUrun(@satismiktari int)
returns table
	return 
		select ProductName,
			   Sum(od.Quantity) as [Sat�lan Urun] 
		from [Order Details] od
		join Products p on od.ProductID = p.ProductID
		group by ProductName
		having Sum(od.Quantity) > @satismiktari
		

select * from satilanUrun(1000)


--Stored Procedure

use Northwind

Create Procedure sp_CalisanlariListele
as
	Begin
		select FirstName,
			   LastName,
			   Title from Employees
	End

execute sp_CalisanlariListele

drop procedure sp_CalisanlariListele

create proc sp_UrunByKategori @id int
as 
	Begin
		select ProductName,
			   CategoryName
		from Categories c
			join Products p on c.CategoryID = p.CategoryID
		where c.CategoryID = @id
	End


execute sp_UrunByKategori @id=8

create proc sp_GetEmployeesByFullName @firstName nvarchar(20), @lastName nvarchar(30)
as
	Begin
		select FirstName+Space(1)+LastName, Title from Employees
			where FirstName = @firstName and LastName = @lastName
	End

execute sp_GetEmployeesByFullName @firstName='Robert', @lastName='King'

create proc sp_GetOrderByDate @startDate datetime, @endDate datetime
as
	Begin
		select OrderId,
			   OrderDate,
			   ShippedDate
		from Orders
		where OrderDate between @startDate and @endDate			
	End


execute sp_GetOrderByDate '01/01/1997', '12/30/1997'

create proc sp_GetCustomerOrders @Id nchar(5)
as
	begin
		select c.CompanyName, sum(od.Quantity * od.UnitPrice * (1- od.Discount)) as [Gelir] 
		from [Order Details] od
		join Orders o on od.OrderID = o.OrderID
		join Customers c on c.CustomerID = o.CustomerID
		where c.CustomerID = @Id
		group by c.CompanyName
	end

execute sp_GetCustomerOrders 'Ocean'
	
Create proc sp_GetEmployeeTotalSale @fistName nvarchar(20)
as
	Begin
		select e.EmployeeID,
			   e.FirstName+Space(1)+e.LastName as [Full Name],
			   Cast(Sum(od.Quantity * od.UnitPrice * (1- od.Discount)) as decimal)
		from Employees e
		join Orders o on e.EmployeeID = o.EmployeeID
		join [Order Details] od on od.OrderID= o.OrderID
		where e.FirstName = @fistName
		group by e.EmployeeID, e.FirstName+Space(1)+e.LastName
	End

alter proc sp_GetEmployeeTotalSale @fistName nvarchar(20)
as
	Begin
		select e.EmployeeID,
			   e.FirstName+Space(1)+e.LastName as [Full Name],
			   Cast(Sum(od.Quantity * od.UnitPrice * (1- od.Discount)) as decimal) as [Gelir]
		from Employees e
		join Orders o on e.EmployeeID = o.EmployeeID
		join [Order Details] od on od.OrderID= o.OrderID
		where e.FirstName = @fistName
		group by e.EmployeeID, e.FirstName+Space(1)+e.LastName
	End

execute sp_GetEmployeeTotalSale 'Robert'

create proc sp_GetShippersPaymentByCompanyName @companyName nvarchar(30)
as
	Begin
		select CompanyName, Sum(o.Freight) from Shippers s join Orders o on o.ShipVia = s.ShipperID
		where s.CompanyName = @companyName
		group by s.CompanyName
	End

execute sp_GetShippersPaymentByCompanyName 'Federal Shipping'

alter proc sp_GetShippersPaymentByCompanyName @companyName nvarchar(30)
as
	Begin
		select CompanyName, Sum(o.Freight) as [Total Price] from Shippers s join Orders o on o.ShipVia = s.ShipperID
		where s.CompanyName = @companyName
		group by s.CompanyName
	End

--Trigger(Tetikleyiciler)

Create Trigger trg_SiparisEklendi on [Order Details]
After Insert
AS
	Declare @kacAdet int, @hangiUrunId int;
	select @hangiUrunId = ProductID, @kacAdet = Quantity from inserted
	Update Products
	SET UnitsInStock = UnitsInStock - @kacAdet
	where ProductID = @hangiUrunId

Insert [Order Details] (ProductID, Quantity, OrderID, UnitPrice) Values (10, 5, 10248, 10) 

select ProductID,ProductName, UnitsInStock from Products where ProductID = 10

select * from [Order Details]

create trigger trg_SiparişSilindi on [Order Details]
after delete
as
	Begin
		declare @kacAdet int, @hangiUrun int;
		select @hangiUrun = ProductID, @kacAdet=Quantity from deleted
		Update Products
		Set UnitsInStock += @kacAdet 
		where ProductID = @hangiUrun
	End


delete from [Order Details] where OrderID = 10248 and ProductID = 10

select ProductID,ProductName, UnitsInStock from Products where ProductID = 3

alter trigger trg_SiparisGüncellendi on [Order Details]
after update
as
	Begin
		declare @eskiAdet int, @yeniAdet int, @urunId int;
	
		select @eskiAdet=Quantity from deleted
	
		select @yeniAdet=Quantity, @urunId= ProductID from inserted
	
		update Products
		set UnitsInStock +=  @eskiAdet - @yeniAdet
		where ProductID = @urunId
	End

select * from [Order Details]
select * from Products where ProductID = 11

update [Order Details] set Quantity = 32 where OrderID = 10248 and ProductID=11

--Eksi Sipariş adedi   Yeni sipariş Adedi    Eski Stok   Yeni Stok Miktarı
--       22			            32               22             12


--Instead of trigger

alter table Employees add isDelete int;

select * from Employees

create trigger trg_FiredEmpployee on Employees
instead of delete 
as
	declare @kovulanId int;
	select @kovulanId=EmployeeID from deleted
	update Employees set isDelete=1 where EmployeeID = @kovulanId

delete from Employees where EmployeeID =9

create trigger trg_InsterShipper on Shippers
instead of insert
as
	Begin
		declare @kargoAdi nvarchar(50), @telefon nvarchar(50);
		select @kargoAdi = CompanyName, @telefon = Phone from inserted
		declare @yeniTelefon nvarchar(50);
		set @yeniTelefon = Left(@telefon, 1)+'('+SUBSTRING(@telefon, 2, 3)+')'+SUBSTRING(@telefon, 5, 3)+'-'+SUBSTRING(@telefon, 8,2)+'-'+Right(@telefon,2)
		insert Shippers (CompanyName, Phone) Values (@kargoAdi, @yeniTelefon)
	End

insert into Shippers values ('Aras Kargo', '02129783443')
insert into Shippers values ('Yurtiçi Kargo', '02129783443')
select * from Shippers