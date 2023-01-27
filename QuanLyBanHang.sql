create database `QuanLyBanHang`;
use `QuanLyBanHang`;

create table Customer(
	cID	int primary key,
    cName	varchar(100) not null,
    cAge	int
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
    odQTY varchar(225) not null,
    primary key(oID,pID)
);

create table Product(
	pID int primary key,
    pName varchar(225) unique not null,
    pPrice	int
);

alter table OrderC add constraint FK_oder_customer foreign key(cID) references Customer(cID);
alter table OrderDetail add constraint FK_oderdetail_orderC foreign key(oID) references OrderC(oID);
alter table OrderDetail add constraint FK_oderdetail_product foreign key(pID) references Product(pID);

/*drop database `QuanLyBanHang`;*/

