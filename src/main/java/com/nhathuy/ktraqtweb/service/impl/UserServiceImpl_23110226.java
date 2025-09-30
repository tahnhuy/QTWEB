package com.nhathuy.ktraqtweb.service.impl;

import com.nhathuy.ktraqtweb.entity.UserRoles_23110226;
import com.nhathuy.ktraqtweb.repository.UserRepository_23110226;
import com.nhathuy.ktraqtweb.repository.UserRoleRepository_23110226;
import com.nhathuy.ktraqtweb.service.UserService_23110226;
import com.nhathuy.ktraqtweb.entity.Users_23110226;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl_23110226 implements UserService_23110226 {
    
    private final UserRepository_23110226 userRepository;
    private final UserRoleRepository_23110226 userRoleRepository;

    public UserServiceImpl_23110226(UserRepository_23110226 userRepository, 
                                     UserRoleRepository_23110226 userRoleRepository) {
        this.userRepository = userRepository;
        this.userRoleRepository = userRoleRepository;
    }

    @Override
    public List<Users_23110226> findAll() {
        return userRepository.findAll();
    }

    @Override
    public Page<Users_23110226> findAll(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    @Override
    public Optional<Users_23110226> findById(Integer id) {
        return userRepository.findById(id);
    }

    @Override
    public Optional<Users_23110226> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public Users_23110226 save(Users_23110226 user) {
        // Lưu trực tiếp không mã hóa
        return userRepository.save(user);
    }

    @Override
    public void deleteById(Integer id) {
        // Cascade delete sẽ tự động xóa carts liên quan
        userRepository.deleteById(id);
    }

    @Override
    public Users_23110226 register(String username, String email, String fullname, String password) {
        // Kiểm tra username đã tồn tại chưa
        if (userRepository.findByUsername(username).isPresent()) {
            throw new RuntimeException("Username đã tồn tại!");
        }

        Users_23110226 newUser = new Users_23110226();
        newUser.setUsername(username);
        newUser.setEmail(email);
        newUser.setFullname(fullname);
        newUser.setPassword(password); // Lưu plain text password
        newUser.setStatus(1); // Active
        
        // Gán roleId = 2 (USER role)
        UserRoles_23110226 userRole = userRoleRepository.findById(2)
                .orElseThrow(() -> new RuntimeException("Role USER không tồn tại!"));
        newUser.setRole(userRole);

        return userRepository.save(newUser);
    }

    @Override
    public boolean authenticate(String username, String password) {
        Optional<Users_23110226> userOpt = userRepository.findByUsername(username);
        if (userOpt.isPresent()) {
            Users_23110226 user = userOpt.get();
            // So sánh plain text password
            return password.equals(user.getPassword());
        }
        return false;
    }
}


