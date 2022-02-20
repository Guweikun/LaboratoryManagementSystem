package com.gwk.interceptor;

import com.gwk.pojo.User;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;

public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String[] noNeedAuthPage = new String[]{
                "/LaboratoryManagementSystem/login",
                "/LaboratoryManagementSystem/register"
        };

        HttpSession session = request.getSession();
        String uri = request.getRequestURI();
        System.out.println(uri);
        if (!Arrays.asList(noNeedAuthPage).contains(uri)) {
            User user = (User) session.getAttribute("user");
            System.out.println(user.toString());
            if (null == user) {
                response.sendRedirect("/LaboratoryManagementSystem/login");
                System.out.println("666");
                return false;
            }
        }
        System.out.println("555");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
