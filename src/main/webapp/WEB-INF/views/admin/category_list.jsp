<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Category</title>
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
            background-color: #28a745;
            color: white;
            font-weight: bold;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .category-image {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 4px;
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
    </style>
</head>
<body>
    <div class="admin-container">
        <h1>Quản lý Category</h1>
        
        <div class="actions">
            <a href="/admin/categories/new" class="btn btn-primary">Thêm Category mới</a>
            <a href="/admin/users" class="btn btn-primary">Quản lý User</a>
            <a href="/" class="btn btn-warning">Về trang chủ</a>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên Category</th>
                    <th>Hình ảnh</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="category" items="${categoryPage.content}">
                    <tr>
                        <td>${category.categoryId}</td>
                        <td>${category.categoryName}</td>
                        <td>
                            <c:if test="${not empty category.images}">
                                <img src="${category.images}" alt="${category.categoryName}" class="category-image">
                            </c:if>
                            <c:if test="${empty category.images}">
                                <span style="color: #999;">Chưa có ảnh</span>
                            </c:if>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${category.status == 1}">
                                    <span style="color: green;">Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span style="color: red;">Inactive</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="/admin/categories/edit/${category.categoryId}" class="btn btn-warning" style="padding: 5px 10px; font-size: 14px;">Sửa</a>
                            <a href="/admin/categories/delete/${category.categoryId}" class="btn btn-danger" style="padding: 5px 10px; font-size: 14px;" 
                               onclick="return confirm('Bạn có chắc muốn xóa category này?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty categoryPage.content}">
                    <tr>
                        <td colspan="5" style="text-align: center;">Không có dữ liệu</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        
        <div class="pagination">
            <c:if test="${currentPage > 0}">
                <a href="/admin/categories?page=0">Đầu</a>
                <a href="/admin/categories?page=${currentPage - 1}">Trước</a>
            </c:if>
            
            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <a href="#" class="active">${i + 1}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/admin/categories?page=${i}">${i + 1}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <c:if test="${currentPage < totalPages - 1}">
                <a href="/admin/categories?page=${currentPage + 1}">Sau</a>
                <a href="/admin/categories?page=${totalPages - 1}">Cuối</a>
            </c:if>
        </div>
        
        <p style="text-align: center; margin-top: 10px;">
            Trang ${currentPage + 1} / ${totalPages} - Tổng ${totalItems} categories
        </p>
    </div>
</body>
</html>
