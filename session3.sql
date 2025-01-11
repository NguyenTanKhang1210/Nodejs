-- session 3:
-- khóa chính, khóa ngoại
-- relationship giữa các table

-- tạo table users
-- + Tên table ko dc trùng với keyword của SQL
-- + Nếu tên table mà có 2 từ trở lên thì cách nhau bởi dấu gạch dưới _
-- + Tên table viết theo kiểu snake case 
-- (snake case: nguoi_dung)
-- (camel case: nguoiDung)
-- + Ký tự đầu tiên ko dc phép là số
CREATE TABLE userss(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(255) NOT NULL,
	full_name VARCHAR(255) NOT NULL,
	age INT
	
)

-- tạo data
INSERT INTO userss(email, full_name, age) VALUES
('user1@example.com', 'User One', 25),
('user2@example.com', 'User Two', 30),
('user3@example.com', 'User Three', 22)


SELECT * FROM userss

DELETE FROM userss WHERE user_id=3

INSERT INTO userss(email, full_name, age) VALUES
('user4@example.com', 'User Four', 28);

-- => user_id là 4, ko phải 3


-- khóa ngoại (foreign key)
-- table product 
CREATE TABLE products(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(255) NOT NULL,
	price DOUBLE, 
	description TEXT
)

-- table orders
CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	
	user_id INT,
	-- gán column user_id làm khóa ngoại
	-- và column này sẽ tham chiều tới column
	-- user_id(primary key) của table users
	FOREIGN KEY(user_id) REFERENCES userss(user_id),
	
	-- muốn lấy thông tin sp
	-- => chỉ cần truyền khóa chính của sản phẩm
	product_id INT,
	FOREIGN KEY(product_id) REFERENCES
	products(product_id)
)

-- lưu ý về khóa ngoại
-- được phép có giá trị null
-- có thể trùng giá trị của khóa ngoại


-- tạo table videos
CREATE TABLE videos(
	video_id INT PRIMARY KEY AUTO_INCREMENT,
	video_name VARCHAR(255) NOT NULL,
	duration INT,
	
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES userss(user_id)
)

INSERT INTO videos(video_name, duration, user_id)
VALUES
('Learning Python Basics', 180, 2),
('JavaScript for Beginners', 240, 2),
('Mastering React', 300, 2);

-- query table (có kết bảng)
SELECT * FROM userss
JOIN videos ON userss.user_id = videos.user_id

-- tạo database cho web app food
-- tạo table users
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
)

INSERT INTO users (full_name, email, password) VALUES
('User 1', 'user1@example.com', 'password1'),
('User 2', 'user2@example.com', 'password2'),
('User 3', 'user3@example.com', 'password3'),
('User 4', 'user4@example.com', 'password4'),
('User 5', 'user5@example.com', 'password5'),
('User 6', 'user6@example.com', 'password6'),
('User 7', 'user7@example.com', 'password7'),
('User 8', 'user8@example.com', 'password8'),
('User 9', 'user9@example.com', 'password9'),
('User 10', 'user10@example.com', 'password10'),
('User 11', 'user11@example.com', 'password11'),
('User 12', 'user12@example.com', 'password12'),
('User 13', 'user13@example.com', 'password13'),
('User 14', 'user14@example.com', 'password14'),
('User 15', 'user15@example.com', 'password15'),
('User 16', 'user16@example.com', 'password16'),
('User 17', 'user17@example.com', 'password17'),
('User 18', 'user18@example.com', 'password18'),
('User 19', 'user19@example.com', 'password19'),
('User 20', 'user20@example.com', 'password20');


CREATE TABLE restaurant (
    res_id INT AUTO_INCREMENT PRIMARY KEY,
    res_name VARCHAR(255),
    image VARCHAR(255),
    description VARCHAR(255)
)
INSERT INTO restaurant (res_name, image, description) VALUES
('Restaurant 1', 'https://example.com/images/restaurant1.jpg', 'Description of Restaurant 1'),
('Restaurant 2', 'https://example.com/images/restaurant2.jpg', 'Description of Restaurant 2'),
('Restaurant 3', 'https://example.com/images/restaurant3.jpg', 'Description of Restaurant 3'),
('Restaurant 4', 'https://example.com/images/restaurant4.jpg', 'Description of Restaurant 4'),
('Restaurant 5', 'https://example.com/images/restaurant5.jpg', 'Description of Restaurant 5'),
('Restaurant 6', 'https://example.com/images/restaurant6.jpg', 'Description of Restaurant 6'),
('Restaurant 7', 'https://example.com/images/restaurant7.jpg', 'Description of Restaurant 7'),
('Restaurant 8', 'https://example.com/images/restaurant8.jpg', 'Description of Restaurant 8'),
('Restaurant 9', 'https://example.com/images/restaurant9.jpg', 'Description of Restaurant 9'),
('Restaurant 10', 'https://example.com/images/restaurant10.jpg', 'Description of Restaurant 10'),
('Restaurant 11', 'https://example.com/images/restaurant11.jpg', 'Description of Restaurant 11'),
('Restaurant 12', 'https://example.com/images/restaurant12.jpg', 'Description of Restaurant 12'),
('Restaurant 13', 'https://example.com/images/restaurant13.jpg', 'Description of Restaurant 13'),
('Restaurant 14', 'https://example.com/images/restaurant14.jpg', 'Description of Restaurant 14'),
('Restaurant 15', 'https://example.com/images/restaurant15.jpg', 'Description of Restaurant 15'),
('Restaurant 16', 'https://example.com/images/restaurant16.jpg', 'Description of Restaurant 16'),
('Restaurant 17', 'https://example.com/images/restaurant17.jpg', 'Description of Restaurant 17'),
('Restaurant 18', 'https://example.com/images/restaurant18.jpg', 'Description of Restaurant 18'),
('Restaurant 19', 'https://example.com/images/restaurant19.jpg', 'Description of Restaurant 19'),
('Restaurant 20', 'https://example.com/images/restaurant20.jpg', 'Description of Restaurant 20');


CREATE TABLE like_res (
	like_res_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    
    res_id INT,
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id),
    
    date_like DATETIME
);
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 2, '2025-01-01 10:00:00'),
(1, 4, '2025-01-02 12:30:00'),
(2, 1, '2025-01-03 14:00:00'),
(2, 3, '2025-01-04 16:45:00'),
(3, 5, '2025-01-05 09:15:00'),
(3, 2, '2025-01-06 11:20:00'),
(4, 6, '2025-01-07 14:50:00'),
(4, 3, '2025-01-08 08:00:00'),
(5, 4, '2025-01-09 18:30:00'),
(5, 7, '2025-01-10 19:00:00'),
(6, 8, '2025-01-11 20:15:00'),
(7, 9, '2025-01-12 13:45:00'),
(8, 10, '2025-01-13 07:30:00'),
(9, 5, '2025-01-14 15:10:00'),
(10, 1, '2025-01-15 11:40:00');

-- 1. Tìm 5 ng like nhà hàng nhiều nhất
-- B1: tìm table để kết bảng
-- users, like_res
-- để đếm số lượng like 
-- dùng 1 số hàm tổng hợp => COUNT
SELECT COUNT(u.user_id) AS 'Số lượng like', u.user_id 
FROM users AS u
JOIN like_res AS lr ON  u.user_id = lr.user_id
GROUP BY u.user_id
ORDER BY COUNT(u.user_id) DESC
LIMIT 5





