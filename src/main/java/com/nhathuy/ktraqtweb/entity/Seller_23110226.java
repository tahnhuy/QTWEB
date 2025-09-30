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
@Table(name = "Seller")
@EqualsAndHashCode(exclude = {"users", "products"})
public class Seller_23110226 {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sellerId")
    private Integer sellerId;

    @Column(name = "sellerName")
    private String sellerName;
    
    @Column(name = "images")
    private String images;
    
    @Column(name = "status")
    private Integer status;

    @OneToMany(mappedBy = "seller", fetch = FetchType.LAZY)
    private Set<Users_23110226> users = new LinkedHashSet<>();

    @OneToMany(mappedBy = "seller", fetch = FetchType.LAZY)
    private Set<Product_23110226> products = new LinkedHashSet<>();
}


