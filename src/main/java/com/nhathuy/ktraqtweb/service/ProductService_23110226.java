package com.nhathuy.ktraqtweb.service;

import com.nhathuy.ktraqtweb.entity.Product_23110226;
import com.nhathuy.ktraqtweb.entity.Seller_23110226;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface ProductService_23110226 {
    List<Product_23110226> findAll();
    Optional<Product_23110226> findById(Long id);
    Map<Seller_23110226, List<Product_23110226>> findAllProductsGroupedBySeller();
}
