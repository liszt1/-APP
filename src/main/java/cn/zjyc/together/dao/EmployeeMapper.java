package cn.zjyc.together.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.zjyc.together.entity.Employee;

public interface EmployeeMapper {

    void deleteByPrimaryKey(Integer empId);

    void insert(@Param("Employee")Employee employee);

    Employee selectByPrimaryKey(Integer empId);
    
    void updateByPrimaryKey(@Param("Employee")Employee employee);
    
    List<Employee> selectAll();
}