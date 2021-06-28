package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Course;
import com.ssm.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by Lenovo on 2019-10-12.
 */
@Controller
@RequestMapping("/Course")
public class CourseController {
    @Autowired
    private CourseService courseServiceImpl;
    @RequestMapping("list.do")
    public String list(@RequestParam(value="page",defaultValue= "1") int page, Model model){
        //定义第几页和每页显示的记录数
        PageHelper.startPage(page,5);
        //调用studentServiceImpl的list方法，从数据库取数据
        List<Course> courses=courseServiceImpl.list();
        //通过model对象带出分页封装的students数据pageInfo，到listStudent.jsp页面
        PageInfo pageInfo=new PageInfo(courses);
        model.addAttribute("pageInfo",pageInfo);
        return "listCourses";
    }
}