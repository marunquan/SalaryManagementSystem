package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Employee;
import com.ssm.entity.User;
import com.ssm.service.EmployeeService;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/User")
@SessionAttributes("user")
public class UserController {
    @RequestMapping(value = "toAdd.do", method = RequestMethod.GET)
    public String toAdd(){
        return "addUser";
    }
    @RequestMapping(value = "add.do",method = RequestMethod.POST)
    public String add(User user, Model model) throws IOException {
        //uploadFile(file);
        //employee.setImage(file.getOriginalFilename());
        //添加记录
        model.addAttribute("user",user);
        userServiceImpl.insert(user);
        return "redirect:list.do";
    }
    private void uploadFile(MultipartFile image) throws IOException{
        if(image!=null){
            File imageFile =new File(image.getOriginalFilename());
            image.transferTo(imageFile);
        }
    }
    @RequestMapping(value = "/index")
    public String test(HttpServletRequest request,Model model){
        return "index";
    }
    @Autowired
    private UserService userServiceImpl;
    @Autowired
    private EmployeeService employeeServiceImpl;
    @RequestMapping("list.do")
    public String list(@RequestParam(value="page",defaultValue= "1") int page,Model model){
        //定义第几页和每页显示的记录数
        PageHelper.startPage(page,8);
        //调用employeeServiceImpl的list方法，从数据库取数据
        List<User> employees=userServiceImpl.list();
        //通过model对象带出分页封装的students数据pageInfo，到listStudent.jsp页面
        PageInfo pageInfo=new PageInfo(employees);
        model.addAttribute("pageInfo",pageInfo);
        return "listUser";
    }

    @RequestMapping("listOne.do")
    public String listOne(@RequestParam(value="page",defaultValue= "1") int page, @RequestParam(value="id") String id,Model model) {
        if(id.length()==0){
            return "redirect:list.do";
        }
        else {
            //定义第几页和每页显示的记录数
            PageHelper.startPage(page, 8);
            //调用employeeServiceImpl的list方法，从数据库取数据
            User user = userServiceImpl.selectByPrimaryKey(id);
            System.out.println(user.getSex());
            //通过model对象带出分页封装的students数据pageInfo，到listStudent.jsp页面
            List<User> users=new ArrayList<User>();
            users.add(user);
            PageInfo pageInfo = new PageInfo(users);
            model.addAttribute("pageInfo", pageInfo);
            return "listUser";
        }
    }
    @RequestMapping("delete.do")
    public String delete(String id){
        userServiceImpl.delete(id);
        return "redirect:list.do";
    }
    @RequestMapping("toUpdate.do")
    public String toUpdate(@RequestParam(value="id") String id,Model model){
        User user=userServiceImpl.find(id);
        model.addAttribute("user",user);
        return "updateUser";
    }
    @RequestMapping("update.do")
    public String update(User employee){
        userServiceImpl.update(employee);
        return "redirect:list.do";
    }
}
