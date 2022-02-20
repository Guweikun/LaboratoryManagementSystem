package com.gwk.controller;

import com.gwk.pojo.Course;
import com.gwk.pojo.Lab;
import com.gwk.pojo.User;
import com.gwk.service.CourseService;
import com.gwk.service.LabService;
import com.gwk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LabController {

    @Autowired
    private LabService labService;

    @Autowired
    private UserService userService;

    @Autowired
    private CourseService courseService;

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String selectAllLab(Model model){

        List<Lab> labList = labService.LabList();
        model.addAttribute("labList",labList);

        List<User> userList = userService.UserList();
        model.addAttribute("userList",userList);

        List<Course> courseList = courseService.CourseList();
        model.addAttribute("courseList",courseList);

        return "index";
    }

    @RequestMapping(value = "/index",method = RequestMethod.POST)
    public String addLab(Lab lab){

        System.out.println(lab.toString());
        labService.insertLab(lab);
        return "redirect:/index";
    }

    @RequestMapping(value = "/index/{address}",method = RequestMethod.DELETE)
    public String deleteLab(@PathVariable("address")String address){

        System.out.println("delete>>");
        labService.deleteLab(address);
        System.out.println("delete ok");
        return "redirect:/index";
    }

    @RequestMapping(value = "/index",method = RequestMethod.PUT)
    public String updateLab(Lab lab){

        System.out.println(lab.toString());
        System.out.println("update");
        labService.updateLab(lab);
        return "redirect:/index";
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String loginpage(Model model){
        model.addAttribute("wrongPassword",0);
        model.addAttribute("wrongAccount",0);
        return "loginPage";
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(Model model,HttpServletRequest request){
        request.getSession().setAttribute("user",null);
        return "loginPage";
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String registerpage(Model model){
        return "registerPage";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(User user, Model model, HttpServletRequest request){
        User u = userService.selectUser(user);
        HttpSession session = request.getSession();
        if (u != null){
            System.out.println("notnull");
            session.setAttribute("user",user);
            if (user.getPassword().equals(u.getPassword())){
                session.setAttribute("u",u.getName());
                System.out.println("eq");
                return "redirect:/index";
            }
            else {
                model.addAttribute("wrongPassword",1);
                System.out.println("neq");
            }
        }
        else {
            System.out.println("null");
            model.addAttribute("wrongAccount",1);
        }
        return "loginPage";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(User user,Model model){
        User u = userService.selectUser(user);
        if (u != null){
            model.addAttribute("sameAccount",1);
            return "registerPage";
        }
        else {
            userService.insertUser(user);
            return "loginPage";
        }
    }

}
