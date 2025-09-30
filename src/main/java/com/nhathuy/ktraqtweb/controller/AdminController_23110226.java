package com.nhathuy.ktraqtweb.controller;

import com.nhathuy.ktraqtweb.entity.Category_23110226;
import com.nhathuy.ktraqtweb.entity.UserRoles_23110226;
import com.nhathuy.ktraqtweb.entity.Users_23110226;
import com.nhathuy.ktraqtweb.repository.UserRoleRepository_23110226;
import com.nhathuy.ktraqtweb.service.CategoryService_23110226;
import com.nhathuy.ktraqtweb.service.UserService_23110226;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController_23110226 {

    private final UserService_23110226 userService;
    private final CategoryService_23110226 categoryService;
    private final UserRoleRepository_23110226 userRoleRepository;

    public AdminController_23110226(UserService_23110226 userService,
                                     CategoryService_23110226 categoryService,
                                     UserRoleRepository_23110226 userRoleRepository) {
        this.userService = userService;
        this.categoryService = categoryService;
        this.userRoleRepository = userRoleRepository;
    }

    // ==================== USER MANAGEMENT ====================
    
    @GetMapping("/users")
    public String listUsers(@RequestParam(defaultValue = "0") int page,
                           @RequestParam(defaultValue = "10") int size,
                           Model model) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("userId").descending());
        Page<Users_23110226> userPage = userService.findAll(pageable);
        
        model.addAttribute("userPage", userPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", userPage.getTotalPages());
        model.addAttribute("totalItems", userPage.getTotalElements());
        
        return "admin/user_list";
    }

    @GetMapping("/users/new")
    public String showUserForm(Model model) {
        model.addAttribute("user", new Users_23110226());
        model.addAttribute("roles", userRoleRepository.findAll());
        model.addAttribute("isEdit", false);
        return "admin/user_form";
    }

    @GetMapping("/users/edit/{id}")
    public String showEditUserForm(@PathVariable Integer id, Model model) {
        Optional<Users_23110226> userOpt = userService.findById(id);
        if (userOpt.isPresent()) {
            model.addAttribute("user", userOpt.get());
            model.addAttribute("roles", userRoleRepository.findAll());
            model.addAttribute("isEdit", true);
            return "admin/user_form";
        }
        return "redirect:/admin/users";
    }

    @PostMapping("/users/save")
    public String saveUser(@ModelAttribute Users_23110226 user,
                          @RequestParam Integer roleId) {
        // Gán role
        UserRoles_23110226 role = userRoleRepository.findById(roleId)
                .orElseThrow(() -> new RuntimeException("Role không tồn tại!"));
        user.setRole(role);
        
        // Nếu là user mới và chưa có status, set mặc định là 1
        if (user.getUserId() == null && user.getStatus() == null) {
            user.setStatus(1);
        }
        
        userService.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable Integer id) {
        userService.deleteById(id);
        return "redirect:/admin/users";
    }

    // ==================== CATEGORY MANAGEMENT ====================
    
    @GetMapping("/categories")
    public String listCategories(@RequestParam(defaultValue = "0") int page,
                                 @RequestParam(defaultValue = "10") int size,
                                 Model model) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("categoryId").descending());
        Page<Category_23110226> categoryPage = categoryService.findAll(pageable);
        
        model.addAttribute("categoryPage", categoryPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", categoryPage.getTotalPages());
        model.addAttribute("totalItems", categoryPage.getTotalElements());
        
        return "admin/category_list";
    }

    @GetMapping("/categories/new")
    public String showCategoryForm(Model model) {
        model.addAttribute("category", new Category_23110226());
        model.addAttribute("isEdit", false);
        return "admin/category_form";
    }

    @GetMapping("/categories/edit/{id}")
    public String showEditCategoryForm(@PathVariable Integer id, Model model) {
        Optional<Category_23110226> categoryOpt = categoryService.findById(id);
        if (categoryOpt.isPresent()) {
            model.addAttribute("category", categoryOpt.get());
            model.addAttribute("isEdit", true);
            return "admin/category_form";
        }
        return "redirect:/admin/categories";
    }

    @PostMapping("/categories/save")
    public String saveCategory(@ModelAttribute Category_23110226 category) {
        // Nếu là category mới và chưa có status, set mặc định là 1
        if (category.getCategoryId() == null && category.getStatus() == null) {
            category.setStatus(1);
        }
        categoryService.save(category);
        return "redirect:/admin/categories";
    }

    @GetMapping("/categories/delete/{id}")
    public String deleteCategory(@PathVariable Integer id) {
        categoryService.deleteById(id);
        return "redirect:/admin/categories";
    }
}
