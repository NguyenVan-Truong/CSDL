create database quanlynhansu
use quanlynhansu
create table  nhanvien(
manhanvien int not null,
honhanvien varchar(20) null,
tennhanvien varchar(25) not null,
ngaysinh date,
luong real null,
phd char(5) null
);
create table xep(
maxep char(5) not null,
tenxep nvarchar(10) null,
luong int null
);
--them cot --
alter table phongban
add soluong int 
