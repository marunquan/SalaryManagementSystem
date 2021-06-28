package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Student;
import com.ssm.service.StudentService;
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
import java.util.List;

@Controller
@RequestMapping("/Student")
@SessionAttributes("student")
public class StudentController {
    @RequestMapping(value = "toAdd.do", method = RequestMethod.GET)
    public String toAdd(){
        return "addStudent";
    }
    @RequestMapping(value = "add.do",method = RequestMethod.POST)
    public String add(@RequestParam(value = "file")MultipartFile file, Student student, Model model) throws IOException {
        uploadFile(file);
        student.setImage(file.getOriginalFilename());
        //添加记录
        //model.addAttribute("student",student);
        studentServiceImpl.insert(student);
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
    private StudentService studentServiceImpl;
    @RequestMapping("list.do")
    public String list(@RequestParam(value="page",defaultValue= "1") int page,Model model){
        //定义第几页和每页显示的记录数
        PageHelper.startPage(page,5);
        //调用studentServiceImpl的list方法，从数据库取数据
        List<Student> students=studentServiceImpl.list();
        //通过model对象带出分页封装的students数据pageInfo，到listStudent.jsp页面
        PageInfo pageInfo=new PageInfo(students);
        model.addAttribute("pageInfo",pageInfo);
        return "listStudents";
    }
    @RequestMapping("delete.do")
    public String delete(int id){
        studentServiceImpl.delete(id);
        return "redirect:list.do";
    }
    @RequestMapping("toUpdate.do")
    public String toUpdate(int id,Model model){
        Student student=studentServiceImpl.find(id);
        model.addAttribute("student",student);
        return "updateEmployee";
    }
    @RequestMapping("update.do")
    public String update(Student student){
        studentServiceImpl.update(student);
        return "redirect:list.do";
    }
}
