# PLAIN TEXT PASSWORD - ĐƠN GIẢN HÓA

## ✅ ĐÃ LOẠI BỎ HOÀN TOÀN MÃ HÓA PASSWORD

### Các thay đổi đã thực hiện:

1. **Xóa BCrypt dependency** từ `pom.xml`
2. **Đơn giản hóa UserServiceImpl_23110226:**
   - Xóa BCryptPasswordEncoder
   - Xóa tất cả logging
   - `authenticate()` chỉ so sánh: `password.equals(storedPassword)`
   - `register()` lưu plain text password
   - `save()` lưu trực tiếp không mã hóa

3. **Update Entity Users_23110226:**
   - Password field không cần length = 255

---

## 🗄️ TẠO LẠI DATABASE

### Bước 1: Drop và Create Database

```sql
-- Drop database cũ
USE master;
GO
DROP DATABASE IF EXISTS KiemTraQTWeb;
GO

-- Create database mới
CREATE DATABASE KiemTraQTWeb;
GO
USE KiemTraQTWeb;
GO
```

### Bước 2: Chạy SQLQuery1.sql

Chạy file `SQLQuery1.sql` để tạo tất cả tables.

### Bước 3: Chạy SQLQuery2.sql

Chạy file `SQLQuery2.sql` để insert data mẫu.

**Lưu ý:** Password trong SQLQuery2.sql đã là plain text '123'

---

## 🚀 CHẠY ỨNG DỤNG

### 1. Clean và Build:

```bash
mvn clean install
```

### 2. Start Application:

```bash
mvn spring-boot:run
```

### 3. Login:

**Admin:**
- Username: `admin`
- Password: `123`

**User:**
- Username: `user1`
- Password: `123`

**Seller:**
- Username: `seller_a`
- Password: `123`

---

## 📝 LOGIC AUTHENTICATION ĐƠN GIẢN

```java
@Override
public boolean authenticate(String username, String password) {
    Optional<Users_23110226> userOpt = userRepository.findByUsername(username);
    if (userOpt.isPresent()) {
        Users_23110226 user = userOpt.get();
        // So sánh plain text password
        return password.equals(user.getPassword());
    }
    return false;
}
```

---

## ✅ ƯU ĐIỂM

1. **Đơn giản:** Không cần BCrypt, không cần hash
2. **Dễ debug:** Password trong DB dễ đọc
3. **Phù hợp:** Môi trường học tập/test
4. **Nhanh:** Không tốn thời gian hash/compare

---

## ⚠️ LƯU Ý BẢO MẬT

**KHÔNG SỬ DỤNG PLAIN TEXT PASSWORD TRONG PRODUCTION!**

Đây chỉ phù hợp cho:
- ✅ Môi trường học tập
- ✅ Demo/Test
- ✅ Development local

Trong production thực tế, **BẮT BUỘC** phải mã hóa password!

---

## 🔧 TROUBLESHOOTING

### Nếu vẫn lỗi login:

1. **Verify database:**
   ```sql
   SELECT username, password, roleId FROM Users;
   ```

2. **Check password trong DB:**
   - Phải là '123' (plain text)
   - KHÔNG phải '$2a$...' (BCrypt hash)

3. **Restart application** sau khi clean build

---

**Ngày cập nhật:** 30/09/2025  
**Sinh viên:** Nguyễn Nhật Huy - 23110226

**BÂY GIỜ LOGIN ĐƠN GIẢN VÀ DỄ DÀNG!** 🎉
