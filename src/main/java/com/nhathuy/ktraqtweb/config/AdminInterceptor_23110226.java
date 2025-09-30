package com.nhathuy.ktraqtweb.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AdminInterceptor_23110226 implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("userId") == null) {
            // Chưa đăng nhập
            response.sendRedirect("/login");
            return false;
        }
        
        String roleName = (String) session.getAttribute("roleName");
        if (!"ADMIN".equals(roleName)) {
            // Không phải ADMIN
            response.sendRedirect("/");
            return false;
        }
        
        return true;
    }
}
