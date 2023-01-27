create database `QuanLyBanHang`;
use `QuanLyBanHang`;

create table Customer(
	cID	int primary key,
    cName	varchar(25) not null,
    cAge	tinyint
);

create table OrderC(
	oID	int,
    cID	int not null,
    oDate	date not null,
    oTotalPrice	int,
    primary key(oID)
);

create table OrderDetail(
	oID	int,
    pID	int not null,
    odQTY int not null,
    primary key(oID,pID)
);

create table Product(
	pID int primary key,
    pName varchar(25) unique not null,
    pPrice	int
);

alter table OrderC add constraint FK_oder_customer foreign key(cID) references Customer(cID);
alter table OrderDetail add constraint FK_oderdetail_orderC foreign key(oID) references OrderC(oID);
alter table OrderDetail add constraint FK_oderdetail_product foreign key(pID) references Product(pID);

INSERT INTO Customer
VALUES (1, 'Minh Quan', 10);
INSERT INTO Customer
VALUES (2, 'Ngoc Oanh', 20);
INSERT INTO Customer
VALUES (3, 'Hong Ha', 50);

INSERT INTO OrderC
VALUES (1, 1, '2006-03-21', null);
INSERT INTO OrderC
VALUES (2, 2, '2006-03-23', null);
INSERT INTO OrderC
VALUES (3, 3, '2006-03-16', null);

INSERT INTO Product
VALUES  (1, 'May Giat', 3),
		(2, 'Tu Lanh', 5),
		(3, 'Dieu Hoa', 7),
		(4, 'Quat', 1),
		(5, 'Bep Dien', 2);

INSERT INTO OrderDetail
VALUES (1, 1, 3),
       (1, 3, 7),
       (1, 4, 2),
       (2, 1, 1),
       (3, 1, 8),
       (2, 5, 4),
       (2, 3, 3);

SELECT O.oID, O.oDate, P.pPrice
FROM OrderC O join OrderDetail OD on O.oID = OD.oID
join Product P on OD.pID = p.pID;

SELECT C.cName, P.pName
FROM Customer C 
join OrderC O on C.cID = O.cID 
join OrderDetail OD on O.oID = OD.oID
join Product P on OD.pID = p.pID;

SELECT O.oID, O.oDate, (OD.odQTY * P.pPrice) AS oTotalPrice
FROM OrderC O join OrderDetail OD on O.oID = OD.oID
join Product P on OD.pID = p.pID;

/*drop database `QuanLyBanHang`;*/

