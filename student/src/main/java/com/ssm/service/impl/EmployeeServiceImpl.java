package com.ssm.service.impl;

import com.ssm.dao.EmployeeMapper;
import com.ssm.dao.StudentMapper;
import com.ssm.entity.Employee;
import com.ssm.entity.Student;
import com.ssm.service.EmployeeService;
import com.ssm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Lenovo on 2019-10-6.
 */
@Service("employeeServiceImpl")
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Override
    public List<Employee> list() {
        return employeeMapper.list();
    }
    @Override
    public int insert(Employee employee){
        return employeeMapper.insertSelective(employee);
    }
    @Override
    public int delete(String id,String date){
        return  employeeMapper.deleteByPrimaryKey(id,date);
    }
    @Override
    public List<Employee> find(String id,String date){
        return employeeMapper.selectByPrimaryKey(id,date);
    }
    @Override
    public int update(Employee employee){
        return employeeMapper.updateByPrimaryKey(employee);
    }
    @Override
    public List<Employee> selectByPrimaryKey(String id,String date){return employeeMapper.selectByPrimaryKey(id,date);}
    @Override
    public Employee login(String name,String pwd){
        return employeeMapper.login(name,pwd);
    }
}