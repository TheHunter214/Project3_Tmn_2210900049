-- Tạo database
CREATE DATABASE quanlynuoc_TMN_2210900049;
USE quanlynuoc_TMN_2210900049;

-- Xóa bảng nếu đã tồn tại để tránh lỗi
DROP TABLE IF EXISTS TMN_ThanhToan;
DROP TABLE IF EXISTS TMN_HoaDon;
DROP TABLE IF EXISTS TMN_DongHoNuoc;
DROP TABLE IF EXISTS TMN_KhachHang;
DROP TABLE IF EXISTS TMN_NhanVien;

-- Bảng Khách Hàng
CREATE TABLE TMN_KhachHang (
    TMN_MaKhachHang INT AUTO_INCREMENT PRIMARY KEY,
    TMN_TenKhachHang VARCHAR(255) NOT NULL,
    TMN_DiaChi VARCHAR(255),
    TMN_SoDienThoai VARCHAR(15) UNIQUE NOT NULL
);
-- Bảng Nhân Viên
CREATE TABLE TMN_NhanVien (
    TMN_MaNhanVien INT AUTO_INCREMENT PRIMARY KEY,
    TMN_TenNhanVien VARCHAR(255) NOT NULL,
    TMN_ChucVu VARCHAR(100),
    TMN_SoDienThoai VARCHAR(15) UNIQUE NOT NULL
);
-- Bảng Đồng Hồ Nước
CREATE TABLE TMN_DongHoNuoc (
    TMN_MaDongHo INT AUTO_INCREMENT PRIMARY KEY,
    TMN_MaKhachHang INT,
    TMN_ViTriLapDat VARCHAR(255),
    TMN_TrangThai VARCHAR(50) DEFAULT 'Hoạt động',
    FOREIGN KEY (TMN_MaKhachHang) REFERENCES TMN_KhachHang(TMN_MaKhachHang) ON DELETE CASCADE
);
-- Bảng Hóa Đơn
CREATE TABLE TMN_HoaDon (
    TMN_MaHoaDon INT AUTO_INCREMENT PRIMARY KEY,
    TMN_MaKhachHang INT,
    TMN_MaDongHo INT,
    TMN_MaNhanVien INT,
    TMN_NgayTao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TMN_TongTien DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (TMN_MaKhachHang) REFERENCES TMN_KhachHang(TMN_MaKhachHang) ON DELETE CASCADE,
    FOREIGN KEY (TMN_MaDongHo) REFERENCES TMN_DongHoNuoc(TMN_MaDongHo) ON DELETE CASCADE,
    FOREIGN KEY (TMN_MaNhanVien) REFERENCES TMN_NhanVien(TMN_MaNhanVien) ON DELETE SET NULL
);
-- Bảng Thanh Toán
CREATE TABLE TMN_ThanhToan (
    TMN_MaThanhToan INT AUTO_INCREMENT PRIMARY KEY,
    TMN_MaHoaDon INT,
    TMN_NgayThanhToan TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TMN_HinhThucThanhToan VARCHAR(50),
    TMN_TrangThai VARCHAR(50),
    FOREIGN KEY (TMN_MaHoaDon) REFERENCES TMN_HoaDon(TMN_MaHoaDon) ON DELETE CASCADE
);

INSERT INTO TMN_KhachHang (TMN_TenKhachHang, TMN_DiaChi, TMN_SoDienThoai) VALUES
('Lê Trần Khánh Duy', 'Hà Nội', '0987654321'),
('Lê Long', 'Đông Anh', '0912345678'),
('Ngô Minh', 'Hà Đông', '0934567890');

-- Thêm dữ liệu vào bảng Nhân Viên
INSERT INTO TMN_NhanVien (TMN_TenNhanVien, TMN_ChucVu, TMN_SoDienThoai) VALUES
('Phúc', 'Nhân viên thu tiền', '0978123456'),
('Minh', 'Nhân viên lắp đặt', '0967234567');

-- Thêm dữ liệu vào bảng Đồng Hồ Nước (mỗi đồng hồ gắn với một khách hàng)
INSERT INTO TMN_DongHoNuoc (TMN_MaKhachHang, TMN_ViTriLapDat, TMN_TrangThai) VALUES
(1, 'Số 10, Đường A, Hà Nội', 'Hoạt động'),
(1, 'Số 20, Đường B, Hà Nội', 'Bảo trì'),
(2, 'Số 5, Đường C, Hồ Chí Minh', 'Hoạt động'),
(3, 'Số 15, Đường D, Đà Nẵng', 'Bảo trì');

-- Thêm dữ liệu vào bảng Hóa Đơn (mỗi hóa đơn gắn với một khách hàng, đồng hồ và nhân viên)
INSERT INTO TMN_HoaDon (TMN_MaKhachHang, TMN_MaDongHo, TMN_MaNhanVien, TMN_TongTien) VALUES
(1, 1, 1, 250000),
(1, 2, 2, 180000),
(2, 3, 1, 300000),
(3, 4, 2, 220000);
-- Thêm dữ liệu vào bảng Thanh Toán (mỗi hóa đơn có thể có nhiều thanh toán)
INSERT INTO TMN_ThanhToan (TMN_MaHoaDon, TMN_HinhThucThanhToan, TMN_TrangThai) VALUES
(1, 'Chuyển khoản', 'Đã thanh toán'),
(2, 'Tiền mặt', 'Chờ xác nhận'),
(3, 'Chuyển khoản', 'Đã thanh toán'),
(4, 'Tiền mặt', 'Đã thanh toán');

SELECT * FROM TMN_KhachHang;
SELECT * FROM TMN_DongHoNuoc;
SELECT * FROM TMN_HoaDon;
SELECT * FROM TMN_ThanhToan;
SELECT * FROM TMN_NhanVien;


