<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${isEdit ? 'Sửa' : 'Thêm'} User</title>
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
        input[type="email"],
        input[type="password"],
        input[type="number"],
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
            background-color: #007bff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
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
        <h1>${isEdit ? 'Sửa' : 'Thêm'} User</h1>
        
        <form action="/admin/users/save" method="post">
            <c:if test="${isEdit}">
                <input type="hidden" name="userId" value="${user.userId}">
            </c:if>
            
            <div class="form-group">
                <label for="username">Username: *</label>
                <input type="text" id="username" name="username" value="${user.username}" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email: *</label>
                <input type="email" id="email" name="email" value="${user.email}" required>
            </div>
            
            <div class="form-group">
                <label for="fullname">Họ và tên: *</label>
                <input type="text" id="fullname" name="fullname" value="${user.fullname}" required>
            </div>
            
            <div class="form-group">
                <label for="password">Mật khẩu: ${isEdit ? '(Để trống nếu không đổi)' : '*'}</label>
                <input type="password" id="password" name="password" ${!isEdit ? 'required' : ''}>
            </div>
            
            <div class="form-group">
                <label for="phone">Số điện thoại:</label>
                <input type="text" id="phone" name="phone" value="${user.phone}">
            </div>
            
            <div class="form-group">
                <label for="roleId">Role: *</label>
                <select id="roleId" name="roleId" required>
                    <option value="">-- Chọn Role --</option>
                    <c:forEach var="role" items="${roles}">
                        <option value="${role.roleId}" ${user.role.roleId == role.roleId ? 'selected' : ''}>
                            ${role.roleName}
                        </option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-group">
                <label for="status">Trạng thái: *</label>
                <select id="status" name="status" required>
                    <option value="1" ${user.status == 1 ? 'selected' : ''}>Active</option>
                    <option value="0" ${user.status == 0 ? 'selected' : ''}>Inactive</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="images">Ảnh đại diện (URL):</label>
                <input type="text" id="images" name="images" value="${user.images}">
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Lưu</button>
                <a href="/admin/users" class="btn btn-secondary">Hủy</a>
            </div>
        </form>
    </div>
</body>
</html>
