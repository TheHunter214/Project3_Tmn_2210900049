-- Tạo database
CREATE DATABASE quanlynuoc_TMN_2210900049;
USE quanlynuoc_TMN_2210900049;

-- Tạo bảng KhachHang
CREATE TABLE TMN_KhachHang (
    TMN_MaKhachHang INT AUTO_INCREMENT PRIMARY KEY,
    TMN_HoTen VARCHAR(100) NOT NULL,
    TMN_DiaChi VARCHAR(255),
    TMN_SoDienThoai VARCHAR(15) UNIQUE,
    TMN_Email VARCHAR(100) UNIQUE,
    TMN_NgayDangKy DATE
);

-- Tạo bảng DongHoNuoc
CREATE TABLE TMN_DongHoNuoc (
    TMN_MaDongHo INT AUTO_INCREMENT PRIMARY KEY,
    TMN_MaKhachHang INT,
    TMN_LoaiDongHo VARCHAR(50),
    TMN_ChiSoDau INT,
    TMN_ChiSoCuoi INT,
    FOREIGN KEY (TMN_MaKhachHang) REFERENCES TMN_KhachHang(TMN_MaKhachHang) ON DELETE CASCADE
);

-- Tạo bảng HoaDon
CREATE TABLE TMN_HoaDon (
    TMN_MaHoaDon INT AUTO_INCREMENT PRIMARY KEY,
    TMN_MaDongHo INT,
    TMN_NgayTao DATE,
    TMN_SoTien DOUBLE,
    TMN_TrangThai VARCHAR(50),
    FOREIGN KEY (TMN_MaDongHo) REFERENCES TMN_DongHoNuoc(TMN_MaDongHo) ON DELETE CASCADE
);

-- Tạo bảng ThanhToan
CREATE TABLE TMN_ThanhToan (
    TMN_MaThanhToan INT AUTO_INCREMENT PRIMARY KEY,
    TMN_MaHoaDon INT,
    TMN_HinhThucThanhToan VARCHAR(50),
    TMN_NgayThanhToan DATE,
    TMN_SoTienDaThanhToan DOUBLE,
    FOREIGN KEY (TMN_MaHoaDon) REFERENCES TMN_HoaDon(TMN_MaHoaDon) ON DELETE CASCADE
);

-- Tạo bảng NhanVien
CREATE TABLE TMN_NhanVien (
    TMN_MaNhanVien INT AUTO_INCREMENT PRIMARY KEY,
    TMN_HoTen VARCHAR(100),
    TMN_ChucVu VARCHAR(50),
    TMN_SoDienThoai VARCHAR(15) UNIQUE,
    TMN_Email VARCHAR(100) UNIQUE
);
SHOW TABLES;
SELECT * FROM TMN_KhachHang;
SELECT * FROM TMN_DongHoNuoc;
SELECT * FROM TMN_HoaDon;
SELECT * FROM TMN_ThanhToan;
SELECT * FROM TMN_NhanVien;


INSERT INTO TMN_KhachHang (TMN_HoTen, TMN_DiaChi, TMN_SoDienThoai, TMN_Email, TMN_NgayDangKy)
VALUES 
('Ngô Hoàng Minh', 'Hà Đông', '0123456789', 'minh@gmail.com', '2025-02-20'),
('Lê Hoàng Long', 'Đông Anh', '0987654321', 'longle@gmail.com', '2025-02-21'),
('Trần Minh Nam', 'Ba Đình', '0345678912', 'nam@gmail.com', '2025-02-22');

INSERT INTO TMN_DongHoNuoc (TMN_MaKhachHang, TMN_LoaiDongHo, TMN_ChiSoDau, TMN_ChiSoCuoi)
VALUES 
(1, 'Loại A', 100, 150),
(2, 'Loại B', 200, 250),
(3, 'Loại C', 300, 350);


INSERT INTO TMN_HoaDon (TMN_MaDongHo, TMN_NgayTao, TMN_SoTien, TMN_TrangThai)
VALUES 
(1, '2025-02-25', 500000, 'Chưa Thanh Toán'),
(2, '2025-02-26', 700000, 'Đã Thanh Toán'),
(3, '2025-02-27', 900000, 'Chưa Thanh Toán');


INSERT INTO TMN_ThanhToan (TMN_MaHoaDon, TMN_HinhThucThanhToan, TMN_NgayThanhToan, TMN_SoTienDaThanhToan)
VALUES 
(2, 'Tiền Mặt', '2025-02-26', 700000),
(3, 'Chuyển Khoản', '2025-02-28', 900000);


INSERT INTO TMN_NhanVien (TMN_HoTen, TMN_ChucVu, TMN_SoDienThoai, TMN_Email)
VALUES 
('Phúc Du', 'Nhân viên thu tiền', '0901234567', 'phucdu@gmail.com'),
('LongKa', 'Nhân viên quản lý', '0981234567', 'long@gmail.com');

