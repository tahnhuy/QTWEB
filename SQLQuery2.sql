use KiemTraQTWeb;
go

INSERT INTO UserRoles (roleName) VALUES
('ADMIN'),
('USER'),
('SELLER');
GO

INSERT INTO Seller (sellerName, images, status) VALUES
('Shop Đồ Công Nghệ A', 'img_seller_a.jpg', 1),
('Nhà Sách Trực Tuyến B', 'img_seller_b.jpg', 1),
('Thời Trang X', 'img_seller_x.jpg', 1);
GO

INSERT INTO Users (username, email, fullname, password, images, phone, status, code, roleId, sellerId) VALUES
-- Admin (roleId = 1)
('admin', 'admin@shop.com', 'Nguyễn Văn Admin', '123', NULL, '0901234567', 1, 'ADM001', 1, NULL), 

-- User thường (roleId = 2)
('user1', 'user1@email.com', 'Trần Thị Khách', '123', NULL, '0912345678', 1, 'USR001', 2, NULL),

-- Seller (roleId = 3, liên kết với sellerId = 1)
('seller_a', 'seller_a@shop.com', 'Lê Văn Bán', '123', 'img_seller_avatar.jpg', '0987654321', 1, 'SEL001', 3, 1);
GO

INSERT INTO Category (categoryName, images, status) VALUES
('Điện Thoại', NULL, 1),
('Laptop', NULL, 1),
('Sách', NULL, 1),
('Phụ kiện', NULL, 1);
GO

INSERT INTO Product (productName, productCode, categoryId, description, price, amount, stock, images, wishlist, status, createDate, sellerId) VALUES
-- Sản phẩm 1 (Seller 1 - Shop Đồ Công Nghệ A, Category 1 - Điện Thoại)
('Smartphone X Pro', 'PX001', 1, 'Mô tả chi tiết Smartphone X Pro. Camera 108MP.', 15000000.0, 150, 25, 'phone_xpro.jpg', 50, 1, GETDATE(), 1),

-- Sản phẩm 2 (Seller 1 - Shop Đồ Công Nghệ A, Category 2 - Laptop)
('Laptop Gaming Z', 'PZ002', 2, 'Mô tả chi tiết Laptop Gaming Z. RAM 32GB, Core i9.', 32500000.0, 100, 10, 'laptop_z.jpg', 30, 1, GETDATE(), 1),

-- Sản phẩm 3 (Seller 2 - Nhà Sách Trực Tuyến B, Category 3 - Sách)
('Sách Phát Triển Bản Thân', 'PSB003', 3, 'Mô tả chi tiết Sách Phát Triển Bản Thân. Tác giả: A.', 120000.0, 500, 450, 'sach_a.jpg', 120, 1, GETDATE(), 2),

-- Sản phẩm 4 (Seller 3 - Thời Trang X, Category 4 - Phụ kiện)
('Tai Nghe Bluetooth TWS', 'PTN004', 4, 'Mô tả chi tiết Tai Nghe Bluetooth. Pin 24h.', 850000.0, 200, 150, 'tainghe_tws.jpg', 75, 1, GETDATE(), 3);
GO

-- Cart for user1 (userId = 2)
INSERT INTO Cart (cartId, userId, buyDate, status) VALUES
('CART-USR001-01', 2, '2025-09-30 10:00:00', 0); -- status 0: Đang chờ

-- CartItem for the above cart
INSERT INTO CartItem (cartItemId, quantity, unitPrice, productId, cartId) VALUES
-- Thêm Smartphone X Pro (productId = 1) vào giỏ
('ITEM-C01-P01', 1, 15000000.0, 1, 'CART-USR001-01'), 
-- Thêm Sách Phát Triển Bản Thân (productId = 3) vào giỏ
('ITEM-C01-P03', 2, 120000.0, 3, 'CART-USR001-01');
GO