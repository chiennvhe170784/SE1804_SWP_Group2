--note: Đổi password của user thành max để có thể change toSHA1
USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'ClothesShop')
BEGIN
	ALTER DATABASE [ClothesShop] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [ClothesShop] SET ONLINE;
	DROP DATABASE [ClothesShop];
END

GO

CREATE DATABASE [ClothesShop]
GO
USE  [ClothesShop]
GO
-- Tạo bảng Brand
CREATE TABLE Brand (
  bid INT identity(1,1) PRIMARY KEY,
  name NVARCHAR(50) NOT NULL
);

-- Tạo bảng Role
CREATE TABLE Role (
  rid INT PRIMARY KEY,
  role VARCHAR(50) NOT NULL
);

-- Tạo bảng User
CREATE TABLE [User] (
  uid INT  identity(1,1) PRIMARY KEY,
  fullName NVARCHAR(50) NOT NULL,
  phone VARCHAR(10) NOT NULL,
  address NVARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  username VARCHAR(20) NOT NULL,
  password VARCHAR(max) NOT NULL,
  dob DATE NOT NULL,
  gender int NOT NULL,
  rid INT NOT NULL default 0,
  active int not null default 1,
  FOREIGN KEY (rid) REFERENCES Role(rid)
);

create table wallet(
uid int primary key,
wallet float default 0.0,
FOREIGN KEY (uid) REFERENCES [User](uid),
)



---- Tạo bảng Cart
--CREATE TABLE Cart (
--  cartId INT PRIMARY KEY,
--  pid INT NOT NULL,
--  uid INT NOT NULL,
--  FOREIGN KEY (uid) REFERENCES [User](uid)
--);



-- Tạo bảng Category
CREATE TABLE Category (
  cid INT PRIMARY KEY identity(1,1),
  name NVARCHAR(50) NOT NULL
);


-- Tạo bảng Gender
CREATE TABLE Gender (
  gid INT PRIMARY KEY,
  description VARCHAR(10) NOT NULL
);

-- Tạo bảng Product
CREATE TABLE Product (
  pid INT identity(1,1) PRIMARY KEY,
  name NVARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  price INT NOT NULL,
  describe NVARCHAR(250),
  img VARCHAR(100) NOT NULL,
  releaseDate DATETIME NOT NULL,
  cid INT NOT NULL,
  bid INT NOT NULL,
  gid INT NOT NULL,
  FOREIGN KEY (cid) REFERENCES Category(cid),
  FOREIGN KEY (bid) REFERENCES Brand(bid),
  FOREIGN KEY (gid) REFERENCES Gender(gid),

);

--bang collection
 create table [collection](
 uid int,
 pid int,
 primary key (uid, pid),
 FOREIGN KEY (uid) REFERENCES [User](uid),
 FOREIGN KEY (pid) REFERENCES [Product](pid),
 )

-- Tạo bảng Color
CREATE TABLE Color (
  coid INT  PRIMARY KEY,
  name NVARCHAR(50) NOT NULL,
    pid INT NOT NULL,
    FOREIGN KEY (pid) REFERENCES Product(pid),
);

-- Tạo bảng Cart_Product
--CREATE TABLE Cart_Product (
--  cartid INT NOT NULL,
--  pid INT NOT NULL,
--  quantity INT,
--  PRIMARY KEY (cartid, pid),
--  FOREIGN KEY (cartid) REFERENCES Cart(cartId),
--  FOREIGN KEY (pid) REFERENCES Product(pid)
--);

-- Tạo bảng Order
CREATE TABLE [Order] (
  oid INT identity(1,1) PRIMARY KEY,
  orderDate DATE NOT NULL,
  totalPrice INT NOT NULL,
  address NVARCHAR(100) NOT NULL,
  status BIT NOT NULL default 0,
  note nvarchar(100),
  uid INT NOT NULL,
  FOREIGN KEY (uid) REFERENCES [User](uid)
);



-- Tạo bảng Feedback
CREATE TABLE Feedback (
  fid INT PRIMARY KEY,
  description NVARCHAR(100) NOT NULL,
  oid INT NOT NULL,
  feedbackDate DATETIME NOT NULL,
  FOREIGN KEY (oid) REFERENCES [Order](oid)
);



-- Tạo bảng News
CREATE TABLE News (
  nid INT identity(1,1) PRIMARY KEY,
  title NVARCHAR(50) NOT NULL,
  description NVARCHAR(max) NOT NULL,
  uid INT NOT NULL,
  status bit not null,
  updateDate datetime not null,
  FOREIGN KEY (uid) REFERENCES [User](uid)
);

-- Tạo bảng Size
CREATE TABLE Size (
  sid INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description NVARCHAR(100) NOT NULL,
  gid int,
  foreign key (gid) references Gender(gid)
);


-- Tạo bảng Product_Size
CREATE TABLE Product_Size (
  sid INT NOT NULL,
  pid INT NOT NULL,
  PRIMARY KEY (sid, pid),
  FOREIGN KEY (pid) REFERENCES Product(pid),
  FOREIGN KEY (sid) REFERENCES Size(sid)
);

-- Tạo bảng Response
CREATE TABLE Response (
  rpid INT PRIMARY KEY,
  description NVARCHAR(200) NOT NULL,
  fid INT NOT NULL,
  uid INT NOT NULL,
  responseDate DATETIME NOT NULL,
  FOREIGN KEY (fid) REFERENCES Feedback(fid),
  FOREIGN KEY (uid) REFERENCES [User](uid)
);
Create table OrderDetail(
oid int,
pid int,
numP int,
FOREIGN KEY (oid) REFERENCES [Order](oid)
)



-- Insert into Brand
INSERT INTO Brand ( name) VALUES 
(N'Louis Vuitton'),
(N'Dior'),
(N'Blue Exchange'),
(N'Gucci'),
(N'Prada'),
(N'Burberry'),
(N'Ralph Lauren'),
(N'Vans'),
(N'Zara'),
(N'Calvin Klein'),
(N'Tommy Hilfiger'),
(N'Ralph Lauren'),
(N'Balenciaga'),
(N'Gap');

GO

---- Insert into Role
INSERT INTO Role (rid, role) VALUES 
(0, 'Customer'),
(1, 'Admin'),
(2, 'Staff');
-- Insert into User
INSERT INTO [User] (fullName, phone, address, email, username, password, dob, gender, rid, active) VALUES 
(N'Nguyễn Văn Chung', '0123456789', '123 Nguyen Trai', 'nguyenvana@gmail.com', 'user4', '1BvTL8F1vT5msPyDEcEhPR4m8po=', '1985-05-15', 1, 0, 0),
(N'Nguyễn Văn Ba', '0987654321', '45 Bac Tu Liem', 'nguyenvanb@gmail.com', 'user5', '1BvTL8F1vT5msPyDEcEhPR4m8po=', '1990-08-25', 2, 0, 1),
(N'Nguyễn Văn C', '0231231234', '789 Lien Nghia', 'nguyenvanc@gmail.com', 'staff', '1BvTL8F1vT5msPyDEcEhPR4m8po=', '1992-07-30', 2, 2, 1),
(N'Nguyễn Thi Dung', '0564564567', '101 Bac Ninh', 'nguyenvand@gmail.com', 'user', '1BvTL8F1vT5msPyDEcEhPR4m8po=', '1988-12-10', 1, 0, 1),
(N'Nguyễn Văn Quang', '0897897890', '202 Ha Noi', 'nguyenvane@gmail.com', 'user1', '1BvTL8F1vT5msPyDEcEhPR4m8po=', '1995-03-05', 1, 0, 1),
(N'Nguyễn Văn Pa', '0213213210', '303 Tay Nguyen', 'nguyenvanf@gmail.com', 'user2', '1BvTL8F1vT5msPyDEcEhPR4m8po=', '1983-09-22', 2, 0, 1),
(N'Nguyễn Văn Gsa', '0546546543', '404 Ben Tre', 'nguyenvang@gmail.com', 'staff1', '1BvTL8F1vT5msPyDEcEhPR4m8po=', '1989-11-17', 1, 2, 1),
(N'Nguyễn Văn Hoàng', '0879879876', '505 Ho Chi Minh', 'nguyenvanh@gmail.com', 'staff2', '1BvTL8F1vT5msPyDEcEhPR4m8po=', '1991-04-12', 2, 2, 1),
(N'Đinh Văn Duy', '0471471478', '606 Hai Ba Trung', 'nguyenvani@gmail.com', 'user3', '1BvTL8F1vT5msPyDEcEhPR4m8po=', '1993-01-01', 1, 2, 1),
(N'Nguyễn Văn Kiên', '0582582589', '707 Hai Duong', 'nguyenvani@gmail.com', 'admin1', '1BvTL8F1vT5msPyDEcEhPR4m8po=', '1987-06-19', 2, 1, 1),
(N'Chienn', '0999999999', '123 Hung Yen', 'chien19042003@gmail.com', 'admin', '1BvTL8F1vT5msPyDEcEhPR4m8po=', '2003-04-19', 1, 1, 1);




---- Insert into Cart
--INSERT INTO Cart (cartId, pid, uid) VALUES 
--(1, 1, 1),
--(2, 2, 2),
--(3, 3, 3),
--(4, 4, 4),
--(5, 5, 5),
--(6, 6, 6),
--(7, 7, 7),
--(8, 8, 8),
--(9, 9, 9),
--(10, 10, 10);

-- Insert into Category
INSERT INTO Category ( name) VALUES 
( 'coat'),
('dress'),
('hoodie'),
( 'jeans'),
( 'jogger'),
( 'short'),
( 'shirt'),
( 'sweater'),
( 'T_shirt');

-- Insert into Gender
INSERT INTO Gender (gid, description) VALUES 
(1, 'Male'),
(2, 'Female'),
(3,'Other');




-- Insert into Order
INSERT INTO [Order] (orderDate, totalPrice, address, status,note , uid) VALUES 
( '2023-01-01', 240, '123 Main St', 1, 'gui di', 1),
( '2023-02-02', 180, '456 Elm St', 0, 'gui di', 2),
('2023-03-03', 270, '789 Oak St', 1, 'gui di', 3),
( '2023-04-04', 110, '101 Pine St', 0, 'gui di', 4),
('2023-05-05', 300, '202 Maple St', 1, 'gui di', 5),
('2023-06-06', 303, '303 Birch St', 1, 'gui di', 6),
( '2023-07-07', 520, '404 Cedar St', 0, 'gui di', 7),
( '2023-08-08', 150, '505 Walnut St', 1, 'gui di', 8),
( '2023-09-09', 80, '606 Chestnut St', 1, 'gui di', 9),
( '2023-10-10', 225, '707 Willow St', 0, 'gui di', 10),
( '2023-01-01', 240, '123 Main St', 1, 'gui di', 1),
( '2023-02-02', 180, '456 Elm St', 0, 'gui di', 2),
('2023-03-03', 270, '789 Oak St', 1, 'gui di', 3),
( '2023-04-04', 110, '101 Pine St', 0, 'gui di', 4),
('2023-05-05', 300, '202 Maple St', 1, 'gui di', 5),
('2023-06-06', 303, '303 Birch St', 1, 'gui di', 6),
( '2023-05-07', 520, '404 Cedar St', 0, 'gui di', 7),
( '2023-08-08', 150, '505 Walnut St', 1, 'gui di', 8),
( '2023-02-09', 80, '606 Chestnut St', 1, 'gui di', 9),
( '2023-1-10', 225, '707 Willow St', 0, 'gui di', 10);



-- Insert into Feedback
INSERT INTO Feedback (fid, description, oid, feedbackDate) VALUES 
(1, 'Great product!', 1, '2023-06-05'),
(2, 'Not satisfied with the quality', 2, '2023-06-06'),
(3, 'Fast delivery!', 3, '2023-06-07'),
(4, 'Excellent customer service', 4, '2023-06-08'),
(5, 'Would buy again', 5, '2023-06-09'),
(6, 'Highly recommend', 6, '2023-06-10'),
(7, 'Product as described', 7, '2023-06-11'),
(8, 'Very comfortable', 8, '2023-06-12'),
(9, 'Good value for money', 9, '2023-06-13'),
(10, 'Just okay', 10, '2023-06-14');



-- Insert into Response
INSERT INTO Response (rpid, description, fid, uid, responseDate) VALUES 
(1, 'Thank you for your feedback!', 1, 1, '2023-06-15'),
(2, 'We are sorry to hear that.', 2, 2, '2023-06-16'),
(3, 'Glad you liked it!', 3, 3, '2023-06-17'),
(4, 'Thank you for your kind words.', 4, 4, '2023-06-18'),
(5, 'We appreciate your support.', 5, 5, '2023-06-19'),
(6, 'Thanks for the recommendation!', 6, 6, '2023-06-20'),
(7, 'Happy to hear that!', 7, 7, '2023-06-21'),
(8, 'Thank you for the feedback.', 8, 8, '2023-06-22'),
(9, 'Great to hear you liked it.', 9, 9, '2023-06-23'),
(10, 'We will strive to improve.', 10, 10, '2023-06-24');
go





INSERT [dbo].[Category] ( [name]) VALUES ( N'T-shirts')
INSERT [dbo].[Category] ( [name]) VALUES ( N'sweater')
INSERT [dbo].[Category] ( [name]) VALUES ( N'short')
INSERT [dbo].[Category] ( [name]) VALUES ( N'shirt')
INSERT [dbo].[Category] ( [name]) VALUES ( N'jogger')
INSERT [dbo].[Category] ( [name]) VALUES ( N'jeans')
INSERT [dbo].[Category] ( [name]) VALUES ( N'hoodie')
INSERT [dbo].[Category] ( [name]) VALUES ( N'dress')
INSERT [dbo].[Category] ( [name]) VALUES ( N'coat')

GO


INSERT INTO Product
([name], [quantity], [price], [describe], [img], [releaseDate], [cid], [bid], [gid])
VALUES
(N'Basic T-shirt', 50, 200, N'High quality basic T-shirt', N'assets/image_swp/T_shirt/phong_cotron.jpg', CAST(N'2024-06-27' AS DateTime), 1, 11, 1),
(N'V-neck T-shirt', 30, 150, N'Comfortable V-neck T-shirt', N'assets/image_swp/T_shirt/phong_local.jpg', CAST(N'2024-07-26' AS DateTime), 1, 12, 2),
(N'Luxury Kitchen Item', 20, 300, N'Luxury kitchen item with advanced features', N'assets/image_swp/T_shirt/phong_namnu.jpg', CAST(N'2024-08-25T12:00:00.000' AS DateTime), 1, 13, 1),
(N'Basic Book', 10, 100, N'Introduction to basic concepts', N'assets/image_swp/T_shirt/phong_nu.jpg', CAST(N'2024-09-24T13:00:00.000' AS DateTime), 1, 10, 2),
(N'Best Seller Toy', 60, 250, N'Highly popular toy among children', N'assets/image_swp/T_shirt/phong_oversize.jpg', CAST(N'2023-05-23T14:00:00.000' AS DateTime), 1, 10, 2),
(N'Popular Electronic Choice', 40, 180, N'Widely chosen electronic device for its features', N'assets/image_swp/T_shirt/phong_simon.jpg', CAST(N'2022-05-22T15:00:00.000' AS DateTime), 1, 11, 1),

(N'Rugged Rips Slim Fit', 25, 220, N'Highly recommended clothing', N'assets/image_swp/sweater/lencaoco.jpg', CAST(N'2021-05-21T16:00:00.000' AS DateTime), 2, 12, 1),
(N'Striped Sophistication Blouse', 35, 170, N'Customer favorite kitchen item', N'assets/image_swp/sweater/lennam.jpg', CAST(N'2024-05-10T17:00:00.000' AS DateTime), 2, 13, 2),
(N'Scarlet Seduction Cocktail Dress', 15, 350, N'Exclusive book', N'assets/image_swp/sweater/lennam_merino.jpg', CAST(N'2024-05-19T18:00:00.000' AS DateTime), 2, 10, 2),
(N'Linen Leisure Shorts', 45, 130, N'Value for money toy', N'assets/image_swp/sweater/lennu_daitay.jpg', CAST(N'2024-05-18T18:00:00.000' AS DateTime), 2, 10, 1),
(N'Floral Bliss Tee', 93, 53, N'3', N'assets/image_swp/sweater/lennu_hanquoc.jpg', CAST(N'2023-05-28T00:00:00.000' AS DateTime), 2, 11, 2),

(N'Jean Shorts', 113, 34, N' Comfortable jean shorts for casual wear.', N'assets/image_swp/short/1.jpg', CAST(N'2023-05-28T00:00:00.000' AS DateTime), 3, 1, 2),
(N'Sport Shorts', 23, 33, N'Lightweight sport shorts suitable for active lifestyles.', N'assets/image_swp/short/2.jpg', CAST(N'2022-05-28T00:00:00.000' AS DateTime), 3, 2, 2),
(N'Khaki Shorts', 73, 73, N'Classic khaki shorts ideal for both casual and semi-formal settings.', N'assets/image_swp/short/3.jpg', CAST(N'2021-05-28T00:00:00.000' AS DateTime), 3, 5, 2),
(N'Swim Shorts', 83, 63, N'Quick-drying swim shorts perfect for beach and pool activities.', N'assets/image_swp/short/4.jpg', CAST(N'2020-05-28T00:00:00.000' AS DateTime), 3, 9, 2),
(N'Long Shorts', 30, 53, N'Stylish long shorts suitable for casual outings.', N'assets/image_swp/short/5.jpg', CAST(N'2019-05-28T00:00:00.000' AS DateTime), 3, 8, 2),
(N'Mid-length Shorts', 73, 43, N'Versatile mid-length shorts for various casual occasions.
', N'assets/image_swp/short/6.jpg', CAST(N'2024-05-28T00:00:00.000' AS DateTime), 3, 11, 2),

( N'Round-neck', 53, 34, N'Comfortable round-neck shirt suitable for everyday wear.', N'assets/image_swp/shirt/nam1.jpg', CAST(N'2020-05-28T00:00:00.000' AS DateTime),4, 6, 2),
( N'V-neck', 38, 55, N'Stylish V-neck shirt for a fashionable look.', N'assets/image_swp/shirt/nam2.jpg', CAST(N'2023-02-28T00:00:00.000' AS DateTime), 4, 11, 2),
( N'Long-sleeve', 93, 66, N' Long-sleeve shirt for cooler weather or layered outfits.', N'assets/image_swp/shirt/nam3.jpg', CAST(N'2023-01-28T00:00:00.000' AS DateTime), 4, 4, 2),
( N'Printed', 93, 77, N'Shirt featuring attractive prints for a trendy look.', N'assets/image_swp/shirt/namnu2.jpg', CAST(N'2020-05-28T00:00:00.000' AS DateTime), 4, 12, 2),
( N'Sports', 63, 88, N'Sporty shirt designed for active lifestyles.', N'assets/image_swp/shirt/nu1.jpg', CAST(N'2024-12-28T00:00:00.000' AS DateTime), 4, 6, 2),
( N'Falica', 83, 99, N'Stylish shirt suitable for both men and women', N'assets/image_swp/shirt/somi_namnu1.jpg', CAST(N'2024-01-28T00:00:00.000' AS DateTime),4, 7, 2),

( N'Striped Jogger', 93, 83, N'Stylish jogger with striped design, suitable for casual wear.', N'assets/image_swp/jogger/1.jpg', CAST(N'2024-05-28T00:00:00.000' AS DateTime), 5, 7, 2),
( N'Cuffed Jogger', 93, 73, N'Comfortable cuffed jogger pants for a relaxed fit.', N'assets/image_swp/jogger/2.jpg', CAST(N'2023-05-28T00:00:00.000' AS DateTime), 5, 4, 2),
( N'Camouflage Jogger', 113, 30, N' Camouflage pattern jogger pants, ideal for outdoor activities.', N'assets/image_swp/jogger/3.jpg', CAST(N'2022-05-28T00:00:00.000' AS DateTime), 5, 6, 2),
( N'Denim Jogger', 123, 43, N'Casual denim jogger pants for a trendy look.', N'assets/image_swp/jogger/4.jpg', CAST(N'2021-05-28T00:00:00.000' AS DateTime), 5, 4, 2),
( N'Cargo Jogger', 213, 31, N'Functional cargo jogger pants with multiple pockets.', N'assets/image_swp/jogger/5.jpg', CAST(N'2020-05-28T00:00:00.000' AS DateTime), 5, 8, 2),
( N'Fleece Jogger', 73, 99, N'Warm fleece jogger pants for colder weather.', N'assets/image_swp/jogger/6.jpg', CAST(N'2024-05-28T00:00:00.000' AS DateTime), 5, 10, 2),

( N'Distressed Skinny Jeans', 73, 113, N' Distressed skinny jeans for a rugged look.', N'assets/image_swp/jeans/1.jpg', CAST(N'2024-06-28T00:00:00.000' AS DateTime), 6, 11, 2),
( N'Ripped Boyfriend Jeans', 63, 120, N'Trendy ripped boyfriend jeans for a casual style.', N'assets/image_swp/jeans/2.jpg', CAST(N'2023-05-28T00:00:00.000' AS DateTime), 6, 14, 2),
( N'High-Waisted Mom Jeans', 93, 130, N'High-waisted mom jeans for a vintage-inspired look.', N'assets/image_swp/jeans/3.jpg', CAST(N'2022-05-28T00:00:00.000' AS DateTime), 6, 6, 2),
( N'Straight Leg Jeans', 83, 78, N'Classic straight leg jeans for timeless style.', N'assets/image_swp/jeans/4.jpg', CAST(N'2022-05-28T00:00:00.000' AS DateTime), 6, 7, 2),
( N'Flare Jeans', 37, 78, N'Flare jeans for a retro-inspired fashion statement.', N'assets/image_swp/jeans/5.jpg', CAST(N'2021-05-28T00:00:00.000' AS DateTime), 6, 8, 2),
( N'Wide Leg Jeans', 73, 53, N'Wide leg jeans for a relaxed and comfortable fit.', N'assets/image_swp/jeans/6.jpg', CAST(N'2020-05-28T00:00:00.000' AS DateTime), 6, 9, 2),
( N'Skinny Jeans', 73, 73, N'Classic skinny jeans for a sleek silhouette.', N'assets/image_swp/jeans/7.jpg', CAST(N'2019-05-28T00:00:00.000' AS DateTime), 6, 1, 2),
( N'Bootcut Jeans', 73, 66, N'Bootcut jeans for a flattering and versatile style.', N'assets/image_swp/jeans/8.jpg', CAST(N'2018-05-28T00:00:00.000' AS DateTime), 6, 1, 2),
( N'Crop Jeans', 73, 13, N'Stylish crop jeans for a trendy summer look.', N'assets/image_swp/jeans/9.jpg', CAST(N'2020-05-28T00:00:00.000' AS DateTime), 6, 11, 2),
( N'Boyfriend Jeans', 36, 66, N'Comfortable boyfriend jeans for a relaxed fit.', N'assets/image_swp/jeans/nu1.jpg', CAST(N'2024-01-28T00:00:00.000' AS DateTime), 6, 11, 2),

( N'Casual Pullover Hoodie', 213, 76, N'Comfortable pullover hoodie for casual outings.', N'assets/image_swp/hoodie/1.jpg', CAST(N'2024-05-28T00:00:00.000' AS DateTime), 7, 11, 2),
( N'Sporty Zip-Up Hoodie', 23, 44, N'Sporty zip-up hoodie for active lifestyles', N'assets/image_swp/hoodie/2.jpg', CAST(N'2022-05-28T00:00:00.000' AS DateTime), 7,12, 2),
( N'Graphic Print Hoodie', 93, 55, N'Hoodie featuring a stylish graphic print', N'assets/image_swp/hoodie/3.jpg', CAST(N'2024-01-28T00:00:00.000' AS DateTime), 7, 13, 2),
( N'Cozy Fleece Hoodie', 83, 86, N'Warm and cozy fleece hoodie for colder days', N'assets/image_swp/hoodie/4.jpg', CAST(N'2024-02-28T00:00:00.000' AS DateTime), 7, 11, 2),
( N'Vintage Hooded Sweatshirt', 63, 23, N'Vintage-style hooded sweatshirt for a retro look3', N'assets/image_swp/hoodie/5.jpg', CAST(N'2024-03-28T00:00:00.000' AS DateTime), 7, 6, 2),
( N'Trendy Oversized Hoodie', 56, 54, N' Trendy oversized hoodie for a relaxed fit', N'assets/image_swp/hoodie/6.jpg', CAST(N'2024-05-28T00:00:00.000' AS DateTime), 7, 6, 2),
( N'Stylish Hoodie Jacket', 57, 44, N'Stylish hoodie jacket for versatile use.', N'assets/image_swp/hoodie/7.jpg', CAST(N'2024-04-28T00:00:00.000' AS DateTime), 7, 7, 2),
( N'Classic Men Hoodie', 98, 11, N'Classic hoodie for men, suitable for everyday wear.', N'assets/image_swp/hoodie/nam1.jpg', CAST(N'2023-05-28T00:00:00.000' AS DateTime), 7, 8, 2),
( N'Urban Streetwear Hoodie', 66, 87, N'Urban streetwear hoodie with a modern design.', N'assets/image_swp/hoodie/nam2.jpg', CAST(N'2022-05-28' AS DateTime), 7, 11, 2),
( N'Fashionable Hoodie',53, 098, N'Fashionable hoodie with a stylish look.', N'assets/image_swp/hoodie/nam3.jpg', CAST(N'2021-05-28T00:00:00.000' AS DateTime), 7, 9, 2),

( N'Elegant Evening Dress', 753, 73, N'Elegant evening dress for special occasions.', N'assets/image_swp/dress/1.jpg', CAST(N'2020-05-28T00:00:00.000' AS DateTime), 8, 9, 2),
( N'Casual Maxi Dress', 773, 73, N' Casual maxi dress for relaxed settings.', N'assets/image_swp/dress/2.jpg', CAST(N'2023-05-28T00:00:00.000' AS DateTime), 8, 9, 2),
( N'Floral Print Dress', 73, 53, N'Dress featuring a vibrant floral print.', N'assets/image_swp/dress/3.jpg', CAST(N'2022-05-28T00:00:00.000' AS DateTime), 8, 9, 2),
( N'Chic Summer Dress', 37, 43, N'Chic summer dress for warm weather', N'assets/image_swp/dress/4.jpg', CAST(N'2022-05-28T00:00:00.000' AS DateTime), 8, 5, 2),
( N'Formal Cocktail Dress', 53, 33, N' Formal cocktail dress for elegant occasions', N'assets/image_swp/dress/5.jpg', CAST(N'2024-02-28T00:00:00.000' AS DateTime), 8, 11, 2),
( N'Bohemian Midi Dress', 53, 33, N'Bohemian-style midi dress for a relaxed vibe', N'assets/image_swp/dress/6.jpg', CAST(N'2024-03-28T00:00:00.000' AS DateTime), 8, 11, 2),
( N'Vintage Lace Dress', 83, 31, N'Vintage lace dress for a timeless appeal.', N'assets/image_swp/dress/7.jpg', CAST(N'2024-04-28T00:00:00.000' AS DateTime), 8, 11, 2),

( N'Down Winter Coat', 53, 23, N' Warm down winter coat for cold seasons', N'assets/image_swp/coat/du.jpg', CAST(N'2024-05-28T00:00:00.000' AS DateTime), 9,1, 2),
( N'Men Down Jacket', 43,87, N'Down jacket for men, designed for warmth', N'assets/image_swp/coat/du_nam.jpg', CAST(N'2023-05-28T00:00:00.000' AS DateTime), 9, 1, 2),
( N'Paradox Waterproof Jacket', 23, 23, N'Waterproof jacket from Paradox, suitable for rainy days', N'assets/image_swp/coat/du_paradox.jpg', CAST(N'2022-05-28T00:00:00.000' AS DateTime), 9, 2, 2),
( N'Windbreaker Jacket', 453, 54, N'Lightweight windbreaker jacket for outdoor activities', N'assets/image_swp/coat/khoac_gio.jpg', CAST(N'2021-05-28T00:00:00.000' AS DateTime), 9, 2, 2),
( N'Puffer Jacket', 53, 78, N'Puffer jacket for insulation during cold weather', N'assets/image_swp/coat/khoacbof.jpg', CAST(N'2020-05-28T00:00:00.000' AS DateTime), 9, 1, 2),
( N'Unisex Coat', 43, 88, N' Unisex coat suitable for both men and women', N'assets/image_swp/coat/khoacnamnu.jpg', CAST(N'2019-05-28T00:00:00.000' AS DateTime), 9, 3, 2),
( N'Women Coat', 083, 88, N'Women coat for stylish and warm outerwear', N'assets/image_swp/coat/khoacnu.jpg', CAST(N'2018-05-28T00:00:00.000' AS DateTime), 9, 3, 2),
( N'Winter Jacket', 73, 111, N' Warm winter jacket for protection against the cold.', N'assets/image_swp/coat/ni.jpg', CAST(N'2024-05-28T00:00:00.000' AS DateTime), 9, 11, 2);

go
Insert into wallet(uid,wallet) values
(1, 1000),
(4, 99999),
(2, 2000),
(3, 2000),
(11, 99999);


go

INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (4, N'XS', N'XS - Male', 1)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (5, N'S', N'S - Male', 1)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (6, N'M', N'M - Male', 1)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (7, N'L', N'L - Male', 1)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (8, N'XL', N'XL - Male', 1)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (9, N'XXL', N'XXL - Male', 1)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (12, N'XS', N'XS - Female', 2)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (10, N'S', N'S- Female', 2)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (15, N'M', N'M- Female', 2)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (16, N'L', N'L- Female', 2)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (17, N'XL', N'XL- Female', 2)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (18, N'XXL', N'XXL- Female', 2)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (19, N'XS', N'XS - Unisex', 1)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (20, N'S', N'S- Unisex', 2)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (21, N'M', N'M- Unisex', 2)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (22, N'L', N'L- Unisex', 1)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (23, N'XL', N'XL- Unisex', 1)
INSERT [dbo].[Size] ([sid], [name], [description], [gid]) VALUES (24, N'XXL', N'XXL- Unisex', 2)

GO
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([nid], [title], [description], [uid], [status], [updateDate]) VALUES (4, N'Bí kíp phối đồ tập gym nam cực chất lại thoải mái ', N'<h3><strong>1. Chất liệu</strong></h3><p><strong>Yếu tố quan trọng và cơ bản nhất ảnh hưởng đến chất lượng của trang phục và hiệu quả của việc luyện tập là chất liệu. Khi bạn đầu tư một cách hợp lý vào quần áo tập gym, bạn sẽ tận hưởng sự thoải mái và dễ chịu trong quá trình luyện tập.</strong></p><p><strong>Khi mua </strong><a href="https://www.coolmate.me/post/7-dia-chi-mua-quan-ao-tap-gym-nam-chat-luong"><strong>quần áo tập gym cho nam</strong></a><strong> giới, hãy chú ý xem liệu chất liệu vải có khả năng thấm hút mồ hôi tốt và thoáng khí hay không. Khi tập luyện, cơ thể sẽ sản sinh mồ hôi và cần một luồng khí tươi để lưu thông tốt hơn.</strong></p><p><strong>Dù việc tập thể dục có ích cho sức khỏe, nhưng nếu mặc những bộ quần áo không cho phép mồ hôi thoát ra, cơ thể sẽ bị ướt và dễ bị cảm lạnh.</strong></p><p><strong>Hiện nay, có ba chất liệu phổ biến được sử dụng trong sản xuất quần áo tập gym: cotton, polyester và spandex. Hãy cùng xem những đặc điểm của từng loại vải này:</strong><br>&nbsp;</p><ul><li><strong>Cotton: Chất liệu này có khả năng thấm hút tuyệt vời và giới hạn mùi cơ thể. Tuy nhiên, trong những buổi tập với cường độ cao như tập gym, bạn có thể cảm thấy cơ thể ẩm như vừa tắm.</strong></li><li><strong>Polyester: Chất liệu này có độ bền cao, ít nhăn nhúm sau khi giặt, nhẹ và rất thoáng khí. Đặc biệt, vải polyester còn có khả năng chống tia cực tím (UV) ngay cả khi bị ướt.</strong></li><li><strong>Spandex: Chất liệu này có tính co giãn xuất sắc, có thể kéo giãn nhiều lần mà vẫn giữ được hình dạng ban đầu. Ngoài ra, vải spandex còn mềm mại, không gây tĩnh điện và không tạo xơ trên bề mặt.</strong></li></ul><p>&nbsp;</p><figure class="image"><img style="aspect-ratio:800/600;" src="http://localhost:9998/clothesShop/assets/img/newsImage/CoolMate_(23).jpg" width="800" height="600"></figure><h3><strong>2. Độ co giãn</strong></h3><p><strong>Không chỉ về chất liệu, mà độ co giãn cũng đóng góp một phần quan trọng trong việc mang lại sự thoải mái và tự tin cho người mặc. Đối với một bộ đồ tập gym, độ co giãn cao là điều cần thiết để đảm bảo phạm vi hoạt động rộng khi thực hiện các động tác. Ngoài ra, lựa chọn đai quần có tính đàn hồi, ôm vừa eo cũng rất quan trọng. Tránh những chiếc quần quá chặt vì chúng có thể gây ra vết hằn và đau rát trên vùng bụng.</strong></p><h3><strong>3. Size phù hợp</strong></h3><p><strong>Một bộ quần áo thể thao lý tưởng nên có kích cỡ vừa vặn, không quá rộng hoặc quá chật. Khi quần áo quá rộng, nó có thể bị vướng vào các thiết bị tập luyện hoặc gây cản trở khi thực hiện các động tác. Nếu quần áo quá chật, nó có thể hạn chế sự lưu thông máu và ảnh hưởng đến chất lượng buổi tập.</strong></p><h3><strong>4. Thời tiết</strong></h3><p><strong>Dưới đây là một số gợi ý về </strong><a href="https://www.coolmate.me/post/trang-phuc-tap-gym-nam-gioi-thoai-mai-nhattrang%20ph%E1%BB%A5c%20t%E1%BA%ADp%20gym"><strong>trang phục tập gym</strong></a><strong> cho nam giới, tùy thuộc vào mùa:</strong></p><p><strong>Trang phục mùa hè:Khi mùa hè đến, chất liệu thoáng khí và thấm hút là ưu tiên hàng đầu. Vì khí hậu nóng có thể làm bạn ra mồ hôi nhiều hơn, việc chọn sai chất liệu sẽ khiến bạn cảm thấy nóng bức và không thoải mái khi tập luyện. Đồng thời, nếu mồ hôi không được thấm hút ngay, cơ thể có thể bị lạnh. Đây là một số item phù hợp cho mùa hè:</strong></p><ul><li><strong>Áo ba lỗ, </strong><a href="https://www.coolmate.me/collection/ao-ba-lo-tank-top-nam"><strong>áo tank top</strong></a><strong>: Những loại áo này thoáng mát và giúp bạn cảm thấy dễ chịu trong nắng nóng.</strong></li><li><strong>Áo phông:&nbsp;Một chiếc áo phông có chất liệu thấm hút tốt cũng là một lựa chọn tốt cho mùa hè.</strong></li><li><strong>Quần short: Để tạo sự thoải mái và linh hoạt khi tập luyện, quần short là một item phù hợp.</strong></li></ul><p><strong>Trang phục mùa đông:&nbsp;Mùa đông đòi hỏi trang phục thoải mái, thấm hút và giữ ấm cơ thể. Dưới đây là một số gợi ý cho mùa đông:</strong></p><ul><li><strong>Áo phông kết hợp áo ba lỗ:&nbsp;Lớp áo phông bên trong có thể giữ ấm cơ thể, trong khi áo ba lỗ bên ngoài có tính thoáng khí và linh hoạt hơn cho việc vận động.</strong></li><li><strong>Quần jogger: Một chiếc quần jogger thoải mái và ấm áp là lựa chọn phù hợp trong mùa đông.</strong></li><li><p><strong>Áo thun hoặc quần legging giữ nhiệt:&nbsp;Có sẵn những chiếc áo thun hoặc quần legging giữ nhiệt, được ưa chuộng bởi nhiều người tập gym. Đây là những item đáng xem xét để sở hữu trong những buổi tập luyện vào mùa đông.</strong></p><figure class="image"><img style="aspect-ratio:800/600;" src="http://localhost:9998/clothesShop/assets/img/newsImage/bi-kip-phoi-do-tap-gym-nam-cuc-chat-lai-thoai-mai-cho-chang-1823_218.jpg" width="800" height="600"></figure><p>&nbsp;</p></li></ul>', 11, 1, CAST(N'2024-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([nid], [title], [description], [uid], [status], [updateDate]) VALUES (5, N'Đột phá công nghệ in dập nổi trên áo thể thao', N'<h2><strong>1. Embossed Print - Công nghệ in dập nổi hiện đại</strong></h2><p><strong>Công nghệ in Emboss hay kỹ thuật in dập nổi Emboss là một phương pháp in ấn giúp tạo ra các hình ảnh hoặc chữ nổi trên bề mặt giấy hoặc vải. Trước đây, in dập nổi được sử dụng chủ yếu để in danh thiếp hay in tiêu đề cho các văn phòng phẩm. Sau này, công nghệ in dập nổi emboss đã được ứng dụng trong cả địa hạt thời trang, ban đầu là với áo T-shirt và hiện đại là với dòng sản phẩm quần áo thể thao.</strong></p><figure class="image"><img style="aspect-ratio:800/600;" src="http://localhost:9998/clothesShop/assets/img/newsImage/cong-nghe-in-dap-noi.jpg" width="800" height="600"></figure><p><strong>Quá trình in dập nổi thường được thực hiện bằng cách dùng áp lực cao ép khuôn dập nổi vào vật liệu in để tạo ra các chi tiết, hoa văn nổi lên bề mặt sản phẩm in ấn. Ưu điểm của công nghệ này chính là khả năng tạo ra những chi tiết nổi bật, sang trọng, có tính thẩm mỹ cao. Đồng thời, công nghệ in emboss cũng cho phép tạo ra số lượng lớn sản phẩm với chất lượng in cực kỳ đồng đều.</strong></p><h2><strong>2. Ứng dụng công nghệ in dập nổi trên áo bóng đá Coolmate</strong></h2><p><strong>Tại Việt Nam, Coolmate có thể coi là một trong những đơn vị tiên phong ứng dụng công nghệ in dập nổi trên vải cho Football Collection mới ra mắt mùa Euro 2024. Không chỉ đơn thuần ứng dụng công nghệ in Emboss, Coolmate còn nghiên cứu và phát triển riêng chất liệu vải chuyên biệt dành riêng cho thể thao, giúp tối ưu hiệu quả và tính thẩm mỹ của công nghệ in mới.&nbsp;</strong></p><figure class="image"><img style="aspect-ratio:800/800;" src="http://localhost:9998/clothesShop/assets/img/newsImage/in-dap-noi-4180_458.jpg" width="800" height="800"></figure><p><strong>Những chiếc áo Football Coolmate sử dụng chất liệu vải chuyên biệt, kết hợp với công nghệ in hoạ tiết tràn mặt giúp thể hiện tính thời trang và cả tính chất đối kháng đặc trưng của bộ môn thể thao vua.</strong></p><p><strong>Với Football Collection mới toanh được tô tiểm bởi những hoạ tiết từ công nghệ in Emboss, Coolmate hy vọng các “fan cứng" bóng đá có thể tự tin khoác lên mình chiếc áo Football Coolmate để hoà vào không khí mùa Euro cuồng nhiệt, đồng thời tự tin toả sáng trên sân và sôi nổi cổ vũ trên khán đài.&nbsp;</strong></p><h2><strong>3. Lý do bạn nên sở hữu ngay áo bóng đá Coolmate</strong></h2><p><a href="https://www.coolmate.me/collection/quan-ao-da-bong-coolmate"><strong>Football Collection</strong></a><strong> - Món quà mùa hè mới từ Coolmate hứa hẹn sẽ là một dòng sản phẩm thời thượng với thiết kế đẹp mắt, mang đến cảm giác tự tin và thoải mái để bạn có thể mặc mọi lúc, mọi nơi từ sân bóng đến đường phố.</strong></p><h3><strong>Chất liệu bền bỉ, độ bền cao</strong></h3><p><strong>Các thiết kế trong Football Collection mới của Coolmate đều được làm từ 100% Recycled Polyester vừa thân thiện với môi trường, vừa nhẹ và thoáng khí, phù hợp với môn thể thao có cường độ vận động mạnh như bóng đá. Chất liệu chuyên dụng kết hợp với kiểu dệt Knit - Interlock mang đến cho áo bóng đá Coolmate độ co giãn tự nhiên và độ bền cao.</strong></p><h3><strong>Ứng dụng những công nghệ hiện đại</strong></h3><p><strong>Sử dụng kỹ thuật in dập nổi Emboss, những chiếc áo bóng đá Coolmate đều sở hữu hoạ tiết ấn tượng trên bề mặt vải, tăng tính thời trang. Bên cạnh đó, áo còn được ứng dụng công nghệ EXDRY giúp tăng hiệu quả thấm hút, giúp áo nhanh khô và mang đến cảm giác thoáng khí vượt trội.</strong></p>', 11, 1, CAST(N'2024-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([nid], [title], [description], [uid], [status], [updateDate]) VALUES (6, N'May áo sơ mi nam cần bao nhiêu mét vải?', N'<h2><strong>1. Cách tính vải may quần áo chi tiết</strong></h2><p><strong>Để biết cách tính vải may quần áo chính xác nhất đòi hỏi một quá trình tập luyện và thực hành dài. Tuy vậy, nếu không phải “dân chuyên", bạn vẫn có thể tìm hiểu cách tính cơ bản để dễ dàng trao đổi với thợ may khi cần may đồ.</strong></p><h3><strong>1.1. Tìm hiểu về khái niệm khổ vải</strong></h3><p><strong>Trước khi biết </strong><a href="https://www.coolmate.me/post/cach-tinh-vai-may-quan-ao-4144?jskey=acEozRp2TqnwGNxyjbkekaSoOmaqwXiTvVwyD6FiG2MB"><strong>cách tính vải may quần áo</strong></a><strong>, bạn cần nắm được khái niệm về khổ vải. Khổ vài chỉ chiều rộng của 1 cuộn vải tính từ 2 đầu. Ví dụ, nếu 1 cuộn vải có chiều rộng 1,15m thì được gọi là khổ vải 1m.</strong></p><figure class="image"><img style="aspect-ratio:800/600;" src="http://localhost:9998/clothesShop/assets/img/newsImage/cach-tinh-vai-may-quan-ao-4144_118.jpg" width="800" height="600"></figure><p><strong>Đơn vị đo khổ vải thường là mét hoặc inch. Trên thị trường hiện nay sẽ có nhiều khổ vải khác nhau từ 0,9m; 1,20m; 1,50m,... để đáp ứng nhu cầu may mặc. Đặc biệt, may áo và quần đều cần khổ vải khác nhau. Ví dụ, nếu may quần áo nam, bạn sẽ cần các khổ vải theo chất liệu cụ thể như sau:</strong></p><figure class="image"><img style="aspect-ratio:871/552;" src="http://localhost:9998/clothesShop/assets/img/newsImage/Screenshot 2024-07-10 214004.png" width="871" height="552"></figure><p>&nbsp;</p><h3><strong>2. Cách tính vải may quần áo cho từng loại trang phục</strong></h3><p><strong>Cách tính vải may quần áo sẽ phụ thuộc vào việc bạn muốn may áo hay may quần và bạn chọn khổ vải nào. Cụ thể như sau:</strong></p><h4><strong>1.2.1. Cách tính vải may áo</strong></h4><p><strong>Khổ vải 90cm, 1m1: Mua gấp đôi vải sao cho độ dài áo và độ dài tay áo thêm 10cm.Khổ vải 1m2, 1m3: Độ dài áo bằng dài tay áo tăng thêm 10cm.Khổ vải 1m5, 1m6: Mua 1m vải nếu may áo ngắn tay, mua 1m2 vải nếu may áo dài tay.Khổ vải 1m8, 2m: Mua 80cm là đủ nếu là vải cotton.</strong></p><figure class="image"><img style="aspect-ratio:800/600;" src="http://localhost:9998/clothesShop/assets/img/newsImage/cach-tinh-vai-may-quan-ao-4144_472.jpg" width="800" height="600"></figure><h4><strong>1.2.2. Cách tính vải may quần</strong></h4><p><strong>Khổ vải 1m2, 1m3: Mua 1m5 vải nếu muốn may quần vừa vặn.Khổ vải 1m5, 1m6: Mua 1m1 vải là phù hợp. Nếu muốn chiều dài quần ngắn hơn 85cm chỉ cần mua khoảng 1m vải.</strong></p><h4><strong>1.2.3. May áo sơ mi nam cần bao nhiêu mét vải?</strong></h4><p><strong>Hiện nay, để biết may áo sơ mi nam cần bao nhiêu vải, các nhà may, xưởng may thưởng sử dụng chủ yếu bảng thông số theo chiều cao dưới đây để biết cách tính vải may quần áo.&nbsp;</strong></p><p><strong>Ngoài cách tính vải dựa trên chiều cao, để biết may áo sơ mi nam cần bao nhiêu mét vải còn phụ thuộc vào nhiều yếu tố như kiểu dáng áo mong muốn, chất liệu may áo cũng như tay nghề và kinh nghiệm của thợ may.&nbsp;</strong></p>', 11, 1, CAST(N'2024-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([nid], [title], [description], [uid], [status], [updateDate]) VALUES (7, N'Khám phá thời trang thuần chay - Vegan fashion', N'<h2><strong>1. Thời trang thuần chay là gì?&nbsp;</strong></h2><p><strong>Thời trang thuần chay (vegan fashion) là việc khai thác và sử dụng các chất liệu thiết kế không phải từ động vật. Ví dụ, thay vì sử dụng các nguyên liệu như lông, da, lông vũ,... thời trang thuần chay sẽ mang đến những thiết kế làm từ các nguyên liệu có tính nhân đạo hơn, thân thiện với môi trường hơn, hướng đến những giá trị đạo đức và đề cao trách nhiệm xã hội.</strong></p><figure class="image"><img style="aspect-ratio:800/600;" src="http://localhost:9998/clothesShop/assets/img/newsImage/thoi-trang-thuan-chay-4143_711.jpg" width="800" height="600"></figure><p><strong>Vegan fashion đã bắt đầu len lỏi vào dòng chảy thời trang từ sau chiến dịch Veganuary (thử thách duy trì chế độ ăn chay sau 1 tháng). Sau đó, xu hướng này bắt đầu bùng nổ mạnh mẽ từ năm 2015. Từ một xu hướng thông thường, thời trang thuần chay đang dần trở thành một kim chỉ nam đại diện cho lối sống lành mạnh và ý nghĩa của giới trẻ.</strong></p><p><strong>Cũng bởi những giá trị đạo đức và tính bền vững mà nó mang đến, không ít ngôi sao nổi tiếng đã chọn&nbsp;vegan fashion để truyền tải những ảnh hưởng tích cực tới cộng đồng, trong đó phải kể đến một số cái tên như Emma Watson, Miley Cyrus,... Năm 2018, Miley Cyrus từng hợp tác với thương hiệu Converse để cho ra mắt bộ sưu tập quần áo, giày thể thao với 25 mẫu thiết kế làm từ da giả.</strong></p><h2><strong>2. Từ một xu hướng tới “Tuần lễ thời trang thuần chay” đầu tiên</strong></h2><p><strong>Nhận thấy triển vọng mạnh mẽ của&nbsp;thời trang thuần chay trong bối cảnh lối sống “xanh hoá” đang được hưởng ứng mạnh mẽ, nhiều nhà mốt đã cho ra mắt những bộ sưu tập và nhiều mẫu thiết kế ấn tượng để hưởng ứng. Đóng vai trò tiên phong cho sự bùng nổ của xu hướng thời trang thuần chay chính là nhà thiết kế Stella McCartney. Với việc tạo ra hàng loạt chất liệu như lông thú nhân tạo, da giả,... Stella McCartney đã tạo nên một đế chế vegan fashaion.</strong></p><figure class="image"><img style="aspect-ratio:800/600;" src="http://localhost:9998/clothesShop/assets/img/newsImage/thoi-trang-thuan-chay-4143_441.jpg" width="800" height="600"></figure><p><strong>Trong Tuần lễ thời trang Thu Đông Paris 2024 vừa qua, nhà thiết kế này cũng đã gây ấn tượng mạnh mẽ với bộ sưu tập&nbsp;thời trang thuần chay với nhiều thiết kế sang trọng từ váy dài đến các trang phục kiểu cách làm từ vật liệu tái chế, giả da cá sâu làm từ bã trái táo,... Thông qua bộ sưu tập đẹp mắt với những gam màu trung tính này, nhà thiết kế người Anh muốn trao đi thông điệp đẹp đẽ về việc thời trang không cần phải đánh đổi bằng môi trường hay gây hại cho động vật.</strong></p><p><strong>Bên cạnh Stella McCartney, các thương hiệu khác như Vivienne Westwood, Gucci, Labante London, Kuma Design,... Mỗi thương hiệu đều có cách thức riêng để thể hiện sự hưởng ứng với&nbsp;vegan fashion. Nếu như các tên tuổi lớn như Burberry, Raplh Lauren, Michael Kors,... sử dụng chất liệu lông thú nhân tạo cho các bộ sưu tập; thì các thương hiệu nhỏ hơn như Kuma Design hay Labanta lại cho ra mắt hẳn các dòng túi xách, phụ kiện làm từ rác thải nhựa tái chế.</strong></p><p><strong>Đầu năm 2019, Tuần lễ thời trang thuần chay đầu tiên trên thế giới đã được tổ chức. Đây được xem như một sự đền đáp xứng đáng cho nỗ lực của các thương hiệu và các ngôi sao trong việc truyền tải những thông điệp tốt đẹp về bảo vệ môi trường, bảo vệ động vật. Được tổ chức tại Lost Angeles vào tháng 2, Tuần lễ </strong><a href="https://www.coolmate.me/post/thoi-trang-thuan-chay-4143"><strong>thời trang thuần chay</strong></a><strong> được kỳ vọng sẽ sớm trở thành sự kiện thường niên ở làng thời trang thế giới trong tương lai.</strong></p>', 11, 1, CAST(N'2024-07-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
INSERT INTO Product_Size (pid, sid) VALUES (1, 4);
INSERT INTO Product_Size (pid, sid) VALUES (1, 5);
INSERT INTO Product_Size (pid, sid) VALUES (1, 6);
INSERT INTO Product_Size (pid, sid) VALUES (1, 7);

-- Product 2 (V-neck T-shirt) with sizes XS, S, M (Female)
INSERT INTO Product_Size (pid, sid) VALUES (2, 12);
INSERT INTO Product_Size (pid, sid) VALUES (2, 10);
INSERT INTO Product_Size (pid, sid) VALUES (2, 15);

-- Product 3 (Luxury Kitchen Item) with sizes S, M, L, XL (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (3, 20);
INSERT INTO Product_Size (pid, sid) VALUES (3, 21);
INSERT INTO Product_Size (pid, sid) VALUES (3, 22);
INSERT INTO Product_Size (pid, sid) VALUES (3, 23);

-- Product 4 (Basic Book) with sizes M, L, XL, XXL (Male)
INSERT INTO Product_Size (pid, sid) VALUES (4, 6);
INSERT INTO Product_Size (pid, sid) VALUES (4, 7);
INSERT INTO Product_Size (pid, sid) VALUES (4, 8);
INSERT INTO Product_Size (pid, sid) VALUES (4, 9);

-- Product 5 (Best Seller Toy) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (5, 12);
INSERT INTO Product_Size (pid, sid) VALUES (5, 10);
INSERT INTO Product_Size (pid, sid) VALUES (5, 15);
INSERT INTO Product_Size (pid, sid) VALUES (5, 16);

-- Product 6 (Popular Electronic Choice) with sizes M, L, XL (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (6, 21);
INSERT INTO Product_Size (pid, sid) VALUES (6, 22);
INSERT INTO Product_Size (pid, sid) VALUES (6, 23);

-- Product 7 (Rugged Rips Slim Fit) with sizes XS, S, M, L (Male)
INSERT INTO Product_Size (pid, sid) VALUES (7, 4);
INSERT INTO Product_Size (pid, sid) VALUES (7, 5);
INSERT INTO Product_Size (pid, sid) VALUES (7, 6);
INSERT INTO Product_Size (pid, sid) VALUES (7, 7);

-- Product 8 (Striped Sophistication Blouse) with sizes XS, S, M (Female)
INSERT INTO Product_Size (pid, sid) VALUES (8, 12);
INSERT INTO Product_Size (pid, sid) VALUES (8, 10);
INSERT INTO Product_Size (pid, sid) VALUES (8, 15);
-- Product 9 (Classic Sports Sneakers) with sizes S, M, L, XL (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (9, 20);
INSERT INTO Product_Size (pid, sid) VALUES (9, 21);
INSERT INTO Product_Size (pid, sid) VALUES (9, 22);
INSERT INTO Product_Size (pid, sid) VALUES (9, 23);

-- Product 10 (Slim Fit Joggers) with sizes XS, S, M (Male)
INSERT INTO Product_Size (pid, sid) VALUES (10, 4);
INSERT INTO Product_Size (pid, sid) VALUES (10, 5);
INSERT INTO Product_Size (pid, sid) VALUES (10, 6);

-- Product 11 (Elegant Evening Gown) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (11, 12);
INSERT INTO Product_Size (pid, sid) VALUES (11, 10);
INSERT INTO Product_Size (pid, sid) VALUES (11, 15);
INSERT INTO Product_Size (pid, sid) VALUES (11, 16);

-- Product 12 (Comfortable Bed Sheets) with sizes M, L, XL, XXL (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (12, 21);
INSERT INTO Product_Size (pid, sid) VALUES (12, 22);
INSERT INTO Product_Size (pid, sid) VALUES (12, 23);
INSERT INTO Product_Size (pid, sid) VALUES (12, 24);

-- Product 13 (High-Performance Laptop) with sizes S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (13, 20);
INSERT INTO Product_Size (pid, sid) VALUES (13, 21);
INSERT INTO Product_Size (pid, sid) VALUES (13, 22);

-- Product 14 (Chic Designer Handbag) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (14, 12);
INSERT INTO Product_Size (pid, sid) VALUES (14, 10);
INSERT INTO Product_Size (pid, sid) VALUES (14, 15);
INSERT INTO Product_Size (pid, sid) VALUES (14, 16);

-- Product 15 (Vintage Leather Jacket) with sizes XS, S, M, L (Male)
INSERT INTO Product_Size (pid, sid) VALUES (15, 4);
INSERT INTO Product_Size (pid, sid) VALUES (15, 5);
INSERT INTO Product_Size (pid, sid) VALUES (15, 6);
INSERT INTO Product_Size (pid, sid) VALUES (15, 7);

-- Product 16 (Elegant Diamond Necklace) with sizes S, M, L, XL (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (16, 20);
INSERT INTO Product_Size (pid, sid) VALUES (16, 21);
INSERT INTO Product_Size (pid, sid) VALUES (16, 22);
INSERT INTO Product_Size (pid, sid) VALUES (16, 23);

-- Product 17 (Casual Graphic Tee) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (17, 12);
INSERT INTO Product_Size (pid, sid) VALUES (17, 10);
INSERT INTO Product_Size (pid, sid) VALUES (17, 15);
INSERT INTO Product_Size (pid, sid) VALUES (17, 16);

-- Product 18 (Luxury Smartwatch) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (18, 19);
INSERT INTO Product_Size (pid, sid) VALUES (18, 20);
INSERT INTO Product_Size (pid, sid) VALUES (18, 21);
INSERT INTO Product_Size (pid, sid) VALUES (18, 22);

-- Product 19 (Trendy Sunglasses) with sizes XS, S, M (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (19, 19);
INSERT INTO Product_Size (pid, sid) VALUES (19, 20);
INSERT INTO Product_Size (pid, sid) VALUES (19, 21);

-- Product 20 (Warm Wool Scarf) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (20, 12);
INSERT INTO Product_Size (pid, sid) VALUES (20, 10);
INSERT INTO Product_Size (pid, sid) VALUES (20, 15);
INSERT INTO Product_Size (pid, sid) VALUES (20, 16);

-- Product 21 (Cozy Winter Jacket) with sizes S, M, L, XL (Male)
INSERT INTO Product_Size (pid, sid) VALUES (21, 5);
INSERT INTO Product_Size (pid, sid) VALUES (21, 6);
INSERT INTO Product_Size (pid, sid) VALUES (21, 7);
INSERT INTO Product_Size (pid, sid) VALUES (21, 8);

-- Product 22 (Summer Sandals) with sizes XS, S, M (Female)
INSERT INTO Product_Size (pid, sid) VALUES (22, 12);
INSERT INTO Product_Size (pid, sid) VALUES (22, 10);
INSERT INTO Product_Size (pid, sid) VALUES (22, 15);

-- Product 23 (Classic Leather Wallet) with sizes S, M, L, XL (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (23, 20);
INSERT INTO Product_Size (pid, sid) VALUES (23, 21);
INSERT INTO Product_Size (pid, sid) VALUES (23, 22);
INSERT INTO Product_Size (pid, sid) VALUES (23, 23);

-- Product 24 (Modern Art Decor) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (24, 19);
INSERT INTO Product_Size (pid, sid) VALUES (24, 20);
INSERT INTO Product_Size (pid, sid) VALUES (24, 21);
INSERT INTO Product_Size (pid, sid) VALUES (24, 22);

-- Product 25 (Premium Coffee Maker) with sizes M, L, XL, XXL (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (25, 21);
INSERT INTO Product_Size (pid, sid) VALUES (25, 22);
INSERT INTO Product_Size (pid, sid) VALUES (25, 23);
INSERT INTO Product_Size (pid, sid) VALUES (25, 24);

-- Product 26 (Elegant Silk Tie) with sizes XS, S, M (Male)
INSERT INTO Product_Size (pid, sid) VALUES (26, 4);
INSERT INTO Product_Size (pid, sid) VALUES (26, 5);
INSERT INTO Product_Size (pid, sid) VALUES (26, 6);

-- Product 27 (Stylish Fedora Hat) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (27, 12);
INSERT INTO Product_Size (pid, sid) VALUES (27, 10);
INSERT INTO Product_Size (pid, sid) VALUES (27, 15);
INSERT INTO Product_Size (pid, sid) VALUES (27, 16);

-- Product 28 (Comfortable Running Shoes) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (28, 19);
INSERT INTO Product_Size (pid, sid) VALUES (28, 20);
INSERT INTO Product_Size (pid, sid) VALUES (28, 21);
INSERT INTO Product_Size (pid, sid) VALUES (28, 22);

-- Product 29 (Stylish Denim Jeans) with sizes S, M, L, XL (Male)
INSERT INTO Product_Size (pid, sid) VALUES (29, 5);
INSERT INTO Product_Size (pid, sid) VALUES (29, 6);
INSERT INTO Product_Size (pid, sid) VALUES (29, 7);
INSERT INTO Product_Size (pid, sid) VALUES (29, 8);

-- Product 30 (Designer Bracelet) with sizes S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (30, 10);
INSERT INTO Product_Size (pid, sid) VALUES (30, 15);
INSERT INTO Product_Size (pid, sid) VALUES (30, 16);

-- Product 31 (Vintage Record Player) with sizes M, L, XL (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (31, 21);
INSERT INTO Product_Size (pid, sid) VALUES (31, 22);
INSERT INTO Product_Size (pid, sid) VALUES (31, 23);

-- Product 32 (Elegant Evening Clutch) with sizes XS, S, M (Female)
INSERT INTO Product_Size (pid, sid) VALUES (32, 12);
INSERT INTO Product_Size (pid, sid) VALUES (32, 10);
INSERT INTO Product_Size (pid, sid) VALUES (32, 15);

-- Product 33 (Modern Wall Clock) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (33, 19);
INSERT INTO Product_Size (pid, sid) VALUES (33, 20);
INSERT INTO Product_Size (pid, sid) VALUES (33, 21);
INSERT INTO Product_Size (pid, sid) VALUES (33, 22);

-- Product 34 (Wireless Earbuds) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (34, 19);
INSERT INTO Product_Size (pid, sid) VALUES (34, 20);
INSERT INTO Product_Size (pid, sid) VALUES (34, 21);
INSERT INTO Product_Size (pid, sid) VALUES (34, 22);

-- Product 35 (Trendy Fitness Tracker) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (35, 19);
INSERT INTO Product_Size (pid, sid) VALUES (35, 20);
INSERT INTO Product_Size (pid, sid) VALUES (35, 21);
INSERT INTO Product_Size (pid, sid) VALUES (35, 22);

-- Product 36 (Smart Home Assistant) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (36, 19);
INSERT INTO Product_Size (pid, sid) VALUES (36, 20);
INSERT INTO Product_Size (pid, sid) VALUES (36, 21);
INSERT INTO Product_Size (pid, sid) VALUES (36, 22);

-- Product 37 (Luxury Leather Backpack) with sizes S, M, L, XL (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (37, 20);
INSERT INTO Product_Size (pid, sid) VALUES (37, 21);
INSERT INTO Product_Size (pid, sid) VALUES (37, 22);
INSERT INTO Product_Size (pid, sid) VALUES (37, 23);

-- Product 38 (Stylish Leather Boots) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (38, 19);
INSERT INTO Product_Size (pid, sid) VALUES (38, 20);
INSERT INTO Product_Size (pid, sid) VALUES (38, 21);
INSERT INTO Product_Size (pid, sid) VALUES (38, 22);

-- Product 39 (Premium Blended Whiskey) with sizes S, M, L, XL (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (39, 20);
INSERT INTO Product_Size (pid, sid) VALUES (39, 21);
INSERT INTO Product_Size (pid, sid) VALUES (39, 22);
INSERT INTO Product_Size (pid, sid) VALUES (39, 23);

-- Product 40 (Classic Wool Sweater) with sizes S, M, L, XL (Male)
INSERT INTO Product_Size (pid, sid) VALUES (40, 5);
INSERT INTO Product_Size (pid, sid) VALUES (40, 6);
INSERT INTO Product_Size (pid, sid) VALUES (40, 7);
INSERT INTO Product_Size (pid, sid) VALUES (40, 8);

-- Product 41 (Leather Dress Shoes) with sizes XS, S, M, L (Male)
INSERT INTO Product_Size (pid, sid) VALUES (41, 4);
INSERT INTO Product_Size (pid, sid) VALUES (41, 5);
INSERT INTO Product_Size (pid, sid) VALUES (41, 6);
INSERT INTO Product_Size (pid, sid) VALUES (41, 7);

-- Product 42 (Designer Sunglasses) with sizes XS, S, M (Female)
INSERT INTO Product_Size (pid, sid) VALUES (42, 12);
INSERT INTO Product_Size (pid, sid) VALUES (42, 10);
INSERT INTO Product_Size (pid, sid) VALUES (42, 15);

-- Product 43 (Formal Silk Tie) with sizes XS, S, M (Male)
INSERT INTO Product_Size (pid, sid) VALUES (43, 4);
INSERT INTO Product_Size (pid, sid) VALUES (43, 5);
INSERT INTO Product_Size (pid, sid) VALUES (43, 6);

-- Product 44 (Running Shoes) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (44, 19);
INSERT INTO Product_Size (pid, sid) VALUES (44, 20);
INSERT INTO Product_Size (pid, sid) VALUES (44, 21);
INSERT INTO Product_Size (pid, sid) VALUES (44, 22);

-- Product 45 (Winter Coat) with sizes S, M, L, XL (Male)
INSERT INTO Product_Size (pid, sid) VALUES (45, 5);
INSERT INTO Product_Size (pid, sid) VALUES (45, 6);
INSERT INTO Product_Size (pid, sid) VALUES (45, 7);
INSERT INTO Product_Size (pid, sid) VALUES (45, 8);

-- Product 46 (Summer Dress) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (46, 12);
INSERT INTO Product_Size (pid, sid) VALUES (46, 10);
INSERT INTO Product_Size (pid, sid) VALUES (46, 15);
INSERT INTO Product_Size (pid, sid) VALUES (46, 16);

-- Product 47 (Fitness Tracker) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (47, 19);
INSERT INTO Product_Size (pid, sid) VALUES (47, 20);
INSERT INTO Product_Size (pid, sid) VALUES (47, 21);
INSERT INTO Product_Size (pid, sid) VALUES (47, 22);

-- Product 48 (Business Suit) with sizes S, M, L, XL (Male)
INSERT INTO Product_Size (pid, sid) VALUES (48, 5);
INSERT INTO Product_Size (pid, sid) VALUES (48, 6);
INSERT INTO Product_Size (pid, sid) VALUES (48, 7);
INSERT INTO Product_Size (pid, sid) VALUES (48, 8);

-- Product 49 (Evening Gown) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (49, 12);
INSERT INTO Product_Size (pid, sid) VALUES (49, 10);
INSERT INTO Product_Size (pid, sid) VALUES (49, 15);
INSERT INTO Product_Size (pid, sid) VALUES (49, 16);

-- Product 50 (Casual Shirt) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (50, 19);
INSERT INTO Product_Size (pid, sid) VALUES (50, 20);
INSERT INTO Product_Size (pid, sid) VALUES (50, 21);
INSERT INTO Product_Size (pid, sid) VALUES (50, 22);

-- Product 51 (Yoga Pants) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (51, 12);
INSERT INTO Product_Size (pid, sid) VALUES (51, 10);
INSERT INTO Product_Size (pid, sid) VALUES (51, 15);
INSERT INTO Product_Size (pid, sid) VALUES (51, 16);

-- Product 52 (Leather Jacket) with sizes XS, S, M, L (Male)
INSERT INTO Product_Size (pid, sid) VALUES (52, 4);
INSERT INTO Product_Size (pid, sid) VALUES (52, 5);
INSERT INTO Product_Size (pid, sid) VALUES (52, 6);
INSERT INTO Product_Size (pid, sid) VALUES (52, 7);

-- Product 53 (Running Shorts) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (53, 19);
INSERT INTO Product_Size (pid, sid) VALUES (53, 20);
INSERT INTO Product_Size (pid, sid) VALUES (53, 21);
INSERT INTO Product_Size (pid, sid) VALUES (53, 22);

-- Product 54 (Formal Dress) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (54, 12);
INSERT INTO Product_Size (pid, sid) VALUES (54, 10);
INSERT INTO Product_Size (pid, sid) VALUES (54, 15);
INSERT INTO Product_Size (pid, sid) VALUES (54, 16);

-- Product 55 (Hiking Boots) with sizes S, M, L, XL (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (55, 20);
INSERT INTO Product_Size (pid, sid) VALUES (55, 21);
INSERT INTO Product_Size (pid, sid) VALUES (55, 22);
INSERT INTO Product_Size (pid, sid) VALUES (55, 23);

-- Product 56 (Sweater) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (56, 19);
INSERT INTO Product_Size (pid, sid) VALUES (56, 20);
INSERT INTO Product_Size (pid, sid) VALUES (56, 21);
INSERT INTO Product_Size (pid, sid) VALUES (56, 22);

-- Product 57 (Chinos) with sizes S, M, L, XL (Male)
INSERT INTO Product_Size (pid, sid) VALUES (57, 5);
INSERT INTO Product_Size (pid, sid) VALUES (57, 6);
INSERT INTO Product_Size (pid, sid) VALUES (57, 7);
INSERT INTO Product_Size (pid, sid) VALUES (57, 8);

-- Product 58 (Evening Dress) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (58, 12);
INSERT INTO Product_Size (pid, sid) VALUES (58, 10);
INSERT INTO Product_Size (pid, sid) VALUES (58, 15);
INSERT INTO Product_Size (pid, sid) VALUES (58, 16);

-- Product 59 (Casual Shorts) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (59, 19);
INSERT INTO Product_Size (pid, sid) VALUES (59, 20);
INSERT INTO Product_Size (pid, sid) VALUES (59, 21);
INSERT INTO Product_Size (pid, sid) VALUES (59, 22);

-- Product 60 (Sports Bra) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (60, 12);
INSERT INTO Product_Size (pid, sid) VALUES (60, 10);
INSERT INTO Product_Size (pid, sid) VALUES (60, 15);
INSERT INTO Product_Size (pid, sid) VALUES (60, 16);

-- Product 61 (Swim Trunks) with sizes S, M, L, XL (Male)
INSERT INTO Product_Size (pid, sid) VALUES (61, 5);
INSERT INTO Product_Size (pid, sid) VALUES (61, 6);
INSERT INTO Product_Size (pid, sid) VALUES (61, 7);
INSERT INTO Product_Size (pid, sid) VALUES (61, 8);

-- Product 62 (Cocktail Dress) with sizes XS, S, M, L (Female)
INSERT INTO Product_Size (pid, sid) VALUES (62, 12);
INSERT INTO Product_Size (pid, sid) VALUES (62, 10);
INSERT INTO Product_Size (pid, sid) VALUES (62, 15);
INSERT INTO Product_Size (pid, sid) VALUES (62, 16);

-- Product 63 (Casual Sneakers) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (63, 19);
INSERT INTO Product_Size (pid, sid) VALUES (63, 20);
INSERT INTO Product_Size (pid, sid) VALUES (63, 21);
INSERT INTO Product_Size (pid, sid) VALUES (63, 22);

-- Product 64 (Running Tights) with sizes XS, S, M, L (Unisex)
INSERT INTO Product_Size (pid, sid) VALUES (64, 19);
INSERT INTO Product_Size (pid, sid) VALUES (64, 20);
INSERT INTO Product_Size (pid, sid) VALUES (64, 21);
INSERT INTO Product_Size (pid, sid) VALUES (64, 22);

GO

