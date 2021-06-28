package com.ssm.service;

import com.ssm.entity.Employee;
import com.ssm.entity.Student;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

import java.util.EnumMap;
import java.util.List;

public interface EmployeeService {
    public int insert(Employee employee);
    public int delete(String id,String date);
    public List<Employee> find(String id,String date);
    public int update(Employee employee);
    public List<Employee> list() ;
    public List<Employee> selectByPrimaryKey(String id,String date);
    Employee login(String name, String pwd);
}
