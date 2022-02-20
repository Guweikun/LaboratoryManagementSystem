package com.gwk.controller;

import com.gwk.pojo.User;
import com.gwk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/index")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user",method = RequestMethod.POST)
    public String addUser(User user){

        userService.insertUser(user);
        return "redirect:/index";
    }

    @RequestMapping(value = "/user/{account}",method = RequestMethod.DELETE)
    public String deleteUser(@PathVariable("account")String account){

        System.out.println("delete>>");
        userService.deleteUser(account);
        System.out.println("delete ok");
        return "redirect:/index";
    }

    @RequestMapping(value = "/user",method = RequestMethod.PUT)
    public String updateUser(User user){

        System.out.println(user.toString());
        System.out.println("update");
        userService.updateUser(user);
        return "redirect:/index";
    }

}
