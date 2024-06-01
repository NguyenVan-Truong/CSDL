use quanlydean
select * from NHANVIEN
select * from PHONGBAN
--1--
select honv+' ' +tenlot+' '+tennv as 'Họ Và Tên', year(NGSINH) 'ngay sinh'
from nhanvien 
where YEAR (NGSINH) >= 1960-1-1 and year ( NGSINH) <=1970
--2--
SELECT da.TENDEAN, pb.TENPHG, (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV), pb.NG_NHANCHUC
FROM NHANVIEN as nv, PHONGBAN as pb, DEAN as da
WHERE nv.MANV = pb.TRPHG AND pb.MAPHG = da.PHONG AND da.DDIEM_DA LIKE N'%Hà Nội'
--3--
SELECT (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV) AS 'Họ tên nhân viên', COUNT(tn.MA_NVIEN) AS 'Số lượng thân nhân'
FROM NHANVIEN as nv, THANNHAN as tn
WHERE nv.MANV = tn.MA_NVIEN
GROUP BY (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV)
--4--
SELECT da.MADA, COUNT(pc.MA_NVIEN) AS 'Số nhân viên tham gia'
FROM DEAN as da, PHANCONG as pc
WHERE da.MADA = pc.MADA
GROUP BY da.MADA
--5-
SELECT pb.TENPHG, COUNT(da.PHONG) AS 'Số lượng đề án'
FROM NHANVIEN as nv, PHONGBAN as pb, DEAN as da
WHERE nv.MANV = pb.TRPHG AND pb.MAPHG = da.PHONG
GROUP BY Pb.TENPHG
HAVING AVG(nv.LUONG) > 40000
--6--
SELECT (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV) AS 'Nhân viên có 2 thân nhân'
FROM NHANVIEN as nv, THANNHAN as tn
WHERE MANV = MA_NVIEN
GROUP BY (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV)
HAVING COUNT(*) > 2
