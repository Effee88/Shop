package com.example.shopapplication.services;

import com.example.shopapplication.models.Category;
import com.example.shopapplication.models.Product;
import com.example.shopapplication.repositories.PersonRepository;
import com.example.shopapplication.repositories.ProductRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class ProductService {
    private final ProductRepository productRepository;
    private final PersonRepository personRepository;

    public ProductService(ProductRepository productRepository, PersonRepository personRepository) {
        this.productRepository = productRepository;
        this.personRepository = personRepository;
    }

    // Данный метод позволяет получить список всех товаров
    public List<Product> getAllProduct(){
        return productRepository.findAll();
    }

    // Данный метод позволяет получить товар по id
    public Product getProductId(int id){
        Optional<Product> optionalProduct = productRepository.findById(id);
        return optionalProduct.orElse(null);
    }

    // Данный метод позволяет сохранить товар
    @Transactional
    public void saveProduct(Product product, Category category){
        product.setCategory(category);
        productRepository.save(product);
    }

    // Данный метод позволяет обновить данные о товаре
    @Transactional
    public void updateProduct(int id, Product product){
        product.setId(id);
        productRepository.save(product);
    }

    // Данный метод позволяет удалить товар по id
    @Transactional
    public void deleteProduct(int id){
        productRepository.deleteById(id);
    }
}
