use quanlydean
--in ra các bảng-- 
select * from CONGVIEC
select * from DEAN
select * from NHANVIEN
select * from DIADIEM_PHG
select * from PHANCONG
select * from PHONGBAN
select * from THANNHAN
-- in ra các cột của bảng--
select manv,tennv
from NHANVIEN
select mada , phong
from DEAN
--giúp đổi tên cột hiển thị--
select maphg as 'ma phong', tenphg as 'ten phong' from PHONGBAN
--nối các cột với nhau--
select manv as 'mã nhân viên',honv +' '+ tenlot+' '+tennv as 'họ và tên' from NHANVIEN
--in ra họ nhân viên--
select honv from NHANVIEN
--loại bỏ những hàng trùng nhau--
select distinct honv from NHANVIEN
--in ra nhưng hàng đầu mình cần--
-- 20 là phần trăm của bảng--
select top 20 percent * from NHANVIEN
select top 50 percent * from NHANVIEN
-- in ra các người >5--
select * from NHANVIEN
where luong >=40000
select * from NHANVIEN
where luong >=30000
-- tìm những người là nam--
select * from NHANVIEN
where phai = N'Nam'
-- tìm những cùng địa chỉ --
select * from NHANVIEN
where DCHI like N'% tp hcm'
--hiện thị lương cao nhất--
select luong from NHANVIEN
select max(luong) from nhanvien
-- hiển thị lương nhỏ nhất--
select min(luong) from NHANVIEN
-- hiển thị trung bình của cột--
select AVG(luong) from NHANVIEN
-- hiện thị hàm đếm
select COUNT(luong) from NHANVIEN
--hiển thị lương nhân viên của phòng 801--
select avg(luong) from NHANVIEN
where PHG=4
--hiện thị số lượng dự án ở hà nội--
select * from DEAN
select COUNT(ddiem_da) from DEAN
where DDIEM_DA = N'Hà Nội'
--đếm số lượng nhân viên trong mỗi phòng --
select count(*)as 'số Lượng',phg as'Mã phòng ban' from NHANVIEN group by PHG
-- đếm số lượng nhân viên trong mỗi phòng trên 4
select count(*)as 'số Lượng',phg as'Mã phòng ban' from NHANVIEN group by PHG having COUNT(*) >=4
--lấy số lương cao nhất các phòng có nhân viên là nữ--
select phg as 'mã phòng ' ,max(luong) as 'lương cao nhất'
from NHANVIEN  
where phai = N'nữ' 
group by PHG
having max(luong) > 40000
--tinh luong trung bình của các phòng--
select phg as 'mã phòng ' ,avg(luong) as 'lương trung bình'
from NHANVIEN   
group by PHG
--tính tổng lương--
select phg as 'mã phòng ' ,sum(luong) as 'Tổng lương'
from NHANVIEN   
group by PHG
having sum(luong) > 50000
--tính tổng lương công ti trả lương cho mỗi phòng ban ' chỉ tính nhân viên > 30000 ' và hiển thị lương tổng > 60000--
select phg as 'mã Phòng' , sum(luong) as 'tổng lương'
from NHANVIEN
where luong >30000
group by phg 
having sum(luong) >60000
-- sắp xép kết quả tăng dần--
select * from NHANVIEN
order by MANV
-- sắp xép kết quả giảm dần--
select * from NHANVIEN
order by MANV desc

--vd--
select phg as 'mã phòng' , avg(luong) as ' trung bình lương'
from NHANVIEN
where luong >=30000
group by PHG
having avg(luong) >=35000
order by PHG desc
------truy vấn với nhiểu bẳng-----
-- xuất hiện tên cột trùng nhau--
--nối 2 bảng vs nhau---
select * from NHANVIEN
select * from PHONGBAN
select nv.honv+' ' +nv.tenlot+' '+nv.tennv as 'Họ Và Tên',pb.tenphg as 'phòng làm việc'
from nhanvien as nv , phongban as pb
where nv.phg = pb.MAPHG 
--nối với 3 bảng--
select *from DEAN
select * from NHANVIEN
select * from PHANCONG
select nv.honv+' ' +nv.tenlot+' '+nv.tennv as 'Họ Và Tên',mda.tendean as 'tên đề án Tham gia'
from nhanvien as nv , DEAN as mda, PHANCONG as pc
where nv.MANV = pc.MA_NVIEN and mda.MADA = pc.MADA

-- dùng join để nối bảng--
select nv.honv+' '+nv.tennv as 'Họ Và Tên',
pb.tenphg as 'phòng làm việc'
from PHONGBAN pb inner join NHANVIEN nv
on pb.maphg = nv.phg
--
select nv.honv+' ' +nv.tenlot+' '+nv.tennv as 'Họ Và Tên',da.tendean as 'tên đề án Tham gia'
from nhanvien nv inner join PHANCONG pc
on nv.manv = pc.MA_NVIEN inner join DEAN da on pc.MADA=da.MADA
--truy vấn con --
select * from NHANVIEN
where LUONG > (select AVG(luong) from NHANVIEN)




select * from PHONGBAN
select * from NHANVIEN
where PHG in ( select maphg from PHONGBAN where TENPHG like N'%ê%')
