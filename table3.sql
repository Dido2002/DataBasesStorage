create table clients
(
client_id int primary key not null,
fname varchar(15) not null,
lname varchar(15) not null,
address varchar(50) 
)
create table media
(
media_id char(5) primary key not null,
title varchar(30) not null,
created datetime not null
)
create table clientsMedia
(
client_id int not null,
media_id char(5) not null,
daterent datetime not null,
price decimal(6,2)
)
alter table clientMedia
add foreign key(client_id) references clients

alter table clientMedia
add foreign key(media_id) references media