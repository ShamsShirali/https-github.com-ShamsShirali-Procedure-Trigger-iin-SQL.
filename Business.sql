Create Database Business

Use Business

--Task2
Create Table Brands
(
Id int identity primary key,
Name nvarchar(30)
)

Insert Into Brands Values
('Honor'),
('Samsung'),
('Iphone'),
('HP'),
('Xiaomi'),
('Asus'),
('Lenova'),
('Nokia')


Create Table Notebooks
(
Id int identity primary key,
Name nvarchar(30),
Price money,
BrandId int Foreign Key References Brands(Id)
)

Insert Into Notebooks Values
('JSDSHF',2000,2),
('HASJAH',3000,1),
('AAJAUSUH',1200,6),
('FHHISDIS',4000,4),
('NWCNCNM',5000,7),
('TJJPEOIE',4500,3),
('BJSXJ',1400,2)


Create Table Phones
(
Id int identity primary key,
Name nvarchar(30),
Price money,
BrandId int Foreign Key References Brands(Id)
)

Insert Into Phones Values
('BDCSKJ',1000,2),
('BHUBA',600,5),
('UDNCSAU',700,2),
('DNMWC',3000,3)

Insert Into Phones Values
('TJJPEOIE',1500,3)

--3
Select (Notebooks.Name+' '+Brands.Name) as [BrandName],Price From Notebooks
Left Outer Join Brands 
On Notebooks.BrandId=Brands.Id

--4
Select (Phones.Name+' '+Brands.Name) as [BrandName],Price From Phones
Left Outer Join Brands 
On Phones.BrandId=Brands.Id

--5
Select n.Name,Price,BrandId From Notebooks n
Left Outer Join Brands b
On n.BrandId=b.Id
Where b.Name Like '%s%'

--6
Select * From Notebooks n
Where n.Price Between 1999 And 5001

Select * From Notebooks n
Where n.Price>5000

--7
Select * From Phones p
Where p.Price Between 999 And 1501

Select * From Phones p
Where p.Price>1500

--8
Select b.Name,Count(*) as [Count of Notebooks] From Notebooks n
Left Outer Join Brands b
On n.BrandId=b.Id
Group By b.Name

--9
Select b.Name,Count(*) as [Count of Phones] From Phones p
Left Outer Join Brands b
On p.BrandId=b.Id
Group By b.Name

--10
Select n.Name,n.BrandId From Notebooks n
Inner Join Phones p
On n.Name=p.Name And n.BrandId=p.BrandId

--11
Select * From Phones p
Full Join Notebooks n
On p.Id=n.Id

--12
Select b.Name as [BrandName],p.Id,p.Name,p.Price,n.Id,n.Name,n.Price From Brands b
Left Join Phones p
On p.BrandId=b.Id
Left Join Notebooks n
On n.BrandId=b.Id

--13
Select b.Name as [BrandName],p.Id,p.Name,p.Price,n.Id,n.Name,n.Price From Brands b
Full Join Phones p
On p.BrandId=b.Id
Full Join Notebooks n
On p.BrandId=b.Id
Where n.Price>1000 And p.Price>1000

--14
Select b.Name as [BrandName],Count(*) as [ProductCount] From Phones p
Left Join Brands b
On p.BrandId=b.Id
Group By b.Name

--15
Select b.Name as [BrandName],Count(*) as [ProductCount] From Notebooks n
Left Join Brands b
On n.BrandId=b.Id
Group By b.Name
Having Count(*)>2 

