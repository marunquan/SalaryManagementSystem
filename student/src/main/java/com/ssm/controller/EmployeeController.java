package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Employee;
import com.ssm.entity.Slb;
import com.ssm.entity.Student;
import com.ssm.entity.User;
import com.ssm.service.EmployeeService;
import com.ssm.service.SlbService;
import com.ssm.service.StudentService;
import com.ssm.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.incrementer.SybaseAnywhereMaxValueIncrementer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;


/*
import javax.servlet.http.HttpServletRequest;
*/




import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/Employee")
@SessionAttributes("employee")

public class EmployeeController {
    @RequestMapping(value = "toAdd.do", method = RequestMethod.GET)
    public String toAdd(String id, Model model) {
        User user = userServiceImpl.selectByPrimaryKey(id);
        //通过model对象带出分页封装的students数据pageInfo，到listStudent.jsp页面
        model.addAttribute("user", user);
        return "addEmployee";
    }

    @RequestMapping(value = "add.do", method = RequestMethod.POST)
    public String add(Employee employee, Model model) throws IOException {
        //uploadFile(file);
        //employee.setImage(file.getOriginalFilename());
        //添加记录
       jsl(employee);
        model.addAttribute("employee", employee);
        employeeServiceImpl.insert(employee);
        return "redirect:list.do";
    }
    @RequestMapping(value = "jsl.do")
    public void jsl(Employee employee){
        employee.yfsalary=employee.gwsalary+employee.zwsalary+employee.jxsalary+employee.xjsalary;
        List<Slb> slb=slbServiceImpl.list();
        float a=0f;
        for(Slb sl:slb){
            if(employee.getYfsalary()>sl.getRight1()){
                a=a+(sl.getRight1()-sl.getLeft1())*sl.getSl();
            }
            else{
                a=a+(employee.yfsalary-sl.getLeft1())*sl.getSl();
                break;
            }
        }
employee.grsds=a;
    }


    @RequestMapping(value = "/index")
    public String test(HttpServletRequest request, Model model) {
        return "index";
    }

    @Autowired
    private EmployeeService employeeServiceImpl;
    @Autowired
    private UserService userServiceImpl;
    @Autowired
    private SlbService slbServiceImpl;

    @RequestMapping("list.do")
    public String list(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        //定义第几页和每页显示的记录数
        PageHelper.startPage(page, 8);
        //调用employeeServiceImpl的list方法，从数据库取数据
        List<Employee> employees = employeeServiceImpl.list();
        //通过model对象带出分页封装的students数据pageInfo，到listStudent.jsp页面
        PageInfo pageInfo = new PageInfo(employees);
        model.addAttribute("pageInfo", pageInfo);
        return "listEmployees";
    }

    @RequestMapping("listSl.do")
    public String listSl(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        //定义第几页和每页显示的记录数
        PageHelper.startPage(page, 9);
        //调用employeeServiceImpl的list方法，从数据库取数据
        List<Slb> employees = slbServiceImpl.list();
        //通过model对象带出分页封装的students数据pageInfo，到listStudent.jsp页面
        PageInfo pageInfo = new PageInfo(employees);
        model.addAttribute("pageInfo", pageInfo);
        return "listSl";
    }

    @RequestMapping("listOne.do")
    public String listOne(@RequestParam(value = "page", defaultValue = "1") int page, Model model, @RequestParam(value = "id", defaultValue = "%") String id, @RequestParam(value = "year") String year, @RequestParam(value = "mon") String mon) {
        String date = "%";
        if (year.length() > 0)
            date = year + "%";
        if (mon.length() > 0)
            date = date + "-" + mon;
        if (id.equals("%") && date.equals("%")) {
            return "redirect:list.do";
        } else {
            //定义第几页和每页显示的记录数
            PageHelper.startPage(page, 8);
            //调用employeeServiceImpl的list方法，从数据库取数据
            List<Employee> employees = employeeServiceImpl.selectByPrimaryKey(id, date);
            //通过model对象带出分页封装的students数据pageInfo，到listStudent.jsp页面
            PageInfo pageInfo = new PageInfo(employees);
            model.addAttribute("pageInfo", pageInfo);
            return "listEmployees";
        }
    }

    @RequestMapping(value = "listUserEmployee.do", method = RequestMethod.GET)
    public String listUserEmployee(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        //定义第几页和每页显示的记录数
        PageHelper.startPage(page, 8);
        //调用employeeServiceImpl的list方法，从数据库取数据
        List<User> employees = userServiceImpl.list();
        //通过model对象带出分页封装的students数据pageInfo，到listStudent.jsp页面
        PageInfo pageInfo = new PageInfo(employees);
        model.addAttribute("pageInfo", pageInfo);
        return "listUserEmployee";
    }

    @RequestMapping(value = "listOneUser.do", method = RequestMethod.POST)
    public String listOneUser(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "id") String id, Model model) {
        if (id.length() == 0) {
            return "redirect:listUserEmployee.do";
        } else {
            //定义第几页和每页显示的记录数
            PageHelper.startPage(page, 8);
            //调用employeeServiceImpl的list方法，从数据库取数据
            User user = userServiceImpl.selectByPrimaryKey(id);
            //通过model对象带出分页封装的students数据pageInfo，到listStudent.jsp页面
            List<User> users = new ArrayList<User>();
            users.add(user);
            PageInfo pageInfo = new PageInfo(users);
            model.addAttribute("pageInfo", pageInfo);
            return "listUserEmployee";
        }
    }

    @RequestMapping(value = "delete.do", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id") String id,@RequestParam(value = "date") String date) {
        employeeServiceImpl.delete(id,date);
        return "redirect:list.do";
    }

    @RequestMapping("toUpdate.do")
    public String toUpdate(@RequestParam(value = "id") String id, @RequestParam(value = "date") String date, Model model) {
        List<Employee> employees = employeeServiceImpl.find(id, date);
        model.addAttribute("employees", employees);
        return "updateEmployee";
    }

    @RequestMapping("update.do")
    public String update(Employee employee) {
        jsl(employee);
        employeeServiceImpl.update(employee);
        return "redirect:list.do";
    }

    @RequestMapping("toUpdateSl.do")
    public String toUpdateSl(@RequestParam(value = "id") int id, Model model) {
        Slb slb = slbServiceImpl.find(id);
        System.out.println(slb.getLeft1());
        List<Slb> slbs=new ArrayList<Slb>();
        slbs.add(slb);
        model.addAttribute("slb", slbs);
        return "updateSl";
    }

    @RequestMapping("updateSl.do")
    public String updateSl(Slb slb) {
        slbServiceImpl.update(slb);
        return "redirect:listSl.do";
    }
}

