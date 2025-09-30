<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${isEdit ? 'Sửa' : 'Thêm'} Category</title>
    <style>
        .form-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-right: 10px;
        }
        .btn-primary {
            background-color: #28a745;
            color: white;
        }
        .btn-primary:hover {
            background-color: #218838;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        .form-actions {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>${isEdit ? 'Sửa' : 'Thêm'} Category</h1>
        
        <form action="/admin/categories/save" method="post">
            <c:if test="${isEdit}">
                <input type="hidden" name="categoryId" value="${category.categoryId}">
            </c:if>
            
            <div class="form-group">
                <label for="categoryName">Tên Category: *</label>
                <input type="text" id="categoryName" name="categoryName" value="${category.categoryName}" required>
            </div>
            
            <div class="form-group">
                <label for="images">Hình ảnh (URL):</label>
                <input type="text" id="images" name="images" value="${category.images}">
            </div>
            
            <div class="form-group">
                <label for="status">Trạng thái: *</label>
                <select id="status" name="status" required>
                    <option value="1" ${category.status == 1 ? 'selected' : ''}>Active</option>
                    <option value="0" ${category.status == 0 ? 'selected' : ''}>Inactive</option>
                </select>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Lưu</button>
                <a href="/admin/categories" class="btn btn-secondary">Hủy</a>
            </div>
        </form>
    </div>
</body>
</html>
