package com.example.shopapplication.services;
import com.example.shopapplication.models.Order;
import com.example.shopapplication.repositories.OrderRepository;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

}

