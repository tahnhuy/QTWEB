<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - KiemTraQTWeb</title>
    <style>
        .welcome-container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            text-align: center;
        }
        .welcome-container h1 {
            color: white;
            font-size: 48px;
            margin-bottom: 15px;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }
        .welcome-container > p {
            font-size: 20px;
            color: rgba(255,255,255,0.95);
            margin-bottom: 30px;
            font-weight: 400;
        }
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-top: 40px;
        }
        .feature-card {
            background: rgba(255, 255, 255, 0.95);
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }
        .feature-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 32px rgba(0,0,0,0.2);
        }
        .feature-card h3 {
            color: #667eea;
            margin-bottom: 12px;
            font-size: 22px;
            font-weight: 600;
        }
        .feature-card p {
            color: #666;
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 15px;
        }
        .feature-card a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            transition: all 0.3s ease;
        }
        .feature-card a:hover {
            color: #764ba2;
        }
        .user-info {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .user-info p {
            color: #333;
            font-size: 16px;
            font-weight: 500;
        }
        .info-box {
            margin-top: 50px;
            padding: 30px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
        }
        .info-box h3 {
            color: #667eea;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: 600;
        }
        .info-box p {
            color: #333;
            font-size: 16px;
            margin: 8px 0;
        }
    </style>
</head>
<body>
    <div class="welcome-container">
        <c:if test="${not empty sessionScope.username}">
            <div class="user-info">
                <p>Xin chào, <strong>${sessionScope.fullname}</strong> (${sessionScope.roleName})!</p>
            </div>
        </c:if>
        
        <h1>Chào mừng đến KiemTraQTWeb</h1>
        <p>Hệ thống quản lý sản phẩm và người dùng</p>
        
        <div class="features">
            <div class="feature-card">
                <h3>Xem Sản phẩm</h3>
                <p>Duyệt qua danh sách sản phẩm được nhóm theo Seller</p>
                <a href="/products" style="color: #007bff; text-decoration: none;">Xem ngay →</a>
            </div>
            
            <c:if test="${sessionScope.roleName == 'ADMIN'}">
                <div class="feature-card">
                    <h3>Quản lý User</h3>
                    <p>Thêm, sửa, xóa người dùng trong hệ thống</p>
                    <a href="/admin/users" style="color: #007bff; text-decoration: none;">Quản lý →</a>
                </div>
                
                <div class="feature-card">
                    <h3>Quản lý Category</h3>
                    <p>Quản lý danh mục sản phẩm</p>
                    <a href="/admin/categories" style="color: #007bff; text-decoration: none;">Quản lý →</a>
                </div>
            </c:if>
            
            <c:if test="${empty sessionScope.username}">
                <div class="feature-card">
                    <h3>Đăng nhập</h3>
                    <p>Đăng nhập để truy cập đầy đủ tính năng</p>
                    <a href="/login" style="color: #007bff; text-decoration: none;">Đăng nhập →</a>
                </div>
                
                <div class="feature-card">
                    <h3>Đăng ký</h3>
                    <p>Tạo tài khoản mới miễn phí</p>
                    <a href="/register" style="color: #007bff; text-decoration: none;">Đăng ký →</a>
                </div>
            </c:if>
        </div>
        
        <div class="info-box">
            <h3>📋 Thông tin sinh viên</h3>
            <p><strong>Họ tên:</strong> Nguyễn Nhật Huy</p>
            <p><strong>MSSV:</strong> 23110226</p>
            <p><strong>Mã đề:</strong> Đề số 12</p>
        </div>
    </div>
</body>
</html>


