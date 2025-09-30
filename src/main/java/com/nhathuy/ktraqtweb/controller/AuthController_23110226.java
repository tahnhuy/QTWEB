package com.nhathuy.ktraqtweb.controller;

import com.nhathuy.ktraqtweb.entity.Users_23110226;
import com.nhathuy.ktraqtweb.service.UserService_23110226;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class AuthController_23110226 {

    private final UserService_23110226 userService;

    public AuthController_23110226(UserService_23110226 userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                       @RequestParam String password,
                       HttpSession session,
                       Model model) {
        try {
            if (userService.authenticate(username, password)) {
                Optional<Users_23110226> userOpt = userService.findByUsername(username);
                if (userOpt.isPresent()) {
                    Users_23110226 user = userOpt.get();
                    
                    // Lưu thông tin vào session
                    session.setAttribute("userId", user.getUserId());
                    session.setAttribute("username", user.getUsername());
                    session.setAttribute("fullname", user.getFullname());
                    session.setAttribute("roleName", user.getRole().getRoleName());
                    session.setAttribute("roleId", user.getRole().getRoleId());
                    
                    // Redirect theo role
                    if ("ADMIN".equals(user.getRole().getRoleName())) {
                        return "redirect:/admin/users";
                    } else {
                        return "redirect:/";
                    }
                }
            }
            
            model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            return "login";
        } catch (Exception e) {
            model.addAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
            return "login";
        }
    }

    @GetMapping("/register")
    public String showRegisterForm() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String username,
                          @RequestParam String email,
                          @RequestParam String fullname,
                          @RequestParam String password,
                          @RequestParam String confirmPassword,
                          Model model) {
        try {
            // Kiểm tra password khớp
            if (!password.equals(confirmPassword)) {
                model.addAttribute("error", "Mật khẩu xác nhận không khớp!");
                return "register";
            }

            // Đăng ký user mới
            userService.register(username, email, fullname, password);
            model.addAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập.");
            return "login";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "register";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
