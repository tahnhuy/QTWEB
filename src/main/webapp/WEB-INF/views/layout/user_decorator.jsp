<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="sitemesh" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title><sitemesh:write property='title'>KiemTraQTWeb - User</sitemesh:write></title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Open Sans', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
        }
        body {
            font-family: 'Open Sans', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            border-bottom: 3px solid #667eea;
        }
        header * {
            font-family: 'Open Sans', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
        }
        nav {
            max-width: 1200px;
            margin: 0 auto;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .nav-left {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .nav-right {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        nav a {
            color: #667eea;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            font-size: 14px;
        }
        nav a:hover {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(102, 126, 234, 0.3);
        }
        .user-greeting {
            color: #333;
            font-size: 14px;
            font-weight: 500;
            padding: 8px 15px;
            background: #f0f0f0;
            border-radius: 20px;
        }
        main {
            flex: 1;
            padding: 20px 0;
        }
        footer {
            background: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(10px);
            color: white;
            text-align: center;
            padding: 25px;
            margin-top: auto;
            border-top: 3px solid #667eea;
        }
        footer * {
            font-family: 'Open Sans', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
        }
        footer p {
            font-size: 14px;
            line-height: 1.8;
        }
    </style>
    <sitemesh:write property='head'/>
</head>
<body>
<header>
    <nav>
        <div class="nav-left">
            <a href="/">Trang Chủ</a>
            <a href="/products">Sản phẩm</a>
            <c:if test="${sessionScope.roleName == 'ADMIN'}">
                <a href="/admin/users">Quản trị</a>
            </c:if>
        </div>
        <div class="nav-right">
            <c:choose>
                <c:when test="${not empty sessionScope.username}">
                    <span class="user-greeting">${sessionScope.fullname}</span>
                    <a href="/logout">Đăng xuất</a>
                </c:when>
                <c:otherwise>
                    <a href="/login">Đăng nhập</a>
                    <a href="/register">Đăng ký</a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
</header>

<main>
    <sitemesh:write property='body'/>
</main>

<footer>
    <p><strong>Họ tên:</strong> Nguyễn Nhật Huy | <strong>MSSV:</strong> 23110226 | <strong>Mã đề:</strong> Đề số 12</p>
    <p style="margin-top: 8px; font-size: 13px; opacity: 0.9;">© 2025 KiemTraQTWeb - Lập Trình Web</p>
</footer>
</body>
</html>


