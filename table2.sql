create table suppliers
(
sid char(8) not null primary key,
name varchar(30) not null,
city varchar(20) 
)
create table parts
(
part_id int not null primary key,
part_name varchar(30) not null,
color varchar(10),
weight decimal(6,3)
)
create table suppliers_parts
(
sid char(8) foreign key references suppliers not null,
part_id int foreign key references parts not null
primary key (sid,part_id),
quantity int not null
)
