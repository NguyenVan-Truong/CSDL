create database qlnv
use qlnv
create table phong_ban(
ma_pb char(5) primary key ,
ten_pb nvarchar(50),
ma_truongphong char(5)
);
create table nhan_vien(
id_nhanvien char(5) primary key,
ho_nv nvarchar(20),
ten_nv nvarchar(20),
nam_sinh int,
dia_chi nvarchar(200),
gioi_tinh nvarchar(10),
luong real,
phg char(5)
);
create table Du_an(
ma_da char(7) primary key,
ten_da nvarchar(200),
ngay_batdau date,
ngay_ketthuc date
);
 create table quanly_duan(
 ma_da char(7) constraint fk_qly_da foreign key references du_an(ma_da),
 ma_nhanvien char(5) constraint fk_qly_nv foreign key references nhan_vien(id_nhanvien),
 ngay_tham_gia date,
 ngay_ket_thuc date,
 so_gio int,
 vai_tro nvarchar(100),
 constraint pk_qly primary key(ma_da , ma_nhanvien)
 );
 alter table phong_ban
 add constraint fk_truongphong
 foreign key (ma_truongphong) references nhan_vien(id_nhanvien);
 alter table nhan_vien
 add constraint fk_maphong
 foreign key(phg) references phong_ban(ma_pb)

 insert into phong_ban
 values('PB001',N'Nhân Sự',null),
 ('PB002',N'Kinh Doanh',null),
 ('PB003',N'Kế Toán',null),
 ('PB004',N'Dự Án',null),
 ('PB005',N'Kế Hoạch',null)
 insert into nhan_vien
 values('NV001',N'Nguyễn',N'Tuấn', 2004 , N'Hà Nội', N'Nam', 12000000, 'PB001'),
 ('NV002',N'Lưu',N'Ban',2005,N'Thái Bình',N'Nam',13000000,'PB001'),
 ('NV003',N'Pham',N'Chỉnh',2006,N'Hà Nam',N'Nam',11000000,'PB001'),
 ('NV004',N'Vũ',N'Văn',2004,N'Hà Nội',N'Nam',10000000,'PB001'),
 ('NV005',N'Hoàng',N'Tuấn',2003,N'Hải Phòng',N'Nam',15000000,'PB001'),
 ('NV006',N'Nguyễn',N'Kiên',2001,N'Hà Nội',N'Nam',12000000,'PB004'),
 ('NV007',N'Nguyễn',N'Hoà',2000,N'Hải Phòng',N'Nữ',11000000,'PB002'),
 ('NV008',N'Vũ',N'Mai',2004,N'Hà Nội',N'Nữ',17000000,'PB002'),
 ('NV009',N'Phạm',N'Nhi',2005,N'Quảng Ninh',N'Nữ',14000000,'PB003'),
 ('NV010',N'Lê',N'Vi',2007,N'Nghệ An',N'Nữ',10000000,'PB003'),
 ('NV011',N'Nguyễn',N'Thuỷ', 2007 , N'Hà Nam', N'Nam', 12000000 ,null),
 ('NV012',N'Lê',N'Thuỷ', 2007 , N'Hà Nội', N'Nữ', 14000000 ,null)
 insert into Du_an
 values('DA_0001', N'Xây Dựng Phần Mềm Kế Toán Cho Doanh Nghiệp ABC','2022-01-05','2022-05-01'),
 ('DA_0002', N'Xây Dựng Phần Mềm Quán Lý Bán Hàng','2022-04-08','2022-06-05'),
 ('DA_0003', N'Xây Dựng Phần Mềm Chám Công Nghiệp ABC','2022-07-04','2022-09-01'),
 ('DA_0004', N'Xây Dựng website Thương Mại Điện Tử','2022-03-05','2022-05-01'),
 ('DA_0005', N'Xây Dựng Phần Mềm Quản Lý Nhân Sự','2022-06-05','2022-09-01')
 insert into quanly_duan
 values('DA_0001','NV001','2022-01-20','2022-05-01',50,N'Thành Viên'),
 ('DA_0001','NV002','2022-02-12','2022-05-01',42,N'Thành Viên'),
 ('DA_0001','NV003','2022-01-05','2022-05-01',90,N'Quản Lý'),
 ('DA_0002','NV005','2022-04-20','2022-05-01',20,N'Thành Viên'),
 ('DA_0002','NV004','2022-04-28','2022-06-01',60,N'Thành Viên'),
 ('DA_0003','NV001','2022-07-20','2022-05-01',35,N'Thành Viên'),
 ('DA_0004','NV002','2022-03-20','2022-05-01',50,N'Trợ Lý')
 select * from quanly_duan
  select*from nhan_vien
  select * from phong_ban

--dùng full or left or right để hiển thị nhân viên có phòng ban
   select * from nhan_vien
   full outer join phong_ban on nhan_vien.phg=phong_ban.ma_pb

    select * from nhan_vien
    left outer join phong_ban on nhan_vien.phg=phong_ban.ma_pb

    select * from nhan_vien
   right outer join phong_ban on nhan_vien.phg=phong_ban.ma_pb




-- tạo một bảng mới có cùng dữ liệu
   select * into nhan_vien1234 from nhan_vien
   --xoá dữ liệu bảng nhân viên
   delete from nhan_vien1234
   select* from nhan_vien1234
   insert into nhan_vien1234 select * from nhan_vien
--xoá phòng pb005 <ko có khoá ngoại mới xoá đc>
   delete from phong_ban
   where ma_pb='PB005'


   ---abcxyz--
   delete from phong_ban
   where ma_pb not in ( select phg from nhan_vien)
   -----------

-- đổi tên phòng đữ liệu của mã phòng--
   update phong_ban
   set ten_pb=N'Công Nghệ'
   where ma_pb = 'PB001'
  -- tăng lương nv lên 10% của phòng kinh doanh--
   select * from nhan_vien
   select * from phong_ban
   update nhan_vien
   set luong=luong *1.1
   where phg = (select ma_pb from phong_ban where ten_pb like 'Kinh Doanh')


   select distinct phg from nhan_vien
   --sao lưu---
