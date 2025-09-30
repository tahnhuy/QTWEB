<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <title>${product.productName} - Chi tiết sản phẩm</title>
    <style>
        .product-detail-container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
        .product-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }
        .product-image-section img {
            width: 100%;
            border-radius: 8px;
            border: 1px solid #ddd;
        }
        .product-info-section h1 {
            color: #333;
            margin-bottom: 15px;
        }
        .info-row {
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        .info-label {
            font-weight: bold;
            color: #555;
            display: inline-block;
            width: 150px;
        }
        .info-value {
            color: #333;
        }
        .price {
            font-size: 28px;
            color: #dc3545;
            font-weight: bold;
        }
        .description-section {
            grid-column: 1 / -1;
            margin-top: 30px;
            padding-top: 30px;
            border-top: 2px solid #ddd;
        }
        .description-section h2 {
            color: #333;
            margin-bottom: 15px;
        }
        .description-content {
            line-height: 1.6;
            color: #555;
        }
        .status-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 14px;
        }
        .status-active {
            background-color: #d4edda;
            color: #155724;
        }
        .status-inactive {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="product-detail-container">
        <a href="/products" class="back-link">← Quay lại danh sách sản phẩm</a>
        
        <div class="product-content">
            <div class="product-image-section">
                <c:if test="${not empty product.images}">
                    <img src="${product.images}" alt="${product.productName}">
                </c:if>
                <c:if test="${empty product.images}">
                    <img src="/images/no-image.png" alt="No image">
                </c:if>
            </div>
            
            <div class="product-info-section">
                <h1>${product.productName}</h1>
                
                <div class="info-row">
                    <span class="info-label">Mã sản phẩm:</span>
                    <span class="info-value">${product.productCode}</span>
                </div>
                
                <div class="info-row">
                    <span class="info-label">Giá:</span>
                    <span class="price">
                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                    </span>
                </div>
                
                <div class="info-row">
                    <span class="info-label">Số lượng:</span>
                    <span class="info-value">${product.amount}</span>
                </div>
                
                <div class="info-row">
                    <span class="info-label">Còn lại:</span>
                    <span class="info-value">${product.stock} sản phẩm</span>
                </div>
                
                <c:if test="${not empty product.category}">
                    <div class="info-row">
                        <span class="info-label">Danh mục:</span>
                        <span class="info-value">${product.category.categoryName}</span>
                    </div>
                </c:if>
                
                <c:if test="${not empty product.seller}">
                    <div class="info-row">
                        <span class="info-label">Người bán:</span>
                        <span class="info-value">${product.seller.sellerName}</span>
                    </div>
                </c:if>
                
                <div class="info-row">
                    <span class="info-label">Ngày tạo:</span>
                    <span class="info-value">
                        <fmt:formatDate value="${product.createDate}" pattern="dd/MM/yyyy" />
                    </span>
                </div>
                
                <div class="info-row">
                    <span class="info-label">Trạng thái:</span>
                    <c:choose>
                        <c:when test="${product.status == 1}">
                            <span class="status-badge status-active">Đang bán</span>
                        </c:when>
                        <c:otherwise>
                            <span class="status-badge status-inactive">Ngừng bán</span>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <c:if test="${product.wishlist != null && product.wishlist > 0}">
                    <div class="info-row">
                        <span class="info-label">Yêu thích:</span>
                        <span class="info-value">${product.wishlist} người</span>
                    </div>
                </c:if>
            </div>
            
            <div class="description-section">
                <h2>Mô tả sản phẩm</h2>
                <div class="description-content">
                    <c:if test="${not empty product.description}">
                        ${product.description}
                    </c:if>
                    <c:if test="${empty product.description}">
                        <p style="color: #999;">Chưa có mô tả cho sản phẩm này.</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
