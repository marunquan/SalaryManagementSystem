package com.ssm.controller;
import com.ssm.entity.*;

import com.ssm.entity.Student;
import com.ssm.service.AdminService;

import com.ssm.service.CaiwuService;
import com.ssm.service.EmployeeService;

import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Lenovo on 2019-10-3.
 */
@Controller
public class LoginController {
    @Autowired
    private EmployeeService employeeServiceImpl;
    @Autowired
    private CaiwuService caiwuServiceImpl;
   @Autowired
   private AdminService adminServiceImpl;
    @Autowired
    private UserService userServiceImpl;
    @RequestMapping("check.do")
    public String check(@RequestParam(value="username") String username,@RequestParam(value="password") String password, String type, HttpServletRequest request)  {
        switch (Integer.parseInt(type)) {
            case 0: {
                Employee employee = employeeServiceImpl.login(username, password);
                if (employee != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    return "redirect:/Employee/listOne.do?id="+employee.getId()+"";
                } else {
                    return "login";
                }
            }
            case 1: {
                Caiwu caiwu = caiwuServiceImpl.login(username, password);
                User user = userServiceImpl.login(username, password);
                if (caiwu != null||user!=null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    return "redirect:/Employee/list.do";
                }
                else {
                    return "login";
                }
            }
            case 2: {
                Admin admin = adminServiceImpl.login(username, password);
                User user = userServiceImpl.login1(username, password);
                if (admin != null||user!=null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    return "redirect:/User/list.do";
                } else {
                    return "login";
                }
            }
            default:
            {
                return "login";
            }
        }
    }
    @RequestMapping("loginout.do")
    public String loginout(HttpServletRequest request){
        HttpSession session=request.getSession();
        session.invalidate();
        return "login";
    }

}
