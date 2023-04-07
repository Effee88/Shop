package com.example.shopapplication.controllers;

import com.example.shopapplication.models.Person;
import com.example.shopapplication.repositories.PersonRepository;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    private final PersonRepository personRepository;

    public UserController(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    @PostMapping("/update-role")
    public String updateRole(@RequestParam("id") Long id, @RequestParam("role") String role) {
        Person person = (Person) personRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user ID"));
        person.setRole(role);
        personRepository.save(person);
        return "redirect:/admin/infoUsers";
    }
}