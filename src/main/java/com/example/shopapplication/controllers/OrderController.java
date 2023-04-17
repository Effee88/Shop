package com.example.shopapplication.controllers;
import com.example.shopapplication.enumm.Status;
import com.example.shopapplication.models.Order;
import com.example.shopapplication.repositories.OrderRepository;
import com.example.shopapplication.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin/orders")
public class OrderController {

    @Autowired
    private final OrderRepository orderRepository;
    private final OrderService orderService;

    public OrderController(OrderRepository orderRepository, OrderService orderService) {
        this.orderRepository = orderRepository;
        this.orderService = orderService;
    }


        @GetMapping("/admin/orders")
        public String showAllOrders(Model model) {
        List<Order> orders = orderRepository.findAll();
        model.addAttribute("orders", orders);
        return "admin/orders";
    }

        @GetMapping("/search")
        public String showSearchForm(Model model) {
            model.addAttribute("searchTerm", "");
            return "/admin/orders";
        }

        @PostMapping("/search")
        public String searchOrders(@RequestParam("search") String searchTerm, Model model) {
            List<Order> orders = orderRepository.findByLastFourDigitsOfOrderNumber(searchTerm);
            model.addAttribute("searchTerm", searchTerm);
            model.addAttribute("searchOrders", orders);
            model.addAttribute("statusList", Status.values());
            return "/admin/orders";
        }

    }

