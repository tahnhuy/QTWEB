package com.nhathuy.ktraqtweb.controller;

import com.nhathuy.ktraqtweb.entity.Product_23110226;
import com.nhathuy.ktraqtweb.entity.Seller_23110226;
import com.nhathuy.ktraqtweb.service.ProductService_23110226;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class ShopController_23110226 {

    private final ProductService_23110226 productService;

    public ShopController_23110226(ProductService_23110226 productService) {
        this.productService = productService;
    }

    @GetMapping("/products")
    public String listProducts(Model model) {
        Map<Seller_23110226, List<Product_23110226>> productsGroupedBySeller = 
                productService.findAllProductsGroupedBySeller();
        model.addAttribute("productsGroupedBySeller", productsGroupedBySeller);
        return "product_list";
    }

    @GetMapping("/products/{productId}")
    public String productDetail(@PathVariable Long productId, Model model) {
        Optional<Product_23110226> productOpt = productService.findById(productId);
        if (productOpt.isPresent()) {
            model.addAttribute("product", productOpt.get());
            return "product_detail";
        } else {
            model.addAttribute("error", "Sản phẩm không tồn tại!");
            return "redirect:/products";
        }
    }
}
