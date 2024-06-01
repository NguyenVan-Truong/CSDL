create database quanlyhanghoa
use quanlyhanghoa
create table hanghoa(
mahanghoa char(10) not null primary key,
tenhanghoa nvarchar(20) null,
dongia money null,
dvt nvarchar(10) null,
soluong int null
);
create table khachhang(
makhachhang char(10) not null primary key,
tenkhachhang nvarchar(20) null,
diachi nvarchar(20) null,
sdt int null
);
create table phieunhap(
sophieunhap char(10) not null primary key,
ngaynhap date null,
makhachhang char(10) null
);
create table CTnhap(
sophieunhap char(10) not null,
mahanghoa char(10) not null,
soluong int null
);
 alter table CTnhap
add constraint pri_cthnhap
primary key (sophieunhap,mahanghoa)

alter table ctnhap
add constraint khoangoai_ctnhap
foreign key (sophieunhap)
references phieunhap(sophieunhap)

alter table ctnhap
add constraint khoangoai_ctnhap2
foreign key (mahanghoa)
references hanghoa(mahanghoa)

insert into hanghoa
values ('PH001', N'Mỳ Tôm','10000',N'Gói',10),
('PH002', N'Nước Mắm ','15000',N'Chai',20),
('PH003', N'Xúc Xích','12000',N'Chiếc',12)

insert into khachhang
values ('Ph009',N'Nguyễn Văn A',N'Hà Nội','0123456789'),
('Ph010',N'Nguyễn Văn B',N'Hà Nam','0123456987'),
('Ph011',N'Nguyễn Văn C',N'Hải Phòng','0123456654')

insert into phieunhap
values ('PN020','2022-2-1','PH001'),
('PN021','2022-3-1','PH002'),
('PN022','2022-4-1','PH002')
insert into CTnhap
values ('PN020','Ph001',10),
('PN021','Ph002',10),
('PN022','Ph003',10)

select * from hanghoa
where soluong>10


-- liệt kê các phiếu nhập (sophieunhap,ngaylap,soluong, dongia , thanh tien)
--có thành tiền từ 1000000 -> 600000
select phieunhap.sophieunhap,phieunhap.ngaynhap,CTnhap.soluong,hanghoa.dongia,CTnhap.soluong* hanghoa.dongia as' thành tiền'
from hanghoa , phieunhap , CTnhap
where hanghoa.mahanghoa = CTnhap.mahanghoa and CTnhap.sophieunhap = phieunhap.sophieunhap
and CTnhap.soluong* hanghoa.dongia > 100000 and CTnhap.soluong* hanghoa.dongia < 600000

select COUNT(sophieunhap) as 'số phiếu nhập' from phieunhap
where year(ngaynhap) ='2022'
-----
select * from khachhang
where makhachhang not in (select makhachhang from phieunhap)

----
update khachhang
set sdt=N'0927484775'
where tenkhachhang = N'Nguyễn Văn A '

delete from khachhang
where tenkhachhang= N'Nguyễn Văn A'

insert into CTnhap
values ('PN022','PH001',2)

