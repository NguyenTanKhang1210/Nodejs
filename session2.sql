-- Cách 1: tạo database trực tiếp từ tablePlus
-- comment: ctrl + ?
-- Cách 2: tạo database từ code SQL
CREATE DATABASE nodejs_test
-- chạy lệnh: ctrl + enter
-- lưu ý chỉ tạo 1 lần
-- create database nodejs_temp
-- để dùng database mới tạo
USE nodejs_test
-- tạo table
-- kiểu dữ liệu: 3 loại chính
-- 1. kiểu string: varchar, text,...
-- 2. kiểu number: int, float, double 
-- 3. kiểu ngày tháng năm: date, datetime, TIMESTAMP
CREATE TABLE product (
	-- 	<tên column> <kiểu dữ liệu> <constraint>
	product_name VARCHAR(100) NOT NULL,
	image VARCHAR(255),
	price DOUBLE,
	rate INT
)

-- tạo data cho table product
INSERT INTO product (product_name, image, price, rate) VALUES
('Wireless Mouse', 'https://example.com/images/wireless_mouse.jpg', 25.99, 4),
('Bluetooth Keyboard', 'https://example.com/images/bluetooth_keyboard.jpg', 45.50, 5),
('HD Monitor 24"', 'https://example.com/images/hd_monitor_24.jpg', 149.99, 4),
('USB-C Hub', 'https://example.com/images/usb_c_hub.jpg', 29.99, 3),
('External Hard Drive 1TB', 'https://example.com/images/external_hdd_1tb.jpg', 59.99, 5),
('Gaming Headset', 'https://example.com/images/gaming_headset.jpg', 39.99, 4),
('Webcam 1080p', 'https://example.com/images/webcam_1080p.jpg', 49.99, 4),
('Laptop Stand', 'https://example.com/images/laptop_stand.jpg', 19.99, 3),
('Portable Charger 10000mAh', 'https://example.com/images/portable_charger.jpg', 22.50, 5),
('Smart LED Bulb', 'https://example.com/images/smart_led_bulb.jpg', 15.99, 4),
('Noise-Cancelling Earbuds', 'https://example.com/images/noise_cancelling_earbuds.jpg', 89.99, 5),
('Fitness Tracker', 'https://example.com/images/fitness_tracker.jpg', 55.00, 4),
('Smartwatch', 'https://example.com/images/smartwatch.jpg', 199.99, 5),
('Portable Bluetooth Speaker', 'https://example.com/images/bluetooth_speaker.jpg', 35.75, 4),
('Digital SLR Camera', 'https://example.com/images/dslr_camera.jpg', 499.99, 5),
('Wireless Charger', 'https://example.com/images/wireless_charger.jpg', 18.99, 3),
('Action Camera', 'https://example.com/images/action_camera.jpg', 129.99, 4),
('LED Desk Lamp', 'https://example.com/images/led_desk_lamp.jpg', 27.50, 4),
('Tablet 10"', 'https://example.com/images/tablet_10.jpg', 299.99, 5),
('Gaming Laptop', 'https://example.com/images/gaming_laptop.jpg', 1199.99, 5);

-- dùng code SQL để query data
SELECT * FROM product
SELECT product_name, image FROM product
SELECT product_name AS 'Tên sản phẩm' FROM product

-- AS: đổi tên column mỗi lần lấy dữ liệu
-- Lưu ý: tên column trong table vẫn giữ nguyên
-- *: lấy hết tất cả column trong table

-- tạo table users(
-- 	full_name,
-- 	email,
-- 	phone,
-- 	address, 
-- 	age
-- )

CREATE TABLE users(
	full_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	phone VARCHAR(20),
	address VARCHAR(255),
	age int
)

-- tạo data cho table users

INSERT INTO users (full_name, email, phone, address, age) VALUES
('John Doe', 'john.doe@example.com', '555-123-4567', '123 Maple Street, Springfield, IL', 28),
('Jane Smith', 'jane.smith@example.com', '555-987-6543', '456 Oak Avenue, Lincoln, NE', 34),
('Michael Johnson', 'michael.johnson@example.com', '555-234-5678', '789 Pine Road, Madison, WI', 45),
('Emily Davis', 'emily.davis@example.com', '555-345-6789', '321 Birch Lane, Austin, TX', 22),
('William Brown', 'william.brown@example.com', '555-456-7890', '654 Cedar Boulevard, Denver, CO', 37),
('Olivia Wilson', 'olivia.wilson@example.com', '555-567-8901', '987 Walnut Street, Portland, OR', 29),
('James Taylor', 'james.taylor@example.com', '555-678-9012', '159 Cherry Court, Seattle, WA', 31),
('Sophia Martinez', 'sophia.martinez@example.com', '555-789-0123', '753 Aspen Drive, Boulder, CO', 26),
('Benjamin Anderson', 'benjamin.anderson@example.com', '555-890-1234', '852 Spruce Terrace, Minneapolis, MN', 40),
('Ava Thomas', 'ava.thomas@example.com', '555-901-2345', '951 Poplar Street, Chicago, IL', 24),
('Daniel Jackson', 'daniel.jackson@example.com', '555-012-3456', '147 Elm Avenue, Columbus, OH', 38),
('Isabella White', 'isabella.white@example.com', '555-123-4568', '258 Magnolia Road, Nashville, TN', 27),
('Matthew Harris', 'matthew.harris@example.com', '555-234-5679', '369 Cypress Lane, Atlanta, GA', 33),
('Mia Clark', 'mia.clark@example.com', '555-345-6780', '741 Willow Boulevard, Miami, FL', 21),
('Alexander Lewis', 'alexander.lewis@example.com', '555-456-7891', '852 Palm Street, Tampa, FL', 36),
('Charlotte Lee', 'charlotte.lee@example.com', '555-567-8902', '963 Fir Avenue, Phoenix, AZ', 30),
('Ethan Walker', 'ethan.walker@example.com', '555-678-9013', '159 Hemlock Drive, Sacramento, CA', 25),
('Amelia Hall', 'amelia.hall@example.com', '555-789-0124', '357 Redwood Road, San Diego, CA', 23),
('Logan Young', 'logan.young@example.com', '555-890-1235', '753 Sequoia Street, Las Vegas, NV', 32),
('Harper King', 'harper.king@example.com', '555-901-2346', '951 Alder Lane, Orlando, FL', 29);

SELECT * FROM users

-- query (filter data)
-- Câu 1: liệt kê những user có tuổi từ 25-30 và sắp xếp tăng dần hoặc giảm dần
-- asc: tăng dần
-- desc: giảm dần
SELECT * FROM users
WHERE age BETWEEN 25 AND 30
ORDER BY age ASC

-- 25<age<30
SELECT * FROM users
WHERE 25 < age and age < 30
ORDER BY age DESC

-- Câu 2: tìm những người có tên là John
SELECT * FROM users
WHERE full_name LIKE '%John%'

-- %: bỏ qua kí tự
-- %John: tìm những người có chữ John ở cuối
-- VD: Emily John
-- John%:  tìm những người có chữ John ở đầu
-- %John%:  tìm những người có chữ John


-- câu 3: liệt kê những người có tuổi lớn nhất
-- B1: tìm tuổi lớn nhất trong danh sách
-- B2: query những người bằng tuổi lớn nhất
-- C1: query lồng nhau
SELECT * FROM users
WHERE age = (
	SELECT age FROM users
	ORDER BY age DESC
	LIMIT 1
)
-- C2: dùng keyword MAX + query lồng
SELECT * FROM users
WHERE age = (
	SELECT MAX(age) FROM users
)

-- câu 4: đếm số lượng users trong ds
-- => Count

SELECT COUNT(*) AS 'Tổng số user' FROM users 


-- Update data, delete data
-- => phải thêm where để update, delete data cụ thể

UPDATE users SET age = 30
WHERE full_name = 'John Doe'

-- Update list user
UPDATE users SET age = 30
WHERE full_name IN ('John Doe','Jane Smith')

-- delete user
DELETE FROM users
WHERE full_name = 'Jane Smith'
-- => hard delete

-- sofl delete
-- is_delete hoặc delete_at để show hoặc hidden
--data
SELECT * FROM users


-- update table
-- case1: thêm column mới
ALTER TABLE users 
ADD COLUMN gender INT DEFAULT 1

SELECT * FROM users
-- case2: update datatype cho column
ALTER TABLE users
MODIFY COLUMN full_name VARCHAR(100) NOT NULL

-- tổng kết:
-- khái niệm cơ bản cơ sở dữ liệu
-- cách tạo database, table, data
-- query data, filter data, update, delete data
-- update table
