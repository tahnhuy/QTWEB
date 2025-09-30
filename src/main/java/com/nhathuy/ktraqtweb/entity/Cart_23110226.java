package com.nhathuy.ktraqtweb.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Cart")
@EqualsAndHashCode(exclude = {"cartItems"})
public class Cart_23110226 {

    @Id
    @Column(name = "cartId")
    private String cartId;

    @Column(name = "buyDate")
    private LocalDateTime buyDate;
    
    @Column(name = "status")
    private Integer status;

    @ManyToOne
    @JoinColumn(name = "userId")
    private Users_23110226 user;

    @OneToMany(mappedBy = "cart", fetch = FetchType.LAZY)
    private Set<CartItem_23110226> cartItems = new LinkedHashSet<>();
}


