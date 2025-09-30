package com.nhathuy.ktraqtweb.service;

import com.nhathuy.ktraqtweb.entity.Users_23110226;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface UserService_23110226 {
    List<Users_23110226> findAll();
    Page<Users_23110226> findAll(Pageable pageable);
    Optional<Users_23110226> findById(Integer id);
    Optional<Users_23110226> findByUsername(String username);
    Users_23110226 save(Users_23110226 user);
    void deleteById(Integer id);
    Users_23110226 register(String username, String email, String fullname, String password);
    boolean authenticate(String username, String password);
}


