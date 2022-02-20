package com.gwk.controller;

import com.alibaba.fastjson.JSON;
import com.gwk.pojo.Lab;
import com.gwk.pojo.LabSoftware;
import com.gwk.service.LabService;
import com.gwk.service.LabSoftwareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = "/index")
public class LabSoftwareController {

    @Autowired
    private LabSoftwareService labSoftwareService;

    @RequestMapping(value = "/labsoftware/{address}",method = RequestMethod.GET)
    @ResponseBody
    public void selectAllLab(@PathVariable("address")String address, HttpServletResponse response) throws IOException {

        System.out.println("get ..labsoftware"+address);
        List<LabSoftware> labSoftwareList = labSoftwareService.labSoftwareList(address);
        String jsonString = JSON.toJSONString(labSoftwareList);
        System.out.println("finish");
        System.out.println(jsonString);
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(jsonString);
    }

    @RequestMapping(value = "/labsoftware",method = RequestMethod.POST)
    public String addLab(LabSoftware labSoftware){

        System.out.println(labSoftware.toString());
        labSoftwareService.insertLab(labSoftware);
        return "redirect:/index";
    }

    @RequestMapping(value = "/labsoftware",method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteLab(HttpServletRequest request,HttpServletResponse response) throws IOException {

        System.out.println("deletesoft>>");

        BufferedReader br = request.getReader();
        String params = br.readLine();

        //将json字符串转为java对象
        LabSoftware labSoftware = JSON.parseObject(params,LabSoftware.class);
        System.out.println(labSoftware.toString());
        labSoftwareService.deleteLab(labSoftware);

        System.out.println("deletesoft ok");

        //响应成功标识
        response.getWriter().write("success");
    }

    @RequestMapping(value = "/labsoftware",method = RequestMethod.PUT)
    public String updateLab(LabSoftware labSoftware){

        System.out.println(labSoftware.toString());
        System.out.println("update");
        labSoftwareService.updateLab(labSoftware);
        return "redirect:/index";
    }
}
