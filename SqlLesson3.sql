--Завдання 1

--Створіть базу даних максимальною розмірністю 100 МБ, передбачається, 
--що буде використовуватися близько 30 МБ. Введіть усі необхідні налаштування.
--Журнал транзакцій має бути розташований на іншому фізичному диску (якщо такий є).

create database OptSale
on
(
name = 'OptSale',
filename ='E:\Opt.mdf',
size = 30,
maxsize = 100
)
log on 
(
name = 'OptSaleLog',
filename ='E:\OptLog.ldf',
size = 30,
maxsize = 100
)
go

use OptSale
--Завдання 2

--Спроектуйте базу даних для оптового складу, який має постачальники товарів, персонал, 
--постійні замовники. Поля таблиць продумати самостійно.

create table GoodsSallers--------------------------------------
(
SallerId smallint identity primary key not null,
[Name] char(20) not null,
Number char(15) not null,
Email char(50) null
);

insert into GoodsSallers
( [name],number,email)
values 
('Eldorado', '380454340829','eldorado@gmail.com'),
('Comfy', '380635436523','comfy@gmail.com'),
('Rozetka','380993967422','rozetka@gmail.com')

create table Personal----------------------------------------
(
workerId smallint identity not null,
WorkerName char(20) not null,
SallerId smallint foreign key references GoodsSallers(SallerId)
)

insert into Personal
(WorkerName, SallerId)
values
('Vlad', 3),
('Aleksander', 1),
('Gregoriy', 2),
('Petro',1)

create table Buyers-----------------------------
(
BuyerId smallint identity primary key not null,
[Name] char(20) not null,
Number char(15) null,
GoodId smallint foreign key references Goods(goodid)
)

insert into Buyers
([Name], Number, GoodId)
values
('Vadim','380634562363',2),
('Lisa','380662345212',1),
('Kostya','38099234123',3)

create table Goods----------------------------------------
(
GoodId smallint identity not null,
NameOfGood char(20)  not null,
Cost decimal(10,2) not null ,
SallerId smallint foreign key references goodsSallers(SallerId) 
)

alter table Goods
add constraint PK_GoodId
primary key (GoodId)

insert into Goods
(NameOfGood,Cost,SallerId)
values
('Iphone 13 pro max',35299,2),
('Ipad pro',40999,3),
('Macbook pro',51000,1)

select * from Goods
select * from Buyers
select * from Personal
select * from GoodsSallers
