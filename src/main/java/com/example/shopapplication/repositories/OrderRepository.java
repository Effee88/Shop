package com.example.shopapplication.repositories;

import com.example.shopapplication.models.Order;
import com.example.shopapplication.models.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
    List<Order> findByPerson(Person person);

    Order findById(Long orderId);

    List<Order> findAll();

    @Query("SELECT o FROM Order o WHERE RIGHT(o.number, 4) LIKE %:searchTerm")
    List<Order> findByLastFourDigitsOfOrderNumber(@Param("searchTerm") String searchTerm);
}

