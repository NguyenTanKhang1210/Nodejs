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


-- câu 2: tìm 2 nhà hàng có lượt like nhiều nhất
SELECT COUNT(res.res_id) AS 'Lượt like', res.res_name 
FROM restaurant AS res
JOIN like_res AS lr ON lr.res_id=res.res_id
GROUP BY res.res_name
ORDER BY COUNT(res.res_id) DESC
LIMIT 2

-- tạo table rate_res, food_type



CREATE TABLE rate_res (
    rate_res_id INT AUTO_INCREMENT PRIMARY KEY ,
    user_id INT,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    
    res_id INT,
    FOREIGN KEY(res_id) REFERENCES restaurant(res_id),
    amount INT,
    date_rate DATE
)

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 5, '2025-01-01'),
(2, 2, 4, '2025-01-02'),
(3, 3, 3, '2025-01-03'),
(4, 4, 5, '2025-01-04'),
(5, 5, 2, '2025-01-05'),
(6, 6, 4, '2025-01-06'),
(7, 7, 5, '2025-01-07'),
(8, 8, 3, '2025-01-08'),
(9, 9, 4, '2025-01-09'),
(10, 10, 5, '2025-01-10'),
(11, 11, 2, '2025-01-11'),
(12, 12, 5, '2025-01-12'),
(13, 13, 3, '2025-01-13'),
(14, 14, 4, '2025-01-14'),
(15, 15, 1, '2025-01-15'),
(16, 16, 5, '2025-01-16'),
(17, 17, 4, '2025-01-17'),
(18, 18, 3, '2025-01-18'),
(19, 19, 4, '2025-01-19'),
(20, 20, 5, '2025-01-20');


-- tạo table food_type
create table food_type (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(255)
)
INSERT INTO food_type (type_name) VALUES
('Italian'),
('Chinese'),
('Indian'),
('Vietnamese'),
('Mexican'),
('Japanese'),
('Korean'),
('Thai'),
('American'),
('French'),
('Mediterranean'),
('Spanish'),
('Greek'),
('Turkish'),
('Moroccan'),
('Lebanese'),
('Brazilian'),
('Cuban'),
('German'),
('Caribbean');

-- tạo table food
create table food (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(255),
    price DOUBLE,
    image VARCHAR(255),
    description TEXT,
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

INSERT INTO food (food_name, price, image, description, type_id) VALUES
('Margherita Pizza', 9.99, 'margherita.jpg', 'Classic Italian pizza with tomato, mozzarella, and basil.', 1),
('Kung Pao Chicken', 12.50, 'kungpao.jpg', 'Spicy stir-fried chicken with peanuts and vegetables.', 2),
('Butter Chicken', 13.00, 'butterchicken.jpg', 'Indian chicken curry with creamy tomato sauce.', 3),
('Pho', 8.50, 'pho.jpg', 'Vietnamese noodle soup with beef or chicken.', 4),
('Tacos', 7.99, 'tacos.jpg', 'Mexican tortilla filled with meat, cheese, and vegetables.', 5),
('Sushi Platter', 18.00, 'sushi.jpg', 'Assorted Japanese sushi with fresh fish and rice.', 6),
('Bibimbap', 10.50, 'bibimbap.jpg', 'Korean mixed rice with vegetables, meat, and egg.', 7),
('Pad Thai', 9.00, 'padthai.jpg', 'Thai stir-fried rice noodles with shrimp and peanuts.', 8),
('Cheeseburger', 8.99, 'cheeseburger.jpg', 'Classic American burger with cheese, lettuce, and tomato.', 9),
('Croissant', 2.50, 'croissant.jpg', 'French buttery, flaky pastry.', 10),
('Hummus', 4.99, 'hummus.jpg', 'Mediterranean dip made from chickpeas and tahini.', 11),
('Paella', 15.00, 'paella.jpg', 'Spanish rice dish with seafood and saffron.', 12),
('Greek Salad', 6.50, 'greeksalad.jpg', 'Salad with feta cheese, olives, and vegetables.', 13),
('Kebab', 8.00, 'kebab.jpg', 'Turkish skewered meat grilled to perfection.', 14),
('Tagine', 12.00, 'tagine.jpg', 'Moroccan slow-cooked stew with meat and vegetables.', 15),
('Baklava', 5.50, 'baklava.jpg', 'Lebanese dessert with layers of pastry, nuts, and syrup.', 16),
('Feijoada', 13.50, 'feijoada.jpg', 'Brazilian stew with black beans and pork.', 17),
('Ropa Vieja', 14.00, 'ropavieja.jpg', 'Cuban shredded beef with vegetables.', 18),
('Schnitzel', 11.99, 'schnitzel.jpg', 'German breaded and fried meat cutlet.', 19),
('Jerk Chicken', 12.00, 'jerkchicken.jpg', 'Caribbean spicy grilled chicken.', 20);


-- orders
CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES food(food_id),
	amount INT,
	code VARCHAR(10),
	arr_sub_id VARCHAR(255)
)
INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id)
VALUES
    (1, 3, 2, 'CODE001', 'SUB001'),
    (2, 5, 1, 'CODE002', 'SUB002'),
    (3, 2, 4, 'CODE003', 'SUB003'),
    (4, 7, 3, 'CODE004', 'SUB004'),
    (5, 4, 2, 'CODE005', 'SUB005'),
    (6, 1, 1, 'CODE006', 'SUB006'),
    (7, 6, 2, 'CODE007', 'SUB007'),
    (8, 3, 3, 'CODE008', 'SUB008'),
    (9, 8, 1, 'CODE009', 'SUB009'),
    (10, 5, 2, 'CODE010', 'SUB010'),
    (1, 2, 3, 'CODE011', 'SUB011'),
    (2, 4, 1, 'CODE012', 'SUB012'),
    (3, 6, 2, 'CODE013', 'SUB013'),
    (4, 8, 4, 'CODE014', 'SUB014'),
    (5, 1, 3, 'CODE015', 'SUB015'),
    (6, 5, 1, 'CODE016', 'SUB016'),
    (7, 7, 2, 'CODE017', 'SUB017'),
    (8, 3, 3, 'CODE018', 'SUB018'),
    (9, 2, 4, 'CODE019', 'SUB019'),
    (10, 6, 1, 'CODE020', 'SUB020');

-- Câu 3: Tìm người đặt nhà hàng nhiều nhất
-- kết table users và orders
SELECT COUNT(u.user_id) AS 'lượt order', u.full_name 
FROM users AS u 
JOIN orders AS o 
ON o.user_id = u.user_id 
GROUP BY u.full_name 
ORDER BY COUNT(u.user_id) DESC 
LIMIT 1

-- Câu 4: Tìm người không hoạt động
-- (tìm user không like nhà hàng, không đánh giá nhà hàng, không order)
SELECT * FROM users AS u
LEFT JOIN like_res AS lr ON u.user_id = lr.user_id
LEFT JOIN rate_res AS rr ON rr.user_id = u.user_id
LEFT JOIN orders AS o ON o.user_id = u.user_id
WHERE lr.user_id IS NULL 
AND rr.user_id IS NULL 
AND o.user_id IS NULL;



