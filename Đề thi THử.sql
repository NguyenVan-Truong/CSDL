create database dethithu
use dethithu
create table nhacungcap(
mancc char(5) not null primary key,
tenncc nvarchar(10) null,
diachi nvarchar(15) null
);
create table hang(
mahang char(5) not null primary key,
tenhang nvarchar(10) null,
soluong int null,
dongia money null,
xuatxu nvarchar(10) null
);

create table hangdaban(
mancc char(5) not null  foreign key references nhacungcap(mancc),
mahang char(5) not null  foreign key references hang(mahang),
soluongban int null ,
ngayban date null,
giaban money null
);

insert into nhacungcap
values ('35726' ,N'Trường' ,N'Hà Nội'),
('NCC01' ,N'Samsung' ,N'15 Cầu Giáy'),
('NCC02' ,N'Apple' ,N'1 Trịnh Văn Bô'),
('NCC03' ,N'Oppo' ,N'100 Xuân Thuỷ')

insert into hang
values ('H01',N'iphone 13', 100, 5000,N'Trung Quốc'),
('H02',N'Oppo note', 200, 100000,N'Việt Nam'),
('H03',N'Samsung', 150, 15000000,N'Trung Quốc')

insert into hangdaban
values ('NCC01','H01', 2,'2022-08-08','570000'),
('NCC02','H02', 3,'2022-10-20','11000000'),
('NCC03','H03', 3,'2022-10-11','15000000'),
('NCC01','H02', 1,'2022-02-08','11000000')

-- 1 , đưa ra các thông tin nhà cung cấp có tên bắt đầu la a
select * from nhacungcap where tenncc like N'A%'
--2. đưa ra các thông tin các mặt hàng có số luong từ 200-10000
select * from hang
where soluong between 200 and 1000

select * from nhacungcap
select * from hang
select * from hangdaban
-- số lượng bán
select a.mahang , a.tenhang , sum(b.soluongban) as' tông số  lượng'
from hang a inner join  hangdaban b on a.mahang= b.mahang
group by a.mahang , a.tenhang
having sum(b.soluongban) between 2 and 3
--3,đưa ra các mặt hàng chưa bán đc trong 10/2022
select * from hangdaban
 where mahang not in (select mahang from hangdaban where ngayban between '2022-10-01' and '2022-10-30')

-- 4. tìm thông tin 2 mặt hàng cao nhất
select top 2* from hang order by dongia desc
--5. tính tồng tiền h03 trong thang 11/2022
select * from hangdaban
select mahang, (giaban * soluongban) as ' Tổng Tiền ' from hangdaban
where mahang = 'H03' and ngayban between '2022-10-01' and '2022-10-30'
--6. Giảm 10% cho hàng việt Nam
update  hang set dongia = dongia * 0.1 where xuatxu like N'Việt Nam'  
--7 xoá dữ liệu các hàng đã bán 2020
delete from hangdaban where ngayban<'2022-01-01'










select manv , hoten , ngáyinh 
where luong >7000000 and gioitinh like N'nu'


select  manv , hoten ,count(sogio)
from nhanvien , chamcong
where nhanvien=chamcong 
having count(sogio) >300


update duan
set nambatdau='2019'
where tenduan = ' mang gel'

		

