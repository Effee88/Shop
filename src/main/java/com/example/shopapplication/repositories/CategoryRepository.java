package com.example.shopapplication.repositories;

import com.example.shopapplication.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
    com.example.shopapplication.models.Category findByName(String name);
}
