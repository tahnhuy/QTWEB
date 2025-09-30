<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Danh sách sản phẩm</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Open Sans', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .products-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .seller-section {
            margin-bottom: 40px;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .seller-header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .seller-header h2 {
            margin: 0;
            font-size: 24px;
        }
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }
        .product-card {
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .product-name {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .product-name a {
            color: #333;
            text-decoration: none;
        }
        .product-name a:hover {
            color: #007bff;
        }
        .product-code {
            color: #666;
            font-size: 14px;
            margin-bottom: 5px;
        }
        .product-price {
            color: #dc3545;
            font-size: 20px;
            font-weight: bold;
            margin: 10px 0;
        }
        .product-stock {
            color: #28a745;
            font-size: 14px;
        }
        .no-products {
            text-align: center;
            color: #666;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="products-container">
        <h1>Danh sách sản phẩm theo Seller</h1>
        
        <c:if test="${empty productsGroupedBySeller}">
            <div class="no-products">
                <p>Không có sản phẩm nào.</p>
            </div>
        </c:if>
        
        <c:forEach var="entry" items="${productsGroupedBySeller}">
            <div class="seller-section">
                <div class="seller-header">
                    <h2>Seller: ${entry.key.sellerName}</h2>
                </div>
                
                <div class="products-grid">
                    <c:forEach var="product" items="${entry.value}">
                        <div class="product-card">
                            <c:if test="${not empty product.images}">
                                <img src="${product.images}" alt="${product.productName}" class="product-image">
                            </c:if>
                            <c:if test="${empty product.images}">
                                <img src="/images/no-image.png" alt="No image" class="product-image">
                            </c:if>
                            
                            <div class="product-name">
                                <a href="/products/${product.productId}">${product.productName}</a>
                            </div>
                            
                            <div class="product-code">
                                Mã SP: ${product.productCode}
                            </div>
                            
                            <div class="product-price">
                                <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" />
                            </div>
                            
                            <div class="product-stock">
                                Còn lại: ${product.stock} sản phẩm
                            </div>
                            
                            <c:if test="${not empty product.category}">
                                <div style="color: #666; font-size: 14px; margin-top: 5px;">
                                    Danh mục: ${product.category.categoryName}
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
