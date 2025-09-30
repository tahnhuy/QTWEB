package com.nhathuy.ktraqtweb.repository;

import com.nhathuy.ktraqtweb.entity.Users_23110226;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository_23110226 extends JpaRepository<Users_23110226, Integer> {
    Optional<Users_23110226> findByUsername(String username);
}


