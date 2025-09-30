package com.nhathuy.ktraqtweb.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Product")
@EqualsAndHashCode(exclude = {"cartItems"})
public class Product_23110226 {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "productId")
    private Long productId;

    @Column(name = "productName")
    private String productName;
    
    @Column(name = "productCode")
    private String productCode;

    @ManyToOne
    @JoinColumn(name = "categoryId")
    private Category_23110226 category;

    @Column(name = "description", columnDefinition = "NVARCHAR(MAX)")
    private String description;

    @Column(name = "price")
    private Float price;
    
    @Column(name = "amount")
    private Integer amount;
    
    @Column(name = "stock")
    private Integer stock;
    
    @Column(name = "images")
    private String images;
    
    @Column(name = "wishlist")
    private Integer wishlist;
    
    @Column(name = "status")
    private Integer status;
    
    @Column(name = "createDate")
    private LocalDate createDate;

    @ManyToOne
    @JoinColumn(name = "sellerId")
    private Seller_23110226 seller;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<CartItem_23110226> cartItems = new LinkedHashSet<>();
}


