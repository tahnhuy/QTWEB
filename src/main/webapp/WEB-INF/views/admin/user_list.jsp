<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý User</title>
    <style>
        .admin-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .actions {
            margin-bottom: 20px;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-warning {
            background-color: #ffc107;
            color: #333;
        }
        .btn-warning:hover {
            background-color: #e0a800;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .pagination {
            margin-top: 20px;
            text-align: center;
        }
        .pagination a {
            padding: 8px 12px;
            margin: 0 5px;
            border: 1px solid #ddd;
            text-decoration: none;
            color: #007bff;
            border-radius: 4px;
        }
        .pagination a:hover {
            background-color: #007bff;
            color: white;
        }
        .pagination .active {
            background-color: #007bff;
            color: white;
        }
        .pagination .disabled {
            color: #999;
            pointer-events: none;
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <h1>Quản lý User</h1>
        
        <div class="actions">
            <a href="/admin/users/new" class="btn btn-primary">Thêm User mới</a>
            <a href="/admin/categories" class="btn btn-primary">Quản lý Category</a>
            <a href="/" class="btn btn-warning">Về trang chủ</a>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Họ tên</th>
                    <th>Số điện thoại</th>
                    <th>Role</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userPage.content}">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.fullname}</td>
                        <td>${user.phone}</td>
                        <td>${user.role.roleName}</td>
                        <td>
                            <c:choose>
                                <c:when test="${user.status == 1}">
                                    <span style="color: green;">Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: red;">Inactive</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="/admin/users/edit/${user.userId}" class="btn btn-warning" style="padding: 5px 10px; font-size: 14px;">Sửa</a>
                            <a href="/admin/users/delete/${user.userId}" class="btn btn-danger" style="padding: 5px 10px; font-size: 14px;" 
                               onclick="return confirm('Bạn có chắc muốn xóa user này?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty userPage.content}">
                    <tr>
                        <td colspan="8" style="text-align: center;">Không có dữ liệu</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        
        <div class="pagination">
            <c:if test="${currentPage > 0}">
                <a href="/admin/users?page=0">Đầu</a>
                <a href="/admin/users?page=${currentPage - 1}">Trước</a>
            </c:if>
            
            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <a href="#" class="active">${i + 1}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/admin/users?page=${i}">${i + 1}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <c:if test="${currentPage < totalPages - 1}">
                <a href="/admin/users?page=${currentPage + 1}">Sau</a>
                <a href="/admin/users?page=${totalPages - 1}">Cuối</a>
            </c:if>
        </div>
        
        <p style="text-align: center; margin-top: 10px;">
            Trang ${currentPage + 1} / ${totalPages} - Tổng ${totalItems} users
        </p>
    </div>
</body>
</html>
