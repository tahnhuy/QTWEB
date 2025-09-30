package com.nhathuy.ktraqtweb.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.LinkedHashSet;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Users")
@EqualsAndHashCode(exclude = {"carts"})
public class Users_23110226 {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userId")
    private Integer userId;

    @Column(name = "username")
    private String username;
    
    @Column(name = "email")
    private String email;
    
    @Column(name = "fullname")
    private String fullname;
    
    @Column(name = "password")
    private String password;
    
    @Column(name = "images")
    private String images;
    
    @Column(name = "phone")
    private String phone;
    
    @Column(name = "status")
    private Integer status;
    
    @Column(name = "code")
    private String code;

    @ManyToOne
    @JoinColumn(name = "roleId")
    private UserRoles_23110226 role;

    @ManyToOne
    @JoinColumn(name = "sellerId")
    private Seller_23110226 seller;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Cart_23110226> carts = new LinkedHashSet<>();
}


