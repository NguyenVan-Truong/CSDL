create database quanlynhanvien
use quanlynhanvien
create table phong_ban (
ma_pb char(5) not null,
ten_pb nvarchar(50) null,
ma_truongphong char(8) not null
);

create table nhan_vien(
ma_nhanvien char(5) not null,
ho_nhanvien nvarchar(8) null,
ten_nhanvien nvarchar(10) null,
nam_sinh int null,
dia_chi nvarchar(20) null,
gioi_tinh nvarchar(10) null,
luong int null,
phong char(5) not null
);
create table quanlyduan(
ma_duan char(5) not null,
ma_nhanvien char(5) not null,
ngay_thamgia int null,
ngay_ketthuc int null,
so_gio int null,
vai_tro nvarchar(10) null
);
create table du_an(
ma_duan char(5) not null,
ten_duan nvarchar(10) null,
ngay_batdau int null,
ngay_ketthuc int null
);
--them cot--
alter table phong_ban
add soluong int 
alter table phong_ban
alter column soluong varchar(10)
-- xoa cot--
alter table phong_ban
drop column soluong
alter table phong_ban
add constraint kiemtra 
check(soluong>=5)
--check--
alter table nhan_vien
add constraint kiemtranv
check(luong>=100)
alter table phong_ban
add constraint pri_phongban
primary key (ma_pb)
alter table nhan_vien
add constraint pri_nhanvien
primary key (ma_nhanvien)
--khoa chinh--
alter table du_an
add constraint pri_duan
primary key (ma_duan)
--khoa ngoai--
alter table nhan_vien
add constraint khoangoai_nv
foreign key (phong)
references phong_ban(ma_pb)
--doi kieu du lieu--
alter table nhan_vien
alter column phong char(5)