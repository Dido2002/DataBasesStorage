insert into suppliers (sid, name, city)
values (100, 'IVAN IVANOV' , '�����')
insert into suppliers (sid, name, city)
values (101, 'MARIA DIMITROVA' , '�������')
insert into suppliers (sid, name, city)
values (102, 'ANNA IVANOVA', '�������')
insert into suppliers (sid, name, city)
values (103, 'DEAN VALCHEV' , '�������')
-- ����������� ���������� �����
select * from SUPPLIERS

insert into PARTS (PART_ID, PART_NAME, COLOR, WEIGHT)
values (200, 'KLUCH', 'WHITE', 0.50);
insert into PARTS (PART_ID, PART_NAME, COLOR, WEIGHT)
values (201, 'CONTACT', 'GRAY', 1.25)
insert into PARTS (PART_ID, PART_NAME, COLOR, WEIGHT)
values (202, 'CONTACT-1', 'RED', 2.50)
insert into PARTS (PART_ID, PART_NAME, COLOR, WEIGHT)
values (203, 'CONTACT -2', 'WHITE', 1.50)
insert into PARTS (PART_ID, PART_NAME, COLOR, WEIGHT)
values (204, 'CONTACT', 'GRAY', 55)
select * from PARTS

insert into SUPPLIERS_PARTS (SID, PART_ID, QUANTITY)
values (100, 200, 15);
insert into SUPPLIERS_PARTS (SID, PART_ID, QUANTITY)
values (101, 201, 30)
--
select * from SUPPLIERS_PARTS

/* c)���������� �� ������ ������� � ����� ��� (���) 50 (20) */

delete from parts
where weight <= 50

/* d) ������, ����� ����� ���� �������� ��� � ���� (���� ����) ��
������ ������� */
select part_name, color 
from parts

/* e) ������, ����� ����� ������� �� ���������, ����� �� ��������� �
����������, ��-������ �� 100 */
select p.part_name
from parts p
inner join suppliers_parts sp on sp.part_id = p.part_id
where sp.quantity > 100

/* f) ������, ����� ����� ���� �������� ������ ��������� ���������� ��
���� ���������� ���� */
select p.part_name, sum(sp.quantity) as total
from parts p inner join suppliers_parts sp 
on p.part_id = sp.part_id 
group by p.part_id, p.part_name 

/* g) ������, ����� ����� ���� �������� ��� �� ��������� � �����
��������, ����� � �������� */

select s.name, count(sp.sid) as order_count
from suppliers s inner join suppliers_parts sp
on s.sid = sp.sid 
group by s.name, s.sid 

/* h) �� �� ������� �������� ������, ���� �� ������� ���� ����
����������, ����� �� ��������� ��� 3 �������� */

select s.name, count(sp.sid) as order_count
from suppliers s inner join suppliers_parts sp
on s.sid = sp.sid 
group by s.name, s.sid 
having count(sp.sid) > 3

/* i) ������, ����� ����� ���� �������� ������������ �� ������, ����,
����� � ��������� ���������� �� ��� � ������ � ��� � ����� ������ */

select p.part_name, p.color, p.weight, sum(sp.quantity)
from parts p inner join suppliers_parts sp
on sp.part_id = p.part_id 
where p.weight = (select Max(weight) from parts)
and p.weight = (select Min(weight) from parts)
group by p.part_name, p.color, p.weight

/* j) ������, ����� ����� ���� �������� ���������� �� ������
����������, ��� �������� ���� ���� ��������� ��������*/

select s.sid, s.name, s.city
from suppliers s left join suppliers_parts sp
on s.sid = sp.sid 
group by s.sid, s.name, s.city

/* k) ������, ����� ����� ���� �������� ��� �� ������, ���� � ������
����� �� �������� */

select p.part_name, p.color, sum(p.weight * sp.quantity)
from parts p inner join suppliers_parts sp
on p.part_id = sp.part_id
group by p.part_name, p.color


/*l) ��������� �� ������, ����� ������� ���������� �� ����������,
����� �� ���������� � ������ ��������� ����� */

create view Suppliers_Parts
as
select s.name, s.city, count(sp.sid), sum(p.weight * sp.quantity) as weight 
from suppliers s inner join suppliers_parts sp 
on s.sid = sp.sid inner join parts p 
on sp.part_id = p.part_id 
group by s.sid, s.name, s.city


/* m) ��������� �� ���������, ����� �� ������� ���� ������ ���������
������������� �� ������ ������� ����� �� ����������,����� � � ��������,
����� �� ������� � ������������ */

create procedure p_supplier_parts (@part_id int)
as
select s.name, p.part_name, sp.quanity
from suppliers s inner join suppliers_parts sp
on s.sid = sp.sid inner join parts p
on sp.part_id = p.part_id
where p.part_id = @part_id
exec p_supplier_parts 1
