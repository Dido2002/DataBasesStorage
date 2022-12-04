--b) �������� �� ���� ������ PHONE � ��������� �� �������
alter table clients add phone varchar(40)
-- �) �������� �� ���� ����� � ��������� � �������� (������ ���) ����������������
insert into clients(client_id,fname,lname,address,phone)
values(1,'Ivan','Ivanov','�����, ���. �������� 15',084583475);
insert into clients (client_id, FNAME, LNAME, ADDRESS, PHONE)
values (2, 'MARIA','DIMITROVA', '�������, ���. ����� ������� 19',
8891234567)
INSERT INTO clients
VALUES(3,'Anthonii','Ivanov','Str. Neva 15',0888888888)
INSERT INTO clients
VALUES(4,'Ivancho','Kumanov','Str. Listopad 26A',0888888889)
INSERT INTO clients
VALUES(5,'Kamelia','Samova','Str. Lulyak 2',0888888899)
INSERT INTO clients
VALUES(6,'Angelina','Kostova','Str. Koko 7',0888884499)

-- ����������� ���������� �����
select * from clients

-- �������� ������ � ��������� �� ����� (MEDIA)
insert into MEDIA (MEDIA_ID, TITLE, CREATED)
values (1, 'STAR WORS', 1980-09-01);

insert into MEDIA (MEDIA_ID, TITLE, CREATED)
values (2, 'Full acceleration', 1970-06-08)
insert into MEDIA (MEDIA_ID, TITLE, CREATED)
values (3, 'UP', 2000-09-001)
INSERT INTO MEDIA
VALUES(20,'Iron man',convert(date, '14-04-2008', 105))
INSERT INTO MEDIA
VALUES(123,'Captain America',convert(date, '14-04-2010', 105))
INSERT INTO MEDIA
VALUES(124,'AVENGERS',convert(date, '14-04-2011', 105))
INSERT INTO MEDIA
VALUES(125,'AVENGERS 2',convert(date, '14-04-2015', 105))
select * from MEDIA
-- �������� ������ � ��������� �� ����� (CLIENTSMEDIA)
insert into CLIENTSMEDIA (CLIENT_ID, MEDIA_ID, DATERENT, PRICE)
values (1, 1, convert(datetime, '19-11-2009', 105), 2.5);
insert into CLIENTSMEDIA (CLIENT_ID, MEDIA_ID, DATERENT, PRICE)
values (2, 2, convert(datetime, '19-11-2009', 105), 10.0)
INSERT INTO CLIENTSMEDIA
VALUES(3,20,convert(datetime, '14-04-2010', 105),15.00)
INSERT INTO CLIENTSMEDIA
VALUES(4,123,convert(datetime, '14-04-2012', 105),16.80)
INSERT INTO CLIENTSMEDIA
VALUES(5,123,convert(datetime, '14-04-2012', 105),16.80)
INSERT INTO CLIENTSMEDIA
VALUES(6,123,convert(datetime, '14-04-2012', 105),16.80)
INSERT INTO CLIENTSMEDIA
VALUES(3,123,convert(datetime, '14-04-2012', 105),16.80)
INSERT INTO CLIENTSMEDIA
VALUES(3,20,convert(datetime, '30-12-2019', 105),16.80)
INSERT INTO CLIENTSMEDIA
VALUES(4,20,convert(datetime, '30-12-2020', 105),16.80)
INSERT INTO CLIENTSMEDIA
VALUES(6,20,convert(datetime, '05-12-2020', 105),16.80)
INSERT INTO CLIENTSMEDIA
VALUES(3,125,convert(datetime,'06-12-2020', 105),16.80)
INSERT INTO CLIENTSMEDIA
VALUES(4,125,convert(datetime, '06-12-2020', 105),24.00)
INSERT INTO CLIENTSMEDIA
VALUES(5,125,convert(datetime, '06-12-2020', 105),44.25)
INSERT INTO CLIENTSMEDIA
VALUES(6,125,convert(datetime, '06-12-2020', 105),49.99)
--
select * from CLIENTSMEDIA


-- d) ������� �� ���� �� ���� � ������������� 123 �� 15,20
update clientsMedia
set price = 15.20
where media_id =123

-- e) ������, ����� ����� ���� �������� ��� � �������, ����� � �������
--�� ������ ������� ��������� �� ��� ��� �������� ���

select fname,lname,address, phone
from clients 
order by client_id

-- f) �����, ����� ����� ������� �� �������, ����� ���� � ������, ����
--� ���������� �� �������� � �������, ����� �� �� �������

select title as title, count(cm.media_id) as total
from media m left join clientsMedia cm
on m.media_id = cm.media_id
group by title

-- g) ������, ����� ����� ������� �� �������, ����� ���� � ������, ����
--������� ���� ����� ����� �� ����� ��� 3 ����
select title as movieName, count(cm.media_id) as total
from media m inner join clientsMedia cm
on m.media_id = cm.media_id
group by title 
having count(cm.media_id) > 3

-- h) ��������� �� ������, ����� ������� ��� �� ������, ��� �� �����
--����� � ������, ���� ��������� ����� �� ���� 12.10.2019

create view ClientsMedia
as 
select fname +' '+ lname as name, title as movieName, daterent
from clients  inner join clientsMedia 
on clients.client_id = clientsMedia.client_id 
inner join media on media.media_id = clientsMedia.media_id
where daterent > '12.10.2019'

-- i) ������, ����� ������� ���, ���� �� ��������� � ���� �� ����, ����
--������ �� � ��-����� �� 50

select title as movieName, created as DateOfCreation, price
from media inner join clientsMedia 
on media.media_id = clientsMedia.media_id
where clientsMedia.price < 50.00
order by title

-- j) �� �� ������� ��� �� ���� � ���� �� ��������� � ���-������ � ���-
--����� ����
select title as movieTitle, created as DateOfCreation,price 
from media inner join clientsMedia
on media.media_id = clientsMedia.media_id
where clientsMedia.price = (select Max(price) from clientsMedia)
and clientsMedia.price = (select Min(price) from clientsMedia)

-- k) �� �� ������ ���, ����� � ������� �� ������ � ������, ����� � ���
--�� ������� �� ������ �����

select fname +' '+ lname as name, address, phone, sum(price) as total
from clients inner join clientsMedia
on clients.client_id = clientsMedia.client_id
group by fname +' '+ lname, address, phone
order by name 