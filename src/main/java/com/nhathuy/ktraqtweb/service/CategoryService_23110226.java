package com.nhathuy.ktraqtweb.service;

import com.nhathuy.ktraqtweb.entity.Category_23110226;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface CategoryService_23110226 {
    List<Category_23110226> findAll();
    Page<Category_23110226> findAll(Pageable pageable);
    Optional<Category_23110226> findById(Integer id);
    Category_23110226 save(Category_23110226 category);
    void deleteById(Integer id);
}
