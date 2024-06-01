create database quanlysinhvien
use quanlysinhvien
create table sinhvien(
masv char(5) not null,
ngaysinh int null,
gioitinh nvarchar(10) null,
hoten nvarchar(10) null,
malop char(5) not null 
);
create table lophoc(
malop char(5) not null,
tenlop nvarchar(10) null,
nienkhoa int null
);
create table monhoc(
maMH char(5) not null,
tenMH nvarchar(10) null,
sotiet int null
);
create table dangky(
masv char(5) not null,
maMH char(5) not null,
sodiem int null
);
alter table monhoc
add constraint kiemtra 
check(sotiet>0)
alter table dangky
add constraint kT 
check(sodiem>0 and sodiem<10)
alter table sinhvien
add constraint pri_sinhvien
primary key (masv)
alter table lophoc
add constraint pri_lophoc
primary key (malop)
alter table monhoc
add constraint pri_monhoc
primary key (maMH)
alter table dangky
add constraint pri_dangky
primary key (masv)
alter table dangky
drop constraint pri_dangky
alter table dangky
add constraint pri_dangky
primary key (masv,maMH)
alter table sinhvien
add constraint khoangoai_sv
foreign key (malop)
references lophoc(malop)
alter table dangky
add constraint khoangoai_dangky
foreign key (masv)
references sinhvien(masv)
alter table dangky
add constraint khoangoai_dy
foreign key (maMH)
references monhoc(maMH)
