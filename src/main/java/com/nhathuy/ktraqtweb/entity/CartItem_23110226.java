package com.nhathuy.ktraqtweb.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "CartItem")
public class CartItem_23110226 {

    @Id
    @Column(name = "cartItemId")
    private String cartItemId;

    @Column(name = "quantity")
    private Integer quantity;
    
    @Column(name = "unitPrice")
    private Float unitPrice;

    @ManyToOne
    @JoinColumn(name = "productId")
    private Product_23110226 product;

    @ManyToOne
    @JoinColumn(name = "cartId")
    private Cart_23110226 cart;
}


