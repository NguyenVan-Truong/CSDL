create database quanlythuvien
use quanlythuvien
create table sach(
masach nvarchar(10) not null primary key,
tensach nvarchar(20) null,
nhaxuatban nvarchar(20) null,
tacgia nvarchar(10) null,
soluong int null,
giatien float null,
ngaynhapkho date null,
vitri nvarchar(20) null,
maloaisach nvarchar(10) null,
sotrang int null
);
create table loaisach(
maloaisach nvarchar(10) not null primary key,
tenloaisach nvarchar(50) null
);
create table sinhvien(
masv nvarchar(10) not null primary key ,
tensv nvarchar(20) null,
ngayhethan date null,
chuyennganh nvarchar(15) null,
phone nvarchar(11) null,
email nvarchar(20) null
);
create table phieumuon(
mapm nvarchar(10) not null primary key,
ngaymuon date null,
ngaytra date null,
masv nvarchar(10) null,
trangthai nvarchar(20) null
);
create table phieumuonchitiet(
id int identity(1,1) primary key not null,
mapm nvarchar(10) null,
masach nvarchar(10) null,
ghichu nvarchar(50) null
);
alter table sach
add constraint ls_fk
foreign key (maloaisach)
references loaisach(maloaisach)

alter table phieumuonchitiet
add constraint s_pmct_fk
foreign key (masach)
references sach(masach)

alter table phieumuonchitiet
add constraint pm_pmct_fk
foreign key (mapm)
references phieumuon(mapm)

alter table phieumuon
add constraint PM_fk
foreign key(masv)
references sinhvien(masv)

alter table [dbo].[sinhvien]
add constraint sinhvien_unq_email
unique(email)

alter table [dbo].[sinhvien]
add constraint sinhvien_unq_phone
unique(phone)

alter table [dbo].[sinhvien]
add constraint sinhvien_unq_masv
unique(masv);

insert into  sinhvien(masv, tensv ,ngayhethan,chuyennganh,phone,email)
values ('PD03347',N'Nguyễn Thành Công','2012-12-12', N'Lập  Mobile','08451235481','ngn3347@gmail.com'),
('PD03346',N'Nguyễn Văn Công','2012-12-12', N'Lập Mobile','08451235482','congnv6@gmail.com'),
('PD03348',N'Trương Công Tài','2012-12-12', N'Lập Trình Web','09824227584','congntps8@gmail.com'),
('PD03349',N'Nguyễn Đình Hải','2012-12-12', N'Lập  Mobile','01511564522','haind@gmail.com'),
('PD03350',N'Trần Ngọc Quốc','2012-12-12', N'Thiết Kế Đồ Hoạ','09871211533','quoc@gmail.com'),
('PD03351',N'Nguyễn Tiến Việt','2012-12-12', N'Ứng Dụng  Mềm','01551213514','viet@gmail.com'),
('PD03352',N'Lê Hữu Nghĩa','2012-12-12', N'LậpMobile','08975485922','nghia@gmail.com'),
('PD03353',N'Lê Nguyễn Hoàng Tiến','2012-12-12', N'Thiết Kế ','08484256484','tien@gmail.com'),
('PD03354',N'Gia Cát Lương','2012-12-12', N'Ứng Phần Mềm','03215815972','luonggc@gmail.com')

insert into loaisach(maloaisach,tenloaisach)
values ('IT',N'Công Nghệ Thông Tin'),
('TA',N'Tiếng Anh'),
('KT',N'Kinh Tế'),
('NV',N'Tiểu Thuyết'),
('LS',N'Lịch Sử')

insert into sach(masach,tensach,nhaxuatban,tacgia,soluong,giatien,ngaynhapkho,vitri,maloaisach,sotrang)
values ('com2012',N'Thiết Kế Đồ Hoạ',N'NXB FPT',N'John Smith','100','135000','2018-12-2','1','IT','250'),
('NV0040',N'Alice Xứ Sở ',N'NXB FPL',N'Huấn Hoa ','10','131000','2018-1-2','1','IT','250'),
('com2022',N'Java Cơ Bản',N'nXB NVT',N'Faker','90','135080','2018-2-21','3','IT','250'),
('com2032',N'Lâp Trình Cơ Bản',N'NXB Dân Chí',N'John ','1','135300','2018-1-9','2','KT','250'),
('kth1010',N'Khái Lược Những  ',N'NXB FPT',N' Smith','120','135200','2018-2-2','9','KT','250'),
('kth1020',N'Hiểu Hết về Tiền',N'NXB FPT',N'Joh','180','135000','2018-12-9','10','TA','200'),
('kth1030',N'Người Nam Châm',N'NXB FPT',N' Smoth','105','135050','2018-1-2','14','TA','100'),
('eng0010',N'Giải Thích Ngữ Pháp',N'NXB FPT',N'Jon ','130','136000','2018-2-22','13','NV','150'),
('eng0020',N'Giết Con Chim Lại',N'NXB FPT',N'Trang','170','135080','2018-2-24','12','LS','254'),
('Ls2050',N'Chân Dung Nhan LOại',N'NXB FPT',N'Trường','190','135900','2018-1-21','19','LS','200')

insert into phieumuon(mapm,masv,ngaymuon,ngaytra,trangthai)
values('PM01','PD03347','2022-4-10','2022-4-17',N'Đã Trả'),
('PM10','PD03347','2022-4-10','2022-4-17',N'Đã Trả'),
('PM03','PD03348','2022-1-10','2022-1-17',N'Đã Trả'),
('PM02','PD03349','2022-2-10','2022-2-17',N'Đã Trả'),
('PM04','PD03350','2022-3-10','2022-3-17',N'Chưa Trả'),
('PM05','PD03351','2022-4-10','2022-4-17',N'Chưa Trả'),
('PM06','PD03352','2022-5-10','2022-5-17',N'Chưa Trả'),
('PM07','PD03353','2022-6-10','2022-6-17',N'Đã Trả'),
('PM08','PD03346','2022-7-10','2022-7-17',N'Chưa Trả'),
('PM09','PD03354','2022-9-10','2022-9-17',N'Đã Trả')

insert into phieumuonchitiet(mapm,masach,ghichu)
values ('PM01','com2012',N'Sách Mới'),
('PM01','com2012',N'Sách Mới'),
('PM02','com2022',N'Sách Mới'),
('PM03','com2012',N'Sách Mới'),
('PM04','com2012',N'Sách Mới'),
('PM05','kth1010',N'Sách Mới'),
('PM06','kth1010',N'Sách Mới'),
('PM07','kth1010',N'Sách Mới'),
('PM08','kth1030',N'Sách Mới'),
('PM09','eng0020',N'Sách Mới'),
('PM10','eng0020',N'Sách Mới'),
('PM01','eng0020',N'Sách Mới'),
('PM02','kth1030',N'Sách Mới'),
('PM03','Ls2050',N'Sách Mới'),
('PM03','Ls2050',N'Sách Mới')

select tensach,masach,giatien,tacgia from sach
where maloaisach='IT'

select a.mapm ,masv,ngaymuon, b.masach from phieumuon a inner join phieumuonchitiet b
on a.mapm = b.mapm
where a.ngaymuon like '2022-01%'

select * from phieumuon
where trangthai like N'Chưa Trả'
order by ngaymuon

select a.maloaisach ,b.tenloaisach,count(b.maloaisach) as 'sa dau sach' 
from sach a inner join loaisach b on a.maloaisach = b.maloaisach
group by a.maloaisach , b.tenloaisach

select masv,count(masv) as 'so luot muon ' from phieumuon
group by masv

select * from sach
where tensach like N'%o%'

select a.tensv , a.masv , b.mapm , b.ngaymuon, b.ngaytra, sach.tensach
from sinhvien a inner join phieumuon b on a.masv = b.masv
inner join phieumuonchitiet on phieumuonchitiet.mapm = b.mapm
inner join sach on sach.masach = phieumuonchitiet.masach
group by a.tensv , a.masv , b.mapm , b.ngaymuon, b.ngaytra, sach.tensach

select sach.masach, count(phieumuonchitiet.masach) as ' so lan muon'
from sach inner join phieumuonchitiet on phieumuonchitiet.masach = sach.masach
group by sach.masach
having COUNT(phieumuonchitiet.masach) >1

update sach set giatien = giatien-giatien*0.3
where year(ngaynhapkho) <= '2019'

update phieumuon set trangthai = N'Đã Trả'
where masv = 'PD03347'

select phieumuon.mapm, ngaymuon,ngaytra , trangthai,sinhvien.tensv,sinhvien.email, 
DATEDIFF(day,phieumuon.ngaytra , GETDATE()) as ' so ngay qua han'
from phieumuon
inner join sinhvien on sinhvien.masv = phieumuon.masv
where trangthai like N'Chưa Trả'
and DATEDIFF(day,phieumuon.ngaytra, GETDATE()) >= 0

update sach set soluong = soluong + 5
where masach in (select sach.masach from sach
inner join phieumuonchitiet on phieumuonchitiet.masach =sach.masach
group by sach.masach
having COUNT(phieumuonchitiet.masach) >1)

delete phieumuon
where ngaymuon < '2022-02-05'
