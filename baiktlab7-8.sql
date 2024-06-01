create database quanlymathang
use quanlymathang
create table mathang(
mahang char(5) not null primary key,
tenhang nvarchar(20) null ,
dongia int null
);
create table khachhang(
Makhachhang char(5) not null primary key,
tenkhachhang nvarchar(20) null ,
gioitinh nvarchar(10) null,
quequan nvarchar(10) null
);
 create table hoadon(
 sophieu char(5) not null primary key,
 ngaylap date null,
 makhachhang char(5) null
 );

 create table cthoadon(
 sophieu char(5) not null,
 mahang char(5) not null,
 soluong int null
 );
alter table hoadon
add constraint khoangoai_hd
foreign key (makhachhang)
references khachhang(makhachhang)

 alter table cthoadon
add constraint pri_cthoadon
primary key (sophieu,mahang)

alter table cthoadon
add constraint khoangoai_cthoadon
foreign key (sophieu)
references hoadon(sophieu)

alter table cthoadon
add constraint khoangoai_cthoadon2
foreign key (mahang)
references mathang(mahang)

insert into mathang
values ('m1',N'Dưỡng Môi Ohui','200000'),
('m2',N'Tinh Chất Ohui','1000000'),
('m3',N'Kem Dưỡng Ohui','550000')

insert into khachhang
values ('k1',N'Trần Triệu Vy',N'Nữ',N'Hà Nội'),
('k2',N'Trần Đình Phong',N'Nam',N'Thái Bình'),
('k3',N'Minh Hà',N'Nữ',N'Sài Gòn')

insert into hoadon
values ('P1',N'2019-3-3','k1'),
 ('P2',N'2019-3-3','k1'),
 ('P3',N'2019-3-3','k3')

 insert into cthoadon
 values ('P1','m1','2'),
 ('P1','m2','3'),
 ('P2','m2','1')
 select * from khachhang
update khachhang
set quequan=N'Hải Phòng'
where tenkhachhang = N'Trần Triệu Vy'

select * from mathang
delete from mathang
where tenhang= N'Kem Dưỡng Ohui'
select * from mathang
select * from khachhang
select * from hoadon
select * from cthoadon
--1-
select * from khachhang
select Makhachhang ,tenkhachhang, gioitinh from khachhang
where tenkhachhang like N'Nguyễn%' and quequan like  N'Hà Nội'
--2-
select b.makhachhang , b.tenkhachhang, sum(d.soluong* a.dongia) as N'Tổng Tiền'
from khachhang as b , mathang as a , hoadon as c , cthoadon  as d
where b.Makhachhang = c.makhachhang and c.sophieu = d.sophieu and d.mahang = a.mahang
group by b.Makhachhang, b.tenkhachhang
having sum(d.soluong * a.dongia) >=1000000

--3
select b.makhachhang , b.tenkhachhang , SUM(d.soluong * a.dongia) as N'Tổng Tiền '
from khachhang as b , mathang as a , hoadon as c , cthoadon as d
where b.Makhachhang = c.makhachhang and c.sophieu = d.sophieu  and d.mahang=a.mahang
group by b.Makhachhang, b.tenkhachhang
having sum(d.soluong * a.dongia)>1000000
--4-
select * from khachhang
where Makhachhang not in (select distinct Makhachhang from hoadon)
--5-
select b.makhachhang , b.tenkhachhang , d.mahang , a.tenhang , a.dongia, d.soluong
from khachhang as b join hoadon as c on b.Makhachhang = c.makhachhang join cthoadon as d on c.sophieu = d.sophieu join mathang as a on
d.mahang = a.mahang
group by b.Makhachhang , b.tenkhachhang, d.mahang , a.tenhang , a.dongia , d.soluong
having b.tenkhachhang = N'Trần Triệu Vy'

--6-
insert into cthoadon
values ('P2','m1',3)
--7-
update khachhang
set quequan=N'Miền Tây'
where tenkhachhang = N'Minh Hà '
--8-
delete from mathang
where tenhang= N'Kem Dưỡng ohui'
