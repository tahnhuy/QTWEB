package com.nhathuy.ktraqtweb.service.impl;

import com.nhathuy.ktraqtweb.entity.Product_23110226;
import com.nhathuy.ktraqtweb.entity.Seller_23110226;
import com.nhathuy.ktraqtweb.repository.ProductRepository_23110226;
import com.nhathuy.ktraqtweb.service.ProductService_23110226;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl_23110226 implements ProductService_23110226 {

    private final ProductRepository_23110226 productRepository;

    public ProductServiceImpl_23110226(ProductRepository_23110226 productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public List<Product_23110226> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Optional<Product_23110226> findById(Long id) {
        return productRepository.findById(id);
    }

    @Override
    public Map<Seller_23110226, List<Product_23110226>> findAllProductsGroupedBySeller() {
        List<Product_23110226> allProducts = productRepository.findAll();
        
        // Tạo Map mới để tránh ConcurrentModificationException
        Map<Seller_23110226, List<Product_23110226>> groupedProducts = new LinkedHashMap<>();
        
        for (Product_23110226 product : allProducts) {
            if (product.getSeller() != null) {
                Seller_23110226 seller = product.getSeller();
                
                // Nếu seller chưa có trong map, tạo list mới
                if (!groupedProducts.containsKey(seller)) {
                    groupedProducts.put(seller, new ArrayList<>());
                }
                
                // Thêm product vào list của seller
                groupedProducts.get(seller).add(product);
            }
        }
        
        return groupedProducts;
    }
}
