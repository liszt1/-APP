package cn.zjyc.together.dao;

import java.util.List;


import cn.zjyc.together.entity.Department;


public interface DepartmentMapper {

    List<Department> select();
    
    Department selecta();

}