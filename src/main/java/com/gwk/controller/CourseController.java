package com.gwk.controller;

import com.gwk.pojo.Course;
import com.gwk.pojo.User;
import com.gwk.service.CourseService;
import com.gwk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping(value = "/index")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping(value = "/course",method = RequestMethod.POST)
    public String addCourse(Course course){

        courseService.insertCourse(course);
        return "redirect:/index";
    }

    @RequestMapping(value = "/course/{account}",method = RequestMethod.DELETE)
    public String deleteCourse(@PathVariable("account")String account) throws UnsupportedEncodingException {

        System.out.println("delete>>");
        System.out.println(account+"ok");
        account = new String(account.getBytes("iso-8859-1"), "utf-8");
        System.out.println(account+"okle");
        courseService.deleteCourse(account);
        System.out.println("delete ok");
        return "redirect:/index";
    }

    @RequestMapping(value = "/course",method = RequestMethod.PUT)
    public String updateCourse(Course course){

        System.out.println(course.toString());
        System.out.println("update");
        courseService.updateCourse(course);
        return "redirect:/index";
    }
}
