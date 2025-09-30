# FIX DATABASE MAPPING - HƯỚNG DẪN

## VẤN ĐỀ ĐÃ FIX

Lỗi: `Invalid column name 'user_id'` xảy ra vì JPA tự động convert camelCase sang snake_case, nhưng database của bạn sử dụng camelCase.

## GIẢI PHÁP ĐÃ THỰC HIỆN

### 1. ✅ **QUAN TRỌNG NHẤT** - Đã fix Hibernate Naming Strategy:

Thêm vào `application.properties`:
```properties
spring.jpa.hibernate.naming.physical-strategy=org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl
spring.jpa.hibernate.naming.implicit-strategy=org.hibernate.boot.model.naming.ImplicitNamingStrategyJpaCompliantImpl
```

Điều này ngăn Hibernate convert `userId` → `user_id`

### 2. ✅ Đã thêm `@Column` annotation cho TẤT CẢ entities:

- **Users_23110226.java** - Tất cả fields đã có `@Column(name = "...")`
- **UserRoles_23110226.java** - Đã fix
- **Product_23110226.java** - Đã fix
- **Category_23110226.java** - Đã fix
- **Seller_23110226.java** - Đã fix
- **Cart_23110226.java** - Đã fix
- **CartItem_23110226.java** - Đã fix

### 3. ✅ Đã update password field để hỗ trợ BCrypt:

```java
@Column(name = "password", length = 255)
private String password;
```

## CÁC BƯỚC THỰC HIỆN

### Bước 1: Chạy SQL Update (QUAN TRỌNG!)

Chạy file `SQLQuery_UpdatePassword.sql` để:
- Update password column từ NVARCHAR(50) → NVARCHAR(255)
- Update tất cả password '123' thành BCrypt hash

```sql
-- Chạy trong SQL Server Management Studio
USE KiemTraQTWeb;
GO

ALTER TABLE Users
ALTER COLUMN password NVARCHAR(255);
GO

UPDATE Users
SET password = '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy'
WHERE password = '123';
GO
```

### Bước 2: Clean và Rebuild Project

```bash
mvn clean install
```

### Bước 3: Restart Application

Restart ứng dụng Spring Boot

### Bước 4: Test Login

**Thông tin đăng nhập:**
- Username: `admin`
- Password: `123`

hoặc

- Username: `user1`  
- Password: `123`

## MAPPING ĐÃ FIX

| Entity Field | Database Column | Status |
|-------------|-----------------|--------|
| userId | userId | ✅ Fixed |
| username | username | ✅ Fixed |
| email | email | ✅ Fixed |
| fullname | fullname | ✅ Fixed |
| password | password | ✅ Fixed (255 chars) |
| roleId | roleId | ✅ Fixed |
| sellerId | sellerId | ✅ Fixed |
| productId | productId | ✅ Fixed |
| categoryId | categoryId | ✅ Fixed |
| cartId | cartId | ✅ Fixed |

## LƯU Ý

1. **PHẢI chạy SQL update** trước khi test login
2. Password '123' đã được hash thành BCrypt
3. Tất cả user mới đăng ký sẽ tự động hash password
4. Column names giờ match 100% với database

## KẾT QUẢ MONG ĐỢI

✅ Login thành công  
✅ Không còn lỗi "Invalid column name"  
✅ BCrypt password hoạt động  
✅ Session được tạo đúng  
✅ Redirect theo role (ADMIN → /admin/users, USER → /)

---

**Ngày fix:** 30/09/2025  
**Sinh viên:** Nguyễn Nhật Huy - 23110226
