create database Baoshop;
use Baoshop;

drop database Baoshop;

CREATE TABLE Accounts(
	Username nvarchar(50) not null primary key,
    Password nvarchar(50) not null,
    Fullname nvarchar(50) not null,
    Email nvarchar(50) not null,
    Photo nvarchar(50) not null
) ENGINE = InnoDB;
select * from Accounts;
drop table Accounts;

CREATE TABLE Authorities(
     Id int not null primary key AUTO_INCREMENT,
     Username nvarchar(50) not null,
     RoleId nvarchar(10) not null
)ENGINE = InnoDB;
drop table Authorities;

CREATE TABLE Categories(
     Id char(4) not null primary key,
     Name nvarchar(50) not null
)ENGINE = InnoDB;
drop table Categories;


CREATE TABLE Products(
     Id int not null primary key auto_increment,
     Name nvarchar(50) not null,
     Image nvarchar(50) not null,
     Price float not null,
     CreateDate date NOT NULL,
     Available bit not null,
     CategoryId char(4) not null
)ENGINE = InnoDB;
drop table Products;

CREATE TABLE Roles(
     Id nvarchar(10) not null primary key,
     Name nvarchar(50) not null
)ENGINE = InnoDB;
drop table Roles;

CREATE TABLE OrderDetails(
	Id bigint NOT NULL PRIMARY KEY auto_increment,
	OrderId bigint NOT NULL,
	ProductId int NOT NULL,
	Price float NOT NULL,
	Quantity int NOT NULL
)ENGINE = InnoDB;
drop table OrderDetails;

CREATE TABLE Orders(
	Id bigint  NOT NULL primary key auto_increment,
	Username nvarchar(50) NOT NULL,
	CreateDate datetime NOT NULL,
	Address nvarchar(100) NOT NULL
)ENGINE = InnoDB;
drop table Orders;

insert into Roles values
('ADMIN','Admin'),
('PM','Project Manager'),
('USER','User');

INSERT Accounts (Username, Password, Fullname, Email, Photo) VALUES ('lnb','123','Lê Nhựt Bảo','baoln@gmail.com','a.jpg');
INSERT Accounts (Username, Password, Fullname, Email, Photo) VALUES ('nva','123','Nguyễn Văn A','anv@gmail.com','b.jpg');
INSERT Accounts (Username, Password, Fullname, Email, Photo) VALUES ('nvb','123','Nguyễn Văn B','bnv@gmail.com','b1.jpg');

INSERT Authorities (Id, Username, RoleId) VALUES ('101','lnb','ADMIN');
INSERT Authorities (Id, Username, RoleId) VALUES ('102','nva','USER');
INSERT Authorities (Id, Username, RoleId) VALUES ('103','nvb','PM');


INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100005, 10249, 1001, 42.4, 40);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100006, 10250, 1002, 7.7, 10);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100007, 10250, 1003, 42.4, 35);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100008, 10250, 1004, 16.8, 15);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100009, 10251, 1005, 16.8, 6);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100010, 10251, 1006, 15.6, 15);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100011, 10251, 1007, 16.8, 20);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100012, 10252, 1008, 64.8, 40);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100013, 10252, 1009, 2, 25);
INSERT OrderDetails (Id, OrderId, ProductId, Price, Quantity) VALUES (100014, 10252, 1010, 27.2, 40);

INSERT Categories (Id, Name) VALUES (N'1000', N'cỏ nhân tạo');
INSERT Categories (Id, Name) VALUES (N'1001', N'futsal');
INSERT Categories (Id, Name) VALUES (N'1002', N'dung cụ khác');



INSERT Orders (Id, Username, CreateDate, Address) VALUES (10249, N'lnb', CAST('2021-09-03 00:00:00'AS DateTime), N'Luisenstr. 48');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10250, N'lnb', CAST('2021-09-03 00:00:00' AS DateTime), N'Rua do Paço, 67');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10251, N'nva', CAST('2021-09-03 00:00:00' AS DateTime), N'2, rue du Commerce');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10252, N'nva', CAST('2021-09-03 00:00:00' AS DateTime), N'Boulevard Tirou, 255');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10253, N'nva', CAST('2021-09-03 00:00:00' AS DateTime), N'Rua do Paço, 67');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10254, N'nva', CAST('2021-09-03 00:00:00' AS DateTime), N'Hauptstr. 31');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10255, N'nva', CAST('2021-09-03 00:00:00' AS DateTime), N'Starenweg 5');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10256, N'nva', CAST('2021-09-03 00:00:00' AS DateTime), N'Rua do Mercado, 12');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10257, N'nva', CAST('2021-09-03 00:00:00' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35');
INSERT Orders (Id, Username, CreateDate, Address) VALUES (10258, N'nvb', CAST('2021-09-03 00:00:00' AS DateTime), N'Kirchgasse 6');

INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1001, N'Giày Adidas Nemeziz Tango 18+TF', N'1001.jpg', 190, CAST('2021-09-02' AS Date), 0, N'1000');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1002, N'ADIDAS PREDATOR MUTATOR 20.3 IC', N'1002.jpg', 19, CAST('2021-09-02' AS Date), 0, N'1001');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1003, N'Bóng đá động lực', N'1003.jpg', 10, CAST('2021-09-02' AS Date), 1, N'1002');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1004, N'Giày Codad FX One cao cấp', N'1004.jpg', 180, CAST('2021-09-02' AS Date), 1, N'1000');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1005, N'Giày futsal Pan Impulse Graffiti IC', N'1005.jpg', 200, CAST('2021-09-02' AS Date), 1, N'1000');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1006, N'Giày phủi WIKA 3 sọc CT3 đế thấp TF', N'1006.jpg', 150, CAST('2021-09-02' AS Date), 1, N'1000');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1007, N'NIKE LUNAR GATO II IC', N'1007.jpg', 106, CAST('2021-09-02' AS Date), 1, N'1001');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1008, N'NIKE MERCURIAL VAPOR 12 PRO IC', N'1008.jpg', 110, CAST('2021-09-02' AS Date), 1, N'1001');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1009, N'NIKE REACT GATO IC FUTSAL 2020', N'1009.jpg', 210, CAST('2021-09-02' AS Date), 1, N'1001');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1010, N'banggoibongchuyen', N'1010.jpg', 50, CAST('2021-09-02' AS Date), 1, N'1002');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1011, N'gangtaydoden', N'1011.jpg', 70, CAST('2021-09-02' AS Date), 1, N'1002');
INSERT Products (Id, Name, Image, Price, CreateDate, Available, CategoryId) VALUES (1012, N'gangtaynike', N'1012.jpg', 90, CAST('2021-09-02' AS Date), 1, N'1002');


select * from Categories;
select * from Products;
select * from Roles;
select * from Authorities;
select * from Accounts;


ALTER TABLE Products  ADD  CONSTRAINT FK_CategoryId FOREIGN KEY(CategoryId)
REFERENCES Categories (Id) ON DELETE CASCADE ;

ALTER TABLE Authorities  ADD  CONSTRAINT FK_UserRoles FOREIGN KEY(Username)
REFERENCES Accounts (Username)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Authorities  ADD  CONSTRAINT FK_Roles FOREIGN KEY(RoleId)
REFERENCES Roles(Id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE OrderDetails  ADD  CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY(OrderId)
REFERENCES Orders(Id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE OrderDetails ADD  CONSTRAINT FK_OrderDetails_Products FOREIGN KEY(ProductId)
REFERENCES Products (Id)
ON UPDATE CASCADE;

ALTER TABLE Orders ADD  CONSTRAINT FK_Orders_Customers FOREIGN KEY(Username)
REFERENCES Accounts (Username)
ON UPDATE CASCADE
ON DELETE CASCADE