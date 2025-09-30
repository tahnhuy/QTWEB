package com.nhathuy.ktraqtweb.service.impl;

import com.nhathuy.ktraqtweb.entity.Category_23110226;
import com.nhathuy.ktraqtweb.repository.CategoryRepository_23110226;
import com.nhathuy.ktraqtweb.service.CategoryService_23110226;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl_23110226 implements CategoryService_23110226 {

    private final CategoryRepository_23110226 categoryRepository;

    public CategoryServiceImpl_23110226(CategoryRepository_23110226 categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<Category_23110226> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Page<Category_23110226> findAll(Pageable pageable) {
        return categoryRepository.findAll(pageable);
    }

    @Override
    public Optional<Category_23110226> findById(Integer id) {
        return categoryRepository.findById(id);
    }

    @Override
    public Category_23110226 save(Category_23110226 category) {
        return categoryRepository.save(category);
    }

    @Override
    public void deleteById(Integer id) {
        categoryRepository.deleteById(id);
    }
}
